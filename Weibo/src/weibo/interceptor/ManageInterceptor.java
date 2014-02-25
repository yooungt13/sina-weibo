package weibo.interceptor;

import weibo.hibernate.Login;
import weibo.util.ImplUtil;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class ManageInterceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		
        Login log = ImplUtil.getSessionLogin();  
        if (log == null) {  
            return Action.LOGIN;  
        } else { 
        	if( ImplUtil.getUserRole() != 1 ){
        		return Action.LOGIN; 
        	}else{
        		return invocation.invoke();  
        	}
        }		
	}

}
