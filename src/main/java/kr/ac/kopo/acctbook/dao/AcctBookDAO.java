package kr.ac.kopo.acctbook.dao;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.acctbook.vo.CalendarVO;

@Repository
public class AcctBookDAO {

	@Autowired
	private SqlSessionTemplate sst;
	
	public String moneyFormat(int money) {
		DecimalFormat formatter = new DecimalFormat("###,###");
		String won = formatter.format(money);
		return won;
	}
	
	// 캘린더에 직접 거래내역 입력, 저장
	public void insertOne(CalendarVO vo) {
		sst.insert("acctbook.dao.acctbookDAO.ACCTBOOK_INOUT", vo);
	}

	// 가장 최근에 insert한 거래내역 조회
	public CalendarVO selectLatestTran() {
		CalendarVO vo = sst.selectOne("acctbook.dao.acctbookDAO.selectLatest");
		vo.setAmountFm(moneyFormat(vo.getAmount()));
		return vo;
	}
	
	// 전체 거래내역 조회
	public List<CalendarVO> selectAllTran() {
		List<CalendarVO> list = sst.selectList("acctbook.dao.acctbookDAO.selectAllTran");
		return list;
	}
	
	// 기간으로 거래내역 조회
	public List<CalendarVO> selectAllTran(CalendarVO vo) {
		List<CalendarVO> list = sst.selectList("acctbook.dao.acctbookDAO.searchTranByDates", vo);
		return list;
	}
	
	public String[] selectDayInOut(String date) {
		System.out.println("date : " + date);
		
		String dayIn = sst.selectOne("acctbook.dao.acctbookDAO.selectDayIn", date);
		String dayOut = sst.selectOne("acctbook.dao.acctbookDAO.selectDayOut", date);
		
		dayIn = "+" + moneyFormat(Integer.parseInt(dayIn));
		dayOut = "-" + moneyFormat(Integer.parseInt(dayOut));
		
		String[] arrWon = {dayIn, dayOut};
		return arrWon;
	}

	public List<CalendarVO> selectAllHistory(CalendarVO calVO) {
		List<CalendarVO> list = sst.selectList("acctbook.dao.acctbookDAO.searchTranByDates", calVO);
		
		for(int i = 0; i < list.size(); i++) {
			String won = moneyFormat(list.get(i).getAmount());
			list.get(i).setBalanceFm(won); 		
			
			String[] arr = list.get(i).getContent().split(";");
			
			list.get(i).setContent(arr[0]); // 내통장표시내용
			list.get(i).setRcvBankName(arr[1]); // 입금자 은행 이름
			list.get(i).setRcvBankAcctNum(arr[2]); // 입금자 계좌번호
			
			System.out.println(list.get(i));
		}
		
		return list;
	}

	public List<CalendarVO> selectAllHistoryFilter(CalendarVO calVO) {
		List<CalendarVO> list = sst.selectList("acctbook.dao.acctbookDAO.searchTranByDatesFilter", calVO);
		
		for(int i = 0; i < list.size(); i++) {
			String won = moneyFormat(list.get(i).getAmount());
			list.get(i).setBalanceFm(won); 				
			
			String[] arr = list.get(i).getContent().split(";");
			
			list.get(i).setContent(arr[0]); // 내통장표시내용
			list.get(i).setRcvBankName(arr[1]); // 입금자 은행 이름
			list.get(i).setRcvBankAcctNum(arr[2]); // 입금자 계좌번호
			
			System.out.println(list.get(i));
		}
		return list;
	}
	
	
	// ------------------------------------------------------------
	// 현금 가계부 기능들
	// ------------------------------------------------------------
	public List<CalendarVO> cashSelectAllInOut() {
		List<CalendarVO> list = new ArrayList<>();
		list.addAll(sst.selectList("acctbook.dao.acctbookDAO.cashSelectMonthIn"));
		list.addAll(sst.selectList("acctbook.dao.acctbookDAO.cashSelectMonthOut"));

		// System.out.println("최종 list입니다 :");
		for (int i = 0; i < list.size(); i++) {
			String won = moneyFormat(list.get(i).getAmount());
			if (list.get(i).getTranType().equals("+")) {
				list.get(i).setAmountFm("+" + won);
			} else {
				list.get(i).setAmountFm("-" + won);
			}

			System.out.println(list.get(i));
		}
		return list;
	}

	// ------------------------------------------------------------
	// 계좌 가계부 기능들
	// ------------------------------------------------------------

	// 캘린더 처음 로드될 때 일별 지출,수입 list로 조회
	public List<CalendarVO> acctGroupInOut() {
		List<CalendarVO> list = new ArrayList<>();
		list.addAll(sst.selectList("acctbook.dao.acctbookDAO.acctGroupMonthIn"));
		list.addAll(sst.selectList("acctbook.dao.acctbookDAO.acctGroupMonthOut"));

		// System.out.println("최종 list입니다 :");
		for (int i = 0; i < list.size(); i++) {
			String won = moneyFormat(list.get(i).getAmount());
			if (list.get(i).getTranType().equals("+")) {
				list.get(i).setAmountFm("+" + won);
			} else {
				list.get(i).setAmountFm("-" + won);
			}

			System.out.println(list.get(i));
		}
		return list;
	}
	
	public List<CalendarVO> acctAllInOut() {
		List<CalendarVO> list = sst.selectList("acctbook.dao.acctbookDAO.acctAllMonthInOut");
		/* list.addAll(sst.selectList("acctbook.dao.acctbookDAO.acctAllMonthOut")); */

		// System.out.println("최종 list입니다 :");
		for (int i = 0; i < list.size(); i++) {
			String won = moneyFormat(list.get(i).getAmount());
			if (list.get(i).getTranType().equals("+")) {
				list.get(i).setAmountFm("+" + won);
			} else {
				list.get(i).setAmountFm("-" + won);
			}

			System.out.println(list.get(i));
		}
		return list;
	}

	public List<CalendarVO> acctSelectCalInOut(CalendarVO calVO) {
		List<CalendarVO> list = new ArrayList<>();
		list.addAll(sst.selectList("acctbook.dao.acctbookDAO.acctPeriodIn", calVO));
		list.addAll(sst.selectList("acctbook.dao.acctbookDAO.acctPeriodOut", calVO));

		// System.out.println("최종 list입니다 :");
		for (int i = 0; i < list.size(); i++) {
			String won = moneyFormat(list.get(i).getAmount());
			if (list.get(i).getTranType().equals("+")) {
				list.get(i).setAmountFm("+" + won);
			} else {
				list.get(i).setAmountFm("-" + won);
			}

			System.out.println(list.get(i));
		}
		return list;
	}

}
