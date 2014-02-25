package weibo.hibernate;

import java.util.Set;

/**
 * Login entity. @author MyEclipse Persistence Tools
 */
public class Login extends AbstractLogin implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Login() {
	}

	/** minimal constructor */
	public Login(String loginName, String password) {
		super(loginName, password);
	}

	/** full constructor */
	public Login(String loginName, String password, Long loginType,
			Set userinfos) {
		super(loginName, password, loginType, userinfos);
	}

}
