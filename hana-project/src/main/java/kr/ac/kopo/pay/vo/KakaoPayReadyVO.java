package kr.ac.kopo.pay.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class KakaoPayReadyVO {

	/* 
	response값을 객체로 받기 위한 Java Bean
	: KakaoPay(Service)의 return 값으로 redirect url을 불러와 결제가 완료되면 해당 주소로 가게끔 설정해 놓는다.
	*/
	
    private String tid, next_redirect_pc_url;
    private String created_at; // 원래 Date 타입이었음
}
