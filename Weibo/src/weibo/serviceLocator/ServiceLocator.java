package weibo.serviceLocator;

import org.springframework.context.ApplicationContext;

import weibo.servive.CommentServ;
import weibo.servive.FansServ;
import weibo.servive.MsgServ;
import weibo.servive.PageServ;
import weibo.servive.ProfileServ;
import weibo.servive.UserServ;
import weibo.util.ImplUtil;

public class ServiceLocator {

	private ApplicationContext appContext;
	private static UserServ userServ;
	private static MsgServ msgServ;
	private static FansServ fansServ;
	private static CommentServ commentServ;
	private static ProfileServ profileServ;
	private static PageServ pageServ;
	
	public ServiceLocator() {
		this.appContext = ImplUtil.getApplicationContext();
		this.userServ = (UserServ) ImplUtil.getBeanByName("UserServ");
		this.msgServ = (MsgServ) ImplUtil.getBeanByName("MsgServ");
		this.fansServ = (FansServ) ImplUtil.getBeanByName("FansServ");
		this.commentServ = (CommentServ) ImplUtil.getBeanByName("CommentServ");
		this.profileServ = (ProfileServ) ImplUtil.getBeanByName("ProfileServ");
		this.pageServ = (PageServ) ImplUtil.getBeanByName("PageServ");
	}

	public static UserServ getUserServ() {
		return userServ;
	}

	public void setUserServ(UserServ userServ) {
		this.userServ = userServ;
	}

	public static MsgServ getMsgServ() {
		return msgServ;
	}

	public void setMsgServ(MsgServ msgServ) {
		this.msgServ = msgServ;
	}

	public static FansServ getFansServ() {
		return fansServ;
	}

	public void setFansServ(FansServ fansServ) {
		this.fansServ = fansServ;
	}

	public static CommentServ getCommentServ() {
		return commentServ;
	}

	public void setCommentServ(CommentServ commentServ) {
		this.commentServ = commentServ;
	}

	public static ProfileServ getProfileServ() {
		return profileServ;
	}

	public void setProfileServ(ProfileServ profileServ) {
		this.profileServ = profileServ;
	}

	public ApplicationContext getAppContext() {
		return appContext;
	}

	public void setAppContext(ApplicationContext appContext) {
		this.appContext = appContext;
	}

	public static PageServ getPageServ() {
		return pageServ;
	}

	public void setPageServ(PageServ pageServ) {
		this.pageServ = pageServ;
	}
	
	
}
