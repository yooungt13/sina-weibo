package weibo.hibernate;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * TransmitCollection entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see weibo.hibernate.TransmitCollection
 * @author MyEclipse Persistence Tools
 */

public class TransmitCollectionDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(TransmitCollectionDAO.class);
	// property constants
	public static final String TC_ORIGINAL = "tcOriginal";

	protected void initDao() {
		// do nothing
	}

	public void save(TransmitCollection transientInstance) {
		log.debug("saving TransmitCollection instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TransmitCollection persistentInstance) {
		log.debug("deleting TransmitCollection instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TransmitCollection findById(java.lang.Integer id) {
		log.debug("getting TransmitCollection instance with id: " + id);
		try {
			TransmitCollection instance = (TransmitCollection) getHibernateTemplate()
					.get("weibo.hibernate.TransmitCollection", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TransmitCollection instance) {
		log.debug("finding TransmitCollection instance by example");
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
		log.debug("finding TransmitCollection instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from TransmitCollection as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByTcOriginal(Object tcOriginal) {
		return findByProperty(TC_ORIGINAL, tcOriginal);
	}

	public List findAll() {
		log.debug("finding all TransmitCollection instances");
		try {
			String queryString = "from TransmitCollection";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TransmitCollection merge(TransmitCollection detachedInstance) {
		log.debug("merging TransmitCollection instance");
		try {
			TransmitCollection result = (TransmitCollection) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TransmitCollection instance) {
		log.debug("attaching dirty TransmitCollection instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TransmitCollection instance) {
		log.debug("attaching clean TransmitCollection instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TransmitCollectionDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (TransmitCollectionDAO) ctx.getBean("TransmitCollectionDAO");
	}
}