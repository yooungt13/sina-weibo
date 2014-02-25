package weibo.action;

import weibo.hibernate.Login;
import weibo.hibernate.Userinfo;
import weibo.hibernate.UserinfoDAO;
import weibo.servive.UserServ;
import weibo.util.ImplUtil;

import java.util.Date;
import java.util.Calendar;
import java.util.Map;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;


public class SettingAction extends BaseAction{
	private Userinfo user;
	private String birthday_y;
	private String birthday_m;
	private String birthday_d;
	private String birthday;
	private Date bir;
	
	private Login updatepassword;
	private String oldpassword;
	private String confirmpasswprd; 
	
	private Userinfo educationinfo;
	
	private Userinfo workinfo;
	
	private Userinfo tag;
	
	private Userinfo power;
	
	public Userinfo getPower() {
		return power;
	}

	public void setPower(Userinfo power) {
		this.power = power;
	}
	
	public Userinfo getWorkinfo() {
		return workinfo;
	}

	public void setWorkinfo(Userinfo workinfo) {
		this.workinfo = workinfo;
	}

	public Userinfo getEducationinfo() {
		return educationinfo;
	}

	public void setEducationinfo(Userinfo educationinfo) {
		this.educationinfo = educationinfo;
	}

	public Login getUpdatepassword() {
		return updatepassword;
	}

	public void setUpdatepassword(Login updatepassword) {
		this.updatepassword = updatepassword;
	}

	public String getOldpassword() {
		return oldpassword;
	}

	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}

	public String getConfirmpasswprd() {
		return confirmpasswprd;
	}

	public void setConfirmpasswprd(String confirmpasswprd) {
		this.confirmpasswprd = confirmpasswprd;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

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

	public Userinfo getUser() {
		return user;
	}

	public void setUser(Userinfo user) {
		this.user = user;
	}
	
	public Userinfo getTag() {
		return tag;
	}

	public void setTag(Userinfo tag) {
		this.tag = tag;
	}
		

	@Override
	public String execute() throws Exception {
		return "success";
	}
	
	@SuppressWarnings("deprecation")
	public String updateUser() throws ParseException{
		UserServ userServ = this.servLocator.getUserServ();

		//将日期从string型转为date型传入user
		this.birthday = this.birthday_y + this.birthday_m + this.birthday_d ;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		Date bir = formatter.parse(birthday);
		user.setBirthday(bir);

		if( userServ.updateUser(user) ){
			return "success";
		}
		return "error";
	}
	
	public String validateOldPassword(){
		UserServ userServ = this.servLocator.getUserServ();
		userServ.validateOldPassword(this.oldpassword);
		return null;
		
	}
	
	public String updatePassword() throws ParseException{
		UserServ userServ = this.servLocator.getUserServ();
		if(userServ.compare(this.oldpassword)){
			if( updatepassword.getPassword().equals(this.confirmpasswprd) ){
				if( userServ.updatePassword(updatepassword) ){			
					return "success";
				}else{
					return "error";
				}
			}else{
				return "error";
			}
		}
		return"error";
	}

	public String saveEducationinfo() throws ParseException{
		UserServ userServ = this.servLocator.getUserServ();

		if( userServ.saveEducationinfo(educationinfo) ){
			return "success";
		}
		return "error";	
	}
	
	public String saveWorkinfo() throws ParseException{
		UserServ userServ = this.servLocator.getUserServ();

		if( userServ.saveWorkinfo(workinfo) ){
			return "success";
		}
		return "error";	
	}
	
	public String Tag() throws ParseException{
		UserServ userServ = this.servLocator.getUserServ();

		if( userServ.Tag(tag) ){
			return "success";
		}
		return "error";	
	}
	
	public String validateNickName(){
		
		UserServ userServ = this.servLocator.getUserServ();
		try {
			this.user.setNickName(java.net.URLDecoder.decode(this.user.getNickName(),"utf-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		userServ.validateNickName(this.user);
		
		return null;
	}
	
	public String powerSetting() throws ParseException{
		UserServ userServ = this.servLocator.getUserServ();

		if( userServ.powerSetting(power) ){
			return "success";
		}
		return "error";	
	}
}




