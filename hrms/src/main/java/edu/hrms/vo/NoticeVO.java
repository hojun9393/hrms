package edu.hrms.vo;

public class NoticeVO {
	private int noticeNo;
	private int userId;
	private String title;
	private String content;
	private String rdate;
	private String delyn;
	
	public NoticeVO() {}

	public NoticeVO(int noticeNo, int userId, String title, String content, String rdate, String delyn) {
		this.noticeNo = noticeNo;
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.rdate = rdate;
		this.delyn = delyn;
	}
	
	int getNoticeNo() {
		return noticeNo;
	}
	void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	int getUserId() {
		return userId;
	}
	void setUserId(int userId) {
		this.userId = userId;
	}
	String getTitle() {
		return title;
	}
	void setTitle(String title) {
		this.title = title;
	}
	String getContent() {
		return content;
	}
	void setContent(String content) {
		this.content = content;
	}
	String getRdate() {
		return rdate;
	}
	void setRdate(String rdate) {
		this.rdate = rdate;
	}
	String getDelyn() {
		return delyn;
	}
	void setDelyn(String delyn) {
		this.delyn = delyn;
	}	
}
