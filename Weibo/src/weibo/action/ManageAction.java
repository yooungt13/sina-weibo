package weibo.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import weibo.bean.PageBean;
import weibo.hibernate.Login;
import weibo.hibernate.MsgNotice;
import weibo.hibernate.Profile;
import weibo.hibernate.Userinfo;
import weibo.servive.MsgServ;
import weibo.servive.PageServ;
import weibo.servive.ProfileServ;
import weibo.servive.UserServ;

public class ManageAction extends BaseAction{

	private int pageNumber;
	private PageBean pageBean;	
	
	private String nickName;
	private String profContent;
	private Profile prof;
	private int userId;
	private Login log;
	private String identifier;
	private  MsgNotice message;
	private String msgToName;
	private ArrayList<Profile> profList;
	private ArrayList<Userinfo> userList;
	private ArrayList<MsgNotice> noticeList;
	/** ****************************************************** **/
	
	public int getPageNumber() {
		return pageNumber;
	}

	public MsgNotice getMessage() {
		return message;
	}

	public void setMessage(MsgNotice message) {
		this.message = message;
	}

	public String getMsgToName() {
		return msgToName;
	}

	public void setMsgToName(String msgToName) {
		this.msgToName = msgToName;
	}

	public ArrayList<MsgNotice> getNoticeList() {
		return noticeList;
	}

	public void setNoticeList(ArrayList<MsgNotice> noticeList) {
		this.noticeList = noticeList;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(ArrayList arrayList) {
		PageServ pageServ = this.servLocator.getPageServ();		
		PageBean pg = new PageBean();
		
		if(this.pageNumber == 0){
			this.setPageNumber(1);
		}
		
		pg.setPageNumer(this.pageNumber);
		pg.setTotalPosts(arrayList.size());
		pg.setList(pageServ.getListByPageNum(pageNumber, pg.getPageSize(), arrayList));
		int tp =  pg.getTotalPosts()/pg.getPageSize() + ((pg.getTotalPosts()%pg.getPageSize())>0?1:0);
		pg.setTotalPages(tp); 
		this.pageBean = pg;
	}

	public String getNickName() throws UnsupportedEncodingException {
		return java.net.URLDecoder.decode(this.nickName,"utf-8");
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getProfContent() throws UnsupportedEncodingException {
		return java.net.URLDecoder.decode(this.profContent,"utf-8");
	}

	public void setProfContent(String profContent) {
		this.profContent = profContent;
	}

	public ArrayList<Profile> getProfList() {
		return profList;
	}

	public void setProfList(ArrayList<Profile> profList) {
		this.profList = profList;
	}

	public ArrayList<Userinfo> getUserList() {
		return userList;
	}

	public void setUserList(ArrayList<Userinfo> userList) {
		this.userList = userList;
	}
	
	public Profile getProf() {
		return prof;
	}

	public void setProf(Profile prof) {
		this.prof = prof;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Login getLog() {
		return log;
	}

	public void setLog(Login log) {
		this.log = log;
	}

	public String getIdentifier() {
		return identifier;
	}

	public void setIdentifier(String identifier) {
		this.identifier = identifier;
	}

	/** ****************************************************** **/
	
	public String initManage() throws Exception {
		return "success";	
	}
	

	public String userSearch() throws Exception {
		UserServ userServ = this.servLocator.getUserServ();
		this.setPageBean(userServ.getUserListByName(java.net.URLDecoder.decode(this.nickName,"utf-8")));
		this.setUserList(this.pageBean.getList());
		return "userSearch";
	}
	
	public String weiboSearch() throws Exception {
		ProfileServ profServ = this.servLocator.getProfileServ();
		UserServ userServ = this.servLocator.getUserServ();
		this.setPageBean(profServ.getProfListByContent(java.net.URLDecoder.decode(this.profContent,"utf-8")));
		this.setProfList(this.pageBean.getList());
		return "weiboSearch";
	}
	
	public String deleteWeibo() {
		// TODO Auto-generated method stub
		ProfileServ profServ = this.servLocator.getProfileServ();
		profServ.deleteProf(this.prof.getProfId());
		
		return "weiboSearch";
	}
	
	public String freezeUser() {
		// TODO Auto-generated method stub
		UserServ userServ = this.servLocator.getUserServ();
		userServ.freezeUser(this.userId);
		
		return "userSearch";
	}
	
	public String recoverUser() {
		// TODO Auto-generated method stub
		UserServ userServ = this.servLocator.getUserServ();
		userServ.recoverUser(this.userId);
		
		return "userSearch";
	}			
	
	public String getPwd(){
		ActionContext.getContext().getSession().remove("pwderror");
		return "getPwd";	
	}
	
	public String updatePwd(){
		
		UserServ userServ = this.servLocator.getUserServ();
		if(userServ.updatePwd(this.log,this.identifier)){		
			return "updatePwd";	
		}else{
			return "getPwd";
		}
	}
	
	public String confirmUpdatePwd(){
		
		if(ActionContext.getContext().getSession().get("updatepwd") == null){
			return "login";
		}else{
			UserServ userServ = this.servLocator.getUserServ();
			if(userServ.confirmUpdatePwd(this.log)){		
				return "login";	
			}else{
				return "error";
			}
		}
	}
	public String sendnotice(){
		
		MsgServ msgServ = this.servLocator.getMsgServ();
		msgServ.sendNotice(message,this.msgToName);
		return "notice";
	}
	public String sendallnotice(){
			
		MsgServ msgServ = this.servLocator.getMsgServ();
		msgServ.sendAllNotice(message,this.msgToName);
		return "allnotice";
	}
}
