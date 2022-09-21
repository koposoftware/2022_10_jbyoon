package kr.ac.kopo.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.util.CookieManager;

@SessionAttributes("loginVO") // 로그인 시 사용자정보를 세션에 등록시키는 어노테이션 (여러 jsp에서 쓸 수 있도록)
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@GetMapping("/")
	public String Index() {
		System.out.println("fdsafdas");
		return "index";
	}
	
	//로그인
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(HttpServletRequest request) {
		//spring form tag에서 사용할 memberVO를 공유영역에 등록시킨다. 
		request.setAttribute("memberVO", new MemberVO());

		//WEB-INF/jsp/member/login.jsp
		return "member/login";
	}
	
	@PostMapping("/login")
	public String loginPost(@Valid MemberVO member, BindingResult result, 			
								Model model, HttpSession session, HttpServletResponse response ) throws Exception {
		System.out.println("MemberController/loginPost");

		if(result.hasErrors()) {
			//null값이 존재. -> 다시입력하세요.
			//WEB-INF/jsp/member/login.jsp
			return "member/login";
		}else {
			//null값이 존재하지 않음 -> db작업. id/password가 유효한 사용자확인
			MemberVO authMember = memberService.login(member);
			//System.out.println("authMember : " + authMember);
			if(authMember == null) {
				//id랑 password가 유효하지 않은경우
				model.addAttribute("loginmsg", "id와 password가 유효하지 않습니다.");
				
				return "member/login";
			}else {
				// 1. 세션 등록
				session.setAttribute("loginVO", authMember);
				System.out.println(authMember);
				
				// 2. 쿠키 생성
				CookieManager myCookie = new CookieManager(); //("", authMember.getId());
				myCookie.addCookie("id", authMember.getId());
				
				// 3. 최근 들어갔던 페이지 경로 저장
				String dest = (String)session.getAttribute("dest");
				System.out.println("dest:" + dest);
				
				if(dest==null) {
					return "redirect:/";
				}else {
					return "redirect:"+dest;
				}
				
			}
		} 
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		session.invalidate();
		
		return "redirect:/";
	}
	
	/* 회원가입 */
	@GetMapping("/member/register")
	public String register(Model model) {
		MemberVO vo1 = new MemberVO();
		model.addAttribute("vo1", vo1);
		return "member/register";
	}
	
	@PostMapping("/member/register")
	public String register(@Valid @ModelAttribute("vo1") MemberVO member, BindingResult result) {		
		System.out.println("MemberController/register");
		
		if(result.hasErrors()) {
			return "member/register";
		} else {
			memberService.insertUser(member);
			return "redirect:/login";
		}
	}
	
	/* 계좌개설 -> 개인정보 동의 update */
	@ResponseBody
	@PostMapping("/member/chkMInfoType")
	public String AgreeMInfo(@RequestParam("id") String id, String chk) {
		if(chk.equals("true")) memberService.UpdateMInfoType(id);
		else return "fail";
		return "success";
	}
	
	
	
	/* 약관들에 동의했다면 오픈뱅킹 계좌 목록 페이지로 이동 
	 * 수정 필요 : account 말고 id 값을 받아와야 함!!! OpenBankingPolicy.jsp 수정 필요!!!
	 * */
	
	@PostMapping("/member/chkOpenType")
	public String AgreeOpenType() throws Exception {
		System.out.println("membercontroller / AgreeOpenType()");
		
		CookieManager cookie = new CookieManager();
		String id = cookie.findCookie("id");
		// 1. 사용자의 오픈뱅킹 타입 업데이트
		memberService.UpdateOpenType(id);
		
		// 2-1. 오픈뱅킹 API 호출 : 오픈뱅킹 계좌들 정보 조회 using ajax
		
		
		// 3. 오픈뱅킹 계좌 목록 페이지로 이동 
		
		// location.href="${pageContext.request.contextPath}/account/openlist";
		
		return "account/OpenAccounts";
	}
	
}

