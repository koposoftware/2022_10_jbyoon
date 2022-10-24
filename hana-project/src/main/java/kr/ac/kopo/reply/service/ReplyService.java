package kr.ac.kopo.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.reply.dao.ReplyDAO;
import kr.ac.kopo.reply.vo.ReplyVO;

@Service
public class ReplyService {

	@Autowired 
	private ReplyDAO replyDAO;
	@Autowired
	private BoardDAO boardDAO;
	
	@Transactional
	public void insert(ReplyVO replyVO) {
		
		boardDAO.increaseReplyCount(replyVO.getBoardNo());
		replyDAO.insert(replyVO);
		
	}
	
	public List<ReplyVO> selectAll(int boardNo){
		List<ReplyVO> list = replyDAO.selectAll(boardNo);
		return list;
	}
	
	@Transactional
	public void delete(int boardNo, int replyNo) {
		replyDAO.delete(replyNo);
		boardDAO.decreaseReplyCount(boardNo);
		//t_board boardNo인 게시글 reply_cnt 를 1감소.
	}
}










