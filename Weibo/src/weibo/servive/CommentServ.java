package weibo.servive;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import weibo.bean.PageBean;
import weibo.hibernate.Comment;
import weibo.hibernate.Profile;
import weibo.hibernate.Userinfo;

public interface CommentServ {
	
	/**
	 * 保存评论
	 * @param com 评论对象
	 * @author titan
	 */
	public void saveComment(Comment com);

	/**
	 * 删除评论
	 * @param comId 评论的评论ID
	 * @author titan
	 */
	public boolean deleteComment(Integer comId);
	
	/**
	 * 得到相关微博的评论
	 * @param profile 微博ID
	 * @author titan
	 */
	public void getCommentByProfId(Profile profile);

	/**
	 * 得到评论人的昵称
	 * @param comComId 评论的评论ID
	 * @param comId 本条评论的ID
	 * @author titan
	 */
	public void getReplyComment(Integer comComId, Integer comId);
	
	/**
	 * 获得用户评论信息
	 * @return 评论列表
	 * @author titan
	 */
	public ArrayList<Comment> getCommentByUser();
	
	/**
	 * 获得用户发出评论信息
	 * @return 评论列表
	 * @author titan
	 */
	public ArrayList<Comment> getSendComList();
		
	/**
	 * 获得关注人评论信息
	 * @param 粉丝管理服务
	 * @return 评论列表
	 * @author titan
	 */
	public ArrayList<Comment> getComListByFollow();

	/**
	 * 获得陌生人评论信息
	 * @return 评论列表
	 * @author titan
	 */
	public ArrayList<Comment> getComListByStranger();

	/**
	 * 删除已选择的评论项
	 * @param 选中的评论项ID列表
	 * @author titan
	 */
	public void deleteSelected(String selectedList);

	/**
	 * 得到被评论的评论项
	 * @param 被评论的评论项ID
	 * @return 评论项
	 * @author titan
	 */
	public Comment getBeCommented(Integer comComId);

	/**
	 * 得到被评论微博的用户
	 * @param 被评论的微博ID
	 * @return 用户
	 * @author titan
	 */
	public Userinfo getBeCommentedProfUser(int profId);	
	
	/**
	 * 初始化当前页面@我的评论列表
	 * @return 保存页面数据的List
	 * @author titan
	 */
	public ArrayList<Comment> getAtMeComPage();
	
	
	/**
	 * 增加一个@评论
	 * @param com 评论
	 * @author titan
	 */
	public boolean addComAt(Comment com);
}
