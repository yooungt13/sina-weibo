package weibo.hibernate;

/**
 * FansManage entity. @author MyEclipse Persistence Tools
 */
public class FansManage extends AbstractFansManage implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public FansManage() {
	}

	/** full constructor */
	public FansManage(Integer fansId, Integer followId, Integer groupId) {
		super(fansId, followId, groupId);
	}

}
