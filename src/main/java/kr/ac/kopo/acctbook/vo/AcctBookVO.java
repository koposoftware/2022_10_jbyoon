package kr.ac.kopo.acctbook.vo;

import lombok.Data;

@Data
public class AcctBookVO {

	private int no;
	private String bankAcctNum;
	private int amount;
	private String tranDt;
}
