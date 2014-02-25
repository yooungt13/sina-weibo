package weibo.hibernate;

import java.sql.Timestamp;

import weibo.util.ImplUtil;

/**
 * AbstractComment entity provides the base persistence definition of the
 * Comment entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractComment implements java.io.Serializable {

	// Fields

	private Integer comId;
	private Userinfo userinfo;
	private Profile profile;
	private Timestamp comTime;
	private String comContent;
	private Integer comComId;
	private String pubTime;
	private String comFrom;
	private String comFace;
	private String comProfContent;
	private String comComContent;	
	private String publishContent;
	private Comment comCom;

	// Constructors

	/** default constructor */
	public AbstractComment() {
	}

	/** minimal constructor */
	public AbstractComment(Userinfo userinfo, Profile profile,
			Timestamp comTime, String comContent) {
		this.userinfo = userinfo;
		this.profile = profile;
		this.comTime = comTime;
		this.comContent = comContent;
	}

	/** full constructor */
	public AbstractComment(Userinfo userinfo, Profile profile,
			Timestamp comTime, String comContent, Integer comComId) {
		this.userinfo = userinfo;
		this.profile = profile;
		this.comTime = comTime;
		this.comContent = comContent;
		this.comComId = comComId;
	}

	// Property accessors

	public Integer getComId() {
		return this.comId;
	}

	public void setComId(Integer comId) {
		this.comId = comId;
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

	public Timestamp getComTime() {
		return this.comTime;
	}

	public void setComTime(Timestamp comTime) {
		this.comTime = comTime;
	}

	public String getComContent() {
		return this.comContent;
	}

	public void setComContent(String comContent) {
		this.comContent = comContent;
	}

	public Integer getComComId() {
		return this.comComId;
	}

	public void setComComId(Integer comComId) {
		this.comComId = comComId;
	}

	public String getPubTime() {
		return ImplUtil.getSubTime(this.comTime);
	}

	public String getComFrom() {
		UserinfoDAO userDao = (UserinfoDAO)ImplUtil.getBeanByName("UserinfoDAO");
		Userinfo user = userDao.findById(this.getUserinfo().getUserId());
		return user.getNickName();
	}

	public String getComFace() {
		UserinfoDAO userDao = (UserinfoDAO)ImplUtil.getBeanByName("UserinfoDAO");
		Userinfo user = userDao.findById(this.getUserinfo().getUserId());
		return user.getMyFace();
	}

	public String getComProfContent() {
		ProfileDAO profDao = (ProfileDAO) ImplUtil.getBeanByName("ProfileDAO");
		Profile prof = profDao.findById(this.profile.getProfId());
		if( prof != null){
			return prof.getProfContent();
		}else{
			return "error";
		}
	}

	public String getComComContent() {
		CommentDAO comDao = (CommentDAO)ImplUtil.getBeanByName("CommentDAO");
		Comment c = comDao.findById(this.comComId);
		if( c != null){
			return c.getComContent();
		}else{
			return "error";
		}
		
	}
	
	public String getPublishContent() {	
		return ImplUtil.getPublishContent(this.getComContent());
	}
	
	public String getPublishComContent() {	
		return ImplUtil.getPublishContent(this.getComComContent());
	}
	
	public String getPublishProfContent() {	
		return ImplUtil.getPublishContent(this.getComProfContent());
	}

	public Comment getComCom() {
		CommentDAO comDao = (CommentDAO)ImplUtil.getBeanByName("CommentDAO");
		Comment c = comDao.findById(this.comComId);
		return c;
	}
}