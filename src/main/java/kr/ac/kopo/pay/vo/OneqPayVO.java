package kr.ac.kopo.pay.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OneqPayVO {

	// oneqpay table
//	private String bankAcctNum;
//	private String bankAcctAlias;
//	private int balance;
//	private String memberId;
//	
//	// oneqpay_log table
//    private String paymentMethodType;
//    private String itemName;
//    private String approvedAt;
//    private int totalAmt;
//    private String totalAmtFm;
//    private String balanceFm;
    
	private int amount;
	private String tranType;// +, -, 이체
	private String setYM;
	private String memberId;
	private int categoryCd;
	private String opponentName;
	//private String content;
	private String tranDt;
    private String itemName;
    private int balance;
    private String amountFm;
    private String balanceFm;
    private String bankAcctAlias;
    private String bankAcctNum;
    
}
