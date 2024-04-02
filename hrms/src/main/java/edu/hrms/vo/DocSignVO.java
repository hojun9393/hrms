package edu.hrms.vo;

public class DocSignVO {

	private int docSignNo;
	private int docNo;
	private int signLineNo;
	private int state;
	
	
	public int getDocSignNo() {
		return docSignNo;
	}
	public void setDocSignNo(int docSignNo) {
		this.docSignNo = docSignNo;
	}
	public int getDocNo() {
		return docNo;
	}
	public void setDocNo(int docNo) {
		this.docNo = docNo;
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
		return "DocSignVO [docSignNo=" + docSignNo + ", docNo=" + docNo + ", signLineNo=" + signLineNo + ", state="
				+ state + "]";
	}
	
	
	
}
