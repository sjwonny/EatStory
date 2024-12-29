package common;

public class Paging {
	private final int perPage = 40; // 페이지당 글 갯수
	private int pageCount; // 총 페이지갯수
	private int boardCount; // 총 글의 갯수
	private int first; // 현재 페이지의 첫 글의 번호
	private int last; //현재 페이지의 끝글의 번호
	private final int perSection = 10; //페이지갯수
	private int begin; // 시작페이지
	private int end; //끝페이지
	private int section; // 범위 번호
	private int page; //현재 페이지
	
	private boolean prev; //이전
	private boolean next; //다음
	
	public Paging(int page,int boardCount) {
		this.page = page;
		this.boardCount = boardCount;
		
		//총 페이지 
		pageCount = boardCount / perPage;
		pageCount += (boardCount % perPage) == 0 ? 0 : 1;
		
		//시작글의 번호
		first = (page - 1) * perPage + 1;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public void setFirst(int first) {
		this.first = first;
	}

	public void setLast(int last) {
		this.last = last;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public void setSection(int section) {
		this.section = section;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getPerPage() {
		return perPage;
	}

	public int getPageCount() {
		return pageCount;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public int getFirst() {
		return first;
	}

	public int getLast() {
		return last;
	}

	public int getPerSection() {
		return perSection;
	}

	public int getBegin() {
		return begin;
	}

	public int getEnd() {
		return end;
	}

	public int getSection() {
		return section;
	}

	public int getPage() {
		return page;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}
}
