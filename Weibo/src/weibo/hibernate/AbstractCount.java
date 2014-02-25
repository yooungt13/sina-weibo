package weibo.hibernate;

/**
 * AbstractCount entity provides the base persistence definition of the Count
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractCount implements java.io.Serializable {

	// Fields

	private Integer userId;
	private Userinfo userinfo;
	private Long fansCount;
	private Long msgCount;
	private Long atProfileCount;
	private Long atCommentCount;
	private Long noticeCount;
	private Long commentCount;

	// Constructors

	/** default constructor */
	public AbstractCount() {
	}

	/** full constructor */
	public AbstractCount(Integer userId, Userinfo userinfo, Long fansCount,
			Long msgCount, Long atProfileCount, Long atCommentCount,
			Long noticeCount, Long commentCount) {
		this.userId = userId;
		this.userinfo = userinfo;
		this.fansCount = fansCount;
		this.msgCount = msgCount;
		this.atProfileCount = atProfileCount;
		this.atCommentCount = atCommentCount;
		this.noticeCount = noticeCount;
		this.commentCount = commentCount;
	}

	// Property accessors

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Userinfo getUserinfo() {
		return this.userinfo;
	}

	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}

	public Long getFansCount() {
		return this.fansCount;
	}

	public void setFansCount(Long fansCount) {
		this.fansCount = fansCount;
	}

	public Long getMsgCount() {
		return this.msgCount;
	}

	public void setMsgCount(Long msgCount) {
		this.msgCount = msgCount;
	}

	public Long getAtProfileCount() {
		return this.atProfileCount;
	}

	public void setAtProfileCount(Long atProfileCount) {
		this.atProfileCount = atProfileCount;
	}

	public Long getAtCommentCount() {
		return this.atCommentCount;
	}

	public void setAtCommentCount(Long atCommentCount) {
		this.atCommentCount = atCommentCount;
	}

	public Long getNoticeCount() {
		return this.noticeCount;
	}

	public void setNoticeCount(Long noticeCount) {
		this.noticeCount = noticeCount;
	}

	public Long getCommentCount() {
		return this.commentCount;
	}

	public void setCommentCount(Long commentCount) {
		this.commentCount = commentCount;
	}

}