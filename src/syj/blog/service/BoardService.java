package syj.blog.service;


import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;




import org.springframework.web.multipart.MultipartFile;




import syj.blog.dao.BoardDAO;
import syj.blog.model.Board;


@Service
public class BoardService {

	@Autowired private BoardDAO boardDAO;
	
	
	/**
	 * 업로드 폴더 체크
	 */
	public void chkUploadFolder(String folder) throws IllegalStateException, IOException {
		File folderFile = new File(folder);
		if(!folderFile.exists()){
			folderFile.mkdirs();
		}
	}
	
	
	public List<Board> selectBoardList(Board model) {
		return boardDAO.selectBoardList(model);
	}

	public Board selectBoardView(Board model) {
		return boardDAO.selectBoardView(model);
	}

	public Board selectSaveData() {
		return boardDAO.selectSaveData();
	}
	
	@Transactional
	public void insertBoardWrite(Board model) throws IllegalStateException, IOException {
		
		MultipartFile file = model.getFiles();
		if(file != null && !file.isEmpty()){
			String folder = model.getFilePath();
			File folderFile = new File(folder);
			if(!folderFile.exists()){
				folderFile.mkdirs();
			}
			// 1. 업로드 폴더 없으면 생성
			System.out.println("파일업로드 ===== 폴더 체크완료");
	
			
			chkUploadFolder(folder);
			String fileNm =model.getOfileName();
			File saveFile = new File(folder + File.separator + fileNm);
	        file.transferTo(saveFile);
			/*// 2. 파일 업로드
			String saveFileNm = fileUploadService.saveFile(folder, file);*/
			System.out.println("파일업로드 ===== 저장파일명 : " + fileNm);
			boardDAO.insertBoardFile(model);
		}
		boardDAO.insertBoardWrite(model);
	}

	public void updateBoardWrite(Board model) {
		boardDAO.updateBoardWrite(model);
	}

	public void deleteBoardView(Board model) {
		boardDAO.deleteBoardView(model);
	}

	public void updateReadCount(Board model) {
		boardDAO.updateReadCount(model);
	}


	public List<Board> selectFileList(Board model) {
		return boardDAO.selectFileList(model);
	}


	public Board selectBoardFileDownSerch(Board model) {
		return boardDAO.selectBoardFileDownSerch(model);
	}


	public void updateDownCount(Board model) {
		boardDAO.updateDownCount(model);
	}

	@Transactional
	public void selectReplyView(Board model) throws IllegalStateException, IOException {
		MultipartFile file = model.getFiles();
		if(file != null && !file.isEmpty()){
			String folder = model.getFilePath();
			File folderFile = new File(folder);
			if(!folderFile.exists()){
				folderFile.mkdirs();
			}
			// 1. 업로드 폴더 없으면 생성
			System.out.println("파일업로드 ===== 폴더 체크완료");
	
			
			chkUploadFolder(folder);
			String fileNm =model.getOfileName();
			File saveFile = new File(folder + File.separator + fileNm);
	        file.transferTo(saveFile);
			/*// 2. 파일 업로드
			String saveFileNm = fileUploadService.saveFile(folder, file);*/
			System.out.println("파일업로드 ===== 저장파일명 : " + fileNm);
			boardDAO.insertBoardFile(model);
		}
		Board replyView = boardDAO.selectReplyView(model);
		model.setStep(replyView.getStep()+1);
		model.setRefOrder(replyView.getRefOrder()+1);
		model.setGroupNo(replyView.getGroupNo());
		model.setParentNo(replyView.getParentNo());
		boardDAO.updateReplyView(model);
		boardDAO.replyBoardWrite(model);
		System.out.println("답글등록");
	}
	
	
}
