package weibo.interceptor;

import weibo.hibernate.Userinfo;
import weibo.util.ImplUtil;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		
        Userinfo user = ImplUtil.getSessionUser();  
        if (user == null) {  
            return Action.LOGIN;  
        } else {  
            return invocation.invoke();   
        }
	}

}
