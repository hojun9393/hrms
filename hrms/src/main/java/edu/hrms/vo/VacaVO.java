package edu.hrms.vo;

import java.util.List;

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
	private int duration;
	private String useTime; 
	
	private String name;
	private String dept;
	private String position;
	
	private String mySignState;
	private int mySignOrder;
	private int stateCount;
	private String mySignLineNo;
	
	private List<SignLineVO> signLineVO;
	
	
	public String getUseTime() {
		return useTime;
	}
	public void setUseTime(String useTime) {
		this.useTime = useTime;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
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
	public String getMySignState() {
		return mySignState;
	}
	public void setMySignState(String mySignState) {
		this.mySignState = mySignState;
	}
	public int getMySignOrder() {
		return mySignOrder;
	}
	public void setMySignOrder(int mySignOrder) {
		this.mySignOrder = mySignOrder;
	}
	public int getStateCount() {
		return stateCount;
	}
	public void setStateCount(int stateCount) {
		this.stateCount = stateCount;
	}
	public String getMySignLineNo() {
		return mySignLineNo;
	}
	public void setMySignLineNo(String mySignLineNo) {
		this.mySignLineNo = mySignLineNo;
	}
	
	public List<SignLineVO> getSignLineVO() {
		return signLineVO;
	}
	public void setSignLineVO(List<SignLineVO> signLineVO) {
		this.signLineVO = signLineVO;
	}

}