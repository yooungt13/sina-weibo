package weibo.action;

import weibo.hibernate.Profile;
import weibo.servive.ProfileServ;

public class CollectAction extends BaseAction{
	
	private Profile profile;
	private int favorId;
	
	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}
	
	public int getFavorId() {
		return favorId;
	}

	public void setFavorId(int favorId) {
		this.favorId = favorId;
	}

	public String addCollection() {
		// TODO Auto-generated method stub
		ProfileServ proServ = this.servLocator.getProfileServ();
		proServ.addCollection(this.profile);
		
		return null;
	}
	
	public String deleteCollection() {
		// TODO Auto-generated method stub
		ProfileServ proServ = this.servLocator.getProfileServ();
		proServ.deleteCollection(this.favorId);
		
		return "myFavor";
	}		
}
