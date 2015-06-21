package syj.blog.model;

import org.springframework.web.multipart.MultipartFile;




public class Board extends BaseBoard{
	
	private int boardNo;				//글번호
	private String boardCat;			//게시판유형
	private String boardTitle;			//글제목
	private String boardContent;		//글내용
	private int readCount;				//조회수
	private int fileNo;					//파일번호
	private String createUser;			//등록자
	private String createDate;			//등록일자
	private String updateUser;			//수정자
	private String updateDate;			//수정일자
	private String delYn;				//삭제여부
	private int parentNo;				//상위번호(답글)
	private int groupNo;				//그룹번호(답글)
	private int refOrder;				//답글순서(답글)
	private int step;					//들여쓰기(답글)
	
	private int fileOrd;				//파일순번
	private String filePath;			//파일경로
	private String ofileName;			//실제파일명
	private String afileName;			//저장파일명
	private int downCount;				//다운로드수
	private MultipartFile files;
	
	private String procMode;			//게시판 유형
	private String searchOption;		//검색항목
	private String searchItems;			//검색어
	
	
	public int getParentNo() {
		return parentNo;
	}
	public void setParentNo(int parentNo) {
		this.parentNo = parentNo;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public int getRefOrder() {
		return refOrder;
	}
	public void setRefOrder(int refOrder) {
		this.refOrder = refOrder;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getBoardCat() {
		return boardCat;
	}
	public void setBoardCat(String boardCat) {
		this.boardCat = boardCat;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getProcMode() {
		return procMode;
	}
	public void setProcMode(String procMode) {
		this.procMode = procMode;
	}
	public String getSearchOption() {
		return searchOption;
	}
	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}
	public String getSearchItems() {
		return searchItems;
	}
	public void setSearchItems(String searchItems) {
		this.searchItems = searchItems;
	}
	public int getFileOrd() {
		return fileOrd;
	}
	public void setFileOrd(int fileOrd) {
		this.fileOrd = fileOrd;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public int getDownCount() {
		return downCount;
	}
	public void setDownCount(int downCount) {
		this.downCount = downCount;
	}
	public String getOfileName() {
		return ofileName;
	}
	public void setOfileName(String ofileName) {
		this.ofileName = ofileName;
	}
	public String getAfileName() {
		return afileName;
	}
	public void setAfileName(String afileName) {
		this.afileName = afileName;
	}
	public MultipartFile getFiles() {
		return files;
	}
	public void setFiles(MultipartFile files) {
		this.files = files;
	}
	
	
}
