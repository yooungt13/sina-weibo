package weibo.hibernate;

/**
 * FollowGroup entity. @author MyEclipse Persistence Tools
 */
public class FollowGroup extends AbstractFollowGroup implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public FollowGroup() {
	}

	/** full constructor */
	public FollowGroup(Userinfo userinfo, String groupName) {
		super(userinfo, groupName);
	}

}
