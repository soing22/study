package syj.blog.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.ModelMap;

import syj.blog.model.Board;


  


public class BoardDAOImpl implements BoardDAO {

	private SqlSession sqlSession;    
    
    public void setSqlSession(SqlSession sqlSession)
    {
        this.sqlSession = sqlSession;
    }

	@Override
	public List<Board> selectBoardList(Board model) {
		return sqlSession.selectList("Board.selectBoardList", model);
	}

	@Override
	public Board selectBoardView(Board model) {
		return sqlSession.selectOne("Board.selectBoardView", model);
	}

	@Override
	public Board selectSaveData() {
		return sqlSession.selectOne("Board.selectSaveData");
	}
 
	@Override
	public void insertBoardWrite(Board model) {
		sqlSession.insert("Board.insertBoardWrite", model);
	}

	@Override
	public void updateBoardWrite(Board model) {
		sqlSession.update("Board.updateBoardWrite", model);
	}

	@Override
	public void deleteBoardView(Board model) {
		sqlSession.update("Board.deleteBoardView", model);
	}

	@Override
	public void updateReadCount(Board model) {
		sqlSession.update("Board.updateReadCount", model);
	}

	@Override
	public void insertBoardFile(Board model) {
		sqlSession.insert("Board.insertBoardFile", model);
	}

	@Override
	public List<Board> selectFileList(Board model) {
		return sqlSession.selectList("Board.selectFileList", model);
	}

	@Override
	public Board selectBoardFileDownSerch(Board model) {
		return sqlSession.selectOne("Board.selectBoardFileDownSerch", model);
	}

	@Override
	public void updateDownCount(Board model) {
		sqlSession.update("Board.updateDownCount", model);
	}

	@Override
	public void replyBoardWrite(Board model) {
		sqlSession.insert("Board.replyBoardWrite", model);
	}

	@Override
	public Board selectReplyView(Board model) {
		return sqlSession.selectOne("Board.selectReplyView", model);
	}

	@Override
	public void updateReplyView(Board model) {
		sqlSession.update("Board.updateReplyView", model);
	}
}
