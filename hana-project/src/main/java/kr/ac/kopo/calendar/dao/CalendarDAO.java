package kr.ac.kopo.calendar.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.calendar.vo.RecordVO;
import kr.ac.kopo.calendar.vo.TranVO;

@Repository
public class CalendarDAO {

	@Autowired
	private SqlSessionTemplate sst;
	
	public List<RecordVO> selectAll(){
		List<RecordVO> list = sst.selectList("");
		
		return list;
	}
	
	public RecordVO selectOne(RecordVO rvo) {
		rvo = sst.selectOne("calendar.dao.recordDAO.selectByDate", rvo);
		return rvo;
	}
	
	public void insert(RecordVO rvo) {
		System.out.println(rvo);
		sst.insert("calendar.dao.recordDAO.insert", rvo);
	}
	
	public List<TranVO> selectHana(String id) {
		
		List<TranVO> list = sst.selectList("calendar.dao.calendarDAO.selectHana", id);
		
		System.out.println("하나 거래내역 : \n" + list);
		return list;
		
	}
}
