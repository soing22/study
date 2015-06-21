package syj.blog.model;


public class BaseBoard
{	
	private int		draw;				// 조회호출번호
	private int		page;				// 현재 페이지 번째
	private int		length;				// 한 페이지당 표시 행 수
	private int		rec;				// 한 페이지당 표시 행 수
	private int		start;

	private String 	sidx;				// 정렬 기준이 되는 인덱스
	private String 	sord;				// 정렬 방향(ASC or DESC)
	
	private int		numb;				// 글번호
	
	private int		totalPage;			// 전체 페이지 수
	private int		records;			// 전체 레코드 수
	
	private int		allRow = 0;			// 전체검색여부, 1:적용, 0: 미적용(default)

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getSidx() {
		return sidx;
	}

	public void setSidx(String sidx) {
		this.sidx = sidx;
	}

	public String getSord() {
		return sord;
	}

	public void setSord(String sord) {
		this.sord = sord;
	}

	public int getAllRow() {
		return allRow;
	}

	public void setAllRow(int allRow) {
		this.allRow = allRow;
	}
	
	public int getStartRow() {	
		return (page - 1) * rec + 1;
	}
	public int getEndRow() {
		return page * rec;
	}

	public int getRecords() {
		return records;
	}

	public void setRecords(int records) {
		this.records = records;
	}

	public int getNumb() {
		return numb;
	}

	public void setNumb(int numb) {
		this.numb = numb;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getRec() {
		return rec;
	}

	public void setRec(int rec) {
		this.rec = rec;
	}

	public int getDraw() {
		return draw;
	}

	public void setDraw(int draw) {
		this.draw = draw;
	}

	public int getLength() {
		return rec;
	}

	public void setLength(int length) {
		this.rec = length;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}
}