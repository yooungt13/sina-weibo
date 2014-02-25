package weibo.serviceImpl;


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import com.opensymphony.xwork2.ActionContext;
import com.sun.java.swing.plaf.windows.resources.windows;

import weibo.hibernate.MsgNotice;
import weibo.hibernate.MsgNoticeDAO;
import weibo.hibernate.Profile;
import weibo.hibernate.Userinfo;
import weibo.hibernate.UserinfoDAO;
import weibo.servive.MsgServ;
import weibo.util.ImplUtil;

public class MsgServImpl implements MsgServ{
	
	public boolean sendMessage(MsgNotice msg, String msgToName) {
		Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");
		MsgNoticeDAO msgdao = (MsgNoticeDAO) ImplUtil.getBeanByName("MsgNoticeDAO");
		UserinfoDAO userdao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		
		Userinfo msgToPeople = (Userinfo) userdao.findByNickName(msgToName).get(0);
	
		msg.setMsgTo(msgToPeople.getUserId());
		msg.setMsgTime(new Timestamp(System.currentTimeMillis()));
		msg.setMsgType((short) 0);
		msg.setMsgFrom(user.getUserId());
		msg.setMsgRead(true);
		msgdao.save(msg);
		
		return true;
	}
	
	public ArrayList<MsgNotice> getMsgList() {
		MsgNoticeDAO msgdao = (MsgNoticeDAO) ImplUtil.getBeanByName("MsgNoticeDAO");
		Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");
		ArrayList<MsgNotice> results2=(ArrayList<MsgNotice>) msgdao.findByMsgFrom(user.getUserId());
		ArrayList<MsgNotice> results3=new ArrayList<MsgNotice>();
		for(int i=0;i<results2.size();i++){
			if(results2.get(i).getMsgType()==0){
				results3.add(results2.get(i));
			}
			if(results2.get(i).getMsgType()==1){
				results3.add(results2.get(i));
			}
		}
		java.util.Collections.reverse( results3 );
		
		return results3;
	}
	public ArrayList<MsgNotice> getFromMsgList() {
		MsgNoticeDAO msgdao = (MsgNoticeDAO) ImplUtil.getBeanByName("MsgNoticeDAO");
		Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");
		
		ArrayList<MsgNotice> results=(ArrayList<MsgNotice>) msgdao.findByMsgTo(user.getUserId());
		ArrayList<MsgNotice> results3=new ArrayList<MsgNotice>();
		for(int i=0;i<results.size();i++){
			if(results.get(i).getMsgType()==0){
				results3.add(results.get(i));
			}
			if(results.get(i).getMsgType()==2){
				results3.add(results.get(i));
			}
		}
		Collections.sort(results3,new Comparator<MsgNotice>()
				{
					public int compare(MsgNotice p1,MsgNotice p2){
						if(p1.equals(p2)){
							return 0 ;
						}else if(p1.getMsgId()<p2.getMsgId()){	
							return 1 ;
						}else{
							return -1 ;
						}
					}
				});
		
		return results3;
	}
	public boolean removeMessage(int msg_id){
		
		MsgNoticeDAO msgdao = (MsgNoticeDAO) ImplUtil.getBeanByName("MsgNoticeDAO");
		MsgNotice msg = msgdao.findById(msg_id);
		
		if( msg == null ){
			return false;
		}else{
			msgdao.delete(msg);
			if(msg.getMsgType()==0){
			msg.setMsgType((short)1);
			msgdao.save(msg);
			}
			if(msg.getMsgType()==2){
			msg.setMsgType((short)3);
			msgdao.save(msg);
			}
			return true;
		}	

	}
public boolean fremoveMessage(int msg_id){
		
		MsgNoticeDAO msgdao = (MsgNoticeDAO) ImplUtil.getBeanByName("MsgNoticeDAO");
		MsgNotice msg = msgdao.findById(msg_id);
		
		if( msg == null ){
			return false;
		}else{
			msgdao.delete(msg);
			if(msg.getMsgType()==0){
			msg.setMsgType((short)2);
			msgdao.save(msg);
			}
			if(msg.getMsgType()==1){
			msg.setMsgType((short)3);
			msgdao.save(msg);
			}
			return true;
		}	

	}
public boolean sremoveMessage(int msg_id){
	
	MsgNoticeDAO msgdao = (MsgNoticeDAO) ImplUtil.getBeanByName("MsgNoticeDAO");
	MsgNotice msg = msgdao.findById(msg_id);
	
	if( msg == null ){
		return false;
	}else{
		msgdao.delete(msg);
		msg.setMsgType((short)4);
		msgdao.save(msg);
		return true;
	}	

}
public ArrayList<MsgNotice> getSystemList(){
	MsgNoticeDAO msgdao = (MsgNoticeDAO) ImplUtil.getBeanByName("MsgNoticeDAO");
	Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");
	ArrayList<MsgNotice> results2=(ArrayList<MsgNotice>) msgdao.findByMsgTo(user.getUserId());
	ArrayList<MsgNotice> results3=new ArrayList<MsgNotice>();
	ArrayList<MsgNotice> results4=(ArrayList<MsgNotice>) msgdao.findByMsgTo(0);
	for(int i=0;i<results2.size();i++){
		if(results2.get(i).getMsgType()==5){
			results3.add(results2.get(i));
		}
	}
	for(int i=0;i<results4.size();i++){
	       if(results4.get(i).getMsgTime().after(user.getRegTime()))
	       {results3.add(results4.get(i));}
			
		}
	
	java.util.Collections.reverse(results3);
	
	return results3;
}
	public ArrayList<MsgNotice> getNoticeList(){
		MsgNoticeDAO msgdao = (MsgNoticeDAO) ImplUtil.getBeanByName("MsgNoticeDAO");
		ArrayList<MsgNotice> results2=(ArrayList<MsgNotice>) msgdao.findByMsgType((short) 5);

		java.util.Collections.reverse( results2 );
		
		return results2;
	}
	public boolean sendNotice(MsgNotice msg,String msgToName){
		MsgNoticeDAO msgdao = (MsgNoticeDAO) ImplUtil.getBeanByName("MsgNoticeDAO");
		UserinfoDAO userdao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		
		Userinfo msgToPeople = (Userinfo) userdao.findByNickName(msgToName).get(0);
	
		msg.setMsgTo(msgToPeople.getUserId());
		msg.setMsgTime(new Timestamp(System.currentTimeMillis()));
		msg.setMsgType((short) 5);
		msg.setMsgFrom(0);
		msg.setMsgRead(true);
		msgdao.save(msg);
		
		return true;
	}
	public boolean sendAllNotice(MsgNotice msg,String msgToName){
		MsgNoticeDAO msgdao = (MsgNoticeDAO) ImplUtil.getBeanByName("MsgNoticeDAO");
		if(msgToName.equals("所有人"))
		{msg.setMsgTo(0);
		}
		else{
		Userinfo user = (Userinfo) ActionContext.getContext().getSession().get("user");
		UserinfoDAO userdao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		
		Userinfo msgToPeople = (Userinfo) userdao.findByNickName(msgToName).get(0);
	
		msg.setMsgTo(msgToPeople.getUserId());}

		msg.setMsgTime(new Timestamp(System.currentTimeMillis()));
		msg.setMsgType((short) 5);
		msg.setMsgFrom(0);
		msg.setMsgRead(true);
		msgdao.save(msg);
		return true;
	}
}
