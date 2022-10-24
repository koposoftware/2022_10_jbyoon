package kr.ac.kopo.pay.controller;

import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.kopo.pay.service.KakaoPayService;
import kr.ac.kopo.pay.vo.KakaoPayApprovalVO;
import lombok.extern.java.Log;

@Controller
@Log
public class KakaoPayController {

	@Autowired
	private KakaoPayService serviceKakao; 
	
	/* 단건결제 */
	@GetMapping("/pay")
	//@ResponseBody
	public String kakaopay() {
		return "pay/MainView";
	}
	
	@GetMapping("/pay/kakao/begin")
    public String beginPay() {
        log.info("kakaoPay get............................................");
        
        return "redirect:" + serviceKakao.payReady();
        //return service.payReady();
 
    }
    
	@GetMapping("/pay/kakao/success")
    public String success(@RequestParam("pg_token") String pg_token, Model model) throws ParseException {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        
        KakaoPayApprovalVO info = serviceKakao.kakaoPayInfo(pg_token);
        
        model.addAttribute("info", info);
        model.addAttribute("payCd", "kakao");
        return "pay/success";
    }
	
	
	@GetMapping("/pay/cancel")
	public String cancel(@RequestParam("name") String name
						, @RequestParam("price") String price
						, Model model) {
		String[] arr = {name, price};
		model.addAttribute("item", arr);
		return "pay/cancel";
	}
	
	@GetMapping("/pay/fail")
	public String fail() {
		return "pay/fail";
	}
	
}
