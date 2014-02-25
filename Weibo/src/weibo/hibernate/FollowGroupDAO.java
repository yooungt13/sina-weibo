package weibo.hibernate;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * FollowGroup entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see weibo.hibernate.FollowGroup
 * @author MyEclipse Persistence Tools
 */

public class FollowGroupDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(FollowGroupDAO.class);
	// property constants
	public static final String GROUP_NAME = "groupName";

	protected void initDao() {
		// do nothing
	}

	public void save(FollowGroup transientInstance) {
		log.debug("saving FollowGroup instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(FollowGroup persistentInstance) {
		log.debug("deleting FollowGroup instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public FollowGroup findById(java.lang.Integer id) {
		log.debug("getting FollowGroup instance with id: " + id);
		try {
			FollowGroup instance = (FollowGroup) getHibernateTemplate().get(
					"weibo.hibernate.FollowGroup", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(FollowGroup instance) {
		log.debug("finding FollowGroup instance by example");
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
		log.debug("finding FollowGroup instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from FollowGroup as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByGroupName(Object groupName) {
		return findByProperty(GROUP_NAME, groupName);
	}

	public List findAll() {
		log.debug("finding all FollowGroup instances");
		try {
			String queryString = "from FollowGroup";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public FollowGroup merge(FollowGroup detachedInstance) {
		log.debug("merging FollowGroup instance");
		try {
			FollowGroup result = (FollowGroup) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(FollowGroup instance) {
		log.debug("attaching dirty FollowGroup instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(FollowGroup instance) {
		log.debug("attaching clean FollowGroup instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static FollowGroupDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (FollowGroupDAO) ctx.getBean("FollowGroupDAO");
	}
}