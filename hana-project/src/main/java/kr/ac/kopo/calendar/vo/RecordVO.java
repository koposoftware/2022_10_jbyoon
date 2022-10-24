package kr.ac.kopo.calendar.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RecordVO {

	/*
	Expense Record table (가계부)
	수정사항
	- category code : type 변경 String -> int
	- 계좌별칭명 수정 : alias
	- acctTypeCd 삭제
	 * */
	private String tranDt;
	private String acctCd;
	private String tranCd;
	private int categoryCd;
	private String tranType; // 입금 출금
	private String alias; // 거래에 사용된 계좌의 별칭
	private int cost; // 금액
	private String opponent; // 거래처
	private String memo;
	
}
