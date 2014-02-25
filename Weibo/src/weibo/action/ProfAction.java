package weibo.action;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.opensymphony.xwork2.ActionContext;

import weibo.hibernate.Profile;
import weibo.hibernate.ProfileDAO;
import weibo.hibernate.Userinfo;
import weibo.servive.ProfileServ;
import weibo.util.ImplUtil;

public class ProfAction extends BaseAction{
	
	private int profId;
	private Profile prof;
	private ArrayList<Profile> profList;
	
	private File file;
	private String fileFileName;
	private String fileContentType;
	
	/** *********************************************/
	public Profile getProf() {
		return prof;
	}

	public void setProf(Profile prof) {
		this.prof = prof;
	}

	public ArrayList<Profile> getProfList() {
		return profList;
	}

	public void setProfList(ArrayList<Profile> profList) {
		this.profList = profList;
	}

	public int getProfId() {
		return profId;
	}

	public void setProfId(int profId) {
		this.profId = profId;
	}
	
	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	/** *********************************************/
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		ProfileServ profServ = this.servLocator.getProfileServ();
		//this.prof.setImageRef(profServ.getImageUrl(this.file, this.fileFileName));
		profServ.saveProf(this.prof,this.file,this.fileFileName);
		
		return "homePage";
	}
	
	public String deleteProf() {
		// TODO Auto-generated method stub
		ProfileServ profServ = this.servLocator.getProfileServ();
		profServ.deleteProf(this.profId);
		
		return "myProfile";
	}
	
	public String showProfile(){
		ProfileDAO profDao = (ProfileDAO) ImplUtil.getBeanByName("ProfileDAO");
		this.setProf(profDao.findById(this.profId));
		return "showProfile";
	}
	
	
}
