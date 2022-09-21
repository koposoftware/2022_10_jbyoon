package kr.ac.kopo.board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.kopo.board.service.BoardService;
import kr.ac.kopo.board.vo.BoardVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	//localhost:8080/springboard/board
	@RequestMapping("/board")
	public String allboard(HttpServletRequest request) {
		
		System.out.println("/board handler 동작");
		List<BoardVO> boardlist = new ArrayList<>();
		boardlist = boardService.getAllBoard();
		request.setAttribute("boardlist", boardlist);
		
		// WEB-INF/jsp/board/list.jsp
		return "board/list";
	}
	
	//상세게시글 조회
	// /board/detail?boardNo=3
	//@RequestMapping("/board/detail")
	public String detail(@RequestParam("boardNo") int no, Model model) {
		//DB - 3번 게시글 값을 가져온다. 
		
		//String boardNo = request.getParameter("boardNo");
		BoardVO board = boardService.getOneBoard(no);
		model.addAttribute("board", board);
		//WEB-INF/jsp/board/detail.jsp
		return "board/detail";
	}
		
	// /board/detail/{boardNo} 
	@RequestMapping("/board/detail/{number}")
	public String detail2(@PathVariable("number") int no, Model model) {
		//DB - 3번 게시글 값을 가져온다. 

		System.out.println("/board/detail handler 동작");
		//String boardNo = request.getParameter("boardNo");
		BoardVO board = boardService.getOneBoard(no);
		model.addAttribute("board", board);
		//WEB-INF/jsp/board/detail.jsp
		return "board/detail";
	}
	
	//새글쓰기
	///localhost:8080/springboard/board/write
	////WEB-INF/jsp/board/write.jsp
	//@RequestMapping(value= "/board/write", method = RequestMethod.GET)
	@GetMapping("/board/write")
	public void writeGet(Model model) {		
		//WEB-INF/jsp/board/write.jsp
		
		BoardVO boardVO1 = new BoardVO(); 
		//title="", writer=""; content ="";
		model.addAttribute("boardVO1", boardVO1);
		//return "board/write";
	}
	@PostMapping("/board/write")
	public String writePost(@Valid @ModelAttribute("boardVO1") BoardVO board, BindingResult result) {
		
		
		//0. 입력받은 board가 null값이 포함안되어 있는지 확인한다. BindingResult를 활용
		//1. DB insert작업
		//2. 다 완료후에는 전체게시글 list로 이동		
		System.out.println(result);
		if(result.hasErrors()) {
			//error가 존재하는 경우, null있는경우
			//board/write.jsp로 다시 forward 시킨다.
			return "board/write";
			
		}else {
			//error가 존재 하지 않는경우
			//insert DB -> 전체게시글리스트로 redirect
			boardService.write(board);
			return "redirect:/board";			
		}				
	}
		
	
}
