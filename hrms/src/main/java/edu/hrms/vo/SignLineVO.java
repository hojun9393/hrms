package edu.hrms.vo;

public class SignLineVO {
	
	private int signLineNo;
	private int userid;
	private String type;
	private int signOrder;
	
	
	public int getSignLineNo() {
		return signLineNo;
	}
	public void setSignLineNo(int signLineNo) {
		this.signLineNo = signLineNo;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getSignOrder() {
		return signOrder;
	}
	public void setSignOrder(int signOrder) {
		this.signOrder = signOrder;
	}
	
	@Override
	public String toString() {
		return "SignLineVO [signLineNo=" + signLineNo + ", userid=" + userid + ", type=" + type + ", signOrder="
				+ signOrder + "]";
	}
	
}
