package kr.ac.kopo.util;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class DataFaker {

	@Autowired
	private SqlSessionTemplate sst;

	public static void main(String[] args) throws Exception {
		

	}

}