/**
 * 
 */
package weibo.exception;

public class UserNameNotExistException extends UserException {
	private String username;
	public UserNameNotExistException(String newUsername) {
		super("Username " + newUsername + " does not exist");
		this.username = newUsername;
	}
	public String getUsername() {
		return this.username;
	}
}
