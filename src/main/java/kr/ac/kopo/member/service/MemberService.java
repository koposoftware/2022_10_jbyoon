package kr.ac.kopo.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

@Service
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	public MemberVO login(MemberVO mvo) {
		MemberVO authMember = memberDAO.selectUser(mvo);
		return authMember;
	}
	
	public void insertUser(MemberVO mvo) {
		System.out.println("MemberService/register");
		memberDAO.insertUser(mvo);
	}

	public void UpdateMInfoType(String id) {
		System.out.println("Service / UpdateMInfoType()");
		memberDAO.UpdateMInfoType(id);
	}
	
	public void UpdateOpenType(String id) {
		memberDAO.UpdateOpenType(id);
	}
	
	
	public void saveFile() {
		System.out.println("MemberService/saveFile");
		//memberDAO.insertFile();
	}
	
	// fixedDelay=3000 <=> 3초에 1번 스케줄러 돌림
		// 분 시 일 월 요일(0-6)
//	@Scheduled(fixedDelay = 3000)
//	@Scheduled(cron = "*/5 * * * * *")
//	public void springSchedule() {
//		System.out.println("delay 5초");
//	}
	
}











