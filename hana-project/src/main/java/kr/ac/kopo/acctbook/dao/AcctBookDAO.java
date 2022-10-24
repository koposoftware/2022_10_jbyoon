package kr.ac.kopo.acctbook.dao;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.acctbook.vo.BudgetVO;
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

// ------------------------------------------------------------
// 예산 챌린지 기능들
// ------------------------------------------------------------
	// 이번달 예산 설정한적 있는지 확인, 있다면 설정된 값 조회
	public List<BudgetVO> exist(String id) {
		Date nowDate = new Date();
		SimpleDateFormat date = new SimpleDateFormat("d");
		double nowDt = Double.parseDouble(date.format(nowDate));
		
		List<BudgetVO> list = sst.selectList("acctbook.dao.acctbookDAO.monthlyInfo", id); // 설정된 예산금액, 현재까지 총 지출액
		
		if(list.size() == 0) {
			return null;
		} else {
			double limit = Double.valueOf(list.get(0).getLimit());
			double currAmt = Double.valueOf(list.get(0).getCurrentAmt());
			double endDt = Double.parseDouble(list.get(0).getEndDt());

			// 필요한 값 설정 : 하루 예산, 총예상지출, 오늘까지 권장지출, 오늘까지 권장지출, 남은 예산
			// 한 달 예산 : limitFm
			list.get(0).setLimitFm(moneyFormat((int)limit));
			
			// 현재 남은 금액 : limit - currentAmt
			int leftOverAmt = (int) (limit - currAmt);
			if(leftOverAmt < 0) {
				leftOverAmt = (int) (currAmt - limit);
				list.get(0).setLeftOverFm(moneyFormat(leftOverAmt));
			}
			else list.get(0).setLeftOverFm(moneyFormat(leftOverAmt));
			
			// 하루 예산(오늘까지 권장 지출) : limit / endDt
			int dayLimit = (int) ((limit - currAmt) / (endDt - (nowDt-1)));
			if(dayLimit < 0) {
				list.get(0).setDayLimit(0);
				list.get(0).setDayLimitFm("0");
			} else {
				list.get(0).setDayLimit(dayLimit);
				list.get(0).setDayLimitFm(moneyFormat(dayLimit));
			}
			
			// 지금 소비금액 분석 후 총 예상 지출 : (currentAmt/nowDt)*endDt
			int expected = (int)(currAmt / nowDt * endDt);
			list.get(0).setExpectedExpenseFm(moneyFormat(expected));
			
		}
		return list;
	}

	// 이번달 총 지출, 수입
	public BudgetVO mTotalInOut(CalendarVO calVO) {
		int amt = 0;
		calVO.setTranType("-");
		System.out.println("calVO : " + calVO);
		amt = sst.selectOne("acctbook.dao.acctbookDAO.mTotalInOut", calVO);
		
		BudgetVO bgtVO = new BudgetVO();
		bgtVO.setMTotalMinus(amt);
		bgtVO.setMTotalMinusFm(moneyFormat(amt));

		calVO.setTranType("+");
		amt = sst.selectOne("acctbook.dao.acctbookDAO.mTotalInOut", calVO);
		bgtVO.setMTotalPlus(amt);
		bgtVO.setMTotalPlusFm(moneyFormat(amt));

		return bgtVO;
	}

	// 설정한 예산 정보 저장
	public void saveBudgetInfo (BudgetVO vo) {
		System.out.println("budget VO : " + vo);
		sst.insert("acctbook.dao.acctbookDAO.setMonthlyBudget", vo);
	}
	
	// 예산 금액 수정
	public void updateBudgetAmt(BudgetVO vo) {
		sst.update("acctbook.dao.acctbookDAO.updateBudget", vo);
	}
	
// ------------------------------------------------------------
// 계좌 이체/거래 관련 기능들
// ------------------------------------------------------------	
	// 가장 최근에 insert한 거래내역 1건 조회
	public CalendarVO selectLatestTran() {
		CalendarVO vo = sst.selectOne("acctbook.dao.acctbookDAO.selectLatest");
		vo.setAmountFm(moneyFormat(vo.getAmount()));
		return vo;
	}
	
	/*
	// 전체 거래내역 조회
	public List<CalendarVO> selectAllTran() {
		List<CalendarVO> list = sst.selectList("acctbook.dao.acctbookDAO.selectAllTran");
		return list;
	}
	
	// 기간으로 거래내역 조회
	
	 * public List<CalendarVO> selectAllTran(CalendarVO vo) { List<CalendarVO> list
	 * = sst.selectList("acctbook.dao.acctbookDAO.searchTranByDates", vo); return
	 * list; }
	 */
	
//	public String[] acctTotalDayInOut(String date) {
//		System.out.println("date : " + date);
//		
//		String dayIn = sst.selectOne("acctbook.dao.acctbookDAO.acctTotalDayIn", date);
//		String dayOut = sst.selectOne("acctbook.dao.acctbookDAO.acctTotalDayOut", date);
//		
//		dayIn = "+" + moneyFormat(Integer.parseInt(dayIn));
//		dayOut = "-" + moneyFormat(Integer.parseInt(dayOut));
//		
//		String[] arrWon = {dayIn, dayOut};
//		return arrWon;
//	}

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
	// 캘린더에 직접 거래내역 입력, 저장
	public void cashInsertOne(CalendarVO vo) {
		System.out.println("프로시저 넣을 파라미터 : \n" + vo);

		sst.insert("acctbook.dao.acctbookDAO.CASHBOOK_INOUT", vo);
		vo = sst.selectOne("acctbook.dao.acctbookDAO.selectLatest", vo);
		String won = moneyFormat(vo.getAmount());
		vo.setAmountFm(won);

		System.out.println("DAO / cashInsertOne :\n" + vo);
	}

	// 캘린더 처음 로드될 때 일별 지출,수입 list로 조회
	public List<CalendarVO> cashGroupInOut(String id) {
		System.out.println(id);
		List<CalendarVO> list = sst.selectList("acctbook.dao.acctbookDAO.cashGroupMonthInOut", id);

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

	// 가계부 날짜별 간단 거래내역 (모달에 띄울 내용)
	public List<CalendarVO> cashAllInOut(String id) {
		List<CalendarVO> list = sst.selectList("acctbook.dao.acctbookDAO.cashAllMonthInOut", id);

		for (int i = 0; i < list.size(); i++) {
			list.get(i).setAmountFm(moneyFormat(list.get(i).getAmount()));
			//System.out.println("test : " + list.get(i));
		}
		return list;
	}


// ------------------------------------------------------------
// 계좌 가계부 기능들
// ------------------------------------------------------------
		
	// 캘린더 처음 로드될 때 일별 지출,수입 list로 조회
	public List<CalendarVO> acctGroupInOut(String id) {
		List<CalendarVO> list = new ArrayList<>();
		list.addAll(sst.selectList("acctbook.dao.acctbookDAO.acctGroupMonthInOut", id));
		//list.addAll(sst.selectList("acctbook.dao.acctbookDAO.acctGroupMonthOut", id));

		// System.out.println("최종 list입니다 :");
		for (int i = 0; i < list.size(); i++) {
			String won = moneyFormat(list.get(i).getAmount());
			if (list.get(i).getTranType().equals("+")) {
				list.get(i).setAmountFm("+" + won);
			} else {
				list.get(i).setAmountFm("-" + won);
			}

//			System.out.println(list.get(i));
		}
		return list;
	}
	
//	가계부 날짜별 간단 거래내역 (모달에 띄울 내용)
	public List<CalendarVO> acctAllInOut(String id) {
		List<CalendarVO> list = sst.selectList("acctbook.dao.acctbookDAO.acctAllMonthInOut", id);

		for (int i = 0; i < list.size(); i++) {
			list.get(i).setAmountFm(moneyFormat(list.get(i).getAmount()));
			list.get(i).setBalanceFm(moneyFormat(list.get(i).getBalance()));
		}
		return list;
	}

//	가계부 기간으로 조회 (기간에 해당되는 데이터 전체조회)
	public List<CalendarVO> acctSelectCalInOut(CalendarVO calVO) {
		List<CalendarVO> list = new ArrayList<>();
		
		calVO.setTranType("+");
		list.addAll(sst.selectList("acctbook.dao.acctbookDAO.acctPeriodInOut", calVO));
		calVO.setTranType("-");
		list.addAll(sst.selectList("acctbook.dao.acctbookDAO.acctPeriodInOut", calVO));
		
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setAmountFm(moneyFormat(list.get(i).getAmount()));
			list.get(i).setBalanceFm(moneyFormat(list.get(i).getBalance()));
			System.out.println(list.get(i));
		}
		return list;
	}

	public List<CalendarVO> cashSelectCalInOut(CalendarVO calVO) {
		List<CalendarVO> list = new ArrayList<>();
		
		calVO.setTranType("+");
		list.addAll(sst.selectList("acctbook.dao.acctbookDAO.cashPeriodInOut", calVO));
		calVO.setTranType("-");
		list.addAll(sst.selectList("acctbook.dao.acctbookDAO.cashPeriodInOut", calVO));
		
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setAmountFm(moneyFormat(list.get(i).getAmount()));
			System.out.println(list.get(i));
		}
		
		return list;
	}

	

}
