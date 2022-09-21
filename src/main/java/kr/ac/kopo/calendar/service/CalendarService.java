package kr.ac.kopo.calendar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.calendar.dao.CalendarDAO;
import kr.ac.kopo.calendar.vo.RecordVO;
import kr.ac.kopo.calendar.vo.TranVO;

@Service
public class CalendarService {

	@Autowired
	private CalendarDAO calDao;
	
	public RecordVO insert(RecordVO rvo) {
		System.out.println("CalendarService/insert");
		calDao.insert(rvo);
		
		rvo = calDao.selectOne(rvo);
		return rvo;
	}

	public List<TranVO> selectHana(String id) {
		List<TranVO> list = calDao.selectHana(id);
		System.out.println("Service : " + list);
		return list;
	}
}
