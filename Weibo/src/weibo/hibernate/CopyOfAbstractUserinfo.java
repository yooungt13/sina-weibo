package weibo.hibernate;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import weibo.bean.CountBean;
import weibo.serviceLocator.ServiceLocator;
import weibo.servive.CommentServ;
import weibo.servive.FansServ;
import weibo.servive.MsgServ;
import weibo.servive.ProfileServ;
import weibo.util.ImplUtil;

/**
 * AbstractUserinfo entity provides the base persistence definition of the
 * Userinfo entity. @author MyEclipse Persistence Tools
 */

public abstract class CopyOfAbstractUserinfo implements java.io.Serializable {

	// Fields

	private Integer userId;
	private Login login;
	private String nickName;
	private String trueName;
	private String province;
	private String city;
	private String sex;
	private Date birthday;
	private String email;
	private String qq;
	private String msn;
	private String introduce;
	private String identifier;
	private Long schoolType;
	private String schoolName;
	private String college;
	private Long schoolTime;
	private String workProv;
	private String workCity;
	private String workplace;
	private Long workTimeFrom;
	private Long workTimeTo;
	private String department;
	private String tag;
	private Boolean comPower;
	private Boolean msgPower;
	private Boolean searchPower;
	private String blacklist;
	private String myFace;
	private Set profiles = new HashSet(0);

	private String hiddenID;
	private Long role;
	
	private int profileCount;
	private int fansCount;
	private int followCount;
	private int msgCount;
	private int noticeCount;
	private int atProfileCount;
	private int atCommentCount;
	
	private ArrayList<Userinfo> fansList;
	
	// Constructors

	/** default constructor */
	public CopyOfAbstractUserinfo() {
	}

	/** minimal constructor */
	public CopyOfAbstractUserinfo(Login login, String nickName, String province,
			String city, String sex) {
		this.login = login;
		this.nickName = nickName;
		this.province = province;
		this.city = city;
		this.sex = sex;
	}

	/** full constructor */
	public CopyOfAbstractUserinfo(Login login, String nickName, String trueName,
			String province, String city, String sex, Date birthday,
			String email, String qq, String msn, String introduce,
			String identifier, Long schoolType, String schoolName,
			String college, Long schoolTime, String workProv, String workCity,
			String workplace, Long workTimeFrom, Long workTimeTo,
			String department, String tag, Boolean comPower, Boolean msgPower,
			Boolean searchPower, String blacklist, String myFace, Set profiles) {
		this.login = login;
		this.nickName = nickName;
		this.trueName = trueName;
		this.province = province;
		this.city = city;
		this.sex = sex;
		this.birthday = birthday;
		this.email = email;
		this.qq = qq;
		this.msn = msn;
		this.introduce = introduce;
		this.identifier = identifier;
		this.schoolType = schoolType;
		this.schoolName = schoolName;
		this.college = college;
		this.schoolTime = schoolTime;
		this.workProv = workProv;
		this.workCity = workCity;
		this.workplace = workplace;
		this.workTimeFrom = workTimeFrom;
		this.workTimeTo = workTimeTo;
		this.department = department;
		this.tag = tag;
		this.comPower = comPower;
		this.msgPower = msgPower;
		this.searchPower = searchPower;
		this.blacklist = blacklist;
		this.myFace = myFace;
		this.profiles = profiles;
	}

	// Property accessors

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Login getLogin() {
		return this.login;
	}

	public void setLogin(Login login) {
		this.login = login;
	}

	public String getNickName() {
		return this.nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getTrueName() {
		return this.trueName;
	}

	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}

	public String getProvince() {
		return this.province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getMsn() {
		return this.msn;
	}

	public void setMsn(String msn) {
		this.msn = msn;
	}

	public String getIntroduce() {
		return this.introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getIdentifier() {
		return this.identifier;
	}

	public void setIdentifier(String identifier) {
		this.identifier = identifier;
	}

	public Long getSchoolType() {
		return this.schoolType;
	}

	public void setSchoolType(Long schoolType) {
		this.schoolType = schoolType;
	}

	public String getSchoolName() {
		return this.schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getCollege() {
		return this.college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public Long getSchoolTime() {
		return this.schoolTime;
	}

	public void setSchoolTime(Long schoolTime) {
		this.schoolTime = schoolTime;
	}

	public String getWorkProv() {
		return this.workProv;
	}

	public void setWorkProv(String workProv) {
		this.workProv = workProv;
	}

	public String getWorkCity() {
		return this.workCity;
	}

	public void setWorkCity(String workCity) {
		this.workCity = workCity;
	}

	public String getWorkplace() {
		return this.workplace;
	}

	public void setWorkplace(String workplace) {
		this.workplace = workplace;
	}

	public Long getWorkTimeFrom() {
		return this.workTimeFrom;
	}

	public void setWorkTimeFrom(Long workTimeFrom) {
		this.workTimeFrom = workTimeFrom;
	}

	public Long getWorkTimeTo() {
		return this.workTimeTo;
	}

	public void setWorkTimeTo(Long workTimeTo) {
		this.workTimeTo = workTimeTo;
	}

	public String getDepartment() {
		return this.department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getTag() {
		return this.tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public Boolean getComPower() {
		return this.comPower;
	}

	public void setComPower(Boolean comPower) {
		this.comPower = comPower;
	}

	public Boolean getMsgPower() {
		return this.msgPower;
	}

	public void setMsgPower(Boolean msgPower) {
		this.msgPower = msgPower;
	}

	public Boolean getSearchPower() {
		return this.searchPower;
	}

	public void setSearchPower(Boolean searchPower) {
		this.searchPower = searchPower;
	}

	public String getBlacklist() {
		return this.blacklist;
	}

	public void setBlacklist(String blacklist) {
		this.blacklist = blacklist;
	}

	public String getMyFace() {
		return this.myFace;
	}

	public void setMyFace(String myFace) {
		this.myFace = myFace;
	}

	public Set getProfiles() {
		return this.profiles;
	}

	public void setProfiles(Set profiles) {
		this.profiles = profiles;
	}	
	
	// 自定义
//	public int getProfileCount() {		
//		ProfileServ profileServ = ServiceLocator. getProfileServ();
//		return profileServ.getProfByUser((Userinfo) this).size();
//	}
//	
//	public int getFansCount() {		
//		FansServ fansServ = ServiceLocator.getFansServ();
//		return fansServ.getFansListByUser((Userinfo) this).size();
//	}
//	
//	public int getFollowCount() {
//		FansServ fansServ = ServiceLocator.getFansServ();
//		return fansServ.getFollowListByUser((Userinfo) this).size();
//	}
	
	public int getMsgCount() {
		MsgServ msgServ = ServiceLocator.getMsgServ();
		return msgServ.getFromMsgList().size();
	}
	
	public int getNoticeCount() {
		MsgServ msgServ = ServiceLocator.getMsgServ();
		int size = msgServ.getSystemList().size();
		return size;
	}

	public int getAtProfileCount() {
		ProfileServ profileServ = ServiceLocator. getProfileServ();
		return profileServ.getAtMePage().size();
	}

	public int getAtCommentCount() {
		CommentServ comServ = ServiceLocator. getCommentServ();
		return comServ.getAtMeComPage().size();
	}

//	public ArrayList<Userinfo> getFansList(){
//		
//		FansServ fansServ = ServiceLocator.getFansServ();
//		UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
//		
//		ArrayList<FansManage> fansList = fansServ.getFansListByUser((Userinfo) this);
//		int size = ( fansList.size() < 9 )? fansList.size():9;
//		
//		ArrayList<Userinfo> results = new ArrayList<Userinfo>();
//		
//		for( int i = 0; i < size; i++ ){
//			Userinfo user = userDao.findById(fansList.get(i).getFansId());
//			results.add(user);
//		}
//		
//		return results;		
//	}

	public String getHiddenID() {
		hiddenID = identifier.substring(0,3) + "***********" + identifier.substring(14, 18);
		return hiddenID;
	}

	public Long getRole() {
		UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		LoginDAO logDao = (LoginDAO) ImplUtil.getBeanByName("LoginDAO");
		String loginName = userDao.findById(this.userId).getLogin().getLoginName();
		Login log = logDao.findById(loginName);
		return log.getLoginType();
	}
}