package weibo.serviceImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.context.ApplicationContext;

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
import weibo.hibernate.Userinfo;
import weibo.hibernate.UserinfoDAO;
import weibo.servive.CommentServ;
import weibo.servive.FansServ;
import weibo.util.ImplUtil;

public class CommentServImpl implements CommentServ{

	public void getCommentByProfId(Profile profile) {
		// TODO Auto-generated method stub		
		try {
			HttpServletResponse response; 
	        response=ServletActionContext.getResponse(); 
	        response.setContentType( "text/json;charset=utf-8"); 
	        response.setHeader( "Cache-Control",   "no-cache"); 
	        response.setHeader( "Pargma", "no-cache"); 
	        PrintWriter out;
			out = response.getWriter();
			
	        JSONArray returnComments = new JSONArray();
	        
	        CommentDAO comDao = (CommentDAO)ImplUtil.getBeanByName("CommentDAO");
	        UserinfoDAO userDao = (UserinfoDAO)ImplUtil.getBeanByName("UserinfoDAO");
	        List<Comment> comList = comDao.findByProperty("profile", profile);

	        Collections.sort(comList,new Comparator<Comment>(){
	        	public int compare(Comment c1,Comment c2){
	        		if(c1.equals(c2)){
	        			return 0 ;
	        		}else if(c1.getComId()<c2.getComId()){	
	        			return 1 ;
	        		}else{
	        			return -1 ;
	        		}
	        	}
	        }); 
	        
	        for( int i = 0; i < comList.size(); i++){
		       	JSONObject js = new JSONObject();
		       	js.put("comId", comList.get(i).getComId());
		       	js.put("comContent", comList.get(i).getPublishContent());
		       	js.put("comTime", comList.get(i).getPubTime());
		       	Userinfo user = userDao.findById(comList.get(i).getUserinfo().getUserId());
		       	js.put("comFrom", user.getNickName());
		       	js.put("comFromId", user.getUserId());
		       	js.put("comFace", user.getMyFace());
		       	 
				returnComments.put(js);
	        }
	         
	        out.write(returnComments.toString()); 
	        out.close(); 
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}      
	}

	public void getReplyComment(Integer comComId,Integer comId) {
		// TODO Auto-generated method stub
		
		try {
			HttpServletResponse response; 
	        response=ServletActionContext.getResponse(); 
	        response.setContentType( "text/json;charset=utf-8"); 
	        response.setHeader( "Cache-Control", "no-cache"); 
	        response.setHeader( "Pargma", "no-cache"); 
	        PrintWriter out;
	        
			out = response.getWriter();
	        
	        CommentDAO comDao = (CommentDAO)ImplUtil.getBeanByName("CommentDAO");
	        UserinfoDAO userDao = (UserinfoDAO)ImplUtil.getBeanByName("UserinfoDAO");
	        
	        Userinfo user = userDao.findById(comDao.findById(comComId).getUserinfo().getUserId());
	        
	        JSONObject js = new JSONObject();
	       	js.put("comTo", user.getNickName());
	       	js.put("comComId", comId);
	       	
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
		
	public void saveComment(Comment com) {
	        
	     CommentDAO comDao = (CommentDAO)ImplUtil.getBeanByName("CommentDAO");
	     ProfileDAO profDao = (ProfileDAO)ImplUtil.getBeanByName("ProfileDAO");
	     Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");	        
	      
	     if(com.getComComId() == null )
	    	 com.setComComId(0);
	     com.setComTime(new Timestamp(System.currentTimeMillis()));
	     com.setUserinfo(user);
	     comDao.save(com);
	     
	     addComAt(com);
	}

	public boolean deleteComment(Integer comId) {
		// TODO Auto-generated method stub
		try{
			CommentDAO comDao = (CommentDAO) ImplUtil.getBeanByName("CommentDAO");
			AtmeDAO amDao = (AtmeDAO) ImplUtil.getBeanByName("AtmeDAO");
			
			// 删除相关@
			List<Atme> amList = amDao.findByProperty("comment", comDao.findById(comId));
			for( int i = 0; i < amList.size(); i++ ){
				amDao.delete(amList.get(i));
			}
			
			comDao.delete(comDao.findById(comId));
		}catch(Exception e){
			return false;
		}
		return true;
	}

	public ArrayList<Comment> getCommentByUser() {
		
        CommentDAO comDao = (CommentDAO)ImplUtil.getBeanByName("CommentDAO");
        ProfileDAO profDao = (ProfileDAO) ImplUtil.getBeanByName("ProfileDAO");
        
		Userinfo user = ImplUtil.getSessionUser();		
        
        List<Comment> all = comDao.findAll();
        ArrayList<Comment> results = new ArrayList<Comment>();
        
        for( int i = 0; i < all.size(); i++ ){
        	Comment com = all.get(i);
        	Profile prof = profDao.findById(com.getProfile().getProfId());

        	// 判断评论是否为本人评论
        	if( !com.getUserinfo().getUserId().equals(user.getUserId())){
        		// 判断本条评论的微博是否为本人所发
	        	if( prof.getUserinfo().getUserId().equals(user.getUserId()) )
	        		results.add(com);	        	 
	        	else{
		        	if( com.getComComId() != 0 ){      		
		        		Comment comCom =  com.getComCom();  
		        		if( comCom != null ){
		        			// 判断本条评论的所回复的评论是否为本人所发
			        		if( comCom.getUserinfo().getUserId().equals(user.getUserId()) )
			        			results.add(com);   
		        		}
		        	}
	        	}
        	}
        }
        
        java.util.Collections.reverse(results);
        
		return (ArrayList<Comment>) results;
	}

	public ArrayList<Comment> getSendComList() {
		// TODO Auto-generated method stub
		CommentDAO comDao = (CommentDAO)ImplUtil.getBeanByName("CommentDAO");
		Userinfo user = ImplUtil.getSessionUser();	
		ArrayList<Comment> results =  (ArrayList<Comment>) comDao.findByProperty("userinfo", user);
		
		Collections.sort(results,new Comparator<Comment>(){
        	public int compare(Comment c1,Comment c2){
        		if(c1.equals(c2)){
        			return 0 ;
        		}else if(c1.getComId()<c2.getComId()){	
        			return 1 ;
        		}else{
        			return -1 ;
        		}
        	}
        });
		
		return results;
	}

	public ArrayList<Comment> getComListByFollow() {
		// TODO Auto-generated method stub
		FansManageDAO fmDao = (FansManageDAO)ImplUtil.getBeanByName("FansManageDAO");
		Map<String,Object> session = ActionContext.getContext().getSession();
		Userinfo user = (Userinfo) session.get("user");	
			
		List<Comment> totalList = getCommentByUser();
		List<FansManage> followList = fmDao.findByFansId(user.getUserId());
		ArrayList<Comment> results = new ArrayList<Comment>();
		
		for( int i = 0; i < totalList.size(); i++ ){
			int comFrom = totalList.get(i).getUserinfo().getUserId();
			for( int j = 0; j < followList.size(); j++ ){
				if( followList.get(j).getFollowId().equals(comFrom) ){
					results.add(totalList.get(i));
					break;
				}
			}
		}
		
		Collections.sort(results,new Comparator<Comment>(){
        	public int compare(Comment c1,Comment c2){
        		if(c1.equals(c2)){
        			return 0 ;
        		}else if(c1.getComId()<c2.getComId()){	
        			return 1 ;
        		}else{
        			return -1 ;
        		}
        	}
        });
		
		return results;
	}

	public ArrayList<Comment> getComListByStranger() {
		FansManageDAO fmDao = (FansManageDAO)ImplUtil.getBeanByName("FansManageDAO");
		Map<String,Object> session = ActionContext.getContext().getSession();
		Userinfo user = (Userinfo) session.get("user");	
			
		List<Comment> totalList = getCommentByUser();
		List<FansManage> followList = fmDao.findByFansId(user.getUserId());
		ArrayList<Comment> results = new ArrayList<Comment>();
		
		for( int i = 0; i < totalList.size(); i++ ){
			int comFrom = totalList.get(i).getUserinfo().getUserId();
			for( int j = 0; j < followList.size(); j++ ){
				if( followList.get(j).getFollowId().equals(comFrom) ){
					break;
				}
				if( followList.size() == j + 1 ){
					results.add(totalList.get(i));
				}
			}
		}
		
		Collections.sort(results,new Comparator<Comment>(){
        	public int compare(Comment c1,Comment c2){
        		if(c1.equals(c2)){
        			return 0 ;
        		}else if(c1.getComId()<c2.getComId()){	
        			return 1 ;
        		}else{
        			return -1 ;
        		}
        	}
        });
		
		return results;
	}

	public void deleteSelected(String selectedList) {
		String[] arraycheck = selectedList.split(",");  
		for( int i = 0; i < arraycheck.length; i++){
			deleteComment(Integer.parseInt(arraycheck[i]));
		}
	}
	
	public Comment getBeCommented(Integer comComId) {
		// TODO Auto-generated method stub
		CommentDAO comDao = (CommentDAO)ImplUtil.getBeanByName("CommentDAO");
		return comDao.findById(comComId);
	}

	public Userinfo getBeCommentedProfUser(int profId) {

        ProfileDAO profDao = (ProfileDAO) ImplUtil.getBeanByName("ProfileDAO");
        UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
        
        int userId = profDao.findById(profId).getUserinfo().getUserId();       
		return userDao.findById(userId);
	}

	public ArrayList<Comment> getAtMeComPage() {
		
		AtmeDAO amDao = (AtmeDAO) ImplUtil.getBeanByName("AtmeDAO");
		CommentDAO comDao = (CommentDAO)ImplUtil.getBeanByName("CommentDAO");
	
		Userinfo user = ImplUtil.getSessionUser();
		
		ArrayList<Atme> comIdList = (ArrayList<Atme>) amDao.findByAtWho(user.getNickName());	
		ArrayList<Atme> results = new ArrayList<Atme>();
		
		for( int i = 0; i < comIdList.size(); i++ ){
			if( comIdList.get(i).getProfile() == null ){
				results.add(comIdList.get(i));
			}
		}
		
		ArrayList<Comment> amComList = new ArrayList<Comment>();
		
		for( int i = 0; i < results.size(); i++ ){
			Atme am = results.get(i);
			Comment com = comDao.findById(am.getComment().getComId());
			amComList.add(com);
		}
		java.util.Collections.reverse(amComList);
		return amComList;
	}

	public boolean addComAt(Comment com) {
		
		AtmeDAO amDao = (AtmeDAO) ImplUtil.getBeanByName("AtmeDAO");
		
		Pattern p = Pattern.compile("[@]+");
		String[] tmp = p.split(com.getComContent());
		
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
			am.setComment(com);

			amDao.save(am);
		}				       
        
		return true;
	}
}
