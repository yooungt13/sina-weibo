package weibo.util;
/**
 * 
 */

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import weibo.bean.CountBean;
import weibo.hibernate.Count;
import weibo.hibernate.CountDAO;
import weibo.hibernate.Login;
import weibo.hibernate.MsgNotice;
import weibo.hibernate.TransmitCollectionDAO;
import weibo.hibernate.Userinfo;
import weibo.serviceLocator.ServiceLocator;
import weibo.servive.MsgServ;

import com.opensymphony.xwork2.ActionContext;

public class ImplUtil {
	
	/**
	 * 用于获取当前系统正在使用的ApplicationContext
	 * @return ApplicationContext 
	 * @author titan
	 */
	public static ApplicationContext getApplicationContext(){
		
		//HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);		
		//return WebApplicationContextUtils.getRequiredWebApplicationContext((ServletContext)request.getSession().getServletContext());	
		return WebApplicationContextUtils.getWebApplicationContext( ServletActionContext.getServletContext());
	}

	/**
	 * 通过给定的Bean名字来获取相对应的Bean的实例
	 * @param BeanName 要获取的Bean的名字
	 * @return 返回的是Object，所以获取后需要强制转换成确定的Bean类型
	 * @author titan
	 */
	public static Object getBeanByName(String BeanName){
		return getApplicationContext().getBean(BeanName);
	}

	/**
	 * 通过发布时间与现在时间得到时差
	 * @param pubtime 发布时间
	 * @return 返回时差
	 * @author titan
	 */
	public static String getSubTime(Timestamp pubtime){
		Timestamp nowtime = new Timestamp(System.currentTimeMillis());
		
		if( pubtime.getDate() == nowtime.getDate() ){
			Long subtime = (nowtime.getTime() - pubtime.getTime())/1000;
			
			if( subtime < 60 ){
				return subtime + "秒前";
			}else if( subtime >= 60 && subtime < 3600 ){
				return subtime/60 + "分钟前";
			}else{
				return subtime/3600 + "小时前";
			}
		}else{

			int month = pubtime.getMonth() + 1;
			int day = pubtime.getDate();
			int hour = pubtime.getHours();
			int minute = pubtime.getMinutes();
			
			if( minute < 10 ){
				return month + "月" + day +"日  " + hour + ":0" + minute;
			}else{
				return month + "月" + day +"日  " + hour + ":" + minute;
			}					
		}	
	}

	/**
	 * 获得当前session的用户信息
	 * @return 用户信息
	 * @author titan
	 */
	public static Userinfo getSessionUser(){
		return (Userinfo) ActionContext.getContext().getSession().get("user");
	}
	
	/**
	 * 获得当前session的管理员信息
	 * @return 管理员登陆信息
	 * @author titan
	 */
	public static Login getSessionLogin(){
		return (Login) ActionContext.getContext().getSession().get("login");
	}
	
	/**
	 * 获得当前session的登陆信息的角色
	 * @return 角色
	 * @author titan
	 */
	public static Long getUserRole(){
		return (Long) ActionContext.getContext().getSession().get("role");
	}

	/**
	 * 将内容插入表情标签
	 * @param 原文章内容
	 * @return 具有表情的字符串内容
	 * @author titan
	 */
	public static String getPublishContent(String content){
		String[] tmp = content.split("\\[");
		String results = tmp[0];
		
		for( int i = 1; i < tmp.length; i++ ){
			if( tmp[i].indexOf("]") > 0 ){
				String emt = tmp[i].substring(0, tmp[i].indexOf("]"));
				switch(Emotion.getEmotion(emt)){
					case 奥特曼:
						tmp[i] = tmp[i].replace(emt+"]", "<img src=\"/Weibo/Images/emotions/otm.gif\" title=\"奥特曼\">");
						break;
					case 伤心:
						tmp[i] = tmp[i].replace(emt+"]", "<img src=\"/Weibo/Images/emotions/sad.gif\" title=\"伤心\">");
						break;
					case 围观:
						tmp[i] = tmp[i].replace(emt+"]", "<img src=\"/Weibo/Images/emotions/wg.gif\" title=\"围观\">");
						break;
					case 懒得理你:
						tmp[i] = tmp[i].replace(emt+"]", "<img src=\"/Weibo/Images/emotions/ldln.gif\" title=\"懒得理你\">");
						break;
					case 哈哈:
						tmp[i] = tmp[i].replace(emt+"]", "<img src=\"/Weibo/Images/emotions/laugh.gif\" title=\"哈哈\">");
						break;
					case 鄙视:
						tmp[i] = tmp[i].replace(emt+"]", "<img src=\"/Weibo/Images/emotions/bs.gif\" title=\"鄙视\">");
						break;
					case 花心:
						tmp[i] = tmp[i].replace(emt+"]", "<img src=\"/Weibo/Images/emotions/hs.gif\" title=\"花心\">");
						break;
					case 扣鼻屎:
						tmp[i] = tmp[i].replace(emt+"]", "<img src=\"/Weibo/Images/emotions/kbs.gif\" title=\"扣鼻屎\">");
						break;
					case 讨厌:
						tmp[i] = tmp[i].replace(emt+"]", "<img src=\"/Weibo/Images/emotions/hate.gif\" title=\"讨厌\">");
						break;
					case 给力:
						tmp[i] = tmp[i].replace(emt+"]", "<img src=\"/Weibo/Images/emotions/geili.gif\" title=\"给力\">");
						break;
					case 阴险:
						tmp[i] = tmp[i].replace(emt+"]", "<img src=\"/Weibo/Images/emotions/yx.gif\" title=\"阴险\">");
						break;
					case 嘿嘿:
						tmp[i] = tmp[i].replace(emt+"]", "<img src=\"/Weibo/Images/emotions/hei.gif\" title=\"嘿嘿\">");
						break;
					default:
						tmp[i] = tmp[i].replace(emt+"]","["+emt+"]");
						break;						
				}
			}
			
			results += tmp[i];
		}
		
		return results;
		
	}
	
	/**
	 * 表情的枚举类型
	 * @author titan
	 */
	public enum Emotion {  
	    奥特曼,伤心,围观,懒得理你,嘿嘿,哈哈,鄙视,花心,扣鼻屎,讨厌,给力,阴险,错误;
	      
	    public static Emotion getEmotion(String content){
	    	try{
	    		return valueOf(content.toLowerCase()); 
	    	}catch(Exception e){
	    		return Emotion.错误;
	    	}			
	    }  
	      
	}
	
	public static void saveCount(String countname){
		CountDAO cDao = (CountDAO) ImplUtil.getBeanByName("CountDAO");
		Userinfo user = getSessionUser();
		
		Count cb = cDao.findById(user.getUserId());
		if( cb == null ){
			Count newcb = new Count();
			newcb.setUserId(user.getUserId());
			newcb.setFansCount((long) user.getFansCount());
			newcb.setMsgCount((long) user.getMsgCount());
			newcb.setAtProfileCount((long) user.getAtProfileCount());
			newcb.setAtCommentCount((long) user.getAtCommentCount());
			newcb.setNoticeCount((long) user.getNoticeCount());	
			newcb.setCommentCount((long) user.getCommentCount());
			cDao.save(newcb);
		}else{
			if( countname.equals("fans") ){
				cb.setFansCount((long) user.getFansCount());
			}else if( countname.equals("msg") ){
				cb.setMsgCount((long) user.getMsgCount());
			}else if( countname.equals("notice") ){
				cb.setNoticeCount((long) user.getNoticeCount());			
			}else if( countname.equals("atprofile") ){
				cb.setAtProfileCount((long) user.getAtProfileCount());
			}else if( countname.equals("atcomment") ){
				cb.setAtCommentCount((long) user.getAtCommentCount());
			}else if( countname.equals("comment") ){
				cb.setCommentCount((long) user.getCommentCount());
			}
			cDao.merge(cb);
		}
		
	}
	
	/**
	 * 为新注册的用户发布一条欢迎通知
	 * @author titan
	 */
	public static void welcomeNotice(Userinfo newcom){
		
		CountDAO cDao = (CountDAO) ImplUtil.getBeanByName("CountDAO");
		// 建立小黄签表	
		Count newcb = new Count();
		newcb.setUserId(newcom.getUserId());
		newcb.setFansCount((long) 0);
		newcb.setMsgCount((long) 0);
		newcb.setAtProfileCount((long) 0);
		newcb.setAtCommentCount((long) 0);
		newcb.setNoticeCount((long) 0);
		newcb.setCommentCount((long) 0);
		cDao.save(newcb);
		
		MsgServ msgServ = ServiceLocator.getMsgServ();	
		MsgNotice message = new MsgNotice();
		message.setMsgContent("欢迎您加入我们的微博大家庭，祝您越V越开心，越V越漂亮");
			
		msgServ.sendNotice(message,newcom.getNickName());
	}
}
