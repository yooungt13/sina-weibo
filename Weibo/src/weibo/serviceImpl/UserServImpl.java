package weibo.serviceImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

import weibo.exception.UserException;
import weibo.hibernate.FansManage;
import weibo.hibernate.FansManageDAO;
import weibo.hibernate.Login;
import weibo.hibernate.LoginDAO;
import weibo.hibernate.Userinfo;
import weibo.hibernate.UserinfoDAO;
import weibo.servive.UserServ;
import weibo.util.ImplUtil;

public class UserServImpl implements UserServ{	
	
	public Login validLogin(String username, String password)
			throws UserException {
		// TODO Auto-generated method stub
		LoginDAO loginDao = (LoginDAO) ImplUtil.getBeanByName("LoginDAO");	
		Map<String,Object> session = ActionContext.getContext().getSession();
		Login login = loginDao.findById(username);
		
		if(login!=null){
			if(!login.getPassword().equals(password)){
				login = null;
				session.put("error", "密码错误");	
			}else{
				if( login.getLoginType() == 0){
					Userinfo user = getUserByLogin(login);
					session.put("user", user);	
					session.put("role", login.getLoginType());
					
					session.remove("error");
				}else if( login.getLoginType() == 1){
					session.put("login", login);
					session.put("role", login.getLoginType());
				}else{
					login = null;
					session.put("error", "账号已被冻结");	
				}
			}		
		}
		else{
			session.put("error", "用户不存在");				
		}
		return login;
	}

	public Userinfo getUserByLogin(Login login) {
		// TODO Auto-generated method stub
		UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		Userinfo user = (Userinfo) userDao.findByProperty("login",login).get(0);
		user.setLogin(login);
		return user;
	}

	public boolean register(Userinfo user,Login login) {
		// TODO Auto-generated method stub
				
		try{
			//调用工具包
			LoginDAO logindao = (LoginDAO) ImplUtil.getBeanByName("LoginDAO");
			UserinfoDAO userdao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
			
			if ( logindao.findById( login.getLoginName() ) == null ){
				login.setLoginType((long) 0);
				user.setLogin(login);
				user.setRegTime(new Timestamp(System.currentTimeMillis()));
				
				if( user.getSex().equals("1")){
					user.setMyFace("/Weibo/Images/Faces/boy.gif");
				}else{
					user.setMyFace("/Weibo/Images/Faces/girl.gif");
				}
				logindao.save(login);
				userdao.save(user);	
						
				// 发布一条新通知
				ImplUtil.welcomeNotice(user);
				
			}
			else{
				return false;
			}
			
		}catch(Exception e){
			return false;
		}		
		return true;
	}

	public boolean updateUser(Userinfo userinfo) {
		// TODO Auto-generated method stub
		try{
			UserinfoDAO userinfodao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
			Map<String,Object> session = ActionContext.getContext().getSession();
			Userinfo tmp = (Userinfo) session.get("user");
			Userinfo user = userinfodao.findById(tmp.getUserId());			
			
			user.setUserId(tmp.getUserId());
			user.setNickName(userinfo.getNickName());
			user.setTrueName(userinfo.getTrueName());
			user.setProvince(userinfo.getProvince());
			user.setCity(userinfo.getCity());
			user.setSex(userinfo.getSex());
			
			// 性别修改，默认头像也要修改
			if(userinfo.getSex().equals("1")){
				if( user.getMyFace().equals("/Weibo/Images/Faces/girl.gif") )
					user.setMyFace("/Weibo/Images/Faces/boy.gif");
			}else{
				if( user.getMyFace().equals("/Weibo/Images/Faces/boy.gif") )
					user.setMyFace("/Weibo/Images/Faces/girl.gif");
			}
			
			user.setBirthday(userinfo.getBirthday());
			user.setEmail(userinfo.getEmail());
			user.setQq(userinfo.getQq());
			user.setMsn(userinfo.getMsn());
			user.setIntroduce(userinfo.getIntroduce());
			user.setIdentifier(userinfo.getIdentifier());
			
			userinfodao.merge(user);
			session.put("user", user);
			
		}catch(Exception e){
			return false;
		}
		return true;
	}

	public boolean deleteUserByuserName(String username) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean saveLogin(Login login) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean updatePassword(Login login) {
		// TODO Auto-generated method stub
		try{
			//调用工具包
			LoginDAO logindao = (LoginDAO) ImplUtil.getBeanByName("LoginDAO");
			UserinfoDAO userdao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
			Map<String,Object> session = ActionContext.getContext().getSession();
			Userinfo tmp = (Userinfo) session.get("user");
			Login lg = logindao.findById(tmp.getLogin().getLoginName());
			lg.setPassword(login.getPassword());
			
			logindao.merge(lg);		
			
		}catch(Exception e){
			return false;
		}		
		return true;
	}

	public List<Userinfo> searchPeople(String userNum, String category) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Userinfo> searchPeopleByPage(int firstResult, int pageSize,

			List<Userinfo> arrayList) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public Userinfo getUserById(int userId) {
		// TODO Auto-generated method stub
		UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		return (Userinfo) userDao.findById(userId);		
	}
	
	public boolean compare(String oldpassword) {
		// TODO Auto-generated method stub
		LoginDAO logindao = (LoginDAO) ImplUtil.getBeanByName("LoginDAO");
//		UserinfoDAO userinfodao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		Map<String,Object> session = ActionContext.getContext().getSession();
		Userinfo tmp = (Userinfo) session.get("user");
		Login login = (Login) logindao.findById(tmp.getLogin().getLoginName());
		if (login.getPassword().equals(oldpassword)) {
			return true;
		}  
		else{
			return false;
		}	
	}
	
	public boolean saveEducationinfo(Userinfo user){
		
		try{
			//调用工具包
			UserinfoDAO userdao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
			Map<String,Object> session = ActionContext.getContext().getSession();
			Userinfo tmp = (Userinfo) session.get("user");
			Userinfo userinfo = userdao.findById(tmp.getUserId());
			userinfo.setSchoolType(user.getSchoolType());
			userinfo.setSchoolName(user.getSchoolName());
			userinfo.setSchoolTime(user.getSchoolTime());
			userinfo.setCollege(user.getCollege());
			
			userdao.merge(userinfo);
			userdao.findById(tmp.getUserId());
			session.put("user", userinfo);		
			
		}catch(Exception e){
			return false;
		}		
		return true;
		
	}
	
	public boolean saveWorkinfo(Userinfo user){		
		try{
			//调用工具包
			UserinfoDAO userdao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
			Map<String,Object> session = ActionContext.getContext().getSession();
			Userinfo tmp = (Userinfo) session.get("user");
			Userinfo userinfo = userdao.findById(tmp.getUserId());
			userinfo.setWorkProv(user.getWorkProv());
			userinfo.setWorkCity(user.getWorkCity());
			userinfo.setWorkplace(user.getWorkplace());
			userinfo.setWorkTimeFrom(user.getWorkTimeFrom());
			userinfo.setWorkTimeTo(user.getWorkTimeTo());
			userinfo.setDepartment(user.getDepartment());
			
			userdao.merge(userinfo);
			userdao.findById(tmp.getUserId());
			session.put("user", userinfo);	
			
		}catch(Exception e){
			return false;
		}		
		return true;
		
	}
	
	public boolean Tag(Userinfo user){
		
		try{
			//调用工具包
			UserinfoDAO userdao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
			Map<String,Object> session = ActionContext.getContext().getSession();
			Userinfo tmp = (Userinfo) session.get("user");
			Userinfo userinfo = userdao.findById(tmp.getUserId());
			userinfo.setTag(user.getTag());
			
			userdao.merge(userinfo);
			userdao.findById(tmp.getUserId());
			session.put("user", userinfo);		
			
		}catch(Exception e){
			return false;
		}		
		return true;
		}

	public void validateInfo(Login login) {
		// TODO Auto-generated method stub
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
				
			LoginDAO logindao = (LoginDAO) ImplUtil.getBeanByName("LoginDAO");
			
			
			if ( logindao.findById( login.getLoginName() ) == null ){
				out.write("true"); 
			}
			else{
				out.write("false");
			}
	        out.close();
	        
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public void validateNickName(Userinfo userinfo) {
		// TODO Auto-generated method stub

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
			
	
			UserinfoDAO userdao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
			
			String name = userinfo.getNickName();
			int length = userdao.findByNickName(name).size();
			if ( length == 0 ){
				out.write("true"); 
			}
			else{
				out.write("false");
			}
	        out.close();
	        
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
	}

	public ArrayList<Userinfo> getFamousList() {
		UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		FansManageDAO fmDao = (FansManageDAO) ImplUtil.getBeanByName("FansManageDAO");
		ArrayList<Userinfo> fmsList = (ArrayList<Userinfo>) userDao.findAll();
		
		Collections.sort(fmsList,new Comparator<Userinfo>(){
			public int compare(Userinfo p1,Userinfo p2){
				int s1 = p1.getFansCount();
				int s2 = p2.getFansCount();
				if(s1 == s2){
					return 0 ;
				}else if(s1<s2){	
					return 1 ;
				}else{
					return -1 ;
				}
			}
		}); 
		
		ArrayList<Userinfo> results = new ArrayList<Userinfo>();
		
		Userinfo user = ImplUtil.getSessionUser();
		int userId = user.getUserId();
		ArrayList<FansManage> followList = (ArrayList<FansManage>) fmDao.findByFansId(userId);
		
		boolean isFollow = false;
		//int size = (fmsList.size() < 5) ? fmsList.size():5; 
		
		for( int i =0; i < fmsList.size();i++){
			int fmId = fmsList.get(i).getUserId();
			if( fmId != userId){
				for( int j = 0; j < followList.size(); j++ ){
					if( fmId == followList.get(j).getFollowId()){
						isFollow = true;
						break;
					}
					if( j+1 == followList.size())
						isFollow = false;
				}
				if( !isFollow )
					results.add(fmsList.get(i));
			}
			if( results.size() == 5 )
				break;
		}
		return results;
	}
	
	public ArrayList<Userinfo> getFamousList(int count) {
		UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		FansManageDAO fmDao = (FansManageDAO) ImplUtil.getBeanByName("FansManageDAO");
		ArrayList<Userinfo> fmsList = (ArrayList<Userinfo>) userDao.findAll();
		
		Collections.sort(fmsList,new Comparator<Userinfo>(){
			public int compare(Userinfo p1,Userinfo p2){
				int s1 = p1.getFansCount();
				int s2 = p2.getFansCount();
				if(s1 == s2){
					return 0 ;
				}else if(s1<s2){	
					return 1 ;
				}else{
					return -1 ;
				}
			}
		}); 
		
		ArrayList<Userinfo> results = new ArrayList<Userinfo>();

		for( int i =0; i < count; i++){
			results.add(fmsList.get(i));
		}
		return results;
	}

	public ArrayList<Userinfo> getNewconList() {
		UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		ArrayList<Userinfo> newcomList = (ArrayList<Userinfo>) userDao.findAll();
		
		ArrayList<Userinfo> results = new ArrayList<Userinfo>();
		for(int i = 1; i <= 6; i++ ){
			results.add(newcomList.get(newcomList.size()-i));
		}
		return results;
	}
	
	public boolean powerSetting(Userinfo user) {
		// TODO Auto-generated method stub
		try{
			//调用工具包
			UserinfoDAO userdao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
			Map<String,Object> session = ActionContext.getContext().getSession();
			Userinfo tmp = (Userinfo) session.get("user");
			Userinfo userinfo = userdao.findById(tmp.getUserId());
			userinfo.setSearchPower(user.getSearchPower());
			userinfo.setComPower(user.getComPower());
			userinfo.setMsgPower(user.getMsgPower());
				
			userdao.merge(userinfo);
			userdao.findById(tmp.getUserId());
			session.put("user", userinfo);
			
		}catch(Exception e){
			return false;
		}		
		return true;
	}

	public ArrayList<Userinfo> getUserListByName(String nickName) {
		UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		ArrayList<Userinfo> results = (ArrayList<Userinfo>) userDao.fuzzySearchByNickName(nickName);
		java.util.Collections.reverse(results);
		return results;
		//return (ArrayList<Userinfo>) userDao.findByNickName(nickName);
	}

	public void freezeUser(int userId) {
		LoginDAO logDao = (LoginDAO) ImplUtil.getBeanByName("LoginDAO");
		String loginName = getUserById(userId).getLogin().getLoginName();
		Login log = logDao.findById(loginName);
		log.setLoginType((long) -1);
		logDao.merge(log);		
	}
	
	public void recoverUser(int userId) {
		LoginDAO logDao = (LoginDAO) ImplUtil.getBeanByName("LoginDAO");
		String loginName = getUserById(userId).getLogin().getLoginName();
		Login log = logDao.findById(loginName);
		log.setLoginType((long) 0);
		logDao.merge(log);	
	}

	public boolean updatePwd(Login log, String identifier) {
		UserinfoDAO userDao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
		List<Userinfo> tmp = userDao.findByProperty("login", log);
		Map<String,Object> session = ActionContext.getContext().getSession();
		
		if( tmp.size() == 0 ){
			session.put("pwderror", "登录名错误");
			return false;
		}else{
			Userinfo user = tmp.get(0);
			if( !user.getIdentifier().equals(identifier) ){
				session.put("pwderror", "身份证错误");
				return false;
			}else{
				session.put("updatepwd", log);
				return true;
			}
		}
	}


	public boolean confirmUpdatePwd(Login log) {
		LoginDAO logDao = (LoginDAO) ImplUtil.getBeanByName("LoginDAO");
		Login login = logDao.findById(log.getLoginName());
		if( login == null ){
			return false;
		}else{
			login.setPassword(log.getPassword());
			logDao.merge(login);
			return true;
		}
	}
	
	public void validateOldPassword(String oldpassword) {
		// TODO Auto-generated method stub
		
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
			UserinfoDAO userdao = (UserinfoDAO) ImplUtil.getBeanByName("UserinfoDAO");
			LoginDAO logindao = (LoginDAO) ImplUtil.getBeanByName("LoginDAO");
			Map<String,Object> session = ActionContext.getContext().getSession();
			Userinfo tmp = (Userinfo) session.get("user");
			Login lg = logindao.findById(tmp.getLogin().getLoginName());
			
			String a = oldpassword;
			
			if ( a.equals(lg.getPassword()) ){
				out.write("false"); 
			}
			else{
				out.write("true");
			}
	        out.close();
	        
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
	}

	
}
