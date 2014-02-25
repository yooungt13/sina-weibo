package weibo.serviceImpl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.json.JSONException;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;

import weibo.bean.PageBean;
import weibo.hibernate.Atme;
import weibo.hibernate.AtmeDAO;
import weibo.hibernate.Comment;
import weibo.hibernate.CommentDAO;
import weibo.hibernate.FansManage;
import weibo.hibernate.FansManageDAO;
import weibo.hibernate.Profile;
import weibo.hibernate.ProfileDAO;
import weibo.hibernate.TransmitCollection;
import weibo.hibernate.TransmitCollectionDAO;
import weibo.hibernate.Userinfo;
import weibo.hibernate.UserinfoDAO;
import weibo.servive.ProfileServ;
import weibo.util.ImplUtil;

public class ProfileServImpl implements ProfileServ{

	public boolean saveProf(Profile prof, File img, String imgName) {
		// TODO Auto-generated method stub	
		Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");
		ProfileDAO profDao = (ProfileDAO) ImplUtil.getBeanByName("ProfileDAO");
		
		prof.setUserinfo(user);
		prof.setProfTime(new Timestamp(System.currentTimeMillis()));
		prof.setTcId(0);
		profDao.save(prof);
		
		if( imgName != null ){
			String[] str = imgName.split("\\.");
			imgName = prof.getProfId() +"."+str[1];
			prof.setImageRef(imgName);
			
			profDao.merge(prof);
			saveImage(img, imgName);
		}
		
		addAt(prof);
		return true;
	}

	public Profile findProf(int profId) {
		// TODO Auto-generated method stub
		ProfileDAO profDao = (ProfileDAO) ImplUtil.getBeanByName("ProfileDAO");
		Profile prof = profDao.findById(profId);
		if( prof != null ){
			return prof;
		}else{
			Profile tmp = new Profile();
			tmp.setProfId(profId);
			tmp.setProfContent("NOT FOUND");
			return tmp;
		}
		
	}

	public boolean deleteProf(int profId) {
		// TODO Auto-generated method stub
		try{
			ProfileDAO profDao = (ProfileDAO) ImplUtil.getBeanByName("ProfileDAO");
			CommentDAO comDao = (CommentDAO) ImplUtil.getBeanByName("CommentDAO");
			TransmitCollectionDAO tcDao = (TransmitCollectionDAO) ImplUtil.getBeanByName("TransmitCollectionDAO");
			AtmeDAO amDao = (AtmeDAO) ImplUtil.getBeanByName("AtmeDAO");
			
			// 删除相关评论
			List<Comment> comList = comDao.findByProperty("profile", profDao.findById(profId));
			for( int i = 0; i < comList.size(); i++ ){
				Comment c = comList.get(i);
				List<Atme> atComList = amDao.findByProperty("comment", c);
				for( int j = 0; j < atComList.size(); j++ ){
					amDao.delete(atComList.get(j));
				}
				comDao.delete(comList.get(i));
			}
			
			// 删除相关转发、收藏
			if( profDao.findById(profId).getTcId() != 0){
				TransmitCollection tc = tcDao.findById(profDao.findById(profId).getTcId());
				if( tc != null ){
					tcDao.delete(tc);
				}
			}
			List<TransmitCollection> tcList = tcDao.findByProperty("profile", profDao.findById(profId));
			for( int i = 0; i < tcList.size(); i++ ){
				TransmitCollection tc = tcList.get(i);
				int pid = tc.getProfile().getProfId();
				if( pid != tc.getTcOriginal() && tc.getTcOriginal() != 0){
					tc.setProfile(profDao.findById(tc.getTcOriginal()));
					tcDao.merge(tc);
				}	
				else
					tcDao.delete(tc);
			}
			
			// 删除相关@
			List<Atme> amList = amDao.findByProperty("profile", profDao.findById(profId));
			for( int i = 0; i < amList.size(); i++ ){
				amDao.delete(amList.get(i));
			}
			
			//删除引用图片
			String root = ServletActionContext.getRequest().getRealPath("/Images/Refrences")+"/"+profDao.findById(profId).getImageRef();
			File file = new File(root);
			if(file.exists())
			   file.delete();
			
			profDao.delete(profDao.findById(profId));
		}catch(Exception e){
			return false;
		}
		return true;
	}

	public List<Profile> getProfByUser(Userinfo user){
		// TODO Auto-generated method stub
		ProfileDAO profDao = (ProfileDAO) ImplUtil.getBeanByName("ProfileDAO");
		List<Profile> results = profDao.findByProperty("userinfo", user);
		java.util.Collections.reverse( results );
		return results;
	}

	public Userinfo getUserByProfId(Integer profId) {
		// TODO Auto-generated method stub
		UserinfoDAO userdao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		ProfileDAO profDao = (ProfileDAO) ImplUtil.getBeanByName("ProfileDAO");
		Integer userid = profDao.findById(profId).getUserinfo().getUserId();
		return userdao.findById(userid);
	}

	public List<Profile> getTotalProfByUser(Userinfo user) {
		// TODO Auto-generated method stub
		ProfileDAO profDao = (ProfileDAO) ImplUtil.getBeanByName("ProfileDAO");
		FansManageDAO fmDao = (FansManageDAO) ImplUtil.getBeanByName("FansManageDAO");
		UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		
		ArrayList<FansManage> followList = (ArrayList<FansManage>) fmDao.findByFansId(user.getUserId());
		ArrayList<Profile> results = (ArrayList<Profile>) profDao.findByProperty("userinfo", user);
				
		for( int i = 0; i < followList.size(); i++ ){
			ArrayList<Profile> list = (ArrayList<Profile>) getProfByUser( userDao.findById( followList.get(i).getFollowId() ) );
			for( int j = 0; j < list.size(); j++ ){
				results.add( list.get(j) );
			}
		}
		Collections.sort(results,new Comparator<Profile>()
		{
			public int compare(Profile p1,Profile p2){
				if(p1.equals(p2)){
					return 0 ;
				}else if(p1.getProfId()<p2.getProfId()){	
					return 1 ;
				}else{
					return -1 ;
				}
			}
		}); 

		return results;
	}

	public boolean addCollection(Profile prof) {
		TransmitCollectionDAO tcDao = (TransmitCollectionDAO) ImplUtil.getBeanByName("TransmitCollectionDAO");
		TransmitCollection tc = new TransmitCollection();
		
		List<TransmitCollection> tcList = tcDao.findByProperty("profile", prof); 
		Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");
		
		for( int i = 0; i < tcList.size(); i++ ){
			if( tcList.get(i).getTcOriginal() == 0 ){
				int id1 = tcList.get(i).getUserinfo().getUserId();
				int id2 = user.getUserId();
				if( id1 == id2 )
					tcDao.delete(tcList.get(i));
			}
		}
		
		tc.setProfile(prof);
		tc.setTcOriginal(0);
		tc.setTcTime(new Timestamp(System.currentTimeMillis()));
		tc.setUserinfo(user);
			
		tcDao.save(tc);
			
		return true;				
	}

	public boolean deleteCollection(int favorId) {
		TransmitCollectionDAO tcDao = (TransmitCollectionDAO) ImplUtil.getBeanByName("TransmitCollectionDAO");
		TransmitCollection tc = tcDao.findById(favorId);
		if( tc != null){
			tcDao.delete(tc);
			return true;			
		}else{
			return false;
		}
	}

	public boolean addAt(Profile prof) {
		
		AtmeDAO amDao = (AtmeDAO) ImplUtil.getBeanByName("AtmeDAO");
		
		Pattern p = Pattern.compile("[@]+");
		String[] tmp = p.split(prof.getProfContent());
		
		Set<String> set=new HashSet<String>();
		for( int i = 1; i < tmp.length; i++ ){
			int index1 = ( tmp[i].indexOf(" ") > 0 ) ? tmp[i].indexOf(" ") : tmp[i].length();
			int index2 = ( tmp[i].indexOf(":") > 0 ) ? tmp[i].indexOf(":") : tmp[i].length();
			int index3 = ( tmp[i].indexOf("/") > 0 ) ? tmp[i].indexOf("/") : tmp[i].length();
			
			int index = Math.min(Math.min(index1,index2), index3);
			String atWho = tmp[i].substring(0, index);
			set.add(atWho);
		}
		
		String[] atList = (String[]) set.toArray(new String[set.size()]);
		
		for( int i = 0; i < atList.length; i++ ){		
			Atme am = new Atme();
			am.setAtWho(atList[i]);
			am.setProfile(prof);

			amDao.save(am);
		}				       
        
		return true;
	}
	
	public void addTransmit(Profile profile) {
		
		TransmitCollectionDAO tcDao = (TransmitCollectionDAO) ImplUtil.getBeanByName("TransmitCollectionDAO");
		ProfileDAO profDao = (ProfileDAO) ImplUtil.getBeanByName("ProfileDAO");
		AtmeDAO amDao = (AtmeDAO) ImplUtil.getBeanByName("AtmeDAO");
		
		Userinfo user = ImplUtil.getSessionUser();
		
		TransmitCollection tc = new TransmitCollection();
		Set<String> atList = new HashSet<String>();
		ArrayList<String> tmp = new ArrayList<String>();
		
		// 得到原微博
		Profile nowProf = profDao.findById(profile.getProfId());				
		Profile prof = new Profile();
		
		tc.setProfile(nowProf);
		if( nowProf.getTcId() == 0){
			tc.setTcOriginal(nowProf.getProfId());			
		}else{
			int orgId = tcDao.findById(nowProf.getTcId()).getTcOriginal();
			tc.setTcOriginal(orgId);
		}
		tc.setTcTime(new Timestamp(System.currentTimeMillis()));
		tc.setUserinfo(user);
		tcDao.save(tc);
		
		// 保存新发微博
		prof.setProfContent(profile.getProfContent());
		prof.setProfTime(new Timestamp(System.currentTimeMillis()));
		prof.setUserinfo(user);
		prof.setTcId(tc.getTcId());
		profDao.save(prof);
		
		if( nowProf.getTcId() == 0){			
			// 如果现在微博未引用其他微博，则把当前发布者加入@
			atList.add(nowProf.getPublishName());
			// 判断现在微薄是否有@
			tmp = getAtList(nowProf);
			for( int i = 0; i < tmp.size(); i++){
				atList.add(tmp.get(i));
			}
		
		}else{
			// 如果现转微博已引用其他微博，则把引用微博发布者加入@
			int orgId = tcDao.findById(nowProf.getTcId()).getTcOriginal();
			Profile orgProf = profDao.findById(orgId);		
			
			if( orgProf == null ){
				atList.add(nowProf.getPublishName());
				tmp = getAtList(nowProf);
				for( int i = 0; i < tmp.size(); i++){
					atList.add(tmp.get(i));
				}
			}else{	
				// 判断引用微薄是否有@
				atList.add(orgProf.getPublishName());
				tmp = getAtList(orgProf);
				for( int i = 0; i < tmp.size(); i++){
					atList.add(tmp.get(i));
				}
			}
		}
		
		// 判断新微薄是否有@
		tmp = getAtList(prof);
		for( int i = 0; i < tmp.size(); i++){
			atList.add(tmp.get(i));
		}
		
		addAt(atList,prof);
	}

	public void initTransmit(int tcId) {
		
		TransmitCollectionDAO tcDao = (TransmitCollectionDAO) ImplUtil.getBeanByName("TransmitCollectionDAO");
		ProfileDAO profDao = (ProfileDAO) ImplUtil.getBeanByName("ProfileDAO");

		HttpServletResponse response; 
        response=ServletActionContext.getResponse(); 
        response.setContentType( "text/json;charset=utf-8"); 
        response.setHeader( "Cache-Control",   "no-cache"); 
        response.setHeader( "Pargma", "no-cache"); 
        PrintWriter out;
        
		try {
			TransmitCollection tc = tcDao.findById(tcId);
			Profile org = profDao.findById(tc.getTcOriginal());
			Profile tsmit = profDao.findById(tc.getProfile().getProfId());
			
			JSONObject js = new JSONObject();
			if( org != null ){
		       	js.put("orgName", org.getPublishName());
		       	js.put("orgUserId", org.getUserinfo().getUserId());
		       	js.put("orgContent", org.getPublishContent());
			}else{
				js.put("orgContent", "NOT FOUND");
			}	
	       	
			out = response.getWriter();
			out.write(js.toString()); 
	        out.close(); 
	        
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}					
	}

	public ArrayList<Profile> getAtMePage() {
		// TODO Auto-generated method stub
		AtmeDAO amDao = (AtmeDAO) ImplUtil.getBeanByName("AtmeDAO");
			
		Userinfo user = ImplUtil.getSessionUser();
				
		ArrayList<Atme> profIdList = (ArrayList<Atme>) amDao.findByAtWho(user.getNickName());
		ArrayList<Atme> results = new ArrayList<Atme>();
				
		for( int i = 0; i < profIdList.size(); i++ ){
			if( profIdList.get(i).getComment() == null ){
				results.add(profIdList.get(i));
			}
		}
				
		ArrayList<Profile> amList = new ArrayList<Profile>();
				
		java.util.Collections.reverse( results );
				
		for( int i = 0; i < results.size(); i++ ){
			Atme am = results.get(i);
			Profile prof = findProf(am.getProfile().getProfId());
			amList.add(prof);
		}
		
		return amList;				
	}

	public boolean addAt(Set<String> atList,Profile prof) {
		
		AtmeDAO amDao = (AtmeDAO) ImplUtil.getBeanByName("AtmeDAO");
		String[] results = (String[]) atList.toArray(new String[atList.size()]);
		
		for( int i = 0; i < results.length; i++ ){	
			if( !results[i].equals(ImplUtil.getSessionUser().getNickName())){
				Atme am = new Atme();
				am.setAtWho(results[i]);
				am.setProfile(prof);
				amDao.save(am);
			}
		}				       
        
		return true;
	}
	
	public ArrayList<String> getAtList(Profile prof) {
	
		Pattern p = Pattern.compile("[@]+");
		String[] tmp = p.split(prof.getProfContent());
		
		ArrayList<String> set = new ArrayList<String>();
		for( int i = 1; i < tmp.length; i++ ){
			int index1 = ( tmp[i].indexOf(" ") > 0 ) ? tmp[i].indexOf(" ") : tmp[i].length();
			int index2 = ( tmp[i].indexOf(":") > 0 ) ? tmp[i].indexOf(":") : tmp[i].length();
			int index3 = ( tmp[i].indexOf("/") > 0 ) ? tmp[i].indexOf("/") : tmp[i].length();
			
			int index = Math.min(Math.min(index1,index2), index3);
			String atWho = tmp[i].substring(0, index);
			set.add(atWho);
		}
		
		return set;
	}

	public boolean saveImage(File img, String imgName) {
		try{
			//创建输入流
			InputStream is = new FileInputStream(img); 
			//创建父目录
			String root = ServletActionContext.getRequest().getRealPath("/Images/Refrences");
			
			//创建输出流的目的目录
			File destFile = new File(root,imgName);
				
			//创建输出流
			OutputStream os = new FileOutputStream(destFile);
			
			byte[] buffer = new byte[400];
			int length = 0;
			while ((length = is.read(buffer)) > 0){
				os.write(buffer, 0, length);
			}
			is.close();
			os.close();
			
		}catch(Exception e){
			System.out.println("Log: upload failed!");
			return false;
		}
		
		return true;
	}
	
	public boolean savePreviewImage(File img, String imgName) {
		try{
			HttpServletResponse response; 
		    response=ServletActionContext.getResponse(); 
		    response.setContentType( "text/html;charset=utf-8"); 
		    response.setHeader( "Cache-Control", "no-cache"); 
		    response.setHeader( "Pargma", "no-cache"); 
		    PrintWriter out;
		        
			out = response.getWriter();
						
			//创建输入流
			InputStream is = new FileInputStream(img); 
			//创建父目录
			String root = ServletActionContext.getRequest().getRealPath("/Images/tmp");
				
			Userinfo user = ImplUtil.getSessionUser();			
				
			// 输出至前台接受
			out.write(imgName);
				
			File destFile = new File(root,imgName);	
			
			if(destFile.exists()){
				destFile.delete();
			}
					
			//创建输出流
			OutputStream os = new FileOutputStream(destFile);
				
			byte[] buffer = new byte[400];
			int length = 0;
			while ((length = is.read(buffer)) > 0){
				os.write(buffer, 0, length);
			}
				
			is.close();
			os.close();
		}catch(Exception e){
			return false;
		}
		
		return true;
	}

	public ArrayList<Profile> getRecentProf() {
		ProfileDAO profDao = (ProfileDAO) ImplUtil.getBeanByName("ProfileDAO");
		ArrayList<Profile> recentList = (ArrayList<Profile>) profDao.findAll();
		
		ArrayList<Profile> results = new ArrayList<Profile>();
		for(int i = 1; i <= 5; i++ ){
			results.add(recentList.get(recentList.size()-i));
		}
		return results;
	}

	public ArrayList<Profile> getProfListByContent(String profContent) {
		ProfileDAO profDao = (ProfileDAO) ImplUtil.getBeanByName("ProfileDAO");
		ArrayList<Profile> results = (ArrayList<Profile>) profDao.fuzzySearchByWeibo(profContent);
		java.util.Collections.reverse(results);
		return results;
	}	

}
