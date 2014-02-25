package weibo.hibernate;

import java.sql.Timestamp;
import java.util.ArrayList;

import weibo.util.ImplUtil;

import com.opensymphony.xwork2.ActionContext;

/**
 * AbstractMsgNotice entity provides the base persistence definition of the
 * MsgNotice entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractMsgNotice implements java.io.Serializable {

	// Fields

	private Integer msgId;
	private Timestamp msgTime;
	private Integer msgFrom;
	private Integer msgTo;
	private String msgContent;
	private Short msgType;
	private Boolean msgRead;
	private String msgToName;
	private String msgFromName;
	private int msgSize;
	private String msgFromFace;

	// Constructors
	private String sendTime;

	// Constructors

	/** default constructor */
	public AbstractMsgNotice() {
	}

	/** full constructor */
	public AbstractMsgNotice(Timestamp msgTime, Integer msgFrom, Integer msgTo,
			String msgContent, Short msgType, Boolean msgRead) {
		this.msgTime = msgTime;
		this.msgFrom = msgFrom;
		this.msgTo = msgTo;
		this.msgContent = msgContent;
		this.msgType = msgType;
		this.msgRead = msgRead;
	}

	// Property accessors

	public Integer getMsgId() {
		return this.msgId;
	}

	public void setMsgId(Integer msgId) {
		this.msgId = msgId;
	}

	public Timestamp getMsgTime() {
		return this.msgTime;
	}

	public void setMsgTime(Timestamp msgTime) {
		this.msgTime = msgTime;
	}

	public Integer getMsgFrom() {
		return this.msgFrom;
	}

	public void setMsgFrom(Integer msgFrom) {
		this.msgFrom = msgFrom;
	}

	public Integer getMsgTo() {
		return this.msgTo;
	}

	public void setMsgTo(Integer msgTo) {
		this.msgTo = msgTo;
	}

	public String getMsgContent() {
		return ImplUtil.getPublishContent(this.msgContent);
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public Short getMsgType() {
		return this.msgType;
	}

	public void setMsgType(Short msgType) {
		this.msgType = msgType;
	}

	public Boolean getMsgRead() {
		return this.msgRead;
	}

	public void setMsgRead(Boolean msgRead) {
		this.msgRead = msgRead;
	}
	public String getMsgToName() {
		//Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");
	    
		UserinfoDAO userdao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		if(this.msgTo==0){
			String i="所有人";
			return i;
			}
		else{
			return userdao.findById(this.msgTo).getNickName();
		}
	}

	public void setMsgToName(String msgToName) {
		this.msgToName = msgToName;
	}
	public String getSendTime() {
		return ImplUtil.getSubTime(this.msgTime);
	}
	public String getMsgFromName() {
		UserinfoDAO userdao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		if(this.msgFrom==0){String i="管理员";
			return i;}
		else{return userdao.findById(this.msgFrom).getNickName();}
	}

	public void setMsgFromName(String msgFromName) {
		this.msgFromName = msgFromName;
	}
	public int getMsgSize() {
		MsgNoticeDAO msgdao = (MsgNoticeDAO) ImplUtil.getBeanByName("MsgNoticeDAO");
		Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");
		ArrayList<MsgNotice> list = (ArrayList<MsgNotice>) msgdao.findByMsgTo(user.getUserId());
		
		return list.size();
	}

	public String getMsgFromFace() {
		UserinfoDAO userdao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		return userdao.findById(this.msgFrom).getMyFace();
		
	}

	public void setMsgFromFace(String msgFromFace) {
		this.msgFromFace = msgFromFace;
	}

}