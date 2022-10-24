package kr.ac.kopo.pay.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import kr.ac.kopo.acctbook.controller.AcctBookController;
import kr.ac.kopo.pay.dao.KakaoPayDAO;
import kr.ac.kopo.pay.vo.KakaoPayApprovalVO;
import kr.ac.kopo.pay.vo.KakaoPayReadyVO;
import lombok.extern.java.Log;

@Service
@Log
public class KakaoPayService {

	private static final String HOST = "https://kapi.kakao.com";
	private KakaoPayReadyVO kakaoPayReadyVO;
	private KakaoPayApprovalVO kakaoPayApprovalVO;

	private String item_name = "오렌지주스";
	private String total_amount = "2000";
	private String tax_free_amount = total_amount.substring(0, 3); 
	
	@Autowired
	private KakaoPayDAO kakaoDAO;
	
	@Autowired
	private AcctBookController abController;
	/*
	 * << 결제 준비 >> 카카오페이 결제를 시작하기 위해 상세 정보를 카카오페이 서버에 전달하고 결제 고유 번호(TID)를 받는 단계입니다.
	 * 어드민 키를 헤더에 담아 파라미터 값들과 함께 POST로 요청합니다. 요청이 성공하면 응답 바디에 JSON 객체로 다음 단계 진행을 위한
	 * 값들을 받습니다. 서버(Server)는 tid를 저장하고, 클라이언트는 사용자 환경에 맞는 URL로 리다이렉트(redirect)합니다.
	 */

	public String payReady() {

		RestTemplate restTemplate = new RestTemplate();

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK dc4bff0df117a79052801be88f14c42d");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// headers.add("Content-Type",
		// "application/x-www-form-urlencoded;charset=utf-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("partner_order_id", "1001");
		params.add("partner_user_id", "gorany");
		params.add("item_name", item_name);
		params.add("quantity", "1");
		params.add("total_amount", total_amount);
		params.add("tax_free_amount", tax_free_amount);
		params.add("approval_url", "http://localhost:8080/pay/kakao/success");
		params.add("cancel_url", "http://localhost:8080/pay/cancel?name=" + item_name + "&price=" + total_amount);
		params.add("fail_url", "http://localhost:8080/pay/fail");

		// hearder와 body를 붙이기
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			// RestTemplate 써서 카카오페이에게 데이터를 보냄.
			// 1. "body" = header + body 2. KakaoPayReadyVO.class : 카카오페이로부터 응답을 받는 객체
			kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body,
					KakaoPayReadyVO.class);

			log.info("" + kakaoPayReadyVO);

			return kakaoPayReadyVO.getNext_redirect_pc_url(); // response로 전달할 데이터;

		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "/pay";
	}

	/*
	 * << 결제 승인 >> 사용자가 결제 수단을 선택하고 비밀번호를 입력해 결제 인증을 완료한 뒤, 최종적으로 결제 완료 처리를 하는
	 * 단계입니다. 결제 승인 API를 호출하면 결제 준비 단계에서 시작된 결제건이 승인으로 완료 처리됩니다. 결제 승인 요청이 실패하면 카드사
	 * 등 결제 수단의 실패 정보가 필요에 따라 포함될 수 있습니다.
	 */

	public KakaoPayApprovalVO kakaoPayInfo(String pg_token) {
		log.info("KakaoPayInfoVO............................................");
		log.info("----------------------------------------------------------");

		RestTemplate restTemplate = new RestTemplate();
		// response log를 좀 더 자세히 보여줌
		restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory());

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK dc4bff0df117a79052801be88f14c42d");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", kakaoPayReadyVO.getTid());
		params.add("partner_order_id", "1001");
		params.add("partner_user_id", "gorany");
		params.add("pg_token", pg_token);
		params.add("total_amount", total_amount);

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
			log.info("fhgfh : " + kakaoPayApprovalVO);
			
			// DB 저장
			// 1. kakaoLog table
		    kakaoPayApprovalVO.setTotal(kakaoPayApprovalVO.getAmount().getTotal());
		    kakaoPayApprovalVO.setTax_free(kakaoPayApprovalVO.getAmount().getTax_free());
		    kakaoPayApprovalVO.setVat(kakaoPayApprovalVO.getAmount().getVat());
		    kakaoPayApprovalVO.setPoint(kakaoPayApprovalVO.getAmount().getPoint());

		    kakaoDAO.insertKakaoLog(kakaoPayApprovalVO);
			
			Date nowDate = new Date();
			SimpleDateFormat date = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
			String tranDt = date.format(nowDate);
			String amount = kakaoPayApprovalVO.getTotal().toString();
			String content = kakaoPayApprovalVO.getItem_name(); // + ";하나로통장;220-54846669";
			
			try {
				// 2. accountbook, tran_history table
				abController.addCashTran("-", amount, "1", "KakaoDevelopers"
										, 3, tranDt, content);
				kakaoPayApprovalVO.setApproved_at(tranDt);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return kakaoPayApprovalVO;

		} catch (RestClientException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}

		return null;
	}

}
