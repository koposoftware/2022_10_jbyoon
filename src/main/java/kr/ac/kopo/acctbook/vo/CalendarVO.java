package kr.ac.kopo.acctbook.vo;

import lombok.Data;

@Data
public class CalendarVO {

	// budgetVO
	private String setYM;
	private String memberId;
	
	// tranhistoryVO
	private int categoryCd;
	private String opponentName;
	private String bankAcctAlias;
	private String tranType;
	private String tranMethod;
	private String content;
	private int balance;
	
	// accountbookVO
	private String tranDt;
	private String bankAcctNum;
	private int amount;
	private String amountFm;
	
	private String dayIn; // 수입 일자
	private String dayOut; // 지출 일자
	// private int monthIn;
	// private int monthOut;
	
	private String rcvBankName;
	private String rcvBankAcctNum;
	private String chkTranStatus;
	private String balanceFm;
	
	private String startDt; // 조회기간 - 시작일
	private String endDt;   // 조회기간 - 마지막일
}
