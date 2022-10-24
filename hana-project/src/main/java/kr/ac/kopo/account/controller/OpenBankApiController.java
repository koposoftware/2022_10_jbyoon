package kr.ac.kopo.account.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.account.service.OpenBankService;
import kr.ac.kopo.account.vo.AccountSearchRequestVO;
import kr.ac.kopo.account.vo.AccountTransferRequestVO;
import kr.ac.kopo.account.vo.AccountTransferResponseVO;
import kr.ac.kopo.account.vo.BankAccountSearchResponseVO;
import kr.ac.kopo.account.vo.BankBalanceRequestVO;
import kr.ac.kopo.account.vo.BankRequestToken;
import kr.ac.kopo.account.vo.BankResponseToken;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.util.CookieManager;
import kr.ac.kopo.util.OpenBankUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
public class OpenBankApiController {
	
	// 수정 : session, openBnakUtil에 @autowired 붙임!!
	
	//@Autowired
	//private final HttpSession session;
	@Autowired
    private final OpenBankUtil openBankUtil;
    /**
     * clientID = 	318b30f8-87cc-4e10-aff2-027ebd3e3b3a
     * http://localhost:8080/auth/openbank/callback
     * Client Secret = 5081186a-2d57-49cb-ab45-03dc853079b8
     *
     * 토큰 발급 요청 주소(POST)
     * https://testapi.openbanking.or.kr/oauth/2.0/token
     * code <authorization_code> Y 사용자인증 성공 후 획득한 Authorization Code
     *
     * client_id <client_id> (Max: 40 bytes) Y 오픈뱅킹에서 발급한 이용기관 앱의 Client ID
     *
     * client_secret <client_secret> (Max: 40 bytes) Y 오픈뱅킹에서 발급한 이용기관 앱의 Client Secret
     *redirect_uri <callback_uri> Y
     *
     * Access Token을 전달받을 Callback URL
     *
     * (Authorization Code 획득 시 요청했던 Callback URL)
     * grant_type
     */
    		
    @Value("M202201741")
    private String useCode;
    @Value("50751548-ae5e-4b1b-8414-4247743c4487")
    private String clientId;
    @Value("af048e8f-5acc-4046-954c-ff340a33e192")
    private String client_secret;
    
    private String redirectUri = "http://localhost:8080/auth/openbank/callback";
    private final OpenBankService openBankService;
    @Autowired
    private MemberService memberService;
    
	
	
	/* open banking 사용자 인증 api 호출 페이지로 이동 */
	@GetMapping("/open/auth")
	public String authOpenBanking(Model model) {
		log.info("open banking controller activated.");
		System.out.println("useCode : " + useCode);
		System.out.println("clientId : " + clientId);
		System.out.println("client_secret : " + client_secret);
		
		model.addAttribute("clientId", clientId);
		model.addAttribute("redirectUri", redirectUri);
		
		return "account/openbank/OpenAuth";
	}

//	테스트용으로 만듦. 나중에 지우기!!!
	@GetMapping("test/callback")
	public String testOpenAccountList() {
		return "account/openbank/accountList";
	}
//	여기까지 테스트 메소드 끝.
	/**
     * 토큰요청
     * @param model
     * @return
	 * @throws Exception 
     */
    @GetMapping("/auth/openbank/callback")
    public String getToken(@RequestParam("code") String code, BankRequestToken bankRequestToken, Model model) throws Exception{
    	// 1. code 받기
    	System.out.println("#1) callback / code : " + code);
    	bankRequestToken.setCode(code);
    	
    	
    	// 2. code를 통해 token값 받음
        BankResponseToken token = openBankService.requestToken(bankRequestToken);
        //model.addAttribute("bankResponseToken",token);
        log.info("\n#2) bankResponseToken={}", token);
        
        // 3. 사용자가 오픈뱅킹 동의함 (openType 업데이트)
        CookieManager cookie = new CookieManager();
		String id = cookie.findCookie("id");
		//memberService.UpdateOpenType(id);
        
        // 4. token으로 오픈뱅킹 API 호출 : 오픈뱅킹 계좌들 정보 조회
		AccountSearchRequestVO asrVO = new AccountSearchRequestVO();
		asrVO.setUser_seq_no(token.getUser_seq_no());
		asrVO.setInclude_cancel_yn("Y");
		asrVO.setSort_order("D");
		
		System.out.println("asrVO : \n" + asrVO + "\n");
		
		BankAccountSearchResponseVO account = openBankService.findAccount(asrVO);
        model.addAttribute("bankAccounts",account);
        model.addAttribute("useCode",useCode);
        //model.addAttribute("access_token",access_token);
        
        // 5. 오픈뱅킹 계좌 목록 페이지로 이동 (OpenAccounts, accountList 페이지 합치기)
        // return "account/OpenAccounts";
        return "account/openbank/accountList";
        
    	
        // 아래는 삭제하기
        //return "account/openbank/bank";
    }

    /**
     * 계좌조회
     * VO 만들기
     * @param accountSearchRequestVO
     * @param model
     * @return
     * @throws Exception 
     */
    @GetMapping("/account/list")
    public String searchAccountList(AccountSearchRequestVO accountSearchRequestVO, Model model) throws Exception{
    	
    	BankAccountSearchResponseVO account = openBankService.findAccount(accountSearchRequestVO);
        System.out.println("searchAccountList : " + account);
        model.addAttribute("bankAccounts",account);
        model.addAttribute("useCode",useCode);
        //model.addAttribute("access_token",access_token);
        
        // 3. 오픈뱅킹 계좌 목록 페이지로 이동 
        // return "account/OpenAccounts";
        return "account/openbank/accountList";
    }

    /**
     * 잔액조회
     */
    @GetMapping("/balance")
    public String searchBalance(@RequestParam("access_token") String access_token, BankBalanceRequestVO bankBalanceRequestVO, Model model){
        model.addAttribute("accountBalance", openBankService.findBalance(access_token,bankBalanceRequestVO));
        return "account/openbank/balance";
    }

    /**
     * 계좌이체
     * 계좌이체 처리 테스트에 등록된 값만 계좌이체가능!! 
     */
    @GetMapping("/openTransfer")
    public String openTransfer(Model model, String bank_tran_id,String access_token, String fintech_use_num, String account_num, String req_client_name){
        /**
         * 20000, 100000원만 등록되어있음
         */
        //계좌번호 마스킹된값 제거(계좌번호 보여주는건 계약된 사용자만가능(그래서 마스킹된 3자리 잘라서 보내주고 클라이언트에서 3자리 더해줌
        model.addAttribute("token", access_token);
        model.addAttribute("transferForm",new AccountTransferRequestVO(openBankUtil.getRandomNumber(bank_tran_id)
        																,fintech_use_num
        																,req_client_name
        																,openBankUtil.trimAccountNum(account_num, account_num.length())
        																,openBankUtil.trimAccountNum(account_num, account_num.length())));
        return "account/openbank/transferForm";
    }
    @PostMapping("/transfer")
    public @ResponseBody AccountTransferResponseVO transfer(String access_token,AccountTransferRequestVO accountTransferRequestVO){
        return openBankService.accountTransfer(access_token,accountTransferRequestVO);
    }
	
	
	
	
	
	
	
	
	
	
	
	
}
