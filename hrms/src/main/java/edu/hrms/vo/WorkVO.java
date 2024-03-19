package edu.hrms.vo;

public class WorkVO {

	private int wNo;
	private String userid;
	private String date;
	private String start;
	private String end;
	
	
	WorkVO(){}
	public WorkVO(int wNo, String userid, String date, String start, String end) {
		super();
		this.wNo = wNo;
		this.userid = userid;
		this.date = date;
		this.start = start;
		this.end = end;
	}

	
	public int getwNo() {
		return wNo;
	}
	public void setwNo(int wNo) {
		this.wNo = wNo;
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
	
	
	
}
