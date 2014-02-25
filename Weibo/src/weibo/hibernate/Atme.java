package weibo.hibernate;

/**
 * Atme entity. @author MyEclipse Persistence Tools
 */
public class Atme extends AbstractAtme implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Atme() {
	}

	/** full constructor */
	public Atme(Profile profile, Comment comment, String atWho) {
		super(profile, comment, atWho);
	}

}
