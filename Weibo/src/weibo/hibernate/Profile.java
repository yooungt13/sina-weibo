package weibo.hibernate;

import java.sql.Timestamp;
import java.util.Set;

/**
 * Profile entity. @author MyEclipse Persistence Tools
 */
public class Profile extends AbstractProfile implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Profile() {
	}

	/** minimal constructor */
	public Profile(Userinfo userinfo, Timestamp profTime) {
		super(userinfo, profTime);
	}

	/** full constructor */
	public Profile(Userinfo userinfo, String profContent, Timestamp profTime,
			Integer tcId, String imageRef, Set comments, Set atmes,
			Set transmitCollections) {
		super(userinfo, profContent, profTime, tcId, imageRef, comments, atmes,
				transmitCollections);
	}

}
