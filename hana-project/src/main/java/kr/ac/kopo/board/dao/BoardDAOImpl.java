package kr.ac.kopo.board.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.board.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate sst;
	
	public List<BoardVO> selectAll() { 
		
		List<BoardVO>  list = new ArrayList<>();
		list = sst.selectList("board.dao.boardDAO.selectAll");
		return list;
	}
	@Override
	public BoardVO selectByNo(int boardNo) {
		BoardVO board 
		= sst.selectOne("board.dao.boardDAO.selectByNo", boardNo);
		return board;
	}
	@Override 
	public void insert(BoardVO board) {
		sst.insert("board.dao.boardDAO.insert", board);
		
	}
	@Override
	public void increaseReplyCount(int boardNo) {
		sst.update("board.dao.boardDAO.increaseReplyCount", boardNo);
	}
	@Override
	public void decreaseReplyCount(int boardNo) {
		sst.update("board.dao.boardDAO.decreaseReplyCount",boardNo);
	}
	
}















