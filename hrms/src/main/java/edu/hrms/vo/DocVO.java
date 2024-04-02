package edu.hrms.vo;

import java.util.List;

public class DocVO {
	private int docNo;
	private int userId;
	private String title;
	private String content;
	private String state;
	private String date;
	private int rownum;
	
	private String name;
	private String dept;
	private String position;
	
	private String mySignState;
	private int mySignOrder;
	private int stateCount;
	private String mySignLineNo;
	
	private List<SignLineVO> signLineVO;

	
	public DocVO() {}
	
	public DocVO(int userId, String title, String content) {
		super();
		this.userId = userId;
		this.title = title;
		this.content = content;
	}
	
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getDocNo() {
		return docNo;
	}
	public void setDocNo(int docNo) {
		this.docNo = docNo;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
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
	public List<SignLineVO> getSignLineVO() {
		return signLineVO;
	}
	public void setSignLineVO(List<SignLineVO> signLineVO) {
		this.signLineVO = signLineVO;
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
}
