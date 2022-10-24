package kr.ac.kopo.account.service;

import java.util.List;

import kr.ac.kopo.account.vo.HanaAccountVO;
import kr.ac.kopo.acctbook.vo.CalendarVO;

public interface AccountService {

	List<HanaAccountVO> selectAcctList(String id);

	void insertAcctInfo(HanaAccountVO vo);

	String selectBalance(String string);

	String selectPW(String acctNumber);

	String selectBankNm(String rcvBank);

	void insertTran(CalendarVO vo);

}
