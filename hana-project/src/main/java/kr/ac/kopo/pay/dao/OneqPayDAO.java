package kr.ac.kopo.pay.dao;

import java.text.DecimalFormat;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.pay.vo.OneqPayVO;

@Repository
public class OneqPayDAO {

	@Autowired
	private SqlSessionTemplate sst;

	public String moneyFormat(int money) {
		DecimalFormat formatter = new DecimalFormat("###,###");
		String won = formatter.format(money);
		return won;
	}
	
	public OneqPayVO selectPayAcctInfo(String id) {
		int cnt = sst.selectOne("payMapper.chkAvailable", id);
		if(cnt == 0) {
			sst.insert("payMapper.createPayForID", id);
			// 첫 계좌 개설 시, 해당 계좌가 주요 거래 통장으로 저장됨
			// 주요 거래 통장으로 등록한 계좌를 원큐페이에 등록시킴
			// 2번째부터는 주요 거래 통장을 변경할 수 있음 (이때 원큐페이 잔액 문제는 상관X b/c 출금 계좌번호, 계좌별칭만 변경될 뿐)
			// 주요 거래통장 변경 시 원큐페이에 등록되는 계좌도 함께 변경됨을 알림 (경고메세지 한 번 띄우기) + bank_acct 테이블에 Y->N, N->Y
		}
		
		OneqPayVO vo = sst.selectOne("payMapper.selectPayAcctInfo", id);
		vo.setBalanceFm(moneyFormat(vo.getBalance()));
		System.out.println("balance 하나머니 잔액 : " + vo.getBalanceFm());
		
		return vo;
	}

	public OneqPayVO insertTranLog(OneqPayVO vo) {
		sst.insert("payMapper.PAYMONEY_TRAN", vo);
		vo.setAmountFm(moneyFormat(vo.getAmount()));
		return vo;
	}
	
}
