package weibo.hibernate;

/**
 * Count entity. @author MyEclipse Persistence Tools
 */
public class Count extends AbstractCount implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Count() {
	}

	/** full constructor */
	public Count(Integer userId, Userinfo userinfo, Long fansCount,
			Long msgCount, Long atProfileCount, Long atCommentCount,
			Long noticeCount, Long commentCount) {
		super(userId, userinfo, fansCount, msgCount, atProfileCount,
				atCommentCount, noticeCount, commentCount);
	}

}
