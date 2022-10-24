package kr.ac.kopo.account.dao;

import java.text.DecimalFormat;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.account.vo.HanaAccountVO;
import kr.ac.kopo.acctbook.vo.CalendarVO;

@Repository
public class HanaAccountDAO implements AccountDAO {

	@Autowired
	private SqlSessionTemplate sst;

	public String moneyFormat(int money) {
		DecimalFormat formatter = new DecimalFormat("###,###");
		String won = formatter.format(money);
		return won;
	}
	
	@Override
	public List<HanaAccountVO> selectAcctList(String id) {
		List<HanaAccountVO> list = sst.selectList("account.dao.HanaAccountDAO.selectByID", id);
		System.out.println("하나은행 거래선택 전체조회");
		
		for(int i = 0; i < list.size(); i++) {
			String won = moneyFormat(list.get(i).getBalance());
			list.get(i).setBalView(won); 				
			
			System.out.println(list.get(i));
		}
		
		return list;
	}

	@Override
	public void insertAcctInfo(HanaAccountVO vo) {
		sst.insert("account.dao.HanaAccountDAO.insertNewAcct", vo);
	}

	@Override
	public String selectBalance(String bankAcctNum) {
		String balance = sst.selectOne("account.dao.HanaAccountDAO.selectBalance", bankAcctNum);
		String won = moneyFormat(Integer.parseInt(balance));
		
		return won;
	}

	@Override
	public String selectPW(String acctNumber) {
		String password = sst.selectOne("account.dao.HanaAccountDAO.selectPW", acctNumber);
		return password;
	}

	@Override
	public String selectBankNm(String rcvBank) {
		String bankNm = sst.selectOne("account.dao.HanaAccountDAO.selectBankNm", rcvBank);
		return bankNm;
	}

	@Override
	public void insertTran(CalendarVO vo) {
		sst.insert("acctbook.dao.acctbookDAO.ACCTBOOK_INOUT", vo);
		vo = sst.selectOne("acctbook.dao.acctbookDAO.selectLatest", vo);
		
		String won = moneyFormat(vo.getAmount());
		vo.setAmountFm(won);
		
		System.out.println("DAO / calVO :\n" + vo);
	}

}
