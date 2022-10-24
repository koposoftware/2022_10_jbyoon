package kr.ac.kopo.reply.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.reply.vo.ReplyVO;

@Repository
public class ReplyDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	public void insert(ReplyVO replyVO) {
		sqlSessionTemplate.insert("reply.dao.replyDAO.insert", replyVO);
	}
	
	public List<ReplyVO> selectAll(int boardNo){
		List<ReplyVO> list = 
				sqlSessionTemplate.selectList("reply.dao.replyDAO.selectAll", boardNo);
		return list;
	}
	public void delete(int replyNo) {
		sqlSessionTemplate.delete("reply.dao.replyDAO.delete" , replyNo);
		
	}
	 
}










