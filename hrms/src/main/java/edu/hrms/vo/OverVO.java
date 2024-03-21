package edu.hrms.vo;

public class OverVO {
	private int overTimeNo;
	private int userId;
	private String date;
	private String start;
	private String end;
	private String state;
	
	private String name;
	private String dept;
	private String position;
	
	public OverVO() {}

	public OverVO(int overTimeNo, int userId, String date, String start, String end, String state, String name,
			String dept, String position) {
		this.overTimeNo = overTimeNo;
		this.userId = userId;
		this.date = date;
		this.start = start;
		this.end = end;
		this.state = state;
		this.name = name;
		this.dept = dept;
		this.position = position;
	}

	public int getOverTimeNo() {
		return overTimeNo;
	}

	public void setOverTimeNo(int overTimeNo) {
		this.overTimeNo = overTimeNo;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
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
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}
}
