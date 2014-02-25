package weibo.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import weibo.hibernate.Comment;
import weibo.hibernate.Userinfo;
import weibo.servive.CommentServ;
import weibo.servive.ProfileServ;

public class CommentAction extends BaseAction{
	private Comment com;
	private ArrayList<Comment> comList;
	private int comListSize;
	private String selectedList;
	private List isTransmit;
	private List isCommentToOriginal;
	
	public Comment getCom() {
		return com;
	}

	public void setCom(Comment com) {
		this.com = com;
	}
	
	public ArrayList<Comment> getComList() {
		return comList;
	}

	public void setComList(ArrayList<Comment> comList) {
		this.comList = comList;
	}

	public int getComListSize() {
		return this.comList.size();
	}

	public void setComListSize(int comListSize) {
		this.comListSize = comListSize;
	}

	public List getIsTransmit() {
		return isTransmit;
	}

	public void setIsTransmit(List isTransmit) {
		this.isTransmit = isTransmit;
	}

	public List getIsCommentToOriginal() {
		return isCommentToOriginal;
	}

	public void setIsCommentToOriginal(List isCommentToOriginal) {
		this.isCommentToOriginal = isCommentToOriginal;
	}

	public String getSelectedList() {
		return selectedList;
	}

	public void setSelectedList(String selectedList) {
		this.selectedList = selectedList;
	}

	@Override
	public String execute() throws Exception {
		try{
			CommentServ comServ = this.servLocator.getCommentServ();						
			this.setComList( comServ.getCommentByUser() );
		}catch(Exception e){
			return "error";
		}
		return "comments";
	}
	
	public String showComments() {
		// TODO Auto-generated method stub
		CommentServ comServ = this.servLocator.getCommentServ();
		comServ.getCommentByProfId(this.com.getProfile());
			
		return null;
	}
	
	public String makeComment() {
		// TODO Auto-generated method stub

		CommentServ comServ = this.servLocator.getCommentServ();
		try {
			this.com.setComContent(java.net.URLDecoder.decode(this.com.getComContent(),"utf-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		comServ.saveComment(this.com);
			
		return null;
	}
	
	public String replyComment() {
		// TODO Auto-generated method stub
		CommentServ comServ = this.servLocator.getCommentServ();
		comServ.getReplyComment(this.com.getComComId(),this.com.getComId());

		return null;
	}	

	public String deleteComment() {
		// TODO Auto-generated method stub
		CommentServ comServ = this.servLocator.getCommentServ();
		comServ.deleteComment(this.com.getComId());
		
		return null;
	}

	public String deleteSelected(){
		CommentServ comServ = this.servLocator.getCommentServ();
		comServ.deleteSelected(this.selectedList);
		
		return null;		
	}
	
	public String makeComReply() {
		// TODO Auto-generated method stub

		CommentServ comServ = this.servLocator.getCommentServ();

		this.com.setComContent(this.com.getComContent());
		comServ.saveComment(this.com);
			
		return "profileContent";
	}
}
