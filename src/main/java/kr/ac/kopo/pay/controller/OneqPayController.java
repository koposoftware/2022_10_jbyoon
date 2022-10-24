package kr.ac.kopo.pay.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.pay.service.OneqPayService;
import kr.ac.kopo.pay.vo.OneqPayVO;
import kr.ac.kopo.util.CookieManager;
import lombok.extern.java.Log;

@Controller
@Log
public class OneqPayController {

	@Autowired
	private OneqPayService serviceOneQ;
	
//	public String moneyFormat(int money) {
//		DecimalFormat formatter = new DecimalFormat("###,###");
//		String won = formatter.format(money);
//		return won;
//	}
	public String moneyFormat(int money) {
		DecimalFormat formatter = new DecimalFormat("###,###");
		String won = formatter.format(money);
		return won;
	}
	
	public Map<String, String> productInfo(){
		Date nowDate = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String tranDt = date.format(nowDate);
		
		Map<String, String> map = new HashMap<>();
		map.put("tranType", "-");
		map.put("amount", "32600");
		map.put("categoryCode", "521912");
		map.put("opponentName", "이마트트레이더스");
		//map.put("tranDt", tranDt);
		map.put("tranDt", "2022.10.24 16:24:31");
		map.put("itemName", "종합선물세트, 식빵, 딸기잼, 칫솔세트(10P)");
		map.put("amountFm", moneyFormat(32600));
		
		return map;
	}
	
	
	//@PostMapping("/showQRCode")
	@GetMapping("/showQRCode")
    public String showQRCode(@RequestParam("qrContent") String qrContent, Model model) {
        model.addAttribute("qrCodeContent", "/generateQRCode?qrContent=" + qrContent);
        System.out.println("QR코드 생성완료. 결제 페이지 열림!!");
        return "pay/show-qr-code";
    }

    @GetMapping("/generateQRCode")
    public void generateQRCode(String qrContent, HttpServletResponse response) throws IOException {
        response.setContentType("image/png");
        byte[] qrCode = serviceOneQ.generateQRCode(qrContent, 250, 250);
        OutputStream outputStream = response.getOutputStream();
        outputStream.write(qrCode);
    }
    
    @GetMapping("/pay/oneq/transfer")
    public String transferPage(Model model) throws Exception {
        log.info("pay transfer!!!! get............................................");
        CookieManager cookie = new CookieManager();
		String id = cookie.findCookie("id");

		// 하나머니 충전 계좌 정보 가져오기
        OneqPayVO vo = serviceOneQ.selectPayAcctInfo(id);
        model.addAttribute("payAcct", vo);
        
        return "pay/Transfer";
    }
    
    @ResponseBody
    @PostMapping("/pay/trandata")
    public Map<String, String> tranData() {
    	return productInfo();
    }
    
    //@ResponseBody
    @GetMapping("/pay/success")
    public String success(@RequestParam("type") String screenType, Model model, HttpServletResponse response) throws Exception {
    	response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Headers", "x-requested-with, origin, content-type, accept");
        response.setHeader("Access-Control-Allow-Methods", "POST,GET,OPTIONS,DELETE");
        response.setHeader("Access-Control-Max-Age", "3600");
        
        CookieManager cookie = new CookieManager();
        String id = cookie.findCookie("id");
        
        Map<String, String> map = productInfo();
        
        System.out.println("setYM : " + map.get("tranDt").substring(0, 7));
        
        OneqPayVO vo = new OneqPayVO();
        vo.setAmount(Integer.parseInt(map.get("amount")));
        vo.setTranType(map.get("tranType"));
        vo.setSetYM(map.get("tranDt").substring(0, 7));
        vo.setCategoryCd(Integer.parseInt(map.get("categoryCode")));
        vo.setOpponentName(map.get("opponentName"));
        vo.setTranDt(map.get("tranDt"));
        vo.setItemName(map.get("itemName"));
        
        if(screenType.equals("mobile")) {
        	vo.setMemberId(id);
        } else {
        	vo.setMemberId("2469626384");
        }
        
        OneqPayVO vo2 = serviceOneQ.selectPayAcctInfo(vo.getMemberId());
        vo.setBankAcctNum(vo2.getBankAcctNum());
        vo.setBankAcctAlias(vo2.getBankAcctAlias());
        vo.setBalance(vo2.getBalance());
        vo.setAmountFm(moneyFormat(vo.getAmount()));
        
        System.out.println(vo);
        System.out.println("type : " + screenType);
        
        if(screenType.equals("mobile")) {
        	vo = serviceOneQ.insertTranLog(vo);
        } 
        
        model.addAttribute("vo", vo);
        model.addAttribute("payCd", "oneq");
        
        log.info("pay 결제 성공!!!! get............................................");
        //return "redirect:/showQRCode?qrContent=http://192.168.123.3:8080/pay/oneq/success";
        //return "http://192.168.123.3:8080/pay/success";
        if(screenType.equals("mobile")) {
        	return "pay/success";
        } else {
        	return "pay/successPC";
        }
    }
}
