package kr.ac.kopo.pay.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.pay.vo.KakaoPayApprovalVO;

@Repository
public class KakaoPayDAO {

	@Autowired
	private SqlSessionTemplate sst;
	
	public void insertKakaoLog(KakaoPayApprovalVO kakaoVO) {
		sst.insert("payMapper.kakaoLog", kakaoVO);
	}
}
