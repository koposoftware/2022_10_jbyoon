package kr.ac.kopo.acctbook.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.account.service.AccountService;
import kr.ac.kopo.account.vo.HanaAccountVO;
import kr.ac.kopo.acctbook.service.AcctBookService;
import kr.ac.kopo.acctbook.vo.CalendarVO;
import kr.ac.kopo.util.CookieManager;

@Controller
public class AcctBookController {

	@Autowired
	private AcctBookService abService;
	
	@Autowired
	private AccountService acctService;

//-----------------------------------------------	
//		현금 관련
//----------------------------------------------=
	@GetMapping("/cashbook")
	public String cashMain() {
		// 카드 정보 조회
		
		return "cashbook/main";
	}
	
	
	/* 달력 클릭 > 직접 새 거래내역 입력 > 저장 + model(select 변경사항) */
	@ResponseBody
	@PostMapping("/cashbook/addToCal")
	public CalendarVO addCashTran(  @RequestParam("tranType") String tranType
										, @RequestParam("amount") String amount
										, @RequestParam("categoryCd") String categoryCd
										, @RequestParam("opponentName") String opponentName
										, @RequestParam("acctAlias") String acctAlias
										, @RequestParam("tranDt") String tranDt
										, @RequestParam("content") String content ) throws Exception {
		
	    CookieManager cookie = new CookieManager();
	    String id = cookie.findCookie("id");
	    
		CalendarVO vo = new CalendarVO();
		vo.setSetYM(tranDt.substring(0, 7));
		vo.setMemberId(id);
		vo.setCategoryCd(Integer.parseInt(categoryCd));
		vo.setOpponentName(opponentName);
		vo.setTranType(tranType);
		vo.setContent(content);
		vo.setAmount(Integer.parseInt(amount));
		vo.setTranDt(tranDt);
		
		String[] strArr = acctAlias.split("_");
		if(strArr[0].equals("card")) 
			vo.setTranMethod("계좌");
		else if(strArr[0].equals("pay")) 
			vo.setTranMethod("현금");
		
		switch(strArr[1]) {
		case "Test" :
			vo.setBankAcctAlias("테스트통장");
			vo.setBankAcctNum("220-10102300"); // 테스트통장	
			break;
		case "OneQ" :
			vo.setBankAcctAlias("원큐페이");
			vo.setBankAcctNum("260-10011001"); // 원큐페이
			break;
		case "Kakao" :
			vo.setBankAcctAlias("카카오페이");
			vo.setBankAcctNum("250-10011001"); // 카카오페이
			break;
		}

		
		// 1. 입력받은 데이터 저장 
		abService.insertOne(vo);
		
		String[] arrWon = abService.selectDayInOut(vo.getTranDt());
		vo.setDayIn(arrWon[0]); // 하루 총 수입
		vo.setDayOut(arrWon[1]); // 하루 총 지출
		
		return vo;
	}
	
	/* calendar 로드될 때 모든 일자 별 수입/지출 금액 출력 */
	@ResponseBody
	@PostMapping("/cashbook/dayResult")
	public List<CalendarVO> dayCashTranResult() throws Exception {
		List<CalendarVO> list = abService.cashSelectAllInOut();
		return list;
	}
	
	
//-----------------------------------------------	
//	계좌 관련
//----------------------------------------------=
	/* 가계뿌 페이지로 이동 */
	@GetMapping("/acctbook")
	public String acctMain(Model model) throws Exception {
		CookieManager cookie = new CookieManager();
		String id = cookie.findCookie("id");
		
		// 계좌 정보 조회 -> 계좌-가계부 페이지로 넘김
		List<HanaAccountVO> acctList = new ArrayList<>();
		acctList = acctService.selectAll(id);
		model.addAttribute("acctList", acctList);
		
		// 거래내역 목록 tab에 보여줄 내용
		List<CalendarVO> tranHistoryList = abService.acctAllInOut();
		model.addAttribute("tranList", tranHistoryList);
		
		return "accountbook/main";
	}
	
	
	/* 1. 달력 로드 (각 날짜별 총 지출, 수입) */
	@ResponseBody
	@PostMapping("/acctbook/dayResult")
	public List<CalendarVO> dayAcctTranResult() throws Exception {
		List<CalendarVO> list = abService.acctGroupInOut();
		
		return list;
	}
	
	/* 2. 각 날짜의 지출/수입 bar 클릭 시 모달 띄움 (선택된 날짜의 간단 거래정보 출력)
	 * 3. 거래내역 tab */
	@ResponseBody
	@PostMapping("/acctbook/calModalResult")
	public List<CalendarVO> dayAcctTranResultForModal() throws Exception {
		List<CalendarVO> list = abService.acctAllInOut();
		
		return list;
	}
	
	/* 4. 필터 기간, 계좌번호 설정 후 조회버튼 클릭 시 캘린더 refresh (각 날짜별 총 지출, 수입 + 필터 조회) */
	@ResponseBody
	@PostMapping("/acctbook/dayResultFilter")
	public List<CalendarVO> calAcctShowResult( @RequestParam("acctNum") String acctNum
											, @RequestParam("startDate") String startDate
											, @RequestParam("endDate") String endDate
											, Model model) {
				
		// 조회 마지막일 + 1
		//String ym = endDate.substring(0, 8); // 2022.09.
		//String date = String.format("%02d", Integer.parseInt(endDate.substring(8)) + 1); // 19
		//endDate = ym + date;
		
		CalendarVO calVO = new CalendarVO();  
		calVO.setBankAcctNum(acctNum);
		calVO.setStartDt(startDate);
		calVO.setEndDt(endDate);
		
		List<CalendarVO> list = abService.acctSelectCalInOut(calVO);
		
		return list;
	}
}
