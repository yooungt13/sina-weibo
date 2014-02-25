package weibo.interceptor;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import weibo.hibernate.Userinfo;
import weibo.util.ImplUtil;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

public class LoginFilter implements Filter{
	
	FilterConfig config; 
	public void destroy() {
		this.config = null;
	}	 
	public void init(FilterConfig config)throws ServletException{  
		this.config = config;  
	}  
	 
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		ActionContext ctx = ActionContext.getContext();  
        Map session = ctx.getSession(); 
        Userinfo user = (Userinfo) session.get("user");  
        if (user == null) {  
        	HttpServletResponse res = (HttpServletResponse) response;  
        	HttpServletRequest req = (HttpServletRequest) request;  
        	res.sendRedirect(req.getContextPath()+"/login.jsp");  
        } else {  
        	chain.doFilter(request, response);   
        }       		  		 		
	}     
}

	