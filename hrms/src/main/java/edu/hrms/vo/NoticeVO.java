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

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
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

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getDelyn() {
		return delyn;
	}

	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}

}
