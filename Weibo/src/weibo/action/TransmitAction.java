package weibo.action;

import weibo.hibernate.Profile;
import weibo.hibernate.TransmitCollection;
import weibo.servive.ProfileServ;

public class TransmitAction extends BaseAction{
	private Profile profile;
	private int tcId;
	
	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public int getTcId() {
		return tcId;
	}

	public void setTcId(int tcId) {
		this.tcId = tcId;
	}

	public String addTransmit() throws Exception {		
		ProfileServ proServ = this.servLocator.getProfileServ();
		proServ.addTransmit(this.profile);
		
		return "homePage";
	}
	
	public String initTransmit(){		
		ProfileServ proServ = this.servLocator.getProfileServ();
		proServ.initTransmit(this.tcId);
		
		return null;
	}
	
}
