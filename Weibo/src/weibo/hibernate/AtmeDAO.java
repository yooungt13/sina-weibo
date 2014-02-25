package weibo.hibernate;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for Atme
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see weibo.hibernate.Atme
 * @author MyEclipse Persistence Tools
 */

public class AtmeDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(AtmeDAO.class);
	// property constants
	public static final String AT_WHO = "atWho";

	protected void initDao() {
		// do nothing
	}

	public void save(Atme transientInstance) {
		log.debug("saving Atme instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Atme persistentInstance) {
		log.debug("deleting Atme instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Atme findById(java.lang.Integer id) {
		log.debug("getting Atme instance with id: " + id);
		try {
			Atme instance = (Atme) getHibernateTemplate().get(
					"weibo.hibernate.Atme", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Atme instance) {
		log.debug("finding Atme instance by example");
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
		log.debug("finding Atme instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Atme as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByAtWho(Object atWho) {
		return findByProperty(AT_WHO, atWho);
	}

	public List findAll() {
		log.debug("finding all Atme instances");
		try {
			String queryString = "from Atme";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Atme merge(Atme detachedInstance) {
		log.debug("merging Atme instance");
		try {
			Atme result = (Atme) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Atme instance) {
		log.debug("attaching dirty Atme instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Atme instance) {
		log.debug("attaching clean Atme instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static AtmeDAO getFromApplicationContext(ApplicationContext ctx) {
		return (AtmeDAO) ctx.getBean("AtmeDAO");
	}
}