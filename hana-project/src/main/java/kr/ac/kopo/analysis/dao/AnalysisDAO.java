package kr.ac.kopo.analysis.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AnalysisDAO {

	@Autowired
	private SqlSessionTemplate sst;
	
	public List<String> selectWeekExpense(Map<String, Object> map){
		return sst.selectList("analysis.graph.weeklyExpense", map);
	}
	
	public List<String> selectMonthExpense(Map<String, Object> map){
		return sst.selectList("analysis.graph.monthlyExpense", map);
	}
	
	public List<String> selectCategoryRate(Map<String, Object> map){
		return sst.selectList("analysis.graph.categoryRate", map);
	}
	public List<String> compareCategory(){
		return sst.selectList("analysis.graph.compareCategory");
	}
	public List<String> selectPayTypeCnt(Map<String, Object> map){
		return sst.selectList("analysis.graph.payTypeCnt", map);
	}
	public List<String> selectQuarterExpense(Map<String, Object> map){
		return sst.selectList("analysis.graph.quarterlyExpense", map);
	}
}
