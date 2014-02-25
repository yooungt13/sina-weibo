package weibo.hibernate;

import java.sql.Timestamp;

/**
 * MsgNotice entity. @author MyEclipse Persistence Tools
 */
public class MsgNotice extends AbstractMsgNotice implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public MsgNotice() {
	}

	/** full constructor */
	public MsgNotice(Timestamp msgTime, Integer msgFrom, Integer msgTo,
			String msgContent, Short msgType, Boolean msgRead) {
		super(msgTime, msgFrom, msgTo, msgContent, msgType, msgRead);
	}

}
