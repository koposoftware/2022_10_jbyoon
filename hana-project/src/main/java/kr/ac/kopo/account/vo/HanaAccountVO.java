package kr.ac.kopo.account.vo;

import lombok.Data;

@Data
public class HanaAccountVO {

	/*
	Bank Account (계좌 테이블)
	*/
	private String acctNum;
	private String acctNum_masked;
	private String memberId;
	private int bankCd;
	private String alias;
	private String acctPw;
	private int balance;
	private String createDt;
	private String acctBookChk;
	private String type;
	private String imgPath;
	private String balView;
	
}
