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
	
	private int mTotalMinus; // 이번달 총 지출
	private int mTotalPlus;  // 이번달 총 수입
	private String mTotalMinusFm;
	private String mTotalPlusFm;
	private String limitFm;
	private String leftOverFm; // (예산 - 총지출)
	private String nowDt; // 오늘 일자
	private int dayLimit;
	private String dayLimitFm;
	private String expectedExpenseFm;
	private String dday;
}
