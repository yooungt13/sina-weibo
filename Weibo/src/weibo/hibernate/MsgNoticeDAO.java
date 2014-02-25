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
 * MsgNotice entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see weibo.hibernate.MsgNotice
 * @author MyEclipse Persistence Tools
 */

public class MsgNoticeDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(MsgNoticeDAO.class);
	// property constants
	public static final String MSG_FROM = "msgFrom";
	public static final String MSG_TO = "msgTo";
	public static final String MSG_CONTENT = "msgContent";
	public static final String MSG_TYPE = "msgType";
	public static final String MSG_READ = "msgRead";

	protected void initDao() {
		// do nothing
	}

	public void save(MsgNotice transientInstance) {
		log.debug("saving MsgNotice instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(MsgNotice persistentInstance) {
		log.debug("deleting MsgNotice instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public MsgNotice findById(java.lang.Integer id) {
		log.debug("getting MsgNotice instance with id: " + id);
		try {
			MsgNotice instance = (MsgNotice) getHibernateTemplate().get(
					"weibo.hibernate.MsgNotice", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(MsgNotice instance) {
		log.debug("finding MsgNotice instance by example");
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
		log.debug("finding MsgNotice instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from MsgNotice as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByMsgFrom(Object msgFrom) {
		return findByProperty(MSG_FROM, msgFrom);
	}

	public List findByMsgTo(Object msgTo) {
		return findByProperty(MSG_TO, msgTo);
	}

	public List findByMsgContent(Object msgContent) {
		return findByProperty(MSG_CONTENT, msgContent);
	}

	public List findByMsgType(Object msgType) {
		return findByProperty(MSG_TYPE, msgType);
	}

	public List findByMsgRead(Object msgRead) {
		return findByProperty(MSG_READ, msgRead);
	}

	public List findAll() {
		log.debug("finding all MsgNotice instances");
		try {
			String queryString = "from MsgNotice";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public MsgNotice merge(MsgNotice detachedInstance) {
		log.debug("merging MsgNotice instance");
		try {
			MsgNotice result = (MsgNotice) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(MsgNotice instance) {
		log.debug("attaching dirty MsgNotice instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(MsgNotice instance) {
		log.debug("attaching clean MsgNotice instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static MsgNoticeDAO getFromApplicationContext(ApplicationContext ctx) {
		return (MsgNoticeDAO) ctx.getBean("MsgNoticeDAO");
	}
}