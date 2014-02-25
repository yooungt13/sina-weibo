package weibo.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import weibo.hibernate.MsgNotice;
import weibo.hibernate.MsgNoticeDAO;
import weibo.hibernate.Profile;
import weibo.hibernate.Userinfo;
import weibo.hibernate.UserinfoDAO;
import weibo.servive.MsgServ;
import weibo.servive.UserServ;
import weibo.util.ImplUtil;

public class MessageAction extends BaseAction{
	private Userinfo user;
	private  MsgNotice message;
	private String msgToName;
	private int msg_id;
	private ArrayList<MsgNotice> msgList;
	private ArrayList<MsgNotice> frommsgList;
	private ArrayList<MsgNotice> systemList;
	
	public ArrayList<MsgNotice> getSystemList() {
		return systemList;
	}



	public void setSystemList(ArrayList<MsgNotice> systemList) {
		this.systemList = systemList;
	}



	public int getMsg_id() {
		return msg_id;
	}



	public void setMsg_id(int msg_id) {
		this.msg_id = msg_id;
	}



	public ArrayList<MsgNotice> getMsgList() {
		return msgList;
	}



	public void setMsgList(ArrayList<MsgNotice> msgList) {
		this.msgList = msgList;
	}



	public ArrayList<MsgNotice> getFrommsgList() {
		return frommsgList;
	}



	public void setFrommsgList(ArrayList<MsgNotice> frommsgList) {
		this.frommsgList = frommsgList;
	}



	public MsgNotice getMessage() {
		return message;
	}



	public void setMessage(MsgNotice message) {
		this.message = message;
	}

	public String getMsgToName() {
		return msgToName;
	}



	public void setMsgToName(String msgToName) {
		this.msgToName = msgToName;
	}



	public String execute() throws Exception{
		
		MsgServ msgServ = this.servLocator.getMsgServ();
		
	
		msgServ.sendMessage(message,this.msgToName);
		return "message";
	}


	public String msglist(){
		
		MsgServ msgServ = this.servLocator.getMsgServ();
		this.setMsgList(msgServ.getMsgList());
		return "messages";
	}
	public String fmsgRemove(){
		MsgServ msgServ = this.servLocator.getMsgServ();
		msgServ.removeMessage(msg_id);
	    return "fmsgremoves";
	}
	public String msgRemove(){
		MsgServ msgServ = this.servLocator.getMsgServ();
		msgServ.fremoveMessage(msg_id);
	    return "msgremoves";
	}
	public String smsgRemove(){
		MsgServ msgServ = this.servLocator.getMsgServ();
		msgServ.sremoveMessage(msg_id);
	    return "smsgremoves";
	}
	public String frommsglist(){
		MsgServ msgServ = this.servLocator.getMsgServ();
		this.setFrommsgList(msgServ.getFromMsgList());
		return "frommessage";
	}
	public String validatemsgtoName(){
		
		try {
			// 创建response
			HttpServletResponse response; 
	        response=ServletActionContext.getResponse(); 
	        response.setContentType( "text/json;charset=utf-8"); 
	        response.setHeader( "Cache-Control", "no-cache"); 
	        response.setHeader( "Pargma", "no-cache"); 
	        PrintWriter out;
	        
	        // 创建响应输出，通过out将返回值写入response
			out = response.getWriter();
	        
	        //JSONObject js = new JSONObject();
			UserServ userServ = this.servLocator.getUserServ();
			
			UserinfoDAO userdao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
			String name = "";
			try {
				name=java.net.URLDecoder.decode(this.msgToName,"utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
		

			e.printStackTrace();
			}
//			System.out.println(ImplUtil.getSessionLogin());
//			System.out.println(ImplUtil.getSessionLogin() != null);
//			System.out.println(name.equals("所有人"));
//			
            if(ImplUtil.getSessionLogin() != null && name.equals("所有人"))
            {
            	out.write("false");
            	}
            else{
			int length = userdao.findByNickName(name).size();

				if ( length == 0 ){
					out.write("true"); 
				}
				else{
					out.write("false");
				}
            }
	        out.close();
	        
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		return null;
	}
	public String noticelist(){
		MsgServ msgServ = this.servLocator.getMsgServ();
		this.setSystemList(msgServ.getSystemList());
	    return "noticelist";
	}
public String nvalidatemsgtoName(){
		try {
			// 创建response
			HttpServletResponse response; 
	        response=ServletActionContext.getResponse();
	        response.setContentType( "text/json;charset=utf-8"); 
	        response.setHeader( "Cache-Control", "no-cache"); 
	        response.setHeader( "Pargma", "no-cache"); 
	        PrintWriter out;
	        
	        // 创建响应输出，通过out将返回值写入response
			out = response.getWriter();
	        
	        //JSONObject js = new JSONObject();
			UserServ userServ = this.servLocator.getUserServ();
			
			UserinfoDAO userdao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
			String name = "";
			try {
				name=java.net.URLDecoder.decode(this.msgToName,"utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
		

			e.printStackTrace();
			}
//			System.out.println(ImplUtil.getSessionLogin());
//			System.out.println(ImplUtil.getSessionLogin() != null);
//			System.out.println(name.equals("所有人"));
//			
            if(ImplUtil.getSessionLogin() != null && name.equals("所有人"))
            {
            	out.write("false");
            	}
            else{
			int length = userdao.findByNickName(name).size();

				if ( length == 0 ){
					out.write("true"); 
				}
				else{
					out.write("false");
				}
            }
	        out.close();
	        
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		return null;
	}
}
