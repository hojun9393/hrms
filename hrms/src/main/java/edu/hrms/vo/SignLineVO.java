package edu.hrms.vo;

public class SignLineVO {
	private int userId;
	private String name;
	private String dept;
	private String position;
	private int signOrder;
	private String state;
	private int signLineNo;
	
	public SignLineVO() {}
	
	public SignLineVO(String name, String dept, String position, int signOrder, String state, int userId) {
		this.userId = userId;
		this.name = name;
		this.dept = dept;
		this.position = position;
		this.signOrder = signOrder;
		this.state = state;
	}
	
	
	public int getSignLineNo() {
		return signLineNo;
	}
	public void setSignLineNo(int signLineNo) {
		this.signLineNo = signLineNo;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
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
	public int getSignOrder() {
		return signOrder;
	}
	public void setSignOrder(int signOrder) {
		this.signOrder = signOrder;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}