package kr.ac.kopo.member.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
	
	private String id;
	private String pw;
	private String name;
	private String email;
	private String addr;
	private String phone;
	private String jumin1;
	private String jumin2;
	private String regDt;
	private String minfoChk;
	private String openChk;
	private String payChk;
	private String type;
	private String profileImage;
}
