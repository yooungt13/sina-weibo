package weibo.action;

import weibo.hibernate.Userinfo;
import weibo.hibernate.UserinfoDAO;
import weibo.util.ImplUtil;

import java.util.Map;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;


public class UploadAction extends BaseAction{
	private File file;
	private String fileFileName;
	private String fileContentType;
	private int profId;
	
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
	
	public int getProfId() {
		return profId;
	}

	public void setProfId(int profId) {
		this.profId = profId;
	}

	public String upload() throws Exception{
		try{
		//创建输入流
		InputStream is = new FileInputStream(file); 
		//创建父目录
		String root = ServletActionContext.getRequest().getRealPath("/Images/Faces");
		
		UserinfoDAO userinfodao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		Map<String,Object> session = ActionContext.getContext().getSession();
		Userinfo user = (Userinfo) session.get("user");
		
		//创建输出流的目的目录
		String[] str = this.fileFileName.split("\\.");
		this.setFileFileName(user.getUserId()+"."+str[1]);
		File destFile = new File(root,this.fileFileName);
			
		//创建输出流
		OutputStream os = new FileOutputStream(destFile);
		user.setMyFace("/Weibo/Images/Faces/"+this.fileFileName);
		
		session.remove("user");
		session.put("user", user);
		userinfodao.merge(user);	
		
		byte[] buffer = new byte[400];
		int length = 0;
		while ((length = is.read(buffer)) > 0){
			os.write(buffer, 0, length);
		}
			is.close();
			os.close();
		}catch(Exception e){
			return "false";
		}
		
		return "success";
	}
	
}
