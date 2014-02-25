package weibo.hibernate;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * Userinfo entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see weibo.hibernate.Userinfo
 * @author MyEclipse Persistence Tools
 */

public class UserinfoDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(UserinfoDAO.class);
	// property constants
	public static final String NICK_NAME = "nickName";
	public static final String TRUE_NAME = "trueName";
	public static final String PROVINCE = "province";
	public static final String CITY = "city";
	public static final String SEX = "sex";
	public static final String EMAIL = "email";
	public static final String QQ = "qq";
	public static final String MSN = "msn";
	public static final String INTRODUCE = "introduce";
	public static final String IDENTIFIER = "identifier";
	public static final String SCHOOL_TYPE = "schoolType";
	public static final String SCHOOL_NAME = "schoolName";
	public static final String COLLEGE = "college";
	public static final String SCHOOL_TIME = "schoolTime";
	public static final String WORK_PROV = "workProv";
	public static final String WORK_CITY = "workCity";
	public static final String WORKPLACE = "workplace";
	public static final String WORK_TIME_FROM = "workTimeFrom";
	public static final String WORK_TIME_TO = "workTimeTo";
	public static final String DEPARTMENT = "department";
	public static final String TAG = "tag";
	public static final String COM_POWER = "comPower";
	public static final String MSG_POWER = "msgPower";
	public static final String SEARCH_POWER = "searchPower";
	public static final String BLACKLIST = "blacklist";
	public static final String MY_FACE = "myFace";

	protected void initDao() {
		// do nothing
	}

	public void save(Userinfo transientInstance) {
		log.debug("saving Userinfo instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Userinfo persistentInstance) {
		log.debug("deleting Userinfo instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Userinfo findById(java.lang.Integer id) {
		log.debug("getting Userinfo instance with id: " + id);
		try {
			Userinfo instance = (Userinfo) getHibernateTemplate().get(
					"weibo.hibernate.Userinfo", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Userinfo instance) {
		log.debug("finding Userinfo instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Userinfo instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Userinfo as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByNickName(Object nickName) {
		return findByProperty(NICK_NAME, nickName);
	}

	public List findByTrueName(Object trueName) {
		return findByProperty(TRUE_NAME, trueName);
	}

	public List findByProvince(Object province) {
		return findByProperty(PROVINCE, province);
	}

	public List findByCity(Object city) {
		return findByProperty(CITY, city);
	}

	public List findBySex(Object sex) {
		return findByProperty(SEX, sex);
	}

	public List findByEmail(Object email) {
		return findByProperty(EMAIL, email);
	}

	public List findByQq(Object qq) {
		return findByProperty(QQ, qq);
	}

	public List findByMsn(Object msn) {
		return findByProperty(MSN, msn);
	}

	public List findByIntroduce(Object introduce) {
		return findByProperty(INTRODUCE, introduce);
	}

	public List findByIdentifier(Object identifier) {
		return findByProperty(IDENTIFIER, identifier);
	}

	public List findBySchoolType(Object schoolType) {
		return findByProperty(SCHOOL_TYPE, schoolType);
	}

	public List findBySchoolName(Object schoolName) {
		return findByProperty(SCHOOL_NAME, schoolName);
	}

	public List findByCollege(Object college) {
		return findByProperty(COLLEGE, college);
	}

	public List findBySchoolTime(Object schoolTime) {
		return findByProperty(SCHOOL_TIME, schoolTime);
	}

	public List findByWorkProv(Object workProv) {
		return findByProperty(WORK_PROV, workProv);
	}

	public List findByWorkCity(Object workCity) {
		return findByProperty(WORK_CITY, workCity);
	}

	public List findByWorkplace(Object workplace) {
		return findByProperty(WORKPLACE, workplace);
	}

	public List findByWorkTimeFrom(Object workTimeFrom) {
		return findByProperty(WORK_TIME_FROM, workTimeFrom);
	}

	public List findByWorkTimeTo(Object workTimeTo) {
		return findByProperty(WORK_TIME_TO, workTimeTo);
	}

	public List findByDepartment(Object department) {
		return findByProperty(DEPARTMENT, department);
	}

	public List findByTag(Object tag) {
		return findByProperty(TAG, tag);
	}

	public List findByComPower(Object comPower) {
		return findByProperty(COM_POWER, comPower);
	}

	public List findByMsgPower(Object msgPower) {
		return findByProperty(MSG_POWER, msgPower);
	}

	public List findBySearchPower(Object searchPower) {
		return findByProperty(SEARCH_POWER, searchPower);
	}

	public List findByBlacklist(Object blacklist) {
		return findByProperty(BLACKLIST, blacklist);
	}

	public List findByMyFace(Object myFace) {
		return findByProperty(MY_FACE, myFace);
	}

	public List findAll() {
		log.debug("finding all Userinfo instances");
		try {
			String queryString = "from Userinfo";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Userinfo merge(Userinfo detachedInstance) {
		log.debug("merging Userinfo instance");
		try {
			Userinfo result = (Userinfo) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Userinfo instance) {
		log.debug("attaching dirty Userinfo instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Userinfo instance) {
		log.debug("attaching clean Userinfo instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static UserinfoDAO getFromApplicationContext(ApplicationContext ctx) {
		return (UserinfoDAO) ctx.getBean("UserinfoDAO");
	}
	

	public List fuzzySearchByNickName(String nickName) {
		log.debug("finding Userinfo instance with property: nickName, value: " + nickName);
		try {
			String queryString = "from Userinfo as model where model.nickName like ?";
			return getHibernateTemplate().find(queryString, "%"+nickName+"%");
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}	
	}
}