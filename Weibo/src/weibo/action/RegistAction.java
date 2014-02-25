package weibo.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.json.JSONException;
import org.json.JSONObject;

import weibo.hibernate.CommentDAO;
import weibo.hibernate.Login;
import weibo.hibernate.LoginDAO;
import weibo.hibernate.Userinfo;
import weibo.hibernate.UserinfoDAO;

import weibo.servive.UserServ;
import weibo.util.ImplUtil;

public class RegistAction extends BaseAction{
	
	private Login login;
	private Userinfo userinfo;
	private String confirmpwd;
	private String birthday_y;
	private String birthday_m;
	private String birthday_d;

	public String getBirthday_y() {
		return birthday_y;
	}

	public void setBirthday_y(String birthday_y) {
		this.birthday_y = birthday_y;
	}

	public String getBirthday_m() {
		return birthday_m;
	}

	public void setBirthday_m(String birthday_m) {
		this.birthday_m = birthday_m;
	}

	public String getBirthday_d() {
		return birthday_d;
	}

	public void setBirthday_d(String birthday_d) {
		this.birthday_d = birthday_d;
	}

	public Userinfo getUserinfo() {
		return userinfo;
	}

	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}

	public Login getLogin() {
		return login;
	}

	public void setLogin(Login login) {
		this.login = login;
	}

	public String getConfirmpwd() {
		return confirmpwd;
	}

	public void setConfirmpwd(String confirmpwd) {
		this.confirmpwd = confirmpwd;
	}

	public String execute() throws Exception{
		// 用来获取操作USER的服务
		UserServ userServ = this.servLocator.getUserServ();
		
		if( login.getPassword().equals(this.confirmpwd) ){
			if( userServ.register(userinfo,login) ){			
				return "success";
			}else{
				return "error";
			}
		}else{
			return "error";
		}
		
	}
	
	public String validateInfo(){
		
		UserServ userServ = this.servLocator.getUserServ();
		userServ.validateInfo(login);
			
		return null;
	}
	
	public String validateNickName(){
		
		UserServ userServ = this.servLocator.getUserServ();
		try {
			this.userinfo.setNickName(java.net.URLDecoder.decode(this.userinfo.getNickName(),"utf-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		userServ.validateNickName(this.userinfo);
		
		return null;
	}
}
