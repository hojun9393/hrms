package edu.hrms.vo;

public class SearchVO {

	private String startDate;
	private String endDate;
	private String listType;
	private String position;
	private String searchVal;
	private String dept;
	
	
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
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
	public String getListType() {
		return listType;
	}
	public void setListType(String listType) {
		this.listType = listType;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getSearchVal() {
		return searchVal;
	}
	public void setSearchVal(String searchVal) {
		this.searchVal = searchVal;
	}
	
	
	@Override
	public String toString() {
		return "SearchVO [startDate=" + startDate + ", endDate=" + endDate + ", listType=" + listType + ", position="
				+ position + ", searchVal=" + searchVal + ", dept=" + dept + "]";
	}
	
	
	
	
}
