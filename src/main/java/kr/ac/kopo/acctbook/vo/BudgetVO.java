package kr.ac.kopo.acctbook.vo;

import lombok.Data;

@Data
public class BudgetVO {

	private String setYM;
	private String memberId;
	private String beginDt;
	private String endDt;
	private int currentAmt;
	private int limit;
	private String chk;
	private int amount;
}
