package kr.ac.kopo.reply.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.kopo.reply.service.ReplyService;
import kr.ac.kopo.reply.vo.ReplyVO;
 
@RestController
public class ReplyController {

	@Autowired
	private ReplyService replyService;	
	 
	@PostMapping("/reply")
	public void insert(ReplyVO replyVO) {
		System.out.println("post reply");
		System.out.println(replyVO);
		replyService.insert(replyVO);
	}
	
	//reply/{boardNo}  get
	@GetMapping("/reply/{boardNo}")
	public List<ReplyVO> getAllReply(@PathVariable("boardNo") int boardNo) {
		
		List<ReplyVO> replylist = replyService.selectAll(boardNo); 		
		return replylist;
	}	
	
	///reply/${board.no}/'+ replyNo	
	//@DeleteMapping("/reply/{boardNo}/{replyNo}")
	@RequestMapping(value ="/reply/{boardNo}/{replyNo}", method = RequestMethod.DELETE)
	public void delete(@PathVariable("boardNo") int boardNo,
						@PathVariable("replyNo") int replyNo) {
		System.out.println("boardNO : " + boardNo + " replyNo : " + replyNo);
		replyService.delete(boardNo, replyNo);
	}
}













