package weibo.hibernate;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Set;

/**
 * Userinfo entity. @author MyEclipse Persistence Tools
 */
public class Userinfo extends AbstractUserinfo implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Userinfo() {
	}

	/** minimal constructor */
	public Userinfo(Login login, String nickName, String province, String city,
			String sex, Timestamp regTime) {
		super(login, nickName, province, city, sex, regTime);
	}

	/** full constructor */
	public Userinfo(Login login, String nickName, String trueName,
			String province, String city, String sex, Date birthday,
			String email, String qq, String msn, String introduce,
			String identifier, Long schoolType, String schoolName,
			String college, Long schoolTime, String workProv, String workCity,
			String workplace, Long workTimeFrom, Long workTimeTo,
			String department, String tag, Boolean comPower, Boolean msgPower,
			Boolean searchPower, String blacklist, String myFace,
			Timestamp regTime, Set comments, Set followGroups, Set counts,
			Set profiles, Set transmitCollections) {
		super(login, nickName, trueName, province, city, sex, birthday, email,
				qq, msn, introduce, identifier, schoolType, schoolName,
				college, schoolTime, workProv, workCity, workplace,
				workTimeFrom, workTimeTo, department, tag, comPower, msgPower,
				searchPower, blacklist, myFace, regTime, comments,
				followGroups, counts, profiles, transmitCollections);
	}

}
