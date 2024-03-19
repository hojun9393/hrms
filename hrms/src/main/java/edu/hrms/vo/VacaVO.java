package edu.hrms.vo;

public class VacaVO {
	private int vacaNo;
	private int userId;
	private String rdate;
	private String reason;
	private String state;
	private String startTime;
	private String endTime;
	private String startDate;
	private String endDate;
	
	private String name;
	private String dept;
	private String position;
	
	public VacaVO() {}

	public VacaVO(int vacaNo, int userId, String rdate, String reason, String state, String startTime, String endTime,
			String startDate, String endDate, String name, String dept, String position) {
		this.vacaNo = vacaNo;
		this.userId = userId;
		this.rdate = rdate;
		this.reason = reason;
		this.state = state;
		this.startTime = startTime;
		this.endTime = endTime;
		this.startDate = startDate;
		this.endDate = endDate;
		this.name = name;
		this.dept = dept;
		this.position = position;
	}

	public int getVacaNo() {
		return vacaNo;
	}
	public void setVacaNo(int vacaNo) {
		this.vacaNo = vacaNo;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
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
