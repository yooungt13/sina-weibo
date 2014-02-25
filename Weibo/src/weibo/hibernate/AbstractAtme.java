package weibo.hibernate;

/**
 * AbstractAtme entity provides the base persistence definition of the Atme
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractAtme implements java.io.Serializable {

	// Fields

	private Integer amId;
	private Profile profile;
	private Comment comment;
	private String atWho;

	// Constructors

	/** default constructor */
	public AbstractAtme() {
	}

	/** minimal constructor */
	public AbstractAtme(String atWho) {
		this.atWho = atWho;
	}

	/** full constructor */
	public AbstractAtme(Profile profile, Comment comment, String atWho) {
		this.profile = profile;
		this.comment = comment;
		this.atWho = atWho;
	}

	// Property accessors

	public Integer getAmId() {
		return this.amId;
	}

	public void setAmId(Integer amId) {
		this.amId = amId;
	}

	public Profile getProfile() {
		return this.profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public Comment getComment() {
		return this.comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public String getAtWho() {
		return this.atWho;
	}

	public void setAtWho(String atWho) {
		this.atWho = atWho;
	}

}