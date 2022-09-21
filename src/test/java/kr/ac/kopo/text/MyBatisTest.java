package kr.ac.kopo.text;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.acctbook.vo.CalendarVO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.calendar.vo.TranVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.reply.vo.ReplyVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/spring-mvc.xml"})
public class MyBatisTest {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Test
	public void mybatisT() {
		assertNotNull(sqlSessionTemplate);		
	}
	
//	--------------------------------
//	Board Test
//	--------------------------------
	
//	@Test
	public void boardSelectAllTest() {
		List<BoardVO> boardlist = 
				sqlSessionTemplate.selectList("board.dao.boardDAO.selectAll");
		for(BoardVO board : boardlist) {
			System.out.println(board);
		}
	}
//	@Test /* null 값 반환함 */
	public void boardSelectByNo() {
		BoardVO board = sqlSessionTemplate.selectOne("board.dao.boardDAO.selectByNo", "0003");
		System.out.println(board);
	}

//	@Test
	public void boardInsertTest() {
		BoardVO boardVO = new BoardVO("1010", "0003", 0, "test", "writer", "20022020", 0, "title", "content", 0);
		
		sqlSessionTemplate.insert("board.dao.boardDAO.insert", boardVO);
	}
	
//	@Test /* 안됨 */
	public void increaseReplyCount() {
		sqlSessionTemplate.update("board.dao.boardDAO.increaseReplyCount", "0005");
	}
//	@Test /* 안됨 */
	public void decreaseReplyCount() {
		sqlSessionTemplate.update("board.dao.boardDAO.decreaseReplyCount", "0005");
	}
	
//	@Test
	public void replyInsertTest() {
		ReplyVO replyVO = new ReplyVO();
		replyVO.setContent("content");
		replyVO.setWriter("writer");
		replyVO.setBoardNo(17);
		sqlSessionTemplate.insert("reply.dao.replyDAO.insert", replyVO);
	}
	
	
	
//	--------------------------------
//	Member Test
//	--------------------------------
	
	//@Test
	public void selectUser() {
		MemberVO member = new MemberVO();
		member.setId("woo");
		member.setPw("1234");
		
		MemberVO authMember 
		= sqlSessionTemplate.selectOne("member.dao.memberDAO.selectUser", member);
		
		System.out.println(authMember);
	}
	
//	@Test
	public void registerUser() {
		/*
		 * MemberVO member = new MemberVO("1010", 0, "test", "test", "test" ,
		 * "circle@gmail.com", "서울특별시 구로구", "01011112222", "111111-2222222" , "F",
		 * "19980601", "20220823");
		 */
		
		// sqlSessionTemplate.insert("member.dao.memberDAO.registerUser", member);
	}

	
	//@Test
	public void insertExpenseRecord() {
		/*
		INSERT INTO EXPENSE_RECORD (TRAN_CD, CATEGORY_CD, TRAN_TYPE, ACCT_ALIAS
		                , COST, OPPONENT, MEMO, ACCT_CD, ACCT_TYPE_CD)
		VALUES (LPAD(SEQ_EXPENSERECORD_TRANCD.NEXTVAL, 6, '0')
		, 0
		, '지출'
		, '하나로통장'
		, 10000
		, '은지'
		, '은지한테 10000원 보냄'
		, '0004'
		, 0);
		*/
	}
	
//	@Test
	public void paddingTest() {
		String acctCd = "4";
		int len = 4;
		StringBuilder sb = new StringBuilder();
		for(int i = 0; i < len-(acctCd.length()); i++) {
			sb.append("0");
		}
		
		String padding = sb.toString();
		System.out.println(padding + acctCd);
	}
	
	//@Test
	public void selectTranListTest() {
		
		List<TranVO> list = sqlSessionTemplate.selectList("calendar.dao.calendarDAO.selectHana", "0002");
		System.out.println(list);
		
	}
	
	//@Test
	public void procedureTest() {
		// 하나로 결제
		TranVO vo = new TranVO();
		vo.setTranType("출금");
		vo.setBankAcctNum("220-11112222");
		vo.setOpponent("피자헛");
		vo.setCost(26000);
		vo.setAcctCd("0002");
		sqlSessionTemplate.insert("calendar.dao.calendarDAO.HANA_PROCEDURE", vo);
		List<TranVO> list = sqlSessionTemplate.selectList("calendar.dao.calendarDAO.selectHana", vo.getAcctCd());
		
		System.out.println("하나 거래내역 : \n" + list);
		
	}
	
	//@Transactional
	//@Test
	public void InsertFromCal() {  // 아직 실패
		CalendarVO vo = new CalendarVO();
		
		vo.setSetYM("2022-09");
		vo.setMemberId("f");
		vo.setCategoryCd(0);
		vo.setOpponentName("또봉이통닭");
		vo.setBankAcctAlias("테스트카드");
		vo.setTranType("-");
		vo.setContent("0914 / 통닭먹음");
		vo.setAmount(23000);
		vo.setTranMethod("계좌");
		vo.setBankAcctNum("220-10102300"); // 테스트통장	
				
		sqlSessionTemplate.insert("acctbook.dao.acctbookDAO.ACCTBOOK_INSERT_MYSELF", vo);
	}
	
}































