package kr.ac.kopo.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.member.vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public MemberVO selectUser(MemberVO mvo) {
//		if(mvo.getType().equals("K")) {
//			// kakao login
//			mvo = sst.selectOne("member.dao.memberDAO.selectUserKakao", mvo);
//		} else {
//			// 일반 login
//			mvo = sst.selectOne("member.dao.memberDAO.selectUser", mvo);			
//		}
		mvo = sst.selectOne("member.dao.memberDAO.login", mvo);
		return mvo;
	}
	
	public String selectiD(MemberVO mvo) {
		String id = sst.selectOne("member.dao.memberDAO.selectId", mvo);
		return id;
	}
	
	public void insertUser(MemberVO member) {
		System.out.println("MemberDAO/registerUser");
		sst.insert("member.dao.memberDAO.registerUser", member);
	}
	
	public void UpdateMInfoType(String id) {
		System.out.println("DAO / UpdateMInfoType()");
		sst.update("member.dao.memberDAO.updateMInfoChk", id);
	}
	
	public void UpdateOpenType(String id) {
		sst.update("member.dao.memberDAO.updateOpenChk", id);
	}

	public void UpdatePayChk(String id) {
		String res = sst.selectOne("member.dao.memberDAO.checkPayAgreed", id);
		System.out.println("res : " + res);
		if(res.equals("N")) {
			sst.update("member.dao.memberDAO.updatePayChk", id);			
		}
	}
	
//------------------------------------------
//  카카오 로그인 
//------------------------------------------	
//    public MemberVO loginKakao(MemberVO vo) {
//    	vo = sst.selectOne("member.dao.memberDAO.selectUserKakao", vo);
//		return vo;
//	}
	
	
}
