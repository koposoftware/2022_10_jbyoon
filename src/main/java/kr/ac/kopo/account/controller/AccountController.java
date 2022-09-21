package kr.ac.kopo.account.controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

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
public class AccountController {

	@Autowired
	private AccountService acctService;
	
	@Autowired
	private AcctBookService bookService;
	
	public String moneyFormat(int money) {
		DecimalFormat formatter = new DecimalFormat("###,###");
		String won = formatter.format(money);
		return won;
	}
	
	public String dateNow() {
		Date date_now = new Date(System.currentTimeMillis()); // 현재시간을 가져와 Date형으로 저장한다
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss"); 
		String date = dateFormat.format(date_now);
		return date;
	}
	
	
	@GetMapping("/account/createForm")
	public String CreateAccount(Model model) {
		// 랜덤 계좌번호 생성 
		Random rnd = new Random();
		int acctNum = rnd.nextInt(99999999);
		model.addAttribute("AcctNumber", ("220-" + String.format("%08d", acctNum)));
		
		return "account/CreateAcct";
	}
	
	@ResponseBody
	@PostMapping("/account/create")
	public String CreateAccount(  @RequestParam("bankName") String bankName
								, @RequestParam("bankAcctNum") String bankAcctNum
								, @RequestParam("acctAlias") String acctAlias
								, @RequestParam("acctPw") String acctPw
								, @RequestParam("cardChk") String cardChk ) throws Exception {
		// DB insert into bank_acct table
		CookieManager cookie = new CookieManager();
		String id = cookie.findCookie("id");
		HanaAccountVO vo = new HanaAccountVO();
		vo.setAcctNum(bankAcctNum); // 계좌번호
		vo.setMemberId(id);
		vo.setAlias(acctAlias);
		vo.setAcctPw(acctPw);
		
		acctService.insertAcctInfo(vo);
		
		return "success";
	}
	
	@GetMapping("/account/hanalist")
	public String GetHanaAccounts(HttpServletRequest request) throws Exception {
		System.out.println("Controller / ShowHanaAccounts()");
		
		CookieManager cookie = new CookieManager();
		String id = cookie.findCookie("id");

		System.out.println("쿠키값 : " + id);

		List<HanaAccountVO> list = new ArrayList<>();
		list = acctService.selectAll(id);
		
		request.setAttribute("hanaList", list);

		return "account/HanaAccounts";
	}
	
	/* 계좌 이체 페이지로 이동 */
	@GetMapping("/account/transfer1")
	public String showTransferPage(Model model) throws Exception {
		CookieManager cookie = new CookieManager();
		String id = cookie.findCookie("id");
		
		// 계좌 정보 조회 -> 계좌-가계부 페이지로 넘김
		List<HanaAccountVO> list = new ArrayList<>();
		list = acctService.selectAll(id);
		model.addAttribute("acctList", list);
		
		return "account/Transfer1";
	}
	
	/* 계좌 잔액 정보 조회 */
	@ResponseBody
	@PostMapping("/transfer/balance")
	public CalendarVO balanceOfAcct(@RequestParam("bankAcctNum") String bankAcctNum, Model model) {
		CalendarVO calVO = new CalendarVO();  
		String[] strArr = bankAcctNum.split("/");
		calVO.setBankAcctAlias(strArr[0]);
		calVO.setBankAcctNum(strArr[1]);
		
		String bal = acctService.selectBalance(calVO.getBankAcctNum());
		calVO.setBalanceFm(bal);
		
		model.addAttribute("balanceList", calVO);
		
		return calVO;
	}
	
	/* 계좌이체 정보 확인 절차 */
	@ResponseBody
	@PostMapping("/transfer/confirm")
	public CalendarVO confirmTransfer(@RequestParam("acctNum") String acctNum
									, @RequestParam("rcvBank") String rcvBank
									, @RequestParam("rcvBankAcctNum") String rcvBankAcctNum
									, @RequestParam("amount") int amount
									, @RequestParam("acctPw") String acctPw
									, @RequestParam("content") String content
									, @RequestParam("rcvName") String rcvName, Model model) {
		CalendarVO calVO = new CalendarVO();  
		String[] strArr = acctNum.split("/");
		calVO.setBankAcctNum(strArr[1]);
		calVO.setRcvBankName(acctService.selectBankNm(rcvBank));
		calVO.setRcvBankAcctNum(rcvBankAcctNum);
		calVO.setAmount(amount);
		calVO.setOpponentName(rcvName);
		calVO.setContent(content);
		
		calVO.setAmountFm(moneyFormat(amount));
		
		// 계좌 비밀번호 유효성 검증
		String password = acctService.selectPW(calVO.getBankAcctNum());		
		if(acctPw.equals(password)) calVO.setChkTranStatus("정상");
		else calVO.setChkTranStatus("실패");
		
		System.out.println("이체하기 버튼 누름 : \n" + calVO);
		
		model.addAttribute("calVO", calVO);
		return calVO;
	}
	
	@ResponseBody
	@PostMapping("/transfer/action")
	public String addAcctTransaction(@RequestParam("acctNum") String acctNum
									, @RequestParam("rcvBank") String rcvBank
									, @RequestParam("rcvBankAcctNum") String rcvBankAcctNum
									, @RequestParam("amount") int amount
									, @RequestParam("acctPw") String acctPw
									, @RequestParam("content") String content
									, @RequestParam("rcvName") String rcvName, Model model) throws Exception {
		CookieManager cookie = new CookieManager();
	    String id = cookie.findCookie("id");
	    
	    String[] strArr = acctNum.split("/");
	    
	    String date = dateNow();
		System.out.println(date + "/" + date.substring(0, 7));
	    
		CalendarVO calVO = new CalendarVO();
		calVO.setAmount(amount);
		calVO.setSetYM(date.substring(0, 7));
		calVO.setMemberId(id);
		calVO.setBankAcctNum(strArr[1]);
		calVO.setCategoryCd(9); // '금융' default
		calVO.setOpponentName(rcvName);
		calVO.setTranType("-");
		calVO.setBankAcctAlias(strArr[0]);
		calVO.setTranMethod("계좌");
		calVO.setContent(content + ";" + acctService.selectBankNm(rcvBank) + ";" + rcvBankAcctNum);
		calVO.setTranDt(date);

		acctService.insertTran(calVO);
		
		return "success";
	}
	
	
	@GetMapping("/transfer/result")
	public String showResultPage(Model model) {
		CalendarVO vo = bookService.selectLatestTran();
		System.out.println("selectLatestTran" + vo);
		
		String[] arr = vo.getContent().split(";");
		
		vo.setRcvBankName(arr[1]);
		vo.setRcvBankAcctNum(arr[2]);
		vo.setChkTranStatus("정상");
		
		String balance = acctService.selectBalance(vo.getBankAcctNum());
		vo.setBalanceFm(balance);
		
		System.out.println("transfer2로 가는 애 :\n" + vo);
		model.addAttribute("calVO", vo);
		return "account/Transfer2";
	}
	
	// 출금계좌번호  bankAcctNum  , 조회기간(오늘 날짜)  tranDt  , 상대입금계좌  rcvBankAcctNum
	@GetMapping("/tran/history")
	public String showHistoryPage(Model model) throws Exception {
		CookieManager cookie = new CookieManager();
		String id = cookie.findCookie("id");
		
		// 계좌 정보 조회 -> 계좌-가계부 페이지로 넘김
		List<HanaAccountVO> list = new ArrayList<>();
		list = acctService.selectAll(id);
		model.addAttribute("acctList", list);
		
		//CalendarVO vo = new CalendarVO();
		
		//String date = dateNow();
		//vo.setStartDt(date.substring(0, 10));
		//vo.setEndDt(date.substring(0, 10));
		//model.addAttribute("dates", vo);
		
		return "account/HanaTranHistory";
	}
	
	@ResponseBody
	@PostMapping("/tran/historyList")
	public List<CalendarVO> showHistoryList( @RequestParam("acctNum") String acctNum
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
		
		List<CalendarVO> list = bookService.selectAllHistory(calVO);
		model.addAttribute("list", list);
		return list;
		
	}
	
	@ResponseBody
	@PostMapping("/tran/historyListFilter")
	public List<CalendarVO> showHistoryListFilter( @RequestParam("acctNum") String acctNum
												, @RequestParam("startDate") String startDate
												, @RequestParam("endDate") String endDate
												, @RequestParam("rcvBankAcctNum") String rcvBankAcctNum, Model model) {
		
		// 조회 마지막일 + 1
		//String ym = endDate.substring(0, 8); // 2022.09.
		//String date = String.format("%02d", Integer.parseInt(endDate.substring(8)) + 1); // 19
		//endDate = ym + date;
		
		CalendarVO calVO = new CalendarVO();  
		calVO.setBankAcctNum(acctNum);
		calVO.setStartDt(startDate);
		calVO.setEndDt(endDate);
		calVO.setRcvBankAcctNum("%" + rcvBankAcctNum);
		
		List<CalendarVO> list = bookService.selectAllHistoryFilter(calVO);
		model.addAttribute("list", list);
		
		return list;
	}
	
}
