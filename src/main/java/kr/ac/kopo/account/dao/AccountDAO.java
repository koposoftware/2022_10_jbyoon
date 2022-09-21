package kr.ac.kopo.account.dao;

import java.util.List;

import kr.ac.kopo.account.vo.HanaAccountVO;
import kr.ac.kopo.acctbook.vo.CalendarVO;

public interface AccountDAO {

	List<HanaAccountVO> selectAll(String id);

	void insertAcctInfo(HanaAccountVO vo);

	String selectBalance(String bankAcctNum);

	String selectPW(String acctNumber);

	String selectBankNm(String rcvBank);

	void insertTran(CalendarVO vo);

}
