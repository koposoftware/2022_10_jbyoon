package kr.ac.kopo.account.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.HanaAccountVO;
import kr.ac.kopo.acctbook.vo.CalendarVO;

@Service
public class HanaService implements AccountService {

	@Autowired
	private AccountDAO acctDao;
	
	@Override
	public List<HanaAccountVO> selectAll(String id) {
		List<HanaAccountVO> list = acctDao.selectAll(id);
		return list;
	}

	@Override
	public void insertAcctInfo(HanaAccountVO vo) {
		acctDao.insertAcctInfo(vo);
	}

	@Override
	public String selectBalance(String bankAcctNum) {
		String balance = acctDao.selectBalance(bankAcctNum);
		return balance;
	}

	@Override
	public String selectPW(String acctNumber) {
		String password = acctDao.selectPW(acctNumber);
		return password;
	}

	@Override
	public String selectBankNm(String rcvBank) {
		String bankNm = acctDao.selectBankNm(rcvBank);
		return bankNm;
	}

	@Override
	public void insertTran(CalendarVO vo) {
		acctDao.insertTran(vo);
	}

}
