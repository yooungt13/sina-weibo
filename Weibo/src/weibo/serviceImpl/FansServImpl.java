package weibo.serviceImpl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import javax.xml.registry.infomodel.User;

import com.opensymphony.xwork2.ActionContext;

import weibo.hibernate.FansManage;
import weibo.hibernate.FansManageDAO;
import weibo.hibernate.FollowGroup;
import weibo.hibernate.FollowGroupDAO;
import weibo.hibernate.Userinfo;
import weibo.hibernate.UserinfoDAO;
import weibo.servive.FansServ;
import weibo.util.ImplUtil;

public  class FansServImpl implements FansServ{
	public boolean saveFollow(FansManage fans)
	{
		return false;		
	}

	public ArrayList<FansManage> getFansListByUser(Userinfo user) {
		// TODO Auto-generated method stub
		FansManageDAO fmDao = (FansManageDAO) ImplUtil.getBeanByName("FansManageDAO");
		
		// 通过userId在follow字段中找到符合的粉丝列表
		ArrayList<FansManage> fansList = new ArrayList<FansManage>();
		fansList = (ArrayList<FansManage>) fmDao.findByFollowId(user.getUserId());
		java.util.Collections.reverse( fansList );
		return fansList;
		
	}
	public ArrayList<FansManage> getFollowListByUser(Userinfo user) {
		// TODO Auto-generated method stub
		// 声明一个DAO工具类，操作数据库
		FansManageDAO fmDao = (FansManageDAO) ImplUtil.getBeanByName("FansManageDAO");
		ArrayList<FansManage> followList = new ArrayList<FansManage>();
		followList = (ArrayList<FansManage>) fmDao.findByFansId(user.getUserId());
		// 通过userId在follow字段中找到符合的关注列表
		java.util.Collections.reverse(followList);
		return followList;
	}
//fans页面的具体加关注方法
	public void saveFans(Integer fansId)
	{   
		Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");
		FansManageDAO fnDao = (FansManageDAO) ImplUtil.getBeanByName("FansManageDAO");
		boolean TF = lookOutFans(fansId);
		if(!TF)
		{
		 FansManage fansLists = new FansManage();
		 fansLists.setFansId(user.getUserId());
		 fansLists.setFollowId(fansId);
		 fansLists.setGroupId(0);
		 fnDao.save(fansLists);
		}
	}
	//fans页面的具体删除fans方法
	public int deleteFans(Integer fansId) {
		// TODO Auto-generated method stub
		Userinfo users = (Userinfo) ActionContext.getContext().getSession().get("user");
		FansManageDAO fnDaos = (FansManageDAO) ImplUtil.getBeanByName("FansManageDAO");
		ArrayList<FansManage> fansLists = (ArrayList<FansManage>) fnDaos.findByFollowId(users.getUserId());
		java.util.Collections.reverse(fansLists);
		for(int i=0;i<fansLists.size();i++){
			int fansD = fansId; 
			int fansI = fansLists.get(i).getFansId();
			if(fansD == fansI)
			{   
				fnDaos.delete(fansLists.get(i));
				return i;
			}
		}
		return -1;
	}
	//follow页面的具体删除follow方法
	public int deleteFollow(Integer followId) {
		// TODO Auto-generated method stub
		Userinfo users = (Userinfo) ActionContext.getContext().getSession().get("user");
		FansManageDAO fnDaos = (FansManageDAO) ImplUtil.getBeanByName("FansManageDAO");
		ArrayList<FansManage> followLists = (ArrayList<FansManage>) fnDaos.findByFansId(users.getUserId());
		java.util.Collections.reverse(followLists);
		for(int i=0;i<followLists.size();i++)
		{
			int followD = followId;
			int followI = followLists.get(i).getFollowId();
			if(followD == followI)
			{
				fnDaos.delete(followLists.get(i));
				return i;
			}
		}
		return -1;
	}
	public boolean lookOutFans(Integer fansId){
		Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");
		FansManageDAO fmDao = (FansManageDAO) ImplUtil.getBeanByName("FansManageDAO");
		ArrayList<FansManage> fansList = (ArrayList<FansManage>) fmDao.findByFollowId(fansId);
		for(int i=0;i<fansList.size();i++)
		{ 
            int fanssId = fansList.get(i).getFansId();
            int userId = user.getUserId();
			if( fanssId == userId )
			{
				return true;
			}
		}
		return false;
	}

	public void savegroupId(String groupName) {
		// TODO Auto-generated method stub
		Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");
		FollowGroupDAO fmDao=(FollowGroupDAO) ImplUtil.getBeanByName("FollowGroupDAO");
		ArrayList<FollowGroup> groupList = (ArrayList<FollowGroup>) fmDao.findByProperty("userinfo", user);
		if(groupList.size() < 3)
		{
		       FollowGroup fwDao=new FollowGroup();
		       fwDao.setGroupName(groupName);
		       fwDao.setUserinfo(user);
		       fmDao.save(fwDao);
		}
	}
	public int getUserFansNumber(){
		ArrayList<FansManage> followLists = new ArrayList<FansManage>();
		Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");
		FansManageDAO fmDao = (FansManageDAO) ImplUtil.getBeanByName("FansManageDAO");
		ArrayList<FansManage> followList = (ArrayList<FansManage>) fmDao.findByFollowId(user.getUserId());
		followLists =(ArrayList<FansManage>) fmDao.findByFansId(user.getUserId());
		int result = 0;
		for(int i = 0;i < followLists.size();i++){
			int followI = followLists.get(i).getFollowId();
			for(int a =0;a < followList.size();a++)
			{
			    int fansI =followList.get(a).getFansId();
			    if(followI == fansI)
			    {
			      result++;
			    }
			}
		}
		return result;
	}
	  public int getFollowIdNumber(){
	    	ArrayList<FansManage> followLists = new ArrayList<FansManage>();
			Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");
			FansManageDAO fmDao = (FansManageDAO) ImplUtil.getBeanByName("FansManageDAO");
			followLists =(ArrayList<FansManage>) fmDao.findByFansId(user.getUserId());
			return followLists.size();
	    }

	public ArrayList<FollowGroup> getFollowTeam(Userinfo user) {
		// TODO Auto-generated method stub
		FollowGroupDAO fgDao =(FollowGroupDAO) ImplUtil.getBeanByName("FollowGroupDAO");
		UserinfoDAO users =(UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		ArrayList<FollowGroup> groupList = (ArrayList<FollowGroup>) fgDao.findByProperty("userinfo", users.findById(user.getUserId()));
		return groupList;
	}
	public ArrayList<FollowGroup> firstGroup(){
		ArrayList<FollowGroup> first = getFollowTeam(ImplUtil.getSessionUser());
		ArrayList<FollowGroup> newfirst = new ArrayList<FollowGroup>();
		if(first.size() != 0){
			newfirst.add(first.get(0));
		}
		if(first.size() == 2 || first.size() >2){
			newfirst.add(first.get(1));
		}
		if(first.size() == 3 || first.size() >3){
			newfirst.add(first.get(2));
		}
		return newfirst;
	}
	public ArrayList<FollowGroup> lastGroup(){
		ArrayList<FollowGroup> last = getFollowTeam(ImplUtil.getSessionUser());
		ArrayList<FollowGroup> newlast = new ArrayList<FollowGroup>();
		if(last.size()>3){
			for(int i=3;i<last.size();i++){
				newlast.add(last.get(i));
			}
		}
		return newlast;
	}
	
	public ArrayList<FansManage> getFansIdSqList(Userinfo user) {
	    FansManageDAO fmDao = (FansManageDAO) ImplUtil.getBeanByName("FansManageDAO");
		ArrayList<FansManage> fmsList = (ArrayList<FansManage>) fmDao.findByFollowId(user.getUserId());
		int a = fmsList.get(0).getFansId();
		Collections.sort(fmsList,new Comparator<FansManage>(){
			public int compare(FansManage p1,FansManage p2){
				int s1 = a(p1);
				int s2 = a(p2);
				if(s1 == s2){
					return 0 ;
				}else if(s1<s2){	
					return 1 ;
				}else{
					return -1 ;
				}
			}
		}); 
		return fmsList;
	}
    public ArrayList<FansManage> getFollowIdSqList(Userinfo user){
    	FansManageDAO fmDao = (FansManageDAO) ImplUtil.getBeanByName("FansManageDAO");
  		ArrayList<FansManage> fmsList = (ArrayList<FansManage>) fmDao.findByFansId(user.getUserId());
  		ArrayList<FansManage> result = new ArrayList<FansManage>();
  		for(int i=0;i<fmsList.size();i++){
  	  		ArrayList<FansManage> followIdFansList = (ArrayList<FansManage>) fmDao.findByFansId(fmsList.get(i).getFollowId());
  			int followI = user.getUserId();
  			for(int a=0;a<followIdFansList.size();a++)
  			{
               int userId = followIdFansList.get(a).getFollowId();
  			   if(followI == userId)
  			  {
  				result.add(fmsList.get(i));
  			  }
  			}
  		}
  		return result;
    }
    public ArrayList<FansManage> getGroupFollowId(Userinfo user){
    	FansManageDAO fmDao = (FansManageDAO) ImplUtil.getBeanByName("FansManageDAO");
  		ArrayList<FansManage> fmsList = (ArrayList<FansManage>) fmDao.findByFansId(user.getUserId());
  		ArrayList<FansManage> result = new ArrayList<FansManage>();
  		for(int i=0;i<fmsList.size();i++){
  			if(fmsList.get(i).getGroupId() == 0){
  				result.add(fmsList.get(i));
  			}
  		}
  		java.util.Collections.reverse(result);
  		return result;
    }
    public boolean findUserIdByUserId(Userinfo user1, Userinfo user2){
		FansManageDAO fmDao = (FansManageDAO) ImplUtil.getBeanByName("FansManageDAO");
		ArrayList<FansManage> followList = (ArrayList<FansManage>) fmDao.findByFansId(user2);
		for(int i=0;i<followList.size();i++){
			int a = followList.get(i).getFollowId();
			int b = user1.getUserId();
			if(a ==b){
				return true;
			}
		}
    	return false;
    }
	public int a(FansManage b) {
		// TODO Auto-generated method stub
		FansManageDAO fmDao = (FansManageDAO) ImplUtil.getBeanByName("FansManageDAO");
		return fmDao.findByFollowId(b.getFansId()).size();
	}
}

