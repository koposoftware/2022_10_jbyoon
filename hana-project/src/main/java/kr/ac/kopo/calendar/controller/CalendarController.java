package kr.ac.kopo.calendar.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.calendar.service.CalendarService;
import kr.ac.kopo.calendar.vo.RecordVO;
import kr.ac.kopo.calendar.vo.TranVO;
import kr.ac.kopo.member.vo.MemberVO;

@Controller
public class CalendarController {

	@Autowired
	private CalendarService calService;
	
	
	/* 하나은행 계좌 거래내역만 가져오기 */
	@ResponseBody
	@PostMapping("/calendar/OnlyHana")
	public String getHanaTranList(@RequestParam("id") String id, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<TranVO> list = calService.selectHana(id);
		System.out.println("controller : " + list);
		
		session.setAttribute("HanaList", list);
		return "success";
	}
	
	
	
	/* rvo.setAcctCd(mvo.getAcctCd()); -> getId() 로 수정 필요!!! */
	@PostMapping("/calendar/insert")
	public String addRecord(RecordVO rvo, Model model, HttpServletRequest request) {
		System.out.println("CalendarController/addRecord");
		String[] arr = rvo.getTranDt().split(" ");
		String month = "", date = "";
		
		switch(arr[1]) {
		case "January" :
			month = "01";
			break;
		case "February" :
			month = "02";
			break;
		case "March" :
			month = "03";
			break;
		case "April" :
			month = "04";
			break;
		case "May" :
			month = "05";
			break;
		case "June" :
			month = "06";
			break;
		case "July" :
			month = "07";
			break;
		case "August" :
			month = "08";
			break;
		case "September" :
			month = "09";
			break;
		case "October" :
			month = "10";
			break;
		case "November" :
			month = "11";
			break;
		case "December" :
			month = "12";
			break;
		}
		date = arr[2] + month + arr[0];
		rvo.setTranDt(date);
		
		if(rvo.getTranType().equals("in")) {
			rvo.setTranType("입금");
		} else {
			rvo.setTranType("출금");
		}
		
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginVO");
//		rvo.setAcctCd(mvo.getAcctCd());
		//rvo.setAcctTypeCd(mvo.getAcctTypeCd());
		
		rvo = calService.insert(rvo);
		model.addAttribute("recordVO", rvo);
		return "calendar/CalendarMain";
	}
	
}
