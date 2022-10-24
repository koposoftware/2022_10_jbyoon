package kr.ac.kopo.message.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.kopo.message.service.KakaoAPI;

@RestController
public class MessageController {

	@PostMapping("/message")
	public String test(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String token = (String)session.getAttribute("accessToken");
		KakaoAPI api = null;
		System.out.println("메세지 보내기 전에 token :" + token);
		
		if(token != null) {
			api = new KakaoAPI();
			//api.SendKakaoMessage(token);
			//api.SendKakaoMessage(token, vo);
		}
		return "success";
	}
}
