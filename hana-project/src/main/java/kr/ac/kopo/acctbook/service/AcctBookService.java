package kr.ac.kopo.acctbook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.acctbook.dao.AcctBookDAO;
import kr.ac.kopo.acctbook.vo.BudgetVO;
import kr.ac.kopo.acctbook.vo.CalendarVO;

@Service
public class AcctBookService {

	@Autowired
	private AcctBookDAO abDao;
	
//-----------------------------------------------	
//	예산챌린지 기능들
//-----------------------------------------------
	public List<BudgetVO> exist(String id) {
		List<BudgetVO> list = abDao.exist(id);
		return list;
	}
	
	// 이번달 총 지출, 수입
	public BudgetVO mTotalInOut(CalendarVO vo) {
		return abDao.mTotalInOut(vo);
	}
	
	// 예산 설정 금액 저장
	public void saveBudgetInfo(BudgetVO vo) {
		abDao.saveBudgetInfo(vo);
	}
	
	// 예산 금액 수정
	public void updateBudgetAmt(BudgetVO vo) {
		abDao.updateBudgetAmt(vo);
	}
	
// ------------------------------------------------------------
// 현금 가계부 기능들
// ------------------------------------------------------------

	// 캘린더에서 값 insert into DB
	public void cashInsertOne(CalendarVO vo) {
		abDao.cashInsertOne(vo);
	}

	// 맨 처음 캘린더 로드될 때 가져올 각 일자별 입출금 데이터
	public List<CalendarVO> cashGroupInOut(String id) {
		List<CalendarVO> list = abDao.cashGroupInOut(id);
		return list;
	}

	// 모달에 띄울 간단 거래내역
	public List<CalendarVO> cashAllInOut(String id) {
		List<CalendarVO> list = abDao.cashAllInOut(id);
		return list;
	}

// ------------------------------------------------------------
// 계좌 가계부 기능들
// ------------------------------------------------------------	
//	계좌이체 값 insert into DB
//	public void insertOne(CalendarVO vo) {
//		abDao.insertOne(vo);
//	}
	
	public CalendarVO selectLatestTran() {
		CalendarVO vo = abDao.selectLatestTran();
		return vo;
	}
	
//	public String[] acctTotalDayInOut(String date) {
//		String[] arrWon = abDao.acctTotalDayInOut(date);
//		return arrWon;
//	}
	

	
	public List<CalendarVO> acctGroupInOut(String id) {
		List<CalendarVO> list = abDao.acctGroupInOut(id);
		return list;
	}
	
	public List<CalendarVO> acctAllInOut(String id) {
		List<CalendarVO> list = abDao.acctAllInOut(id);
		return list;
	}
	
	public List<CalendarVO> selectAllHistory(CalendarVO calVO) {
		List<CalendarVO> list = abDao.selectAllHistory(calVO);
		return list;
	}
	
	public List<CalendarVO> selectAllHistoryFilter(CalendarVO calVO) {
		List<CalendarVO> list = abDao.selectAllHistoryFilter(calVO);
		return list;
	}

	public List<CalendarVO> acctSelectCalInOut(CalendarVO calVO) {
		List<CalendarVO> list = abDao.acctSelectCalInOut(calVO);
		return list;
	}

	public List<CalendarVO> cashSelectCalInOut(CalendarVO calVO) {
		List<CalendarVO> list = abDao.cashSelectCalInOut(calVO);
		return list;
	}
	

	
}
