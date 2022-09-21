package kr.ac.kopo.pay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.pay.service.PayService;
import lombok.extern.java.Log;

@Controller
@Log
public class KakaoPayController {

	@Autowired
	private PayService service; 
	
	/* 단건결제 */
	@GetMapping("/kakaopay")
	//@ResponseBody
	public String kakaopay() {
		return "pay/kakaoPayMain";
	}
	
	@ResponseBody
	@PostMapping("/kakaoPay")
    public String kakaoPay() {
        log.info("kakaoPay post............................................");
        
//        return "redirect:" + service.payReady(); // kakaoPayReadyVO.getNext_redirect_pc_url();
        return service.payReady();
 
    }
    
	@GetMapping("/pay/success")
    public void success(@RequestParam("pg_token") String pg_token, Model model) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        
        // gson 사용
        
        
        model.addAttribute("info", service.kakaoPayInfo(pg_token));
    }
	
	
	@GetMapping("/pay/cancel")
	public String cancel() {
		return "pay/cancel";
	}
	
	@GetMapping("/pay/fail")
	public String fail() {
		return "pay/fail";
	}
	
}
