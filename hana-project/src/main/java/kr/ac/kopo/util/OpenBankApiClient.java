package kr.ac.kopo.util;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import kr.ac.kopo.account.vo.AccountSearchRequestVO;
import kr.ac.kopo.account.vo.AccountTransferRequestVO;
import kr.ac.kopo.account.vo.AccountTransferResponseVO;
import kr.ac.kopo.account.vo.BankAccountSearchResponseVO;
import kr.ac.kopo.account.vo.BankBalanceRequestVO;
import kr.ac.kopo.account.vo.BankBalanceResponseVO;
import kr.ac.kopo.account.vo.BankRequestToken;
import kr.ac.kopo.account.vo.BankResponseToken;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@RequiredArgsConstructor
@Service
public class OpenBankApiClient {
    private final OpenBankUtil openBankUtil;
    private final HttpHeaders httpHeaders;
    private final RestTemplate restTemplate;
    
    @Value("M202201741")
    private String useCode;  // 핀테크번호+U -> 거래고유번호 생성기
    @Value("50751548-ae5e-4b1b-8414-4247743c4487")
    private String clientId;
    @Value("af048e8f-5acc-4046-954c-ff340a33e192")
    private String client_secret;
    
    private String redirect_uri = "http://localhost:8080/auth/openbank/callback";
    private String base_url = "https://testapi.openbanking.or.kr/v2.0";

    /**
     * 토큰발급요청
     */
    public BankResponseToken requestToken(BankRequestToken bankRequestToken){
        //post 방식으로 key=vale 데이터 요청 (금결원)
        //http 헤더 오브젝트 생성
        httpHeaders.add("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
        //httpBody 오브젝트 생성
        bankRequestToken.setBankRequestToken(clientId,client_secret,redirect_uri,"authorization_code");
        //헤더의 컨텐트 타입이 application/x-www-form-urlencoded;charset=UTF-8이므로 객체를 집어넣을수 없음.. 그러므로 MultiValueMap 사용 해야함
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("code",bankRequestToken.getCode());
        parameters.add("client_id",bankRequestToken.getClient_id());
        parameters.add("client_secret",bankRequestToken.getClient_secret());
        parameters.add("redirect_uri",bankRequestToken.getRedirect_uri());
        parameters.add("grant_type",bankRequestToken.getGrant_type());
        // HttpHeader 와 HttpBody를 하나의 오브젝트에 담기
        HttpEntity<MultiValueMap<String,String>> param =
                new HttpEntity<>(parameters,httpHeaders);
        //Http 요청하기 - post 방식으로
        return restTemplate.exchange("https://testapi.openbanking.or.kr/oauth/2.0/token", HttpMethod.POST, param, BankResponseToken.class).getBody();
    }
    //        //Gson, Json Simple, Object Mapper
//        ObjectMapper objectMapper = new ObjectMapper();
//        BankReponseToken bankReponseToken = null;
//        try {
//            bankReponseToken = objectMapper.readValue(responseEntity.getBody(), BankReponseToken.class);
//
//        } catch (JsonProcessingException e) {
//            e.printStackTrace();
//        }

    /**
     * 계좌조히
     * @param accountSearchRequestVO
     * @return
     */
    public BankAccountSearchResponseVO requestAccountList(AccountSearchRequestVO accountSearchRequestVO){
        String url = base_url+"/account/list";
        HttpEntity<String> openBankAcountSerchRequest = new HttpEntity<>(setHeader(accountSearchRequestVO.getAccess_token()));
        UriComponents builder = UriComponentsBuilder.fromHttpUrl(url)
                .queryParam("user_seq_no", accountSearchRequestVO.getUser_seq_no())
                .queryParam("include_cancel_yn", accountSearchRequestVO.getInclude_cancel_yn())
                .queryParam("sort_order", accountSearchRequestVO.getSort_order())
                .build();

        return restTemplate.exchange(builder.toUriString(), HttpMethod.GET, openBankAcountSerchRequest, BankAccountSearchResponseVO.class).getBody();
    }
    /**
     * 잔액조회
     */
    public BankBalanceResponseVO requestBalance(BankBalanceRequestVO bankBalanceRequestVO, String access_token){
        String url = base_url+"/account/balance/fin_num";
        HttpEntity<String> balance = new HttpEntity<>(setHeader(access_token));
        bankBalanceRequestVO.setBankTransIdAndTranssDtime(openBankUtil.getRandomNumber(bankBalanceRequestVO.getBank_tran_id()),openBankUtil.getTransTime());
        
        UriComponents builder = UriComponentsBuilder.fromHttpUrl(url)
                .queryParam("bank_tran_id", makeBankTranId(bankBalanceRequestVO.getBank_tran_id()))
                .queryParam("fintech_use_num", bankBalanceRequestVO.getFintech_use_num())
                .queryParam("tran_dtime",bankBalanceRequestVO.getTran_dtime())
                .build();

        return restTemplate.exchange(builder.toUriString(), HttpMethod.GET, balance, BankBalanceResponseVO.class).getBody();
    }

    public String makeBankTranId(String bankTranId) {
    	// M202201741+U663560342 -> + 제거
        String[] strArr = bankTranId.split("+");
        bankTranId = strArr[0] + strArr[1];
		return bankTranId;
    }
    
    /**
     *
     * 계좌이체
     */
    public AccountTransferResponseVO requestTransfer(String access_token, AccountTransferRequestVO accountTransferRequestVO){
        String url = base_url+"//transfer/withdraw/fin_num";
        accountTransferRequestVO.setTran_dtime(openBankUtil.getTransTime());
        ResponseEntity<AccountTransferRequestVO> param = new ResponseEntity<>(accountTransferRequestVO,setHeader(access_token),HttpStatus.OK);
        return restTemplate.exchange(url, HttpMethod.POST, param, AccountTransferResponseVO.class).getBody();
    }


    /**
     * 헤더에 엑세스 토큰넣기
     * @param access_token
     * @return
     */
    public HttpHeaders setHeader(String access_token){
        httpHeaders.add("Authorization", "Bearer "+access_token);
        return httpHeaders;
    }

}