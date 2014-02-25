package weibo.hibernate;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for Count
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see weibo.hibernate.Count
 * @author MyEclipse Persistence Tools
 */

public class CountDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(CountDAO.class);
	// property constants
	public static final String FANS_COUNT = "fansCount";
	public static final String MSG_COUNT = "msgCount";
	public static final String AT_PROFILE_COUNT = "atProfileCount";
	public static final String AT_COMMENT_COUNT = "atCommentCount";
	public static final String NOTICE_COUNT = "noticeCount";
	public static final String COMMENT_COUNT = "commentCount";

	protected void initDao() {
		// do nothing
	}

	public void save(Count transientInstance) {
		log.debug("saving Count instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Count persistentInstance) {
		log.debug("deleting Count instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Count findById(java.lang.Integer id) {
		log.debug("getting Count instance with id: " + id);
		try {
			Count instance = (Count) getHibernateTemplate().get(
					"weibo.hibernate.Count", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Count instance) {
		log.debug("finding Count instance by example");
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
		log.debug("finding Count instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Count as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByFansCount(Object fansCount) {
		return findByProperty(FANS_COUNT, fansCount);
	}

	public List findByMsgCount(Object msgCount) {
		return findByProperty(MSG_COUNT, msgCount);
	}

	public List findByAtProfileCount(Object atProfileCount) {
		return findByProperty(AT_PROFILE_COUNT, atProfileCount);
	}

	public List findByAtCommentCount(Object atCommentCount) {
		return findByProperty(AT_COMMENT_COUNT, atCommentCount);
	}

	public List findByNoticeCount(Object noticeCount) {
		return findByProperty(NOTICE_COUNT, noticeCount);
	}

	public List findByCommentCount(Object commentCount) {
		return findByProperty(COMMENT_COUNT, commentCount);
	}

	public List findAll() {
		log.debug("finding all Count instances");
		try {
			String queryString = "from Count";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Count merge(Count detachedInstance) {
		log.debug("merging Count instance");
		try {
			Count result = (Count) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Count instance) {
		log.debug("attaching dirty Count instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Count instance) {
		log.debug("attaching clean Count instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static CountDAO getFromApplicationContext(ApplicationContext ctx) {
		return (CountDAO) ctx.getBean("CountDAO");
	}
}