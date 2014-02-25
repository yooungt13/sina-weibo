package weibo.action;

import weibo.serviceLocator.ServiceLocator;

import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport{
	protected ServiceLocator servLocator;
	
    public BaseAction(){
    	this.servLocator=new ServiceLocator();

    }
    
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return super.execute();
	}
}
