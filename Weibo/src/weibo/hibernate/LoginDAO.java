package weibo.hibernate;

import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for Login
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see weibo.hibernate.Login
 * @author MyEclipse Persistence Tools
 */

public class LoginDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(LoginDAO.class);
	// property constants
	public static final String PASSWORD = "password";
	public static final String LOGIN_TYPE = "loginType";

	protected void initDao() {
		// do nothing
	}

	public void save(Login transientInstance) {
		log.debug("saving Login instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Login persistentInstance) {
		log.debug("deleting Login instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Login findById(java.lang.String id) {
		log.debug("getting Login instance with id: " + id);
		try {
			Login instance = (Login) getHibernateTemplate().get(
					"weibo.hibernate.Login", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Login instance) {
		log.debug("finding Login instance by example");
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
		log.debug("finding Login instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Login as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByPassword(Object password) {
		return findByProperty(PASSWORD, password);
	}

	public List findByLoginType(Object loginType) {
		return findByProperty(LOGIN_TYPE, loginType);
	}

	public List findAll() {
		log.debug("finding all Login instances");
		try {
			String queryString = "from Login";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Login merge(Login detachedInstance) {
		log.debug("merging Login instance");
		try {
			Login result = (Login) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Login instance) {
		log.debug("attaching dirty Login instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Login instance) {
		log.debug("attaching clean Login instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static LoginDAO getFromApplicationContext(ApplicationContext ctx) {
		return (LoginDAO) ctx.getBean("LoginDAO");
	}
}