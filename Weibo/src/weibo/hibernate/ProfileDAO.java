package weibo.hibernate;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * Profile entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see weibo.hibernate.Profile
 * @author MyEclipse Persistence Tools
 */

public class ProfileDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(ProfileDAO.class);
	// property constants
	public static final String PROF_CONTENT = "profContent";
	public static final String TC_ID = "tcId";
	public static final String IMAGE_REF = "imageRef";

	protected void initDao() {
		// do nothing
	}

	public void save(Profile transientInstance) {
		log.debug("saving Profile instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Profile persistentInstance) {
		log.debug("deleting Profile instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Profile findById(java.lang.Integer id) {
		log.debug("getting Profile instance with id: " + id);
		try {
			Profile instance = (Profile) getHibernateTemplate().get(
					"weibo.hibernate.Profile", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Profile instance) {
		log.debug("finding Profile instance by example");
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
		log.debug("finding Profile instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Profile as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByProfContent(Object profContent) {
		return findByProperty(PROF_CONTENT, profContent);
	}

	public List findByTcId(Object tcId) {
		return findByProperty(TC_ID, tcId);
	}

	public List findByImageRef(Object imageRef) {
		return findByProperty(IMAGE_REF, imageRef);
	}

	public List findAll() {
		log.debug("finding all Profile instances");
		try {
			String queryString = "from Profile";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Profile merge(Profile detachedInstance) {
		log.debug("merging Profile instance");
		try {
			Profile result = (Profile) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Profile instance) {
		log.debug("attaching dirty Profile instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Profile instance) {
		log.debug("attaching clean Profile instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ProfileDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ProfileDAO) ctx.getBean("ProfileDAO");
	}
	
	public List fuzzySearchByWeibo(String content) {
		log.debug("finding Profile instance with property: profContent, value: " + content);
		try {
			String queryString = "from Profile as model where model.profContent like ?";
			return getHibernateTemplate().find(queryString, "%"+content+"%");
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
}