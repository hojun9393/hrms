package edu.hrms.vo;

public class OvertimeVO {

	private int overtimeNo;
	private String userid;
	private String date;
	private String start;
	private String end;
	private String state;
	private String content;
	private String total;
	
	
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public int getOvertimeNo() {
		return overtimeNo;
	}
	public void setOvertimeNo(int overtimeNo) {
		this.overtimeNo = overtimeNo;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
