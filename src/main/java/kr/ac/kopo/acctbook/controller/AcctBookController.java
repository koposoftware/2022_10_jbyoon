package kr.ac.kopo.acctbook.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import kr.ac.kopo.acctbook.vo.BudgetVO;
import kr.ac.kopo.acctbook.vo.CalendarVO;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.util.CookieManager;

@Controller
public class AcctBookController {

	@Autowired
	private AcctBookService abService;
	
	@Autowired
	private AccountService acctService;
	
	@Autowired
	private MemberService memberService;
	
	// 쿠키 id값 조회
	public String cookieForID() throws Exception {
		CookieManager cookie = new CookieManager();
		return cookie.findCookie("id");
	}
//-----------------------------------------------	
//		예산 관련
//-----------------------------------------------
	
	// 가계부 예산 tab에 뿌려줄 정보
	public void BudgetSetting(HttpServletRequest request, Model model) throws Exception {
		Date nowDate = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy년MM월31일");
		String budgetMonth = date.format(nowDate);

		// startDt, endDt, ID 값 넘겨줘야함 -> calVO
		CalendarVO calVO = new CalendarVO();
		calVO.setMemberId(cookieForID());
		
		BudgetVO bVO = abService.mTotalInOut(calVO);
		
		List<BudgetVO> list = abService.exist(cookieForID()); // 설정된 예산금액, 총 지출액
		System.out.println("설정된 예산금액 : " + list);
		
		int cnt = 0;
		if(list != null) {
			cnt++;
			model.addAttribute("budgetChk", "Y");
			model.addAttribute("budgetList", list);
			
			// 지출 % 분석
			double currAmtVal = Double.valueOf(list.get(0).getCurrentAmt());
			double limitVal = Double.valueOf(list.get(0).getLimit());
			int percentage = (int) Math.round(currAmtVal / limitVal * 100);
			model.addAttribute("percentage", percentage);
			
		} else {
			model.addAttribute("budgetChk", "N");
		}
		
		model.addAttribute("minus", bVO.getMTotalMinusFm());
		model.addAttribute("plus", bVO.getMTotalPlusFm());
		model.addAttribute("month", budgetMonth);
		model.addAttribute("cnt", cnt);
	}
	
	@GetMapping("/budget")
	public String setUpBudget(HttpServletRequest request, Model model) throws Exception {
		// 0. 예산 설정했다면 1(예산 : db조회), 아님 0 (예산: 0원) / 1. 이번달 총 지출 / 2. 이번달 총 수입 / 3. 예산 설정
		BudgetSetting(request, model);
		
		// 설정된 예산금액, 총 지출액
		List<BudgetVO> list = abService.exist(cookieForID()); 
		
		// 오늘 날짜
		Date nowDate = new Date();
		SimpleDateFormat date = new SimpleDateFormat("dd");
		String today = date.format(nowDate);
		
		// today.equals(list.get(0).getEndDt())
		if(list != null && today.equals("21")) {
			challengeResult(model, list, today);
		}
		
		System.out.println(list);
		model.addAttribute("today", today);
		model.addAttribute("budget", list);
		
		return "accountbook/BudgetMain";
	}
	
	public void challengeResult(Model model, List<BudgetVO> list, String today) throws Exception {
		int expenditure = list.get(0).getCurrentAmt();
		int goal = list.get(0).getLimit();

		// 매달 마지막 날에 아래 경우를 따져 알림 전송
		if (expenditure > goal) { // 1. 지출 > 예산 (실패)
			model.addAttribute("amtLeft", 0);
			model.addAttribute("result", "fail");
		} else if (expenditure <= goal) { // 2. 지출 <= 예산 (성공)
			model.addAttribute("result", "success");
		}
	}

	// 예산 수정
	@ResponseBody
	@PostMapping("/acctbook/budget/setting")
	public String acctSetInitGoal(@RequestParam("budgetAmt") String limit, @RequestParam("currAmt") String currentAmt) throws Exception {
		BudgetVO vo = new BudgetVO();
		String temp = "";
		
		// 0. DDAY 값 설정
		Date nowDate = new Date();
		SimpleDateFormat date = new SimpleDateFormat("dd");
		int today = Integer.parseInt(date.format(nowDate));
		
		Calendar cal = Calendar.getInstance();
		int endDt = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
        
		vo.setDday(String.valueOf(endDt - today));
		
		// 1. 회원번호 세팅
		vo.setMemberId(cookieForID());

		// 2. 현재 총 지출액 설정
		String[] strCurrAmt = currentAmt.split(",");
		for (String val : strCurrAmt) {
			temp += val;
		}
		vo.setCurrentAmt(Integer.parseInt(temp));
		System.out.println("총지출 : " + temp);

		// 3. 예산 금액 설정
		temp = "";
		String[] strLimit = limit.split(",");
		for (String val : strLimit) {
			temp += val;
		}
		vo.setLimit(Integer.parseInt(temp));
		System.out.println("예산 : " + temp);

		// 4. DB 저장
		abService.saveBudgetInfo(vo);
		
		return "success"; 
	}
	
	@GetMapping("/budget/update/goal")
	public String updateGoalAmt(@RequestParam("bgt") String newLimit
								, Model model
								, HttpServletRequest request, HttpServletResponse respone) throws Exception{
		String temp = "";
		String[] strLimit = newLimit.split(",");
		for (String val : strLimit) {
			temp += val;
		}

		BudgetVO vo = new BudgetVO();
		vo.setMemberId(cookieForID());
		vo.setLimit(Integer.parseInt(temp));
		
		abService.updateBudgetAmt(vo);
		BudgetSetting(request, model);
		
		// KAKAO MESSAGE REST API 호출
//		HttpSession session = request.getSession();
//		String token = (String)session.getAttribute("access_Token");
//		System.out.println("kakao access_Token 존재?? :" + token);
//		KakaoAPI api = null;
//		
//		if(token != null) {
//			api = new KakaoAPI();
//			api.SendKakaoMessage(token, vo);
//		}
		
		return "accountbook/BudgetMain";
	}
	
//-----------------------------------------------	
//		현금 관련
//-----------------------------------------------
	/* 가계부 페이지로 이동 */
	@GetMapping("/cashbook")
	public String cashMain(HttpServletRequest request, Model model) throws Exception {
		// 1. pay_chk=Y 인지 확인 -> N : update, Y : skip
		memberService.UpdatePayChk(cookieForID());
		
		// 2. 이번달 현황 조회
		BudgetSetting(request, model);
		
		// 3. 페이 정보 조회 -> 현금-가계부 페이지로 넘김
		List<String> payList = new ArrayList<>();
		payList.add(0, "거래수단을 선택하십시오.");
		payList.add(1, "현금");
		payList.add(2, "원큐페이");
		payList.add(3, "카카오페이");
		System.out.println("거래수단(페이) 전체조회 : " + payList);

		model.addAttribute("payList", payList);
		
		// 4. 거래내역 목록 tab에 보여줄 내용
		List<CalendarVO> tranHistoryList = abService.cashAllInOut(cookieForID());
		model.addAttribute("tranList", tranHistoryList);
		
		return "cashbook/main";
	}
	
	/* 1. 달력 로드 (각 날짜별 총 지출, 수입) */
	@ResponseBody
	@PostMapping("/cashbook/dayResult")
	public List<CalendarVO> dayCashTranResult() throws Exception {
		List<CalendarVO> list = abService.cashGroupInOut(cookieForID());
		return list;
	}
	
	
	/* 2. 달력 클릭 > 직접 새 거래내역 입력 > 저장 */
	@ResponseBody
	@PostMapping("/cashbook/action")
	public void addCashTran(  @RequestParam("tranType") String tranType
							, @RequestParam("amount") String amount
							, @RequestParam("categoryCd") String categoryCd
							, @RequestParam("opponentName") String opponentName
							, @RequestParam("payType") int payType
							, @RequestParam("tranDt") String tranDt
							, @RequestParam("content") String content ) throws Exception {
		
		CalendarVO vo = new CalendarVO();
		vo.setSetYM(tranDt.substring(0, 7));
		vo.setMemberId(cookieForID());
		vo.setCategoryCd(Integer.parseInt(categoryCd));
		vo.setOpponentName(opponentName);
		vo.setTranType(tranType);
		vo.setTranMethod("현금");
		vo.setContent(content);
		vo.setAmount(Integer.parseInt(amount));
		vo.setTranDt(tranDt);
		
		switch(payType) {
		case 1 :
			vo.setBankAcctAlias("현금");
			vo.setBankAcctNum("cash money"); 	
			break;
		case 2 :
			vo.setBankAcctAlias("원큐페이");
			vo.setBankAcctNum("OneQ"); 	
			break;
		case 3 :
			vo.setBankAcctAlias("카카오페이");
			vo.setBankAcctNum("Kakao"); 
			break;
		}
		
		// 입력받은 데이터 저장 
		abService.cashInsertOne(vo);
	}
	

	/* 3. 각 날짜의 지출/수입 모달 안에 들어갈 내용(선택된 날짜의 간단 거래정보) */
	@ResponseBody
	@PostMapping("/cashbook/calModalResult")
	public List<CalendarVO> cashTranResultForModal() throws Exception {
		List<CalendarVO> list = abService.cashAllInOut(cookieForID());
		return list;
	}
	
	/* 4. 거래내역 tab */
	@ResponseBody
	@PostMapping("/cashbook/calTranHisFilter")
	public List<CalendarVO> calCashShowResult( @RequestParam("bankAcctAlias") String bankAcctAlias
											, @RequestParam("startDate") String startDate
											, @RequestParam("endDate") String endDate
											, Model model) throws Exception {
		CalendarVO calVO = new CalendarVO();  
		calVO.setBankAcctAlias(bankAcctAlias);
		calVO.setStartDt(startDate);

		endDate = endDate.substring(0, 8) + String.format("%02d", Integer.parseInt(endDate.substring(8)) + 1);
		calVO.setEndDt(endDate);
		calVO.setMemberId(cookieForID());
		
		System.out.println("fdsfsfs : " + calVO);
		
		List<CalendarVO> list = abService.cashSelectCalInOut(calVO);
		System.out.println(list);
		return list;
	}
	

//-----------------------------------------------	
//	계좌 관련
//----------------------------------------------=
	/* 가계부 페이지로 이동 */
	@GetMapping("/acctbook")
	public String acctMain(HttpServletRequest request, Model model) throws Exception {
		// 계좌 정보 조회 -> 계좌-가계부 페이지로 넘김
		List<HanaAccountVO> acctList = new ArrayList<>();
		acctList = acctService.selectAcctList(cookieForID());
		model.addAttribute("acctList", acctList);
		
		// 거래내역 목록 tab에 보여줄 내용
		List<CalendarVO> tranHistoryList = abService.acctAllInOut(cookieForID());
		model.addAttribute("tranList", tranHistoryList);
		
		// 예산 tab에 보여줄 내용
		// 0. 예산 설정했다면 1(예산 : db조회), 아님 0 (예산: 0원) / 1. 이번달 총 지출 / 2. 이번달 총 수입 / 3. 예산 설정
		BudgetSetting(request, model);
		
		return "accountbook/main";
	}
	
	/* 1. 달력 로드 (각 날짜별 총 지출, 수입) */
	@ResponseBody
	@PostMapping("/acctbook/dayResult")
	public List<CalendarVO> dayAcctTranResult() throws Exception {
		List<CalendarVO> list = abService.acctGroupInOut(cookieForID());
		
		System.out.println();
		System.out.println("캘린더 : " + list);
		System.out.println();
		
		return list;
	}
	
	/* 2. 각 날짜의 지출/수입 bar 클릭 시 모달 띄움 (선택된 날짜의 간단 거래정보 출력) */
	@ResponseBody
	@PostMapping("/acctbook/calModalResult")
	public List<CalendarVO> acctTranResultForModal() throws Exception {
		List<CalendarVO> list = abService.acctAllInOut(cookieForID());
		System.out.println("modal result : " + list);
		return list;
	}
	
	/* 3. 거래내역 tab */
	@ResponseBody
	@PostMapping("/acctbook/calTranHisFilter")
	public List<CalendarVO> calAcctShowResult( @RequestParam("acctNum") String acctNum
											, @RequestParam("startDate") String startDate
											, @RequestParam("endDate") String endDate
											, Model model) throws Exception {
		CalendarVO calVO = new CalendarVO();  
		calVO.setBankAcctNum(acctNum);
		calVO.setStartDt(startDate);

		endDate = endDate.substring(0, 8) + String.format("%02d", Integer.parseInt(endDate.substring(8)) + 1);
		System.out.println(endDate);
		calVO.setEndDt(endDate);
		calVO.setMemberId(cookieForID());
		
		List<CalendarVO> list = abService.acctSelectCalInOut(calVO);
		
		return list;
	}
	
	
}
