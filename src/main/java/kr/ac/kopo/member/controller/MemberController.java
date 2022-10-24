package kr.ac.kopo.member.controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
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

import com.fasterxml.jackson.databind.JsonNode;

import kr.ac.kopo.acctbook.service.AcctBookService;
import kr.ac.kopo.acctbook.vo.BudgetVO;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.message.service.KakaoAPI;
import kr.ac.kopo.util.CookieManager;

@SessionAttributes("loginVO") // 로그인 시 사용자정보를 세션에 등록시키는 어노테이션 (여러 jsp에서 쓸 수 있도록)
@Controller
public class MemberController {
	
	@Autowired
	private AcctBookService abService;
	
	@Autowired
	private MemberService memberService;

//	@GetMapping("/")
//	public String MainView() {
//		// return "index";
//		return "intro";
//	}

	@GetMapping("/main")
	public String Index() {
		return "index";
	}

	@Autowired
	private KakaoController kakaoLogin;

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request, Model model, HttpSession session) {
		// 처음 로그인 화면을 들어갈때 버튼 클릭시 이동할 주소를 만들어서 보내준다.
		String kakaoUrl = kakaoLogin.getAuthorizationUrl(session);

		// 생성한 인증 URL을 View로 전달
		model.addAttribute("kakao_url", kakaoUrl);
		
		request.setAttribute("memberVO", new MemberVO());

		return "member/login";
	}

	/**
	 * 카카오 로그인 콜백
	 *
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/kakaoOauth")
	public String getKakaoSignIn(ModelMap model, @RequestParam("code") String code
								, HttpSession session, HttpServletRequest request)
			throws Exception {
		
		
//		System.out.println("1번 : "+ code);
		
		JsonNode userInfo = kakaoLogin.getKakaoUserInfo(code);
//		System.out.println("3번 : "+ userInfo);
		
		String accessToken = userInfo.get("accessToken").toString().replaceAll("\"", "");
		session.setAttribute("accessToken", accessToken);
//		System.out.println("session 토큰값 보자!! : " + session.getAttribute("accessToken"));
		
		String id = userInfo.get("id").toString();
		String email = userInfo.get("kakao_account").get("email").toString().replaceAll("\"", "");
		String image = userInfo.get("properties").get("profile_image").toString().replaceAll("\"", "");
		String nickname = userInfo.get("properties").get("nickname").toString().replaceAll("\"", "");

		MemberVO member = new MemberVO();
		member.setId(id);
		member.setName(nickname);
		member.setEmail(email);
		member.setProfileImage(image);
		member.setType("K");
		
		MemberVO authMember = memberService.login(member);
		
		// 1. 세션 등록
		session.setAttribute("loginVO", authMember);
		System.out.println(authMember);
		
		// 2. 쿠키 생성
		CookieManager myCookie = new CookieManager();
		myCookie.addCookie("id", authMember.getId());
		
		// 3. 카카오톡으로 가계부 알림 전송
		msgSender(request, authMember.getId());
		
		// 4. 챌린지 d-day 알림창
		List<BudgetVO> list = abService.exist(authMember.getId());
		// model.addAttribute("dday", list.get(0).getDday());
		session.setAttribute("dday", list.get(0).getDday());
		
		return "index";
	}

	@PostMapping("/login")
	public String loginPost(@Valid MemberVO member, BindingResult result, Model model, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberController/loginPost");

		if (result.hasErrors()) {
			// null값이 존재. -> 다시입력하세요.
			// WEB-INF/jsp/member/login.jsp
			return "member/login";
		} else {
			// null값이 존재하지 않음 -> db작업. id/password가 유효한 사용자확인
			member.setType("U");
			MemberVO authMember = memberService.login(member);
			// System.out.println("authMember : " + authMember);
			if (authMember == null) {
				// id랑 password가 유효하지 않은 경우
				model.addAttribute("loginmsg", "id와 password가 유효하지 않습니다.");

				return "member/login";
			} else {
				// 1. 세션 등록
				session.setAttribute("loginVO", authMember);
				System.out.println(authMember);

				// 2. 쿠키 생성
				CookieManager myCookie = new CookieManager(); // ("", authMember.getId());
				myCookie.addCookie("id", authMember.getId());
				
				// 3. 카카오톡으로 가계부 알림 전송
				msgSender(request, authMember.getId());
				
				// 4. 챌린지 d-day 알림창
				List<BudgetVO> list = abService.exist(authMember.getId());
//				model.addAttribute("dday", list.get(0).getDday());
				session.setAttribute("dday", list.get(0).getDday());
				
				// 5. 최근 들어갔던 페이지 경로 저장 (사용안함!!)
				String dest = (String) session.getAttribute("dest");
				System.out.println("dest:" + dest);

				if (dest == null) {
					return "redirect:/main";
				} else {
					return "redirect:" + dest;
				}

			}
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session, SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		session.invalidate();

		return "member/logout";
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

		if (result.hasErrors()) {
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
		if (chk.equals("true"))
			memberService.UpdateMInfoType(id);
		else
			return "fail";
		return "success";
	}

	/* 회원정보 페이지로 이동 */
	@GetMapping("/member/profile")
	public String memberInfoPage(Model model) throws Exception {
		CookieManager cookie = new CookieManager();
		String id = cookie.findCookie("id");
		MemberVO member = new MemberVO();
		member.setId(id);
		
		MemberVO authMember = memberService.login(member);
		String phone_masked = authMember.getPhone();
		phone_masked = phone_masked.substring(0, 3) + "****" + phone_masked.substring(7);
		authMember.setPhone(phone_masked);
		
		model.addAttribute("phone", phone_masked);
		return "member/profile";
	}
	
//	예산 챌린지 > 카카오톡 메시지 보내기
	public void msgSender(HttpServletRequest request, String id) {
		List<BudgetVO> list = abService.exist(id); // 설정된 예산금액, 총 지출액
		
		// 오늘 날짜
		Date nowDate = new Date();
		SimpleDateFormat date = new SimpleDateFormat("dd");
		String today = date.format(nowDate);
		
		// 이 달의 마지막 날짜
		Calendar cal = Calendar.getInstance();
	    cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
	    String lastDate = date.format(cal.getTime());
	    
		// 카카오 메세지 날리기
		if(list != null) {
			int expenditure = list.get(0).getCurrentAmt();
			int goal = list.get(0).getLimit();
			
//			if(today.equals(lastDate)) {
			if(today.equals("21")) {
				// 매달 마지막 날에 아래 경우를 따져 알림 전송
				if(expenditure > goal) { // 1. 지출 > 예산
					int leftOverAmt = expenditure - goal;
					kakaoMsg(request, "fail", moneyFormat(leftOverAmt));
					
				} else if(expenditure <= goal) { // 2. 지출 <= 예산
					kakaoMsg(request, "success", list.get(0).getLeftOverFm());
				}
			} else {
				if(goal < 5000) { // 3. 하루 지출 추천금액 < 5000원
					kakaoMsg(request, "limit", list.get(0).getDayLimitFm());
				}
			}
			
		} 
	}
	public String moneyFormat(int money) {
		DecimalFormat formatter = new DecimalFormat("###,###");
		String won = formatter.format(money);
		return won;
	}
	
	public String kakaoMsg(HttpServletRequest request, String status, String amount) {
		HttpSession session = request.getSession();
		String token = (String)session.getAttribute("accessToken");
		KakaoAPI api = null;
		System.out.println("메세지 보내기 전에 token :" + token);
		
		if(token != null) {
			api = new KakaoAPI();
			api.SendKakaoMessage(token, status, amount);
		}
		return "success";
	}

}
