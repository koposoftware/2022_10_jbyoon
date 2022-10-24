package kr.ac.kopo.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.ac.kopo.message.service.KakaoAPI;

@Controller
public class KakaoLogoutController {

	@GetMapping("/logout")
	public String handleRequest(HttpServletRequest request, HttpServletResponse respone) throws Exception {
	      KakaoAPI kakao = new KakaoAPI();
	      HttpSession session = request.getSession();

	      kakao.kakaoLogout((String) session.getAttribute("accessToken"));
	      //System.out.println("controller 단에서 토큰 : " + (String) session.getAttribute("access_Token"));
	      session.removeAttribute("accessToken");
	      session.removeAttribute("loginVO");

	      System.out.println("로그아웃 완료.");
	      
	      return "index";
	}

}
