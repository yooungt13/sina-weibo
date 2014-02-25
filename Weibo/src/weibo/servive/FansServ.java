package weibo.servive;

import java.util.ArrayList;
import java.util.List;

import weibo.hibernate.FansManage;
import weibo.hibernate.FollowGroup;
import weibo.hibernate.Userinfo;

public interface FansServ {

	
	/**
	 * 增加一个关注
	 * @author TOSHIBA
	 */
	public boolean saveFollow(FansManage fans);

	/**
	 * 获得指定好友信息
	 * @return 好友列表
	 * @author TOSHIBA
	 */
	public ArrayList<FansManage> getFansListByUser(Userinfo user);
	/**
	 * 获得指定关注信息
	 * @return 关注列表
	 * @author TOSHIBA
	 */
	public ArrayList<FansManage> getFollowListByUser(Userinfo user);
    /**
	 * 关注我的fans
	 * @author TOSHIBA
     * @return 
	 */
    public void saveFans(Integer fansId);
    /**
	 * delete我的fans
	 * @author TOSHIBA
     * @return 
	 */
    public int deleteFans(Integer fansId);
    /**
	 * 增加我的关注页面的分组名
	 * @author TOSHIBA
     * @return 
	 */
    public void savegroupId(String groupName);
    /**
	 * delete我的follow
	 * @author TOSHIBA
     * @return 
	 */
    public int deleteFollow(Integer followId);
    /**
	 * 获得指定分组信息
	 * @return 分组列表
	 * @author TOSHIBA
	 */
    public ArrayList<FollowGroup> getFollowTeam(Userinfo user);
    /**
	 * 获得头三个分组信息
	 * @return 分组列表
	 * @author TOSHIBA
	 */
    public ArrayList<FollowGroup> firstGroup();
    /**
	 * 获得三个之后的分组信息
	 * @return 分组列表
	 * @author TOSHIBA
	 */
    public ArrayList<FollowGroup> lastGroup();
    /**
	 * 判断数据是否重复
	 * @author TOSHIBA
     * @return 
	 */
    public boolean lookOutFans(Integer fansId);
    /**
	 * 得到fans的按粉丝个数多少排列的粉丝列表
	 * @author TOSHIBA
     * @return 
	 */
    public ArrayList<FansManage> getFansIdSqList(Userinfo user);
    public int a(FansManage b);
    /**
	 * 得到follow的未分组列表
	 * @author TOSHIBA
     * @return 
	 */
    public ArrayList<FansManage> getGroupFollowId(Userinfo user);
    /**
	 * 得到follow的相互关注列表
	 * @author TOSHIBA
     * @return 
	 */
    public ArrayList<FansManage> getFollowIdSqList(Userinfo user);
    /**
	 * 得到一个用户follow中是否有另一个用户
	 * @author TOSHIBA
     * @return 
	 */
    public boolean findUserIdByUserId(Userinfo user1, Userinfo user2);
    public int getUserFansNumber();
    public int getFollowIdNumber();
}
