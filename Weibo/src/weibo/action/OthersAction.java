package weibo.action;

import java.util.ArrayList;

import weibo.bean.PageBean;
import weibo.hibernate.FansManage;
import weibo.hibernate.Profile;
import weibo.hibernate.Userinfo;
import weibo.hibernate.UserinfoDAO;
import weibo.servive.FansServ;
import weibo.servive.PageServ;
import weibo.servive.ProfileServ;
import weibo.util.ImplUtil;

public class OthersAction extends BaseAction{
	
	private int otherId;
	private Userinfo other;
	
	private int pageNumber;
	private PageBean pageBean;	
	private PageBean followPageBean;
	private PageBean fansPageBean;
	
	private ArrayList<Profile> profList;
	private ArrayList<FansManage> fansList;
	private ArrayList<FansManage> followList;
	
	private FansManage fans;
	
	public Userinfo getOther() {
		UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		return userDao.findById(this.otherId);
	}

	public void setOther(Userinfo other) {
		this.other = other;
	}

	public int getOtherId() {
		return otherId;
	}

	public void setOtherId(int otherId) {
		this.otherId = otherId;
	}
	
	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(ArrayList arrayList) {
		
		PageServ pageServ = this.servLocator.getPageServ();		
		PageBean pg = new PageBean();
		
		if(this.pageNumber == 0){
			this.setPageNumber(1);
		}
		
		pg.setPageNumer(this.pageNumber);
		pg.setTotalPosts(arrayList.size());
		pg.setProfList(pageServ.getListByPageNum(this.pageNumber, pg.getPageSize(), arrayList));
		int tp =  pg.getTotalPosts()/pg.getPageSize() + ((pg.getTotalPosts()%pg.getPageSize())>0?1:0);
		pg.setTotalPages(tp); 
		this.pageBean = pg;
	}
	
	public void setFollowPageBean(ArrayList arrayList) {
		
		PageServ pageServ = this.servLocator.getPageServ();		
		PageBean pg = new PageBean();
		
		if(this.pageNumber == 0){
			this.setPageNumber(1);
		}
		
		pg.setPageNumer(this.pageNumber);
		pg.setTotalPosts(arrayList.size());
		pg.setFollowList(pageServ.getListByPageNum(pageNumber, pg.getPageSize(), arrayList));
		pg.setTotalPages(pageServ.getTotalPages(pg)); 
		this.followPageBean = pg;
	}

	public void setFansPageBean(ArrayList arrayList) {
		PageServ pageServ = this.servLocator.getPageServ();		
		PageBean pg = new PageBean();
		
		if(this.pageNumber == 0){
			this.setPageNumber(1);
		}
		
		pg.setPageNumer(this.pageNumber);
		pg.setTotalPosts(arrayList.size());
		pg.setFansList(pageServ.getListByPageNum(pageNumber, pg.getPageSize(), arrayList));
		pg.setTotalPages(pageServ.getTotalPages(pg)); 
		this.fansPageBean = pg;
	}
	
	public ArrayList<Profile> getProfList() {
		return profList;
	}

	public void setProfList(ArrayList<Profile> profList) {
		this.profList = profList;
	}

	public ArrayList<FansManage> getFansList() {
		return fansList;
	}

	public void setFansList(ArrayList<FansManage> fansList) {
		this.fansList = fansList;
	}

	public ArrayList<FansManage> getFollowList() {
		return followList;
	}

	public void setFollowList(ArrayList<FansManage> followList) {
		this.followList = followList;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public String Profile(){
		try{
			if( this.otherId != ImplUtil.getSessionUser().getUserId()){
				ProfileServ profServ = this.servLocator.getProfileServ();
				
				this.setPageBean((ArrayList<Profile>) profServ.getProfByUser(this.getOther()));
				this.setProfList(this.pageBean.getProfList());
				
				return "success";
			}else{
				return "myProfile";
			}
		}catch(Exception e){
			return "error";
		}
	}
	
	public FansManage getFans() {
		return fans;
	}

	public void setFans(FansManage fans) {
		this.fans = fans;
	}

	public PageBean getFollowPageBean() {
		return followPageBean;
	}

	public PageBean getFansPageBean() {
		return fansPageBean;
	}

	public String FansList(){
		FansServ fansServ = this.servLocator.getFansServ();
		
		this.setPageBean(fansServ.getFansListByUser(this.getOther()));
		this.setFansList(this.pageBean.getFansList());
		
		return "success";
	}
	
	public String FollowList(){
		FansServ fansServ = this.servLocator.getFansServ();
		
		this.setPageBean(fansServ.getFollowListByUser(this.getOther()));
		this.setFollowList(this.pageBean.getFollowList());
		
		return "success";
	}
	
	public String InformationPage(){
		if( this.otherId != ImplUtil.getSessionUser().getUserId()){
			return "success";
		}else{
			return "myInfo";
		}
	}
	
	public String Follow(){
		if( this.otherId != ImplUtil.getSessionUser().getUserId()){
			FansServ fansServ = this.servLocator.getFansServ();
			
			this.setFollowPageBean(fansServ.getFollowListByUser(this.getOther()));
			this.setFollowList(this.followPageBean.getFollowList());
			return "success";
		}else{
			return "myFollow";
		}
	}
	
	public String Fans(){
		if( this.otherId != ImplUtil.getSessionUser().getUserId()){
			FansServ fansServ = this.servLocator.getFansServ();
			
			this.setFansPageBean(fansServ.getFansListByUser(this.getOther()));
			this.setFansList(this.fansPageBean.getFansList());
			return "success";
		}else{
			return "myFollow";
		}
	}
	
	//fans页面的加关注
	   public String addOthersFansId(){
		   FansServ fansserv=(FansServ) this.servLocator.getFansServ();
		   fansserv.saveFans(this.fans.getFansId());
		   return null;
	   }
	
}
