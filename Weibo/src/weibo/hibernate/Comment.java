package weibo.hibernate;

import java.sql.Timestamp;

/**
 * Comment entity. @author MyEclipse Persistence Tools
 */
public class Comment extends AbstractComment implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Comment() {
	}

	/** minimal constructor */
	public Comment(Userinfo userinfo, Profile profile, Timestamp comTime,
			String comContent) {
		super(userinfo, profile, comTime, comContent);
	}

	/** full constructor */
	public Comment(Userinfo userinfo, Profile profile, Timestamp comTime,
			String comContent, Integer comComId) {
		super(userinfo, profile, comTime, comContent, comComId);
	}

}
