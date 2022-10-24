package kr.ac.kopo.calendar.vo;

import lombok.Data;

@Data
public class TranVO {

	/*
	 * 거래내역 조회를 위한 VO
	Tran history , bank account 테이블 2개 사용됨
	
	*/
	
	private String tranType; // 입출금
	private String alias; // 통장 별칭
	private String opponent; // 거래처
	private int cost; // 거래금액
	private int balance; // 잔액 (bank_acct 테이블)
	private String tranDt; // 결제일
	
	private int bankCd; // 은행번호 (bank_acct 테이블)
	private String tranCd; // 거래번호
	private String acctCd; // 회원번호
	private String bankAcctNum; // 계좌번호
}
