package weibo.hibernate;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * FansManage entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see weibo.hibernate.FansManage
 * @author MyEclipse Persistence Tools
 */

public class FansManageDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(FansManageDAO.class);
	// property constants
	public static final String FANS_ID = "fansId";
	public static final String FOLLOW_ID = "followId";
	public static final String GROUP_ID = "groupId";

	protected void initDao() {
		// do nothing
	}

	public void save(FansManage transientInstance) {
		log.debug("saving FansManage instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(FansManage persistentInstance) {
		log.debug("deleting FansManage instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public FansManage findById(java.lang.Integer id) {
		log.debug("getting FansManage instance with id: " + id);
		try {
			FansManage instance = (FansManage) getHibernateTemplate().get(
					"weibo.hibernate.FansManage", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(FansManage instance) {
		log.debug("finding FansManage instance by example");
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
		log.debug("finding FansManage instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from FansManage as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByFansId(Object fansId) {
		return findByProperty(FANS_ID, fansId);
	}

	public List findByFollowId(Object followId) {
		return findByProperty(FOLLOW_ID, followId);
	}

	public List findByGroupId(Object groupId) {
		return findByProperty(GROUP_ID, groupId);
	}

	public List findAll() {
		log.debug("finding all FansManage instances");
		try {
			String queryString = "from FansManage";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public FansManage merge(FansManage detachedInstance) {
		log.debug("merging FansManage instance");
		try {
			FansManage result = (FansManage) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(FansManage instance) {
		log.debug("attaching dirty FansManage instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(FansManage instance) {
		log.debug("attaching clean FansManage instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static FansManageDAO getFromApplicationContext(ApplicationContext ctx) {
		return (FansManageDAO) ctx.getBean("FansManageDAO");
	}
}