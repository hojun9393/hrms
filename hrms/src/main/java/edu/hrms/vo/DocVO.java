package edu.hrms.vo;

public class DocVO {
	private int docNo;
	private int userId;
	private String title;
	private String content;
	private String state;
	private String date;
	
	private String name;
	private String dept;
	private String position;

	public DocVO() {}

	public DocVO(int docNo, int userId, String title, String content, String state, String date, String name,
			String dept, String position) {
		this.docNo = docNo;
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.state = state;
		this.date = date;
		this.name = name;
		this.dept = dept;
		this.position = position;
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
}
