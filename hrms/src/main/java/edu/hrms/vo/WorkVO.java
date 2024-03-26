package edu.hrms.vo;

public class WorkVO {

	private int wNo;
	private String userid;
	private String date;
	private String start;
	private String end;
	private String overtime;
	private String total;
	private String name;
	private String state;
	private String position;
	private String dept;
	private String dayOfWeek;
	
	
	public String getDayOfWeek() {
		return dayOfWeek;
	}
	public void setDayOfWeek(String dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getOvertime() {
		return overtime;
	}
	public void setOvertime(String overtime) {
		this.overtime = overtime;
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
	
	
	@Override
	public String toString() {
		return "WorkVO [wNo=" + wNo + ", userid=" + userid + ", date=" + date + ", start=" + start + ", end=" + end
				+ ", overtime=" + overtime + ", total=" + total + ", name=" + name + ", state=" + state + ", position="
				+ position + ", dept=" + dept + ", dayOfWeek=" + dayOfWeek + "]";
	}
	
	
}
