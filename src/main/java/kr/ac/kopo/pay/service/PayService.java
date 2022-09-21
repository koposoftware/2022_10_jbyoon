package kr.ac.kopo.pay.service;

import kr.ac.kopo.pay.vo.KakaoPayApprovalVO;

public interface PayService {

	String payReady();
	KakaoPayApprovalVO kakaoPayInfo(String pg_token);
}
