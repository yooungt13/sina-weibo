package weibo.servive;

import java.util.ArrayList;
import java.util.List;

import weibo.hibernate.Login;
import weibo.hibernate.Userinfo;
import weibo.exception.UserException;;


public interface UserServ {
	
	/**
	 * 验证登录
	 * @param username 用户编号（自己）
	 * @param password 用户的密码
	 * @return 如果验证通过则返回true，否则返回false
	 * @throws UserException
	 */
	public  Login validLogin(String username,String password)throws UserException;
	
	/**
	 * 通过用户名，查询用户的详细信息
	 * @param username 用户编号（自己）
	 * @return UserInfo 用户的详细信息
	 */
	public  Userinfo getUserByLogin(Login loin);
	
	/**
	 * 此方法是在注册用户的时候使用
	 * @param user 用户的详细信息
	 * @return  如果在数据库保存成功则返回true，否则返回false。
	 * @author fty
	 */
	public boolean register(Userinfo user,Login login);
	
	/**
	 * 此方法用于更新用户的详细信息
	 * @param user 用户更改后的详细信息
	 * @return 如果在数据库中保存更改成功，则返回true,否则返回false
	 * @author fty
	 */
	public boolean updateUser(Userinfo user);
	
	/**
	 * 删除用户所用的信息，包括他所发布的消息，和对别人的评论等等,注意：只用管理人员才可以删除
	 * @param username 指定要删除哪个用户的编号
	 * @return 如果删除成功，则返回true,否则返回false
	 */
	public boolean deleteUserByuserName(String username);
	
	/**
	 * 保存登陆用户名和密码
	 * @param login 
	 * @return 如果保存成功，则返回true,否则返回false
	 */
	public boolean saveLogin(Login login);

	/**
	 * 更改密码
	 * @param login 
	 * @return
	 */
	public boolean updatePassword(Login login);
	
	/**
	 * 分类获取用户信息集合
	 * @param userNum 用户帐号
	 * @param category 查找类别
	 * @return 用户信息集合
	 */
	public List<Userinfo> searchPeople(String userNum,String category);
	
	/**
	 * 获得指定页码的用户信息
	 * @param firstResult 想要获得的第一的记录的记录号
	 * @param pageSize    想要获取的页数
	 * @param arrayList   要截取的列表
	 * @return 用户信息集合
	 */
	public List<Userinfo> searchPeopleByPage(int firstResult, int pageSize,List<Userinfo> arrayList);
	
	/**
	 * 获得指定页码的用户信息
	 * @param userId 用户ID
	 * @return 用户信息
	 */
	public Userinfo getUserById(int userId);
	
	/**
	 * 获得login表中password与表单中原密码项输入的密码进行比较
	 * @param oldpassword 表单中原密码项输入内容
	 * @return 如果相同return true 否则return false
	 */
	public boolean compare(String oldpassword);
	
	/**
	 * 完善教育信息
	 * @param user
	 * @author fty
	 */
	public boolean saveEducationinfo(Userinfo user);
	
	
	/**
	 * 完善工作信息
	 * @param user
	 * @author fty
	 */
	public boolean saveWorkinfo(Userinfo user);
	
	/**
	 * 添加个人标签
	 * @param user
	 * @author fty
	 */
	public boolean Tag(Userinfo user);
	
	/**
	 * 验证登录名
	 * @param user
	 * @author fty
	 */
	public void validateInfo(Login login);
	
	/**
	 * 验证昵称
	 * @param userinfo
	 * @author fty
	 */
	public void validateNickName(Userinfo userinfo);

	/**
	 * 得到人气用户列表，不包含用户已关注
	 * @param 列表数量
	 * @author titan
	 */
	public ArrayList<Userinfo> getFamousList();
	
	/**
	 * 将设置的权限存入数据库
	 * @param powerSetting
	 * @return 如果保存成功，则返回true,否则返回false
	 * @author fty
	 */
	public boolean powerSetting(Userinfo user);

	/**
	 * 初始化登陆页面时，得到人气用户列表
	 * @param 列表数量
	 * @return 用户列表
	 * @author titan
	 */
	public ArrayList<Userinfo> getFamousList(int count);
	
	/**
	 * 得到最新注册用户
	 * @return 用户列表
	 * @author titan
	 */
	public ArrayList<Userinfo> getNewconList();

	/**
	 * 通过昵称关键词，查找相关用户
	 * @param 用户昵称
	 * @return 用户列表
	 * @author titan
	 */
	public ArrayList<Userinfo> getUserListByName(String nickName);

	/**
	 * 通过用户ID，冻结该用户账号
	 * @param 用户ID
	 * @author titan
	 */
	public void freezeUser(int userId);

	/**
	 * 通过用户ID，恢复该用户账号
	 * @param 用户ID
	 * @author titan
	 */
	public void recoverUser(int userId);

	/**
	 * 通过用户登录名与身份证找回密码
	 * @param log 用户登录名
	 * @param identifier 身份证
	 * @return 如果验证成功则返回true,否则为false
	 * @author titan
	 */
	public boolean updatePwd(Login log, String identifier);

	/**
	 * 确认修改用户密码
	 * @param log 用户登录名
	 * @return 如果修改成功则返回true,否则为false
	 * @author titan
	 */
	public boolean confirmUpdatePwd(Login log);
	
	/**
	 * 验证输入密码与原密码是否相同
	 * @param oldpassword
	 * @author fty
	 */
	public void validateOldPassword(String oldpassword);
}
