package edu.hrms.vo;

import java.util.List;

public class MsgVO {
	private int msgNo;
	private int userId;
	private String content;
	private String sendDate;
	private List<MsgReceiveVO> MsgReceiveVOList;
	
	public int getMsgNo() {
		return msgNo;
	}
	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSendDate() {
		return sendDate;
	}
	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	public List<MsgReceiveVO> getMsgReceiveVOList() {
		return MsgReceiveVOList;
	}
	public void setMsgReceiveVOList(List<MsgReceiveVO> msgReceiveVOList) {
		MsgReceiveVOList = msgReceiveVOList;
	}
	
}
