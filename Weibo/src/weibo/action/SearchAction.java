package weibo.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import weibo.bean.PageBean;
import weibo.hibernate.Profile;
import weibo.hibernate.Userinfo;
import weibo.servive.PageServ;
import weibo.servive.ProfileServ;
import weibo.servive.UserServ;

public class SearchAction extends BaseAction{

	private int pageNumber;
	private PageBean pageBean;	
	
	private String nickName;
	private String profContent;
	private String name;
	private String content;
	
	private ArrayList<Profile> profList;
	private ArrayList<Userinfo> userList;
	private ArrayList<Userinfo> famousList;
	
	/** ****************************************************** **/
	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
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
		pg.setList(pageServ.getListByPageNum(pageNumber, pg.getPageSize(), arrayList));
		int tp =  pg.getTotalPosts()/pg.getPageSize() + ((pg.getTotalPosts()%pg.getPageSize())>0?1:0);
		pg.setTotalPages(tp); 
		this.pageBean = pg;
	}

	public ArrayList<Profile> getProfList() {
		return profList;
	}

	public void setProfList(ArrayList<Profile> profList) {
		this.profList = profList;
	}

	public ArrayList<Userinfo> getUserList() {
		return userList;
	}

	public void setUserList(ArrayList<Userinfo> userList) {
		this.userList = userList;
	}
	
	public String getName() {
		return this.nickName;
	}
	
	public String getNickName() throws UnsupportedEncodingException {
		return java.net.URLDecoder.decode(this.nickName,"utf-8");
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getContent() throws UnsupportedEncodingException {
		return this.profContent;
	}
	
	public String getProfContent() throws UnsupportedEncodingException {
		return java.net.URLDecoder.decode(this.profContent,"utf-8");
	}

	public void setProfContent(String profContent) {
		this.profContent = profContent;
	}

	public ArrayList<Userinfo> getFamousList() {
		return famousList;
	}

	public void setFamousList(ArrayList<Userinfo> famousList) {
		this.famousList = famousList;
	}
	
	public int getFamousCount(){
		return this.famousList.size();
	}

	/** ****************************************************** **/

	public String initSearch() throws Exception {
		UserServ userServ = this.servLocator.getUserServ();
		this.setFamousList(userServ.getFamousList());
		return "findFriends";
	}

	public String user() throws Exception {
		UserServ userServ = this.servLocator.getUserServ();
		this.setFamousList(userServ.getFamousList());
		this.setPageBean(userServ.getUserListByName(java.net.URLDecoder.decode(this.nickName,"utf-8")));
		this.setUserList(this.pageBean.getList());
		return "userSearch";
	}
	
	public String weibo() throws Exception {
		ProfileServ profServ = this.servLocator.getProfileServ();
		UserServ userServ = this.servLocator.getUserServ();
		this.setFamousList(userServ.getFamousList());
		this.setPageBean(profServ.getProfListByContent(java.net.URLDecoder.decode(this.profContent,"utf-8")));
		this.setProfList(this.pageBean.getList());
		return "weiboSearch";
	}
}
