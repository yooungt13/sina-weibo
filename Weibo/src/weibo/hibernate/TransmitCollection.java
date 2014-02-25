package weibo.hibernate;

import java.sql.Timestamp;

/**
 * TransmitCollection entity. @author MyEclipse Persistence Tools
 */
public class TransmitCollection extends AbstractTransmitCollection implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public TransmitCollection() {
	}

	/** minimal constructor */
	public TransmitCollection(Userinfo userinfo, Profile profile,
			Timestamp tcTime) {
		super(userinfo, profile, tcTime);
	}

	/** full constructor */
	public TransmitCollection(Userinfo userinfo, Profile profile,
			Timestamp tcTime, Integer tcOriginal) {
		super(userinfo, profile, tcTime, tcOriginal);
	}

}
