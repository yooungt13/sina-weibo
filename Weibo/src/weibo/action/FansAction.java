package weibo.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;

import weibo.bean.PageBean;
import weibo.hibernate.FansManage;
import weibo.hibernate.FansManageDAO;
import weibo.hibernate.FollowGroup;
import weibo.hibernate.Userinfo;
import weibo.servive.FansServ;
import weibo.servive.PageServ;
import weibo.util.ImplUtil;




public class FansAction extends BaseAction{
	
	private FansManage fans;
	private int fmId;
	private ArrayList<FansManage> fansList;
	private ArrayList<FansManage> followList;
	private FansManage follow;
	private int pageNumber;
	private int pageSize;
	private String groupName;
	private int listType;

	public int getListType() {
		return listType;
	}

	public void setListType(int listType) {
		this.listType = listType;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public ArrayList<FansManage> getFollowList() {
		return followList;
	}

	public void setFollowList(ArrayList<FansManage> followList) {
		this.followList = followList;
	}

	public FansManage getFollow() {
		return follow;
	}

	public void setFollow(FansManage follow) {
		this.follow = follow;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getFmId() {
		return fmId;
	}

	public void setFmId(int fmId) {
		this.fmId = fmId;
	}

	public FansManage getFans() {
		return fans;
	}

	public void setFans(FansManage fans) {
		this.fans = fans;
	}

	public ArrayList<FansManage> getFansList() {
		return fansList;
	}

	public void setFansList(ArrayList<FansManage> fansList) {
		this.fansList = fansList;
	}


	

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		FansServ fansServ = this.servLocator.getFansServ();
		//fansServ.save(this.fans);
		ArrayList<FansManage> tmp;
		Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");
		tmp = fansServ.getFansListByUser(user);
		fansList = tmp;
		return "Myfans";
	}
	//fans页面的加关注
   public String addfansId(){
	   FansServ fansserv=(FansServ) this.servLocator.getFansServ();
	   fansserv.saveFans(this.fans.getFansId());
	   return "homePage";
   }
   //fans页面的删除fans
   public String deletefansId(){
	   FansServ fansServ=(FansServ) this.servLocator.getFansServ();
	   int number = fansServ.deleteFans(this.fans.getFansId());
	   PageBean pg = new PageBean();
	   if(this.listType == 1)
	{
	   Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");
	   List<FansManage> totalList = fansServ.getFansListByUser(user);
	   pg.setTotalPosts(totalList.size());
	   if(pg.getTotalPosts()!=0 && pg.getTotalPosts()== number )
	   {
	        if((pg.getTotalPosts()%pg.getPageSize())==0)
	          {
		         int page;
		         page=this.pageNumber-1;
		         this.setPageNumber(page);
	          }
	   }
	}
	else
	{
			  int page = 1;
			  this.setPageNumber(page);
	}
	   return "deleteFans";
   }
   //follow页面的删除follow
   public String deletefollowId()
	{
	  FansServ fansServ=(FansServ) this.servLocator.getFansServ();
	  PageBean pg = new PageBean();
	  int number =fansServ.deleteFollow(this.follow.getFollowId());
	  if(this.listType == 1)
	 {
	      Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");
	      List<FansManage> totalList = fansServ.getFollowListByUser(user);
	      pg.setTotalPosts(totalList.size());
	      if(pg.getTotalPosts()!=0 && pg.getTotalPosts()== number )
	     {
	        if((pg.getTotalPosts()%pg.getPageSize())==0)
	       {
		      int page;
		      page=this.pageNumber-1;
		      this.setPageNumber(page);
	       }
	     }
	 }
	 else
	 {
		  int page = 1;
		  this.setPageNumber(page);
		  this.setListType(page);
	 }
	 return "deleteFollow";
  }
   //fans页面的关注所有人方法
   public String saveAllfans(){
	   PageServ pageServ=(PageServ) this.servLocator.getPageServ();
	   FansServ fansServ=(FansServ) this.servLocator.getFansServ();
	   ArrayList<FansManage> fansLists=new ArrayList<FansManage>();
	   ArrayList<FansManage> fansL = new ArrayList<FansManage>();
	   Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");
	   switch(this.listType){
		    case 1: fansL = fansServ.getFansListByUser(user);break;
		    case 2: fansL = fansServ.getFansIdSqList(user);break;
		    default:break;
		}
	   fansLists =(ArrayList<FansManage>) pageServ.getListByPageNum(this.pageNumber, this.pageSize, fansL);
	   for(int i=0;i<fansLists.size();i++){
		       boolean ackFans=fansServ.lookOutFans(fansLists.get(i).getFansId());
		       if(ackFans==false){
		           fansServ.saveFans(fansLists.get(i).getFansId());
		       }
	   }
	   return "deleteFans";
   }
   public String saveGroupId(){
	   FansServ fansServ=(FansServ) this.servLocator.getFansServ();
	   try {
		String name =java.net.URLDecoder.decode(this.groupName, "utf-8");
		this.setGroupName(name);
	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   fansServ.savegroupId(this.groupName);
	   return "getgroupId";
   }
}
