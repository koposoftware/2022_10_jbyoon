package kr.ac.kopo.pay.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DebitCardTranVO {

	private String STAT_CODE;
	private String STAT_NAME;
	private String ITEM_CODE1;
	private String ITEM_NAME1;
	private String ITEM_CODE2;
	private String ITEM_NAME2;
	private String ITEM_CODE3;
	private String ITEM_NAME3;
	private String ITEM_CODE4;
	private String ITEM_NAME4;
	private String UNIT_NAME;
	private String TIME;
	private String DATA_VALUE;
	
//	"STAT_CODE":"601Y002",
//	"STAT_NAME":"7.5.2. 지역별 소비유형별 개인 신용카드",
//	"ITEM_CODE1":"A",
//	"ITEM_NAME1":"서울",
//	"ITEM_CODE2":"1000",
//	"ITEM_NAME2":"합계",
//	"ITEM_CODE3":"DAV",
//	"ITEM_NAME3":"월간 일평균",
//	"ITEM_CODE4":null,
//	"ITEM_NAME4":null,
//	"UNIT_NAME":"백만원 ",
//	"TIME":"202201",
//	"DATA_VALUE":"943786"
}
