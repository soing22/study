package syj.blog.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.ModelMap;

import syj.blog.model.Board;



 
public interface BoardDAO {
	
	public void setSqlSession(SqlSession sqlSession);

	List<Board> selectBoardList(Board model);

	public Board selectBoardView(Board model);

	public Board selectSaveData();

	public void insertBoardWrite(Board model);

	public void updateBoardWrite(Board model);

	public void deleteBoardView(Board model);

	public void updateReadCount(Board model);

	public void insertBoardFile(Board model);

	public List<Board> selectFileList(Board model);

	public Board selectBoardFileDownSerch(Board model);

	public void updateDownCount(Board model);

	public void replyBoardWrite(Board model);

	public Board selectReplyView(Board model);

	public void updateReplyView(Board model);

	
}
