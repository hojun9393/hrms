package edu.hrms.vo;

public class OvertimeSignVO {

	private int overtimeSignNo;
	private int overtimeNo;
	private int signLineNo;
	private int state;
	
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
				+ signLineNo + ", state=" + state + "]";
	}
	
}
