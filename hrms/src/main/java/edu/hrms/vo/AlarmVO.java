package edu.hrms.vo;

public class AlarmVO {
	private int alarmNo;
	private int userid;
	private String state;
	private String rdate;
	private String contentType;
	private String contentNo;
	private String signType;
	
	public int getAlarmNo() {
		return alarmNo;
	}
	public void setAlarmNo(int alarmNo) {
		this.alarmNo = alarmNo;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public String getContentNo() {
		return contentNo;
	}
	public void setContentNo(String contentNo) {
		this.contentNo = contentNo;
	}
	public String getSignType() {
		return signType;
	}
	public void setSignType(String signType) {
		this.signType = signType;
	}
}
