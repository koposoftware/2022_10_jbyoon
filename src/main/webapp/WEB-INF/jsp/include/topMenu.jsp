<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table>
		<tr>
			<td rowspan="2">
				<a href="${pageContext.request.contextPath }">
					<img src="${pageContext.request.contextPath }/resources/assets/img/logo.png">
				</a>
			</td>
			<td align="right" >
				<c:if test="${not empty loginVO}">
					${loginVO.name }님. 안녕하세요.
				</c:if>				
			</td>
		</tr>
		<tr>
			<td>
				<a href="${pageContext.request.contextPath}/board"> 게시판 </a> 
				<a href="${pageContext.request.contextPath}/board/write"> 새글쓰기 </a>
				<c:choose>
					<c:when test="${ not empty loginVO}">				
						<a href="${pageContext.request.contextPath}/logout"> 로그아웃 </a>
					</c:when>
					<c:otherwise>				
						<a href="${pageContext.request.contextPath}/member/register"> 회원가입 </a>
						<a href="${pageContext.request.contextPath}/login"> 로그인 </a>
					</c:otherwise>		
				</c:choose>
			</td> 		
		</tr>
		
	</table>
</body>
</html>











