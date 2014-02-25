package weibo.servive;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import weibo.bean.PageBean;
import weibo.hibernate.Comment;
import weibo.hibernate.Profile;
import weibo.hibernate.Userinfo;

public interface ProfileServ {
	
	/**
	 * 将微博对象存入数据库
	 * @param prof 微博对象
	 * @param imgName 
	 * @param img 
	 * @author titan
	 */
	public boolean saveProf(Profile prof, File img, String imgName);
	
	/**
	 * 从数据库中读取，读取失败返回NULL
	 * @param profId 微博ID
	 * @return prof 微博对象
	 * @author titan
	 */
	public Profile findProf(int profId);
	
	/**
	 * 获得指定微博信息
	 * @param userId 话题ID
	 * @return 微博集合
	 * @author titan
	 */
	public List<Profile> getProfByUser(Userinfo user);
	
	/**
	 * 获得指定微博信息
	 * @param profId 微博ID
	 * @return 用户信息
	 * @author titan
	 */
	public Userinfo getUserByProfId(Integer profId );
	
	/**
	 * 获得指定user相关微博信息，包括关注人的微博
	 * @param userId 话题ID
	 * @return 微博集合
	 * @author titan
	 */
	public List<Profile> getTotalProfByUser(Userinfo user );
	
	/**
	 * 删除指定ID微博内容
	 * @param profId 微博ID
	 * @return 如果删除成果则返回true，否则返回false
	 * @author titan
	 */
	public boolean deleteProf(int profId);

	/**
	 * 添加一个收藏
	 * @param prof 微博
	 * @author titan
	 */
	public boolean addCollection(Profile prof);

	/**
	 * 删除一个收藏
	 * @param favorId 收藏ID
	 * @author titan
	 */
	public boolean deleteCollection(int favorId);
	
	/**
	 * 增加一个@微博
	 * @param prof 微博
	 * @author titan
	 */
	public boolean addAt(Profile prof);
	
	/**
	 * 在转发时增加一系列@微博，在有重复时被Set过滤
	 * @param atList 存放@人昵称的Set集合
	 * @param prof 微博
	 * @author titan
	 */
	public boolean addAt(Set<String> atList, Profile prof);
	
	/**
	 * 增加一个@
	 * @param prof 微博
	 * @return Set<String> 存放@的哈希表
	 * @author titan
	 */
	public ArrayList<String> getAtList(Profile prof);
	
	/**
	 * 初始化当前页面@我的微博列表
	 * @return 保存页面数据的List
	 * @author titan
	 */
	public ArrayList<Profile> getAtMePage();

	/**
	 * 添加一个转发
	 * @param prof 微博
	 * @author titan
	 */
	public void addTransmit(Profile profile);

	/**
	 * 初始化一个转发框
	 * @param prof 微博
	 * @author titan
	 */
	public void initTransmit(int tcId);

	/**
	 * 得到引用图片的路径
	 * @param img 图片
	 * @param imgName 图片名称
	 * @author titan
	 */
	public boolean saveImage(File img, String imgName);
	
	/**
	 * 上传预览图片
	 * @param img 图片
	 * @param imgName 图片名称
	 * @author titan
	 */
	public boolean savePreviewImage(File img, String imgName);

	/**
	 * 得到最新发的微博
	 * @return ArrayList<Profile> 列表 
	 * @author titan
	 */
	public ArrayList<Profile> getRecentProf();

	/**
	 * 通过关键字进行模糊查找
	 * @param profContent 关键字
	 * @return 微博列表
	 * @author titan
	 */
	public ArrayList<Profile> getProfListByContent(String profContent);
}
