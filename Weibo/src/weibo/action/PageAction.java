package weibo.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import weibo.bean.PageBean;
import weibo.hibernate.Comment;
import weibo.hibernate.FansManage;
import weibo.hibernate.FollowGroup;
import weibo.hibernate.MsgNotice;
import weibo.hibernate.Profile;
import weibo.hibernate.Userinfo;
import weibo.hibernate.UserinfoDAO;
import weibo.servive.CommentServ;
import weibo.servive.FansServ;
import weibo.servive.MsgServ;
import weibo.servive.PageServ;
import weibo.servive.ProfileServ;
import weibo.servive.UserServ;
import weibo.util.ImplUtil;

import com.opensymphony.xwork2.ActionContext;

public class PageAction extends BaseAction{

	private int pageNumber;		// 	当前页面
	private ArrayList<Profile> profList;
	private ArrayList<Comment> comList;
	private ArrayList<FansManage> fansList;
	private ArrayList<FansManage> followList;
	private ArrayList<Userinfo> famousList;
	private ArrayList<MsgNotice> msgList;
	private ArrayList<MsgNotice> frommsgList;
	private ArrayList<MsgNotice> systemList;
	private int listType;
	private PageBean pageBean;
	private ArrayList<FollowGroup> firstgroupList;
	private ArrayList<FollowGroup> lastgroupList;
	private ArrayList<MsgNotice> noticeList;
	private int userFansNumber;
	private int followIdNumber;
	public int getFollowIdNumber() {
		return followIdNumber;
	}

	public void setFollowIdNumber(int followIdNumber) {
		this.followIdNumber = followIdNumber;
	}

	/** **************************************************  **/
	
	public int getPageNumber() {
		if( pageNumber == 0 )
			return 1;
		return pageNumber;
	}

	public ArrayList<MsgNotice> getNoticeList() {
		return noticeList;
	}

	public void setNoticeList(ArrayList<MsgNotice> noticeList) {
		this.noticeList = noticeList;
	}

	public int getUserFansNumber() {
		return userFansNumber;
	}

	public void setUserFansNumber(int userFansNumber) {
		this.userFansNumber = userFansNumber;
	}

	public ArrayList<FollowGroup> getFirstgroupList() {
		return firstgroupList;
	}

	public void setFirstgroupList(ArrayList<FollowGroup> firstgroupList) {
		this.firstgroupList = firstgroupList;
	}

	public ArrayList<FollowGroup> getLastgroupList() {
		return lastgroupList;
	}

	public void setLastgroupList(ArrayList<FollowGroup> lastgroupList) {
		this.lastgroupList = lastgroupList;
	}

	public ArrayList<MsgNotice> getSystemList() {
		return systemList;
	}

	public void setSystemList(ArrayList<MsgNotice> systemList) {
		this.systemList = systemList;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public ArrayList<Profile> getProfList() {
		return profList;
	}

	public void setProfList(ArrayList<Profile> profList) {
		this.profList = profList;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	
	public ArrayList<Comment> getComList() {
		return comList;
	}

	public void setComList(ArrayList<Comment> comList) {
		this.comList = comList;
	}	
	
	public ArrayList<FansManage> getFansList() {
		return fansList;
	}

	public void setFansList(ArrayList<FansManage> fansList) {
		this.fansList = fansList;
	}

	public ArrayList<FansManage> getFollowList() {
		return followList;
	}

	public void setFollowList(ArrayList<FansManage> followList) {
		this.followList = followList;
	}

	public int getListType() {
		return listType;
	}

	public void setListType(int listType) {
		this.listType = listType;
	}

	public ArrayList<Userinfo> getFamousList() {
		return this.famousList;
	}
	
	public int getFamousCount(){
		return this.famousList.size();
	}

	public void setFamousList(ArrayList<Userinfo> famousList) {
		this.famousList = famousList;
	}

	public ArrayList<MsgNotice> getFrommsgList() {
		return frommsgList;
	}

	public void setFrommsgList(ArrayList<MsgNotice> frommsgList) {
		this.frommsgList = frommsgList;
	}

	public ArrayList<MsgNotice> getMsgList() {
		return msgList;
	}

	public void setMsgList(ArrayList<MsgNotice> msgList) {
		this.msgList = msgList;
	}
	
	/** **************************************************  **/
	// 初始化主页数据
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		ProfileServ profServ = this.servLocator.getProfileServ();
		PageServ pageServ = this.servLocator.getPageServ();
		this.setPageBean(pageServ.getProfPage(profServ, this.getPageNumber()));
		this.setProfList(this.pageBean.getProfList());
		
		UserServ userServ = this.servLocator.getUserServ();
		ArrayList<Userinfo> fmsList = userServ.getFamousList();
		this.setFamousList(fmsList);
		
		return "homePage";
	}
	
	// 初始化我的微博首页数据
	public String myProfPage() {
		// TODO Auto-generated method stub
		ProfileServ profServ = this.servLocator.getProfileServ();
		PageServ pageServ = this.servLocator.getPageServ();
		this.setPageBean(pageServ.getMyProfPage(profServ, this.getPageNumber()));
		this.setProfList(this.pageBean.getProfList());
		
		return "myProfile";
	}
	
	// 初始化收藏首页数据
	public String collectionList(){

		ProfileServ profServ = this.servLocator.getProfileServ();
		PageServ pageServ = this.servLocator.getPageServ();
		this.setPageBean(pageServ.getMyFavorsPage(profServ, this.getPageNumber()));
		this.setProfList(this.pageBean.getProfList());
		
		return "favors";		
	}
	
	// 初始化@我的微博首页数据
	public String atMeList(){
		// 用于提示小黄签刷新数据
		ImplUtil.saveCount("atprofile");
		ProfileServ profServ = this.servLocator.getProfileServ();
		PageServ pageServ = this.servLocator.getPageServ();
		this.setPageBean(pageServ.getAtMePage(profServ, this.getPageNumber()));
		this.setProfList(this.pageBean.getProfList());
		
		return "profOfAtMe";		
	}
	
	// 初始化@我的评论首页数据
	public String atMeComList(){
		// 用于提示小黄签刷新数据
		ImplUtil.saveCount("atcomment");
		CommentServ comServ = this.servLocator.getCommentServ();
		PageServ pageServ = this.servLocator.getPageServ();
		this.setPageBean(pageServ.getAtMeComPage(comServ, this.getPageNumber()));
		this.setComList(this.pageBean.getList());
		
		return "profOfAtComment";		
	}
	
	// 初始化评论首页数据
	public String commentsList() {
		// 用于提示小黄签刷新数据
		ImplUtil.saveCount("comment");
		CommentServ comServ = this.servLocator.getCommentServ();
		PageServ pageServ = this.servLocator.getPageServ();
		this.setPageBean(pageServ.getCommentList(comServ, this.getPageNumber(), this.listType));
		this.setComList(this.pageBean.getList());
		
		return "comments";
	}
	
	// 异步刷新评论页数据
	public String showCommentsList() {
		CommentServ comServ = this.servLocator.getCommentServ();
		PageServ pageServ = this.servLocator.getPageServ();
		pageServ.initCommentsList(comServ, this.getPageNumber(), this.listType);
		
		return null;		
	}
	
	public String showFansLts(){
		FansServ fansServ = this.servLocator.getFansServ();
		PageServ pageServ = this.servLocator.getPageServ();
		pageServ.initFansList(fansServ, this.getPageNumber(), this.listType);
		return null;
	}
	public String showFollowList(){
		FansServ fansServ = this.servLocator.getFansServ();
		PageServ pageServ = this.servLocator.getPageServ();
	    pageServ.initFollowList(fansServ, this.getPageNumber(), this.listType);
	    return null;
	}
	public String fans(){
		// 用于提示小黄签刷新数据
		ImplUtil.saveCount("fans");
		FansServ fansServ = this.servLocator.getFansServ();
		PageServ pageServ = this.servLocator.getPageServ();
		this.setPageBean(pageServ.getFansIdList(fansServ, this.getPageNumber() ,this.listType));
		this.setFansList(this.pageBean.getFansList());
		
		return "fans";
	}
	
	public String fansLis(){
		FansServ fansServ = this.servLocator.getFansServ();
		PageServ pageServ = this.servLocator.getPageServ();
		Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");
		this.setPageBean(pageServ.getFansPage(fansServ, this.getPageNumber(), user));
		this.setFansList(this.pageBean.getFansList());
		
		return "fans";
	}
	
	public String follow(){
		FansServ followServ = this.servLocator.getFansServ();
		PageServ pageServ = this.servLocator.getPageServ();
		Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");
		this.setPageBean(pageServ.getFollowIdList(followServ, this.getPageNumber(), this.listType));
		this.setFollowList(this.pageBean.getFollowList());
		this.setFirstgroupList(followServ.firstGroup());
		this.setLastgroupList(followServ.lastGroup());
		this.setUserFansNumber(followServ.getUserFansNumber());
		this.setFollowIdNumber(followServ.getFollowIdNumber());
		return "follow";
	}
	public String msgList(){
		MsgServ msgServ = this.servLocator.getMsgServ();
		PageServ pageServ = this.servLocator.getPageServ();
		this.setPageBean(pageServ.getMsgPage(msgServ, this.getPageNumber()));
		this.setMsgList(this.pageBean.getMsgList());
		
		return "messages";		
	}
	public String frommsgList(){
		// 用于提示小黄签刷新数据
		ImplUtil.saveCount("msg");
		MsgServ msgServ = this.servLocator.getMsgServ();
		PageServ pageServ = this.servLocator.getPageServ();
		this.setPageBean(pageServ.getFromMsgPage(msgServ, this.getPageNumber()));
		this.setFrommsgList(this.pageBean.getFrommsgList());
		
		return "frommessages";		
	}
	public String systemList(){
		// 用于提示小黄签刷新数据
		ImplUtil.saveCount("notice");
		MsgServ msgServ = this.servLocator.getMsgServ();
		PageServ pageServ = this.servLocator.getPageServ();
		this.setPageBean(pageServ.getSystemMsgPage(msgServ, this.getPageNumber()));
		this.setSystemList(this.pageBean.getSystemList());
		
		return "systemmessages";		
	}
	public String noticeList(){
		MsgServ msgServ = this.servLocator.getMsgServ();
		PageServ pageServ = this.servLocator.getPageServ();
		this.setPageBean(pageServ.getNoticeMsgPage(msgServ, this.pageNumber));
		this.setNoticeList(this.pageBean.getNoticeList());
		
		return "noticemessages";		
	}
	
}
