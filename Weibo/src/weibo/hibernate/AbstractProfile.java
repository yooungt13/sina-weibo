package weibo.hibernate;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.sun.istack.internal.Pool.Impl;

import weibo.util.ImplUtil;

/**
 * AbstractProfile entity provides the base persistence definition of the
 * Profile entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractProfile implements java.io.Serializable {

	// Fields

	private Integer profId;
	private Userinfo userinfo;
	private String profContent;
	private Timestamp profTime;
	private Integer tcId;
	private String imageRef;
	private Set comments = new HashSet(0);
	private Set atmes = new HashSet(0);
	private Set transmitCollections = new HashSet(0);
	
	// 自定义属性
	private String publishName;
	private String subTime;
	private String publishFace;
	private Timestamp collectTime;
	private int favorId;
	private int commentCount;
	private int transmitCount;
	private int orgCount;
	private Profile tsmit;
	private String publishContent;
	private ArrayList<Comment> comList;

	// Constructors

	/** default constructor */
	public AbstractProfile() {
	}

	/** minimal constructor */
	public AbstractProfile(Userinfo userinfo, Timestamp profTime) {
		this.userinfo = userinfo;
		this.profTime = profTime;
	}

	/** full constructor */
	public AbstractProfile(Userinfo userinfo, String profContent,
			Timestamp profTime, Integer tcId, String imageRef, Set comments,
			Set atmes, Set transmitCollections) {
		this.userinfo = userinfo;
		this.profContent = profContent;
		this.profTime = profTime;
		this.tcId = tcId;
		this.imageRef = imageRef;
		this.comments = comments;
		this.atmes = atmes;
		this.transmitCollections = transmitCollections;
	}

	// Property accessors

	public Integer getProfId() {
		return this.profId;
	}

	public void setProfId(Integer profId) {
		this.profId = profId;
	}

	public Userinfo getUserinfo() {
		return this.userinfo;
	}

	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}

	public String getProfContent() {
		return this.profContent;
	}

	public void setProfContent(String profContent) {
		this.profContent = profContent;
	}

	public Timestamp getProfTime() {
		return this.profTime;
	}

	public void setProfTime(Timestamp profTime) {
		this.profTime = profTime;
	}

	public Integer getTcId() {
		return this.tcId;
	}

	public void setTcId(Integer tcId) {
		this.tcId = tcId;
	}

	public String getImageRef() {
		return this.imageRef;
	}

	public void setImageRef(String imageRef) {
		this.imageRef = imageRef;
	}

	public Set getComments() {
		return this.comments;
	}

	public void setComments(Set comments) {
		this.comments = comments;
	}

	public Set getAtmes() {
		return this.atmes;
	}

	public void setAtmes(Set atmes) {
		this.atmes = atmes;
	}

	public Set getTransmitCollections() {
		return this.transmitCollections;
	}

	public void setTransmitCollections(Set transmitCollections) {
		this.transmitCollections = transmitCollections;
	}
		
	// 自定义方法
	public String getPublishName() {
		UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		Userinfo user = userDao.findById(this.getUserinfo().getUserId());
		return user.getNickName();
	}
	
	public String getSubTime() {
		return ImplUtil.getSubTime(this.profTime);
	}

	public String getPublishFace() {
		UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		Userinfo user = userDao.findById(this.getUserinfo().getUserId());
		return user.getMyFace();
	}

	public String getCollectTime() {
		return ImplUtil.getSubTime(this.collectTime);
	}

	public void setCollectTime(Timestamp collectTime) {
		this.collectTime = collectTime;
	}

	public int getFavorId() {
		return favorId;
	}

	public void setFavorId(int favorId) {
		this.favorId = favorId;
	}

	public int getCommentCount() {
		CommentDAO comDao = (CommentDAO)ImplUtil.getBeanByName("CommentDAO");
		List<Comment> comList = comDao.findByProperty("profile", this);
		return comList.size();
	}

	public int getTransmitCount() {
		TransmitCollectionDAO tcDao = (TransmitCollectionDAO) ImplUtil.getBeanByName("TransmitCollectionDAO");
		List<TransmitCollection> tcList = tcDao.findByProperty("profile", this);
		int count = 0;
		for( int i = 0; i < tcList.size(); i++){ 
			TransmitCollection tc = tcList.get(i);
			int orgId = tc.getTcOriginal();
			
			if(orgId != 0)
				if( orgId != this.getProfId() )
					count++; 
		}
		return count + this.getOrgCount();
	}

	public int getOrgCount() {
		TransmitCollectionDAO tcDao = (TransmitCollectionDAO) ImplUtil.getBeanByName("TransmitCollectionDAO");
		List<TransmitCollection> tcList = tcDao.findByTcOriginal(this.profId);
		int count = 0;
		for( int i = 0; i < tcList.size(); i++){ 
			count++; 
		}
		return count;
	}

	public Profile getTsmit() {
		TransmitCollectionDAO tcDao = (TransmitCollectionDAO) ImplUtil.getBeanByName("TransmitCollectionDAO");
		ProfileDAO profDao = (ProfileDAO) ImplUtil.getBeanByName("ProfileDAO");
		
		TransmitCollection tc = tcDao.findById(this.tcId);
		
		if( tc != null)
			return profDao.findById(tc.getTcOriginal());
		else
			return null;
	}

	public String getPublishContent() {	
		return ImplUtil.getPublishContent(this.profContent);
	}

	public ArrayList<Comment> getComList() {
		CommentDAO comDao = (CommentDAO)ImplUtil.getBeanByName("CommentDAO");
		ArrayList<Comment> comList = (ArrayList<Comment>) comDao.findByProperty("profile", this);
		java.util.Collections.reverse(comList);
		return comList;
	}	
}