package weibo.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.json.JSONException;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;

import weibo.bean.CountBean;
import weibo.hibernate.CommentDAO;
import weibo.hibernate.Count;
import weibo.hibernate.CountDAO;
import weibo.hibernate.Login;
import weibo.hibernate.Profile;
import weibo.hibernate.Userinfo;
import weibo.hibernate.UserinfoDAO;
import weibo.servive.ProfileServ;
import weibo.servive.UserServ;
import weibo.util.ImplUtil;

public class LoginAction extends BaseAction{

	private Login login;
	private ArrayList<Userinfo> newcomList;
	private ArrayList<Userinfo> famousList;
	private ArrayList<Profile> recentList; 
	
	public Login getLogin() {
		return login;
	}

	public void setLogin(Login login) {
		this.login = login;
	}

	public ArrayList<Userinfo> getNewcomList() {
		return newcomList;
	}

	public void setNewcomList(ArrayList<Userinfo> newcomList) {
		this.newcomList = newcomList;
	}

	public ArrayList<Userinfo> getFamousList() {
		return famousList;
	}

	public void setFamousList(ArrayList<Userinfo> famousList) {
		this.famousList = famousList;
	}

	public ArrayList<Profile> getRecentList() {
		return recentList;
	}

	public void setRecentList(ArrayList<Profile> recentList) {
		this.recentList = recentList;
	}

	@Override
	public String execute() throws Exception {
		
		// TODO Auto-generated method stub	
		UserServ userServ = this.servLocator.getUserServ();
		Login log = userServ.validLogin(login.getLoginName(), login.getPassword());	
		if(log!=null){			
			if( log.getLoginType() == 0){
				return "homePage";	
			}else{
				return "manage";
			}
		}
		else{
			return "login";				
		}
	}
	
	public String initLogin(){
		try{
			UserServ userServ = this.servLocator.getUserServ();
			ProfileServ profServ = this.servLocator.getProfileServ();
			
			this.setFamousList(userServ.getFamousList(6));
			this.setNewcomList(userServ.getNewconList());
			this.setRecentList(profServ.getRecentProf());
			return "success";
		}catch(Exception e){
			return "error";
		}
	}
	
	public String exitLogin(){
		try{
			ActionContext.getContext().getSession().remove("user");
			ActionContext.getContext().getSession().remove("error");
			return "success";
		}catch(Exception e){
			return "error";
		}
	}
	
	public String refreshCount(){
		
		try {
			HttpServletResponse response; 
	        response=ServletActionContext.getResponse(); 
	        response.setContentType( "text/json;charset=utf-8"); 
	        response.setHeader( "Cache-Control", "no-cache"); 
	        response.setHeader( "Pargma", "no-cache"); 
	        PrintWriter out;
	        
			out = response.getWriter();
			Userinfo user = ImplUtil.getSessionUser();
			
			CountDAO cDao = (CountDAO) ImplUtil.getBeanByName("CountDAO");
			Count cb = cDao.findById(user.getUserId());		
			
	        JSONObject js = new JSONObject();
	       	js.put("fansCount", user.getFansCount() - cb.getFansCount());
	    	js.put("atProfileCount", user.getAtProfileCount() - cb.getAtProfileCount());
	    	js.put("atCommentCount", user.getAtCommentCount() - cb.getAtCommentCount());
	    	js.put("msgCount", user.getMsgCount() - cb.getMsgCount());
	    	js.put("noticeCount", user.getNoticeCount() - cb.getNoticeCount());
	    	js.put("commentCount", user.getCommentCount() - cb.getCommentCount());
	       	
	        out.write(js.toString()); 
	        out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		return null;	
	}
}
