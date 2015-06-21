package syj.blog.controller;



import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import syj.blog.model.BaseBoard;
import syj.blog.model.Board;
import syj.blog.service.BoardService;


@Controller
public class BoardController {
	 
	private final Logger LOGGER = LoggerFactory.getLogger(BoardController.class);
//	private final Logger LOGGER = LoggerFactory.getLogger(CommonDAOImpl.class);
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private BoardService boardService;
	
	public static String contextPathNormalize(HttpServletRequest request) {
		String contextPath = request.getContextPath();
		if (contextPath.endsWith("/")) {
			contextPath = contextPath.substring(0,contextPath.length() - 1);
		}
		//logger.debug("contextPathNormalize >>> request.getContextPath : [{}], result : [{}]", request.getContextPath(), contextPath);
		return contextPath;
	}

	//게시판 목록
	@RequestMapping("/boardList.do")
	public ModelAndView boardList(HttpServletRequest request) throws SQLException{
		LOGGER.debug("라벨캐시 로딩완료-----------------------------------------------------");
		LOGGER.info("라벨캐시 로딩완료-----------------------------------------------------2");
		
		logger.debug("라벨캐시 로딩완료-----------------------------------------------------3");
		logger.info("라벨캐시 로딩완료----------------------------------------------------4");
		return new ModelAndView("/syj/boardList.jsp");
	}
	
	//게시판 목록 ajax
	@RequestMapping("/boardListAjax.do")
	public void boardListAjax(@ModelAttribute Board model, HttpServletRequest request, HttpServletResponse response, ModelMap map) throws SQLException{
		List<Board> resultList = boardService.selectBoardList(model);
		LOGGER.info("test >> {}", resultList.size());
		JSONObject jsonObj = new JSONObject();
		
		if (resultList != null && !resultList.isEmpty())
		{	
			BaseBoard boardObj = (BaseBoard)resultList.get(0);

			/* JSON 데이터 생성 */
			jsonObj.put("page", model.getPage() );				// 요청페이지
			jsonObj.put("rec", model.getRec() );				// 페이지당 조회개수
			jsonObj.put("records", boardObj.getRecords());		// 전체 레코드수
			jsonObj.put("results", JSONArray.fromObject(resultList));
			
		}else{
			jsonObj.put("page", model.getPage() );				// 요청페이지
			jsonObj.put("rec", model.getRec() );				// 페이지당 조회개수
			jsonObj.put("records", 0);		// 전체 레코드수
			jsonObj.put("results", null);
		}
		
		response.setContentType("application/json; charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		
		PrintWriter out = null;
		
		try {
			out = response.getWriter();
			
		} catch (IOException e) {
			LOGGER.error(e.getMessage() + " : ", e.getCause());
		}
		out.write(jsonObj.toString());
		out.flush();
		out.close();
		
	}
	
	//게시판 등록
	@RequestMapping("/boardWrite.do")
	public ModelAndView boardWrite(@ModelAttribute Board model, HttpServletRequest request, ModelMap map) throws SQLException{
		String procMode = model.getProcMode();
//		Board saveData = boardService.selectSaveData();
		Board boardView = boardService.selectBoardView(model);
		System.out.println("procMode >> "+procMode);
		//등록
		if(procMode.equals("insert")){
			map.put("boardNo", 0);
			map.put("createUser", "yjsong");
			map.put("createDate", boardView.getCreateDate());
			map.put("procMode", procMode);
		}
		//수정,답글
		else{
			List<Board> fileList = boardService.selectFileList(model);
			map.put("fileList", fileList);
			map.put("boardNo", boardView.getBoardNo());
			map.put("boardTitle", boardView.getBoardTitle());
			map.put("boardContent", boardView.getBoardContent());
			map.put("createUser", boardView.getCreateUser());
			map.put("createDate", boardView.getCreateDate());
			map.put("procMode", procMode);
		}
		
		
//		map.put("createDate", saveData.getCreateDate());
		return new ModelAndView("/syj/boardWrite.jsp");
		
	}
	
	//게시판 등록 ajax
	@RequestMapping("/boardSaveAjax.do")
	public ModelAndView boardSaveAjax(@ModelAttribute Board model, ModelMap map, HttpServletRequest request, HttpServletResponse response){
//		JSONObject jsonObj = new JSONObject();
		String result = "저장완료";
		String filePath = "c:/blog/uploadfile";
		model.setFilePath(filePath);
		try{
			model.setCreateUser("yjsong");
			model.setUpdateUser("yjsong");
			//수정
			if(model.getProcMode().equals("update")){
				System.out.println("up");
				boardService.updateBoardWrite(model);
				/*jsonObj.put("boardNo", model.getBoardNo());
				jsonObj.put("procMode", model.getProcMode());
				jsonObj.put("msg", "suc");*/
			}
			//답글
			else if(model.getProcMode().equals("reply")){
				System.out.println("re");
				boardService.selectReplyView(model);
//				boardService.replyBoardWrite(model);
			}
			//저장
			else{
				System.out.println("in");
//				model.setBoardNo(model.getBoardNo());
//				model.setFileNo(Integer.parseInt(request.getParameter("fileNo")));
//				model.setFileName(model.getFileName());
//				boardService.insertBoardFileWrite(model);
//				model.setFileNo(model.getFileNo());
				
				boardService.insertBoardWrite(model);
				/*jsonObj.put("boardNo", model.getBoardNo());
				jsonObj.put("procMode", model.getProcMode());
				jsonObj.put("msg", "suc");*/
			}
		}catch(Exception e){
//			jsonObj.put("procMode", model.getProcMode());
//			jsonObj.put("msg", "fail");
			result = "저장실패";
		}
		
		map.put("boardNo", model.getBoardNo());
		map.put("result", result);

		return new ModelAndView("/syj/saveResult.jsp");
	}
	
	//게시판 상세
	@RequestMapping("/boardView.do")
	public ModelAndView boardView(@ModelAttribute Board model, HttpServletRequest request, ModelMap map) throws SQLException{

		LOGGER.debug("boardNo >> {}",request.getParameter("boardNo"));
		//조회수 증가
		boardService.updateReadCount(model);
		//상세 조회
		Board boardView = boardService.selectBoardView(model);
		List<Board> fileList = boardService.selectFileList(model);
		map.put("boardView", boardView);
		map.put("fileList", fileList);
		return new ModelAndView("/syj/boardView.jsp");
		
	}
	
	//게시판 삭제 ajax
	@RequestMapping("/boardDeleteAjax.do")
	public void boardDeleteAjax(@ModelAttribute Board model, HttpServletRequest request, HttpServletResponse response, ModelMap map) throws SQLException{
		JSONObject jsonObj = new JSONObject();
		try{
			model.setUpdateUser("yjsong");
			boardService.deleteBoardView(model);
			jsonObj.put("msg", "suc");
		}catch(Exception e){
			jsonObj.put("msg", "fail");
		}
		
		response.setContentType("application/json; charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		
		PrintWriter out = null;
		
		try {
			out = response.getWriter();
			
		} catch (IOException e) {
			LOGGER.error(e.getMessage() + " : ", e.getCause());
		}
		out.write(jsonObj.toString());
		out.flush();
		out.close();
	}
	
	//파일다운
	@RequestMapping(value = "/boardFileDownload.do")
	public ModelAndView boardFileDownload(@ModelAttribute Board model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Board AttachDetail = boardService.selectBoardFileDownSerch(model);
	    String filepath = AttachDetail.getFilePath() + "/" + AttachDetail.getOfileName();
	    File downloadFile = new File(filepath);
		ModelAndView view = new ModelAndView("downloadView");
		view.addObject("downloadFile", downloadFile);
		view.addObject("orgName", AttachDetail.getOfileName());
		//다운로드시 전송 수 증가
		boardService.updateDownCount(model);
		return view;
	}
	
	
	
	
	//test
	
	@RequestMapping("/test.do")
	public ModelAndView test(@ModelAttribute Board model, HttpServletRequest request, ModelMap map) throws SQLException{
		System.out.println("dsafsdafdfsffs");
		return new ModelAndView("/syj/test.jsp");
		
	}
}
