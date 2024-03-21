package edu.hrms.vo;

public class OvertimeSignVO {

	private int overtimeSignNo;
	private int overtimeNo;
	private int signLineNo;
	private int state;
	private String name;
	private String dept;
	private String position;
	private int signOrder;
	
	
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
	public int getOvertimeSignNo() {
		return overtimeSignNo;
	}
	public void setOvertimeSignNo(int overtimeSignNo) {
		this.overtimeSignNo = overtimeSignNo;
	}
	public int getOvertimeNo() {
		return overtimeNo;
	}
	public void setOvertimeNo(int overtimeNo) {
		this.overtimeNo = overtimeNo;
	}
	public int getSignLineNo() {
		return signLineNo;
	}
	public void setSignLineNo(int signLineNo) {
		this.signLineNo = signLineNo;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	
	@Override
	public String toString() {
		return "OvertimeSignVO [overtimeSignNo=" + overtimeSignNo + ", overtimeNo=" + overtimeNo + ", signLineNo="
				+ signLineNo + ", state=" + state + ", name=" + name + ", dept=" + dept + ", position=" + position
				+ ", signOrder=" + signOrder + "]";
	}
	
}
