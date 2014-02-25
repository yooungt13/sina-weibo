package weibo.bean;

import weibo.hibernate.Userinfo;
import weibo.serviceLocator.ServiceLocator;
import weibo.servive.FansServ;
import weibo.servive.MsgServ;
import weibo.servive.ProfileServ;

public class CountBean {
	private Userinfo user;
	
	private int profileCount;
	private int commentCount;
	private int followCount;
	private int fansCount;
	private int msgCount;
	private int noticeCount;
	
	public Userinfo getUser() {
		return user;
	}
	public void setUser(Userinfo user) {
		this.user = user;
	}
	public int getProfileCount() {
		return profileCount;
	}
	public void setProfileCount(int profileCount) {
		this.profileCount = profileCount;
	}
	public int getFollowCount() {
		return followCount;
	}
	public void setFollowCount(int followCount) {
		this.followCount = followCount;
	}
	public int getMsgCount() {
		return msgCount;
	}
	public void setMsgCount(int msgCount) {
		this.msgCount = msgCount;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public int getNoticeCount() {
		return noticeCount;
	}
	public void setNoticeCount(int noticeCount) {
		this.noticeCount = noticeCount;
	}
	public int getFansCount() {
		return fansCount;
	}
	public void setFansCount(int fansCount) {
		this.fansCount = fansCount;
	}

	
}
