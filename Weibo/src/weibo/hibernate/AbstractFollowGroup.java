package weibo.hibernate;

import java.util.ArrayList;

import weibo.util.ImplUtil;

import com.opensymphony.xwork2.ActionContext;

/**
 * AbstractFollowGroup entity provides the base persistence definition of the
 * FollowGroup entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractFollowGroup implements java.io.Serializable {

	// Fields

	private Integer groupId;
	private Userinfo userinfo;
	private String groupName;

	// Constructors


	/** default constructor */
	public AbstractFollowGroup() {
	}

	/** full constructor */
	public AbstractFollowGroup(Userinfo userinfo, String groupName ) {
		this.userinfo = userinfo;
		this.groupName = groupName;
	}

	// Property accessors

	public Integer getGroupId() {
		return this.groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	public Userinfo getUserinfo() {
		return this.userinfo;
	}

	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}

	public String getGroupName() {
		return this.groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
    
}