package kr.ac.kopo.analysis.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.analysis.dao.AnalysisDAO;

@Service
public class AnalysisService {

	@Autowired
	private AnalysisDAO anaDao;

	public List<String> selectWeekExpense(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);

		return anaDao.selectWeekExpense(map);
	}

	public List<String> selectMonthExpense(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);

		return anaDao.selectMonthExpense(map);
	}
	
	public List<String> selectCategoryRate(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);

		return anaDao.selectCategoryRate(map);
	}
	
	public List<String> compareCategory() {
		return anaDao.compareCategory();
	}
	
	public List<String> selectPayTypeCnt(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);

		return anaDao.selectPayTypeCnt(map);
	}
	public List<String> selectQuarterExpense(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);

		return anaDao.selectQuarterExpense(map);
	}
}
