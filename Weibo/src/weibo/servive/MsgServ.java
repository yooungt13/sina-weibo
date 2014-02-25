package weibo.servive;

import java.util.ArrayList;

import weibo.hibernate.MsgNotice;


public interface MsgServ {
	/**
	 * 此方法是
	 * @param user 用
	 * @return  如果在
	 */
	public boolean sendMessage(MsgNotice msg,String msgToName);
	public ArrayList<MsgNotice> getMsgList();
	public boolean removeMessage(int msg_id);
	public ArrayList<MsgNotice> getFromMsgList();
	public ArrayList<MsgNotice> getSystemList();
	public boolean fremoveMessage(int msg_id);
	public boolean sremoveMessage(int msg_id);
	public boolean sendNotice(MsgNotice msg,String msgToName);
	public ArrayList<MsgNotice> getNoticeList();
	public boolean sendAllNotice(MsgNotice msg,String msgToName);
}

