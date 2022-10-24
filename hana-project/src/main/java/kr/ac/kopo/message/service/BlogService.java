package kr.ac.kopo.message.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("blobService")
public class BlogService {
	
//	@Autowired
//	private BlogDao dao;

	@Autowired
	private SqlSessionTemplate sst;
	
    public void updateAlert() {
    	System.out.println("여기 들어옴!!!!!!");
		
		Date nowDate = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy.MM");
		String budgetMonth = date.format(nowDate);
    	
		System.out.println(budgetMonth);
		
		date = new SimpleDateFormat("dd");
		int today = Integer.parseInt(date.format(nowDate));
		
		String dt = sst.selectOne("acctbook.dao.acctbookDAO.bgtExist", budgetMonth);
		System.out.println("dt : " + dt);
		
		if(dt != null || dt.equals("")) {
			int endDt = Integer.parseInt(dt);
			System.out.println(endDt);
			
			// 예산 등록 되어있다면 -> update dday 컬럼 : endDt - today
			Map<String, String> map = new HashMap<>();
			map.put("dday", String.valueOf(endDt - today));
			map.put("setym", budgetMonth);
			
			System.out.println("fdsfds : " + String.valueOf(endDt - today));
			sst.update("acctbook.dao.acctbookDAO.updateDday", map);
		}
    }
    
    
}
