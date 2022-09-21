package kr.ac.kopo.board.vo;

import javax.validation.constraints.NotEmpty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardVO {
	private String no;
	private String acctCd;
	private int acctTypeCd;
	private String id;
	@NotEmpty(message = "필수사항입니다.")
	private String writer;
	private String regDate; //reg_date
	private int viewCnt;  //view_cnt
	@NotEmpty(message = "필수사항입니다.")
	private String title;
	@NotEmpty(message = "필수사항입니다.")
	private String content;
	private int replyCnt; // 댓글개수
	
	/*
	  NO NUMBER(5, 0) NOT NULL 
	, ACCT_CD CHAR(4 BYTE) NOT NULL 
	, ACCT_TYPE_CD NUMBER(1, 0) 
	, ID VARCHAR2(100 BYTE) NOT NULL 
	, WRITER VARCHAR2(100 BYTE) NOT NULL 
	, REG_DATE CHAR(32 BYTE) DEFAULT TO_CHAR(SYSDATE, 'YYYYMMDD HH:MM:SS') NOT NULL 
	, VIEW_CNT NUMBER(5, 0) NOT NULL 
	, TITLE VARCHAR2(100 BYTE) NOT NULL 
	, CONTENT VARCHAR2(1000 BYTE) NOT NULL 
	, REPLY_CNT NUMBER(5, 0) 
	*/
	
}
