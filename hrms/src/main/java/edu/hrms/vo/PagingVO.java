package edu.hrms.vo;

public class PagingVO {
	private int nowPage; //현재 페이지 번호
	private int startPage; //페이지 시작 번호
	private int endPage; //화면에서 페이지 끝번호
	private int total; //게시글 총 갯수
	private int perPage; //화면당 게시글 노출 갯수
	private int lastPage; //전체 게시글의 페이지 끝번호
	private int start; //화면에서의 게시글 시작 번호
	private int startLimit;
	private int end; //화면에서의 게시글 끝번호
	private int cntPage = 5; //화면에서 보여주고자 하는 페이징 번호 갯수
	
	public PagingVO() {}
	public PagingVO(int nowPage, int total, int perPage) {
		
		setNowPage(nowPage);
		setTotal(total);
		setPerPage(perPage);

		//페이징 끝번호 계산
		calcLastPage(total,perPage);
		
		//게시글 시작번호, 끝번호 계산 (mysql은 시작번호만 필요)
		calcStartEnd(nowPage,perPage);
		
		//한페이지당 보여질 페이지 시작, 종료 번호 계산
		calcStartEndPage(nowPage,cntPage);
		
	}
	public void calcLastPage(int total, int perPage) {
		int lastPage = (int)Math.ceil(total/(double)perPage);
		setLastPage(lastPage);
	}
	
	public void calcStartEndPage(int nowPage, int cntPage) {
		
		int endPage = (int)Math.ceil((double)nowPage/cntPage)*cntPage;
		int startPage = endPage-cntPage+1;
		
		//계산된 끝 페이지 번호보다 최종페이지가 큰 경우
		if(endPage > lastPage) { 
			endPage = lastPage;
		}
		
		//혹시 모를 예외 상황 처리
		if(startPage <1) {
			startPage = 1;
		}
		
		setEndPage(endPage);
		setStartPage(startPage);
		
		
	}
	
	public void calcStartEnd(int nowPage, int perPage) {
		int end = nowPage*perPage;
		int start = end-perPage+1;
		
		setStart(start);
		setStartLimit(start-1);
		setEnd(end);
		
	}
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getCntPage() {
		return cntPage;
	}
	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}
	public int getStartLimit() {
		return startLimit;
	}
	public void setStartLimit(int startLimit) {
		this.startLimit = startLimit;
	}
	
	
}
