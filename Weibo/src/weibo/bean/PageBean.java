package weibo.bean;

import java.util.ArrayList;

import weibo.hibernate.FansManage;
import weibo.hibernate.MsgNotice;
import weibo.hibernate.Profile;

public class PageBean {
	private int pageSize; 		//	分页大小   
	private int pageNumer;		// 	当前页面
	private int totalPosts; 	//	总文章数   
	private int totalPages; 	//	计算得出的总页数   
	private ArrayList<Profile> profList;
	private ArrayList<FansManage> fansList;
	private ArrayList<FansManage> followList;
	private ArrayList<MsgNotice> msgList;
	private ArrayList<MsgNotice> frommsgList;
	private ArrayList<MsgNotice> systemList;
	private ArrayList<MsgNotice> noticeList;
	public ArrayList<MsgNotice> getNoticeList() {
		return noticeList;
	}

	public void setNoticeList(ArrayList<MsgNotice> noticeList) {
		this.noticeList = noticeList;
	}

	public ArrayList<MsgNotice> getSystemList() {
		return systemList;
	}

	public void setSystemList(ArrayList<MsgNotice> systemList) {
		this.systemList = systemList;
	}
	public ArrayList<MsgNotice> getFrommsgList() {
		return frommsgList;
	}

	public void setFrommsgList(ArrayList<MsgNotice> frommsgList) {
		this.frommsgList = frommsgList;
	}

	public ArrayList<MsgNotice> getMsgList() {
		return msgList;
	}

	public void setMsgList(ArrayList<MsgNotice> msgList) {
		this.msgList = msgList;
	}
	
	private ArrayList list;
	private String subTime;
	
	public int getPageSize() {
		return 5;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPosts() {
		return totalPosts;
	}

	public void setTotalPosts(int totalPosts) {
		this.totalPosts = totalPosts;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	
	public int getPageNumer() {
//		if( this.pageNumer == 0){
//			return 1;
//		}else{
//			return this.pageNumer;
//		}
		return this.pageNumer;
	}

	public void setPageNumer(int pageNumer) {
		this.pageNumer = pageNumer;
	}

	public ArrayList<Profile> getProfList() {
		return profList;
	}

	public void setProfList(ArrayList<Profile> profList) {
		this.profList = profList;
	}

	public String getSubTime() {
		return subTime;
	}

	public void setSubTime(String subTime) {
		this.subTime = subTime;
	}

	public ArrayList getList() {
		return list;
	}

	public void setList(ArrayList list) {
		this.list = list;
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
	
}
