<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본인 인증</title>
</head>
<body>
	<h2>1단계 : 사용자 인증 API 호출</h2>

	<c:if test="${access_token eq null}">
		<form id="authorizeFrm" name="authorizeFrm" method="get" action="https://testapi.openbanking.or.kr/oauth/2.0/authorize">
		    <!-- API Key (회원(이용기관)의 Client ID) -->
		    <input type="hidden" name="client_id" value="${clientId}"/>
		    <!-- token 허용 범위 - 로그인, 조회, 이체 -->
		    <input type="hidden" name="scope" value="login inquiry transfer"/>
		    
		    <input type="hidden" name="redirect_uri" value="${redirectUri}"/>
		    <!-- 사용자 인증 타입 구분 (0:최초인증, 2:인증생략) -->
		    <input type="hidden" name="auth_type" value="0"/>
		    <!-- OAuth 2.0 인증 요청 시 반환되는 형태 -->
		    <input type="hidden" name="response_type" value="code"/>
		    <!-- CSRF 보안위협에 대응하기 위해 이용기관이 셋팅하는 난수값 -->
		    <input type="hidden" name="state" value="b80BLsfigm9OokPTjy03elbJqRHOfGSY"/>
		    
		    <button type="submit">토큰발급</button>
		</form>
	</c:if>
	
	
	<p><c:out value="${temporals.createNow()}"></c:out></p>
	
	<form id="acount" method="get" action="/account/list">
	    <input type="hidden" id="token" name="access_token" value="${access_token}"></input>
	    <input type="hidden" id="user_seq_no" name="user_seq_no" value="1100771263"></input>
	    <input type="hidden" id="include_cancel_yn" name="include_cancel_yn" value="N"></input>
	    <input type="hidden" id="sort_order" name="sort_order" value="D"></input>
	    <button type="submit">계좌조회</button>
	</form>
	
	
</body>
</html>