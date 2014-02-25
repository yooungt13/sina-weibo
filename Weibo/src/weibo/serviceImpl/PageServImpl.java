package weibo.serviceImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

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
import weibo.hibernate.MsgNotice;
import weibo.hibernate.Profile;
import weibo.hibernate.ProfileDAO;
import weibo.hibernate.TransmitCollection;
import weibo.hibernate.TransmitCollectionDAO;
import weibo.hibernate.Userinfo;
import weibo.servive.CommentServ;
import weibo.servive.FansServ;
import weibo.servive.MsgServ;
import weibo.servive.PageServ;
import weibo.servive.ProfileServ;
import weibo.util.ImplUtil;

public class PageServImpl implements PageServ{

	public PageBean getProfPage(ProfileServ profServ,int pageNumber) {
		// 声明一个PageBean用来存放翻页间数据
	    PageBean pg = new PageBean();
		Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");	
		List<Profile> totalList = profServ.getTotalProfByUser(user);
		
	    pg.setTotalPosts(totalList.size());
	    pg.setPageNumer(pageNumber);
	    pg.setTotalPages(this.getTotalPages(pg));    	
	    pg.setProfList( getListByPageNum(pageNumber, pg.getPageSize(), (ArrayList) totalList) );
	    
		return pg;
	}

	public PageBean getMyProfPage(ProfileServ profServ, int pageNumber) {
		// TODO Auto-generated method stub
		PageBean pg = new PageBean();
		Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");	
		List<Profile> myList = profServ.getProfByUser(user);
		
		pg.setTotalPosts(myList.size());
		pg.setPageNumer(pageNumber);
		
		int tp =  pg.getTotalPosts()/pg.getPageSize() + ((pg.getTotalPosts()%pg.getPageSize())>0?1:0); 
		pg.setTotalPages(tp);  
		pg.setProfList( getListByPageNum(pageNumber, pg.getPageSize(), (ArrayList) myList));
		
		return pg;
	}

	public int getTotalPages(PageBean pg) {
		// TODO Auto-generated method stub
		//计算得出的总页数   	
	    int tp =  pg.getTotalPosts()/pg.getPageSize() + ((pg.getTotalPosts()%pg.getPageSize())>0?1:0); 
		
		return (tp>5)? 5 : tp;
	}

	public PageBean getCommentList(CommentServ comServ, int pageNumber,
			int listType) {
		// TODO Auto-generated method stub
		PageBean pg = new PageBean();		
		ArrayList<Comment> comList = new ArrayList<Comment>();
				
		switch(listType){
			case 1:	comList = comServ.getCommentByUser(); break;
			case 2:	comList = comServ.getComListByFollow(); break;		
			case 3:	comList = comServ.getComListByStranger();  break;
			case 4:	comList = comServ.getSendComList(); break;	
			default:break;
		}
		
		pg.setPageNumer(pageNumber);
		pg.setTotalPosts(comList.size());
		pg.setList(getListByPageNum(pageNumber, pg.getPageSize(), comList));
		pg.setTotalPages(this.getTotalPages(pg)); 
		return pg;
	}

	public PageBean getMyFavorsPage(ProfileServ profServ, int pageNumber) {
		
		TransmitCollectionDAO tcDao = (TransmitCollectionDAO) ImplUtil.getBeanByName("TransmitCollectionDAO");
		
		PageBean pg = new PageBean();	
		Userinfo user = ImplUtil.getSessionUser();
		ArrayList<TransmitCollection> profIdList = new ArrayList<TransmitCollection>();
		ArrayList<Profile> favorList = new ArrayList<Profile>();
		
		profIdList = (ArrayList<TransmitCollection>) tcDao.findByProperty("userinfo", user);
		
		java.util.Collections.reverse( profIdList );
		
		for( int i = 0; i < profIdList.size(); i++ ){			
			TransmitCollection tc = profIdList.get(i);
			if(tc.getTcOriginal() == 0){
				Profile prof = profServ.findProf(tc.getProfile().getProfId());
				prof.setFavorId(tc.getTcId());
				prof.setCollectTime(tc.getTcTime());
				favorList.add(prof);
			}
		}
		
		pg.setPageNumer(pageNumber);
		pg.setTotalPosts(favorList.size());
		pg.setProfList(getListByPageNum(pageNumber, pg.getPageSize(), favorList));
		pg.setTotalPages(this.getTotalPages(pg)); 
		return pg;
		
	}
	
	public PageBean getAtMePage(ProfileServ profServ, int pageNumber) {

		PageBean pg = new PageBean();	
		ArrayList<Profile> amList = profServ.getAtMePage();

		pg.setPageNumer(pageNumber);
		pg.setTotalPosts(amList.size());
		pg.setProfList(getListByPageNum(pageNumber, pg.getPageSize(), amList));
		pg.setTotalPages(this.getTotalPages(pg)); 
		return pg;
	}

	public PageBean getAtMeComPage(CommentServ comServ, int pageNumber) {
	
		PageBean pg = new PageBean();	
		ArrayList<Comment> amComList = comServ.getAtMeComPage();
		
		pg.setPageNumer(pageNumber);
		pg.setTotalPosts(amComList.size());
		pg.setList(getListByPageNum(pageNumber, pg.getPageSize(), amComList));
		pg.setTotalPages(this.getTotalPages(pg)); 
		return pg;
	}
	
	public void initCommentsList(CommentServ comServ, int pageNumber,int comListType) {
		
		HttpServletResponse response; 
        response=ServletActionContext.getResponse(); 
        response.setContentType( "text/json;charset=utf-8"); 
        response.setHeader( "Cache-Control", "no-cache"); 
        response.setHeader( "Pargma", "no-cache"); 
        PrintWriter out;

		PageBean pg = getCommentList(comServ, pageNumber, comListType);
		ArrayList<Comment> comList = pg.getList();
		Userinfo loginer = (Userinfo) ActionContext.getContext().getSession().get("user");
		
		try {
			out = response.getWriter();
			JSONArray returnComments = new JSONArray();			
			
			for( int i = 0; i < comList.size(); i++){
		       	JSONObject js = new JSONObject();
		       	Comment c = comList.get(i);
		       	js.put("comId", c.getComId());
		       	js.put("comComId", c.getComComId());
		       	js.put("comContent", c.getPublishContent());
		       	js.put("pubTime", c.getPubTime());	    	
		       	js.put("comFromId", c.getUserinfo().getUserId());
		       	
		       	if( comListType != 4 ){
			       	int userId = c.getUserinfo().getUserId();
			       	int loginId = loginer.getUserId();
			       	
			       	if( userId == loginId ){			       		
			       		js.put("comFrom", "我");			       	
			       		if( c.getComComId() != 0 ){
				       		js.put("comComContent", c.getPublishComContent());
				       		js.put("comComProfileId", c.getComCom().getProfile().getProfId());
				       	}else{
				       		js.put("comProfContent", c.getPublishProfContent());
				       		js.put("comProfileId", c.getProfile().getProfId());
				       	}
			       	}else{
			       		js.put("comFrom", c.getComFrom());
			       		if( c.getComComId() != 0 ){
				       		js.put("comComContent", c.getPublishComContent());
				       		if( c.getComCom() != null )
				       			js.put("comComProfileId", c.getComCom().getProfile().getProfId());
				       		
				       	}else{
				       		js.put("comProfContent", c.getPublishProfContent());
				       		js.put("comProfileId", c.getProfile().getProfId());
				       	}			       		
			       	}
		       	}else{
		       		if( c.getComComId() != 0 ){
			       		js.put("comComContent", c.getPublishComContent());			     
			       		if( !c.getComComContent().equals("error") ){
			       			js.put("comComFromId", comServ.getBeCommented(c.getComComId()).getUserinfo().getUserId());
			       			js.put("comComProfileId", c.getComCom().getProfile().getProfId());
			       			js.put("comFrom", comServ.getBeCommented(c.getComComId()).getComFrom());
			       		}else{
			       			js.put("comFrom", "a");
			       		}
			       	}else{
			       		js.put("comProfContent", c.getPublishProfContent());		       		
			       		if( !c.getComProfContent().equals("error") ){
			       			int profId = c.getProfile().getProfId();
			       			js.put("comFrom", comServ.getBeCommentedProfUser(profId).getNickName());
			       			js.put("comProfileId", profId);
			       			js.put("comProfileFromId",  comServ.getBeCommentedProfUser(profId).getUserId());
			       		}else{
			       			js.put("comFrom", "b");
			       		}
			       	}
		       	}

				js.put("comFace", c.getComFace());
				    	
		       	js.put("totalPosts", pg.getTotalPosts());		       	
		       	js.put("profId", c.getProfile().getProfId());
		       	 
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

	public void initFansList(FansServ fansServ, int pageNumber, int fansListType){
		HttpServletResponse response; 
        response=ServletActionContext.getResponse(); 
        response.setContentType( "text/json;charset=utf-8"); 
        response.setHeader( "Cache-Control", "no-cache"); 
        response.setHeader( "Pargma", "no-cache"); 
        PrintWriter out;
        PageBean pg = getFansIdList(fansServ , pageNumber , fansListType);
        ArrayList<FansManage> fansList = pg.getFansList();
        try {
			  out = response.getWriter();
			  JSONArray returnComments = new JSONArray();			 
			  for(int i=0;i<fansList.size();i++){
				  JSONObject js = new JSONObject();
				  FansManage c =fansList.get(i);
				  js.put("fansId", c.getFansId());
				  js.put("fmId", c.getFmId());
				  js.put("fansName", c.getFansName());
				  js.put("ack", c.getAck());
				  js.put("fansNumber", c.getFansNumber());
				  js.put("fansCity", c.getFansCity());
				  js.put("myface", c.getMyface());
				  js.put("seximage", c.getSeximage());
				  js.put("totalPosts", pg.getTotalPosts());
				  js.put("pageSize", pg.getPageSize());
				  js.put("fansIdPro", c.getFansIdPro());
				  js.put("fansIdProfId", c.getFansIdProfId());				  
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
	public PageBean getFansIdList(FansServ fansServ, int pageNumber,int listType){
		PageBean pg = new PageBean();		
		ArrayList<FansManage> fansList = new ArrayList<FansManage>();
		Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");
		for(int i = 0;i < 2; i++)
		{
		switch(listType){
		    case 1: fansList = fansServ.getFansListByUser(user);break;
		    case 2: fansList = fansServ.getFansIdSqList(user);break;
		    default: listType =1;
		    break;
		   }
		}
		pg.setPageNumer(pageNumber);
		pg.setTotalPosts(fansList.size());
		pg.setFansList(getListByPageNum(pageNumber, pg.getPageSize(), fansList));
		pg.setTotalPages(this.getTotalPages(pg)); 
		return pg;
	}
	public PageBean getFollowIdList(FansServ fansServ,int pageNumber,int listType)
	{
		PageBean pg = new PageBean();
		ArrayList<FansManage> followLists = new ArrayList<FansManage>();
		Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");
		for(int i =0; i< 2;i++)
		{
		switch(listType){
		    case 1: followLists = fansServ.getFollowListByUser(user);break;
		    case 2: followLists = fansServ.getFollowIdSqList(user);break;
		    case 3: followLists = fansServ.getGroupFollowId(user);break;
		    default: listType =1; 
		    break;
		   }
		}
		pg.setPageNumer(pageNumber);
		pg.setTotalPosts(followLists.size());
		pg.setFollowList(getListByPageNum(pageNumber, pg.getPageSize(), followLists));
		pg.setTotalPages(this.getTotalPages(pg)); 
		return pg;
	}
	public void initFollowList(FansServ fansServ, int pageNumber, int followListType){
		HttpServletResponse response; 
        response=ServletActionContext.getResponse(); 
        response.setContentType( "text/json;charset=utf-8"); 
        response.setHeader( "Cache-Control", "no-cache"); 
        response.setHeader( "Pargma", "no-cache"); 
        PrintWriter out;
        PageBean pg = getFollowIdList(fansServ , pageNumber , followListType);
        ArrayList<FansManage> followList = pg.getFollowList();
        try {
			  out = response.getWriter();
			  JSONArray returnComments = new JSONArray();
//			  JSONArray returnComment = new JSONArray();
			  for(int i=0;i<followList.size();i++){
				  JSONObject js = new JSONObject();
				  FansManage c =followList.get(i);
				  js.put("followId", c.getFollowId());
				  js.put("fmId", c.getFmId());
				  js.put("followCity", c.getFollowCity());
				  js.put("followNumber", c.getFollowNumber());
				  js.put("followsex", c.getFollowsex());
				  js.put("fmyface", c.getFmyface());
				  js.put("totalPosts", pg.getTotalPosts());
				  js.put("followName", c.getFollowName());
				  js.put("followack", c.getFollowack());
				  js.put("followIdProfId", c.getFollowIdProfId());
				  js.put("followIdPro", c.getFollowIdPro());
				  returnComments.put(js);
			  }
//			  JSONObject jss = new JSONObject();
//			  if(followList.size() == 0)
//			  {
//				  jss.put("userFansNumber", 0);
//			  }
//			  else
//			  {   
//				  int a = followList.get(0).getUserFansNumber();
//			      jss.put("userFansNumber", a);
//			  }
//			  returnComment.put(jss);
//			  out.write(returnComment.toString());
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
	public PageBean getFansPage(FansServ fansServ, int pageNumber,Userinfo user)
	{
		// 声明一个PageBean用来存放翻页间数据
		PageBean pg = new PageBean();
		List<FansManage> totalList = fansServ.getFansListByUser(user);
		pg.setPageNumer(pageNumber);
		//计算得出的总页数  
		pg.setTotalPosts(totalList.size());
		int tp =  pg.getTotalPosts()/pg.getPageSize() + ((pg.getTotalPosts()%pg.getPageSize())>0?1:0); 
	    pg.setTotalPages( (tp>5)? 5 : tp );
	    	
	    pg.setFansList( (ArrayList<FansManage>) getListByPageNum(pg.getPageNumer(), pg.getPageSize(), (ArrayList) totalList) );
	    ActionContext.getContext().getSession().put("page",pg);
		
		return pg;
		
	}
	
	public PageBean getFollowPage(FansServ followServ, int pageNumber,Userinfo user)
	{
		// 声明一个PageBean用来存放翻页间数据
		PageBean pg = new PageBean();
		List<FansManage> totalList = followServ.getFollowListByUser(user);
		pg.setPageNumer(pageNumber);
		//计算得出的总页数  
		pg.setTotalPosts(totalList.size());
		int tp =  pg.getTotalPosts()/pg.getPageSize() + ((pg.getTotalPosts()%pg.getPageSize())>0?1:0); 
	    pg.setTotalPages( (tp>5)? 5 : tp );
	    	
	    pg.setFollowList( (ArrayList<FansManage>) getListByPageNum(pg.getPageNumer(), pg.getPageSize(), (ArrayList) totalList) );
	    ActionContext.getContext().getSession().put("page",pg);
		
		return pg;
		
	}
	
	
	public PageBean getMsgPage(MsgServ msgServ, int pageNumber){
		// TODO Auto-generated method stub
		PageBean pg = new PageBean();
		List<MsgNotice> myList = msgServ.getMsgList();
		
		pg.setTotalPosts(myList.size());
		pg.setPageNumer(pageNumber);	   		
		pg.setTotalPages(this.getTotalPages(pg));  
		pg.setMsgList( getListByPageNum(pageNumber, pg.getPageSize(), (ArrayList) myList));
		
		return pg;
		
	}
	
	public PageBean getFromMsgPage(MsgServ msgServ, int pageNumber){
		PageBean pg = new PageBean();
		List<MsgNotice> myList = msgServ.getFromMsgList();
		
		pg.setTotalPosts(myList.size());
		pg.setPageNumer(pageNumber);	   		
		pg.setTotalPages(this.getTotalPages(pg));  
		pg.setFrommsgList( getListByPageNum(pageNumber, pg.getPageSize(), (ArrayList) myList));
		
		return pg;
	}
	
	public ArrayList getListByPageNum(Integer pageNumer, Integer pageSize, ArrayList list) {
		// TODO Auto-generated method stub
		ArrayList results=new ArrayList();
		
		// 本页第一个微博编号
		int firstNum = ( pageNumer - 1 ) * pageSize;
		if( ( firstNum + pageSize ) < list.size() )
		{
			for(int i =  firstNum; i < ( firstNum + pageSize ); i++)
			{
				results.add( list.get(i) );
			}
		}
		else
		{
			for(int i = firstNum; i < list.size(); i++)
			{
				results.add(list.get(i));
			}
		}
		return results;
	}
	public PageBean getSystemMsgPage(MsgServ msgServ, int pageNumber){
		PageBean pg = new PageBean();
		List<MsgNotice> myList = msgServ.getSystemList();
		
		pg.setTotalPosts(myList.size());
		pg.setPageNumer(pageNumber);	   		
		pg.setTotalPages(this.getTotalPages(pg));  
		pg.setSystemList( getListByPageNum(pageNumber, pg.getPageSize(), (ArrayList) myList));
		
		return pg;
	}
	public PageBean getNoticeMsgPage(MsgServ msgServ, int pageNumber){
		PageBean pg = new PageBean();
		List<MsgNotice> myList = msgServ.getNoticeList();
		
		pg.setTotalPosts(myList.size());
		pg.setPageNumer(pageNumber);	   		
		pg.setTotalPages(this.getTotalPages(pg));  
		pg.setNoticeList( getListByPageNum(pageNumber, pg.getPageSize(), (ArrayList) myList));
		
		return pg;
	}
}
