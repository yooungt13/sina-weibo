package weibo.servive;

import java.util.ArrayList;
import weibo.bean.PageBean;
import weibo.hibernate.Profile;
import weibo.hibernate.Userinfo;

public interface PageServ {
	
	/**
	 * 返回主页微博列表
	 * @param profServ 微博管理服务
	 * @param pageNumber 当前页码
	 * @return 如果保存页面数据的PageBean
	 */
	public PageBean getProfPage(ProfileServ profServ,int pageNumber);
	
	/**
	 * 返回我的微博页微博列表
	 * @param profServ 微博管理服务
	 * @param pageNumber 当前页码
	 * @return 如果保存页面数据的PageBean
	 */
	public PageBean getMyProfPage(ProfileServ profServ,int pageNumber);
	
	/**
	 * 返回当前页面微博总页数
	 * @param pageBean 存储分页信息的BEAN
	 * @return 返回当前页面微博总页数
	 * @author titan
	 */
	public int getTotalPages(PageBean pg);

	/**
	 * 返回当前页面评论列表
	 * @param comServ 评论管理服务
	 * @param pageNumber 当前页码
	 * @param comListType 评论页面类型
	 * @return 保存页面数据的PageBean
	 * @author titan
	 */	
	public PageBean getCommentList(CommentServ comServ, int pageNumber, int comListType);

	/**
	 * 初始化当前页面评论列表
	 * @param comListType 
	 * @param pageNumber 当前页码
	 * @param comServ 
	 * @return 保存页面数据的PageBean
	 * @author titan
	 */
	public void initCommentsList(CommentServ comServ, int pageNumber, int comListType);

	/**
	 * 初始化当前页面收藏列表
	 * @param pageNumber 当前页码
	 * @param profServ 
	 * @return 保存页面数据的PageBean
	 * @author titan
	 */
	public PageBean getMyFavorsPage(ProfileServ profServ, int pageNumber);

	/**
	 * 初始化当前页面@我的微博列表
	 * @param pageNumber 当前页码
	 * @param profServ 
	 * @return 保存页面数据的PageBean
	 * @author titan
	 */
	public PageBean getAtMePage(ProfileServ profServ, int pageNumber);
	
	/**
	 * 初始化当前页面@我的评论列表
	 * @param pageNumber 当前页码
	 * @param comServ 
	 * @return 保存页面数据的PageBean
	 * @author titan
	 */
	public PageBean getAtMeComPage(CommentServ comServ, int pageNumber);
	
	/**
	 * 返回我的fans页fans列表
	 * @param fansServ 粉丝管理服务
	 * @param pageNumber 当前页码
	 * @return 如果保存页面数据的PageBean
	 */
	public PageBean getFansPage(FansServ fansServ, int pageNumber,Userinfo user);
	
	/**
	 * 返回我的follow页follow列表
	 * @param followServ 粉丝管理服务
	 * @param pageNumber 当前页码
	 * @return 如果保存页面数据的PageBean
	 */
	public PageBean getFollowPage(FansServ followServ, int pageNumber,Userinfo user);

	/**
	 * 获得指定页数的列表信息
	 * @param pageNumer 当前页数
	 * @param pageSize 分页数
	 * @return 列表集合
	 * @author titan
	 */
	public ArrayList getListByPageNum(Integer pageNumer, Integer pageSize, ArrayList list);
	public PageBean getFansIdList(FansServ fansServ, int pageNumber,int listType);
	public void initFansList(FansServ fansServ, int pageNumber, int fansListType);
	public void initFollowList(FansServ fansServ, int pageNumber, int followListType);
	public PageBean getFollowIdList(FansServ fansServ,int pageNumber,int listType);
	/**
	 * 返回我的Msg页msg列表
	 * @param msgServ 粉丝管理服务
	 * @param pageNumber 当前页码
	 * @return 如果保存页面数据的PageBean
	 * @author huangying
	 */
	public PageBean getMsgPage(MsgServ msgServ, int pageNumber);
	
	/**
	 * 返回我的FromMsg页msg列表
	 * @param msgServ 粉丝管理服务
	 * @param pageNumber 当前页码
	 * @return 如果保存页面数据的PageBean
	 * @author huangying
	 */
	public PageBean getFromMsgPage(MsgServ msgServ, int pageNumber);	
	/**
	 * 返回我的SystemMsg页msg列表
	 * @param msgServ 粉丝管理服务
	 * @param pageNumber 当前页码
	 * @return 如果保存页面数据的PageBean
	 * @author huangying
	 */
	public PageBean getSystemMsgPage(MsgServ msgServ, int pageNumber);
	/**
	 * 返回我的noticeMsg页msg列表
	 * @param msgServ 粉丝管理服务
	 * @param pageNumber 当前页码
	 * @return 如果保存页面数据的PageBean
	 * @author huangying
	 */
	public PageBean getNoticeMsgPage(MsgServ msgServ, int pageNumber);

}

