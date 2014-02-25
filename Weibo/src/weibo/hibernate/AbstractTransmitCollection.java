package weibo.hibernate;

import java.sql.Timestamp;

/**
 * AbstractTransmitCollection entity provides the base persistence definition of
 * the TransmitCollection entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractTransmitCollection implements
		java.io.Serializable {

	// Fields

	private Integer tcId;
	private Userinfo userinfo;
	private Profile profile;
	private Timestamp tcTime;
	private Integer tcOriginal;

	// Constructors

	/** default constructor */
	public AbstractTransmitCollection() {
	}

	/** minimal constructor */
	public AbstractTransmitCollection(Userinfo userinfo, Profile profile,
			Timestamp tcTime) {
		this.userinfo = userinfo;
		this.profile = profile;
		this.tcTime = tcTime;
	}

	/** full constructor */
	public AbstractTransmitCollection(Userinfo userinfo, Profile profile,
			Timestamp tcTime, Integer tcOriginal) {
		this.userinfo = userinfo;
		this.profile = profile;
		this.tcTime = tcTime;
		this.tcOriginal = tcOriginal;
	}

	// Property accessors

	public Integer getTcId() {
		return this.tcId;
	}

	public void setTcId(Integer tcId) {
		this.tcId = tcId;
	}

	public Userinfo getUserinfo() {
		return this.userinfo;
	}

	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}

	public Profile getProfile() {
		return this.profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public Timestamp getTcTime() {
		return this.tcTime;
	}

	public void setTcTime(Timestamp tcTime) {
		this.tcTime = tcTime;
	}

	public Integer getTcOriginal() {
		return this.tcOriginal;
	}

	public void setTcOriginal(Integer tcOriginal) {
		this.tcOriginal = tcOriginal;
	}

}