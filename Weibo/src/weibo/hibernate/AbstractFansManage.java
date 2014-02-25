package weibo.hibernate;

import java.util.ArrayList;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import weibo.serviceLocator.ServiceLocator;
import weibo.servive.FansServ;
import weibo.util.ImplUtil;
/**
 * AbstractFansManage entity provides the base persistence definition of the
 * FansManage entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractFansManage implements java.io.Serializable {

	// Fields

	private Integer fmId;
	private Integer fansId;
	private Integer followId;
	private String fansName;
	private String followName;
	private String fansCity;
	private int fansNumber;
	private String myface;
	private String followCity;
	private int followNumber;
	private String fmyface;
	private int ack;
	private String seximage;
	private int groupId;
	private int followack;
	// Constructors

	/** default constructor */
	public AbstractFansManage() {
	}

	public int getGroupId() {
		return groupId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	/** full constructor */
	public AbstractFansManage(Integer fansId, Integer followId,Integer groupId) {
		this.fansId = fansId;
		this.followId = followId;
		this.groupId = groupId;
	}

	// Property accessors

	public Integer getFmId() {
		return this.fmId;
	}

	public void setFmId(Integer fmId) {
		this.fmId = fmId;
	}

	public Integer getFansId() {
		return this.fansId;
	}

	public void setFansId(Integer fansId) {
		this.fansId = fansId;
	}

	public Integer getFollowId() {
		return this.followId;
	}

	public void setFollowId(Integer followId) {
		this.followId = followId;
	}
    /** 得到fans昵称   **/
	public String getFansName() {
		UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");		
		return userDao.findById(this.fansId).getNickName();
	}
	  /** 得到follow昵称   **/
	public String getFollowName(){
		UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		return userDao.findById(this.followId).getNickName();
	}
	  /** 得到fans城市   **/
	public String getFansCity(){
		UserinfoDAO userDao =(UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		return userDao.findById(this.fansId).getCity();
	}
	  /** 得到follow城市   **/
	public String getFollowCity(){
		UserinfoDAO userDao =(UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		return userDao.findById(this.followId).getCity();
	}
	  /** 得到fans的fans个数   **/
	public ArrayList<FansManage> getFansListByFansId() {
		FansManageDAO fmDao = (FansManageDAO) ImplUtil.getBeanByName("FansManageDAO");
		ArrayList<FansManage> results = (ArrayList<FansManage>) fmDao.findByFollowId(this.fansId);
		return results;
	}
	public int getFansNumber(){
		ArrayList<FansManage> fansList = new ArrayList<FansManage>();
		fansList = getFansListByFansId();
		return fansList.size();
	}
	  /** 得到follow的fans个数   **/
	public ArrayList<FansManage> getFollowListByFansId() {
		FansManageDAO fmDao = (FansManageDAO) ImplUtil.getBeanByName("FansManageDAO");
		ArrayList<FansManage> results = (ArrayList<FansManage>) fmDao.findByFollowId(this.followId);
		return results;
	}
	public int getFollowNumber(){
		ArrayList<FansManage> followList = new ArrayList<FansManage>();
		followList = getFollowListByFansId();
		return followList.size();
	}
	  /** 得到fans的头像   **/
	public String getMyface(){
		UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		Userinfo fans = userDao.findById(this.fansId);
		return fans.getMyFace();
	}
	  /** 得到follow的头像   **/
	public String getFmyface(){
		UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		Userinfo follow = userDao.findById(this.followId);
		return follow.getMyFace();
	}
	  /** fans界面标签判断信号   **/
	
	public boolean getAck(){
		ArrayList<FansManage> fansList = new ArrayList<FansManage>();
		fansList = getFansListByFansId();
		Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");
		for(int i=0;i<fansList.size();i++)
		{ 
            int fansId = fansList.get(i).getFansId();
            int userId = user.getUserId();
			if( fansId == userId )
			{
				return true;
			}
		}
		return false;
	}
	public String getFansIdProfId(){
		ProfileDAO profDao = (ProfileDAO) ImplUtil.getBeanByName("ProfileDAO");
		UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
 		ArrayList<Profile> fansIdprofile = (ArrayList<Profile>) profDao.findByProperty("userinfo", userDao.findById(this.fansId));
		if(fansIdprofile.size() != 0){
			java.util.Collections.reverse( fansIdprofile );
			return fansIdprofile.get(0).getProfContent();
		}
		return "(他还没有发过微博)";
	}
	public String getFollowIdProfId(){
		ProfileDAO profDao = (ProfileDAO) ImplUtil.getBeanByName("ProfileDAO");
		UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
 		ArrayList<Profile> fansIdprofile = (ArrayList<Profile>) profDao.findByProperty("userinfo", userDao.findById(this.followId));
		if(fansIdprofile.size() != 0){
			java.util.Collections.reverse( fansIdprofile );
			return fansIdprofile.get(0).getProfContent();
		}
		return "(他还没有发过微博)";
	}
	public int getFollowIdPro(){
		ProfileDAO profDao = (ProfileDAO) ImplUtil.getBeanByName("ProfileDAO");
		UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		ArrayList<Profile> fansIdprofile = (ArrayList<Profile>) profDao.findByProperty("userinfo", userDao.findById(this.followId));
		if(fansIdprofile.size() != 0){
			java.util.Collections.reverse( fansIdprofile );
			return fansIdprofile.get(0).getProfId();
		}
		return 0;
	}
	public int getFansIdPro(){
		ProfileDAO profDao = (ProfileDAO) ImplUtil.getBeanByName("ProfileDAO");
		UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		ArrayList<Profile> fansIdprofile = (ArrayList<Profile>) profDao.findByProperty("userinfo", userDao.findById(this.fansId));
		if(fansIdprofile.size() != 0){
			java.util.Collections.reverse( fansIdprofile );
			return fansIdprofile.get(0).getProfId();
		}
		return 0;
	}
	/** follow界面标签判断信号   **/
	public boolean getFollowack(){
		ArrayList<FansManage> followList = new ArrayList<FansManage>();
		Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");
		FansManageDAO fmDao = (FansManageDAO) ImplUtil.getBeanByName("FansManageDAO");
		followList = (ArrayList<FansManage>) fmDao.findByFollowId(user.getUserId());
		for(int i=0;i<followList.size();i++)
		{ 
            int followI = this.followId;
            int fansI = followList.get(i).getFansId();
			if( followI == fansI )
			{
				return true;
			}
		}
		return false;
	}
	
	 /** fans界面性别判断标志   **/
	public String getSeximage(){
		UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");		
		return userDao.findById(this.fansId).getSex();
	}
	/** follow界面性别判断标志   **/
	public String getFollowsex(){
		UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");		
		return userDao.findById(this.followId).getSex();
	}
	
	/** ***********************************   
	 * @author fty
	 * **/
	public boolean getOthersfollowack(){
		ArrayList<FansManage> followList = new ArrayList<FansManage>();
		Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");
		FansManageDAO fmDao = (FansManageDAO) ImplUtil.getBeanByName("FansManageDAO");
		//得到我的关注的链表，用于存我的粉丝的ID
		followList = (ArrayList<FansManage>) fmDao.findByFansId(user.getUserId());
		for(int i=0;i<followList.size();i++)
		{ 
			
            int followI = this.followId;
            int fansI = followList.get(i).getFollowId();
			if( followI == fansI )
			{
				return true;
			}
		}
		return false;
	}
	/** ***********************************   **/
	
	/** ***********************************   
	 * @author titan
	 * **/
	public String getFollowProTime(){
		ProfileDAO profDao = (ProfileDAO) ImplUtil.getBeanByName("ProfileDAO");
		UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		ArrayList<Profile> fansIdprofile = (ArrayList<Profile>) profDao.findByProperty("userinfo", userDao.findById(this.followId));
		if(fansIdprofile.size() != 0){
			java.util.Collections.reverse( fansIdprofile );
			return fansIdprofile.get(0).getSubTime();
		}
		return "0";
	}
	public String getFansProTime(){
		ProfileDAO profDao = (ProfileDAO) ImplUtil.getBeanByName("ProfileDAO");
		UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		ArrayList<Profile> fansIdprofile = (ArrayList<Profile>) profDao.findByProperty("userinfo", userDao.findById(this.fansId));
		if(fansIdprofile.size() != 0){
			java.util.Collections.reverse( fansIdprofile );
			return fansIdprofile.get(0).getSubTime();
		}
		return "0";	
	}
	/** ***********************************   **/
}