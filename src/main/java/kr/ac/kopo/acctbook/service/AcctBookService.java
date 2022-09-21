package kr.ac.kopo.acctbook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.acctbook.dao.AcctBookDAO;
import kr.ac.kopo.acctbook.vo.CalendarVO;

@Service
public class AcctBookService {

	@Autowired
	private AcctBookDAO abDao;
	
	public void insertOne(CalendarVO vo) {
		abDao.insertOne(vo);
	}
	
	public CalendarVO selectLatestTran() {
		CalendarVO vo = abDao.selectLatestTran();
		return vo;
	}
	
	public String[] selectDayInOut(String date) {
		String[] arrWon = abDao.selectDayInOut(date);
		return arrWon;
	}
	
	public List<CalendarVO> cashSelectAllInOut() {
		List<CalendarVO> list = abDao.cashSelectAllInOut();
		return list;
	}
	
	public List<CalendarVO> acctGroupInOut() {
		List<CalendarVO> list = abDao.acctGroupInOut();
		return list;
	}
	
	
	
	public List<CalendarVO> acctAllInOut() {
		List<CalendarVO> list = abDao.acctAllInOut();
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
}
