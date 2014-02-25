/**
 * 
 */
package weibo.exception;

public class MsgReallyExistException extends UserException {
	private String msg;
	public MsgReallyExistException(String msg) {
		super("this message has been in the Database");
		this.msg = msg;
	}
	public String getUsername() {
		return this.msg;
	}
	public MsgReallyExistException(){}
}
