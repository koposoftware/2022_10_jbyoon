<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>register page</title>
	<style>
		.error{
			color:red;
		}
	</style>
</head>
<body>
	<!-- Navigation-->
	<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
	<form:form action="${pageContext.request.contextPath}/member/register" method="post" 
				modelAttribute="vo1" style="width:80%; margin:auto;">
		<table>
			<tr>
				<th>성함</th>
				<td>
					<form:input path="name"  size="30"/>
					<form:errors path="name" class="error" />
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<form:input path="id"  size="30"/>
					<form:errors path="id" class="error" />
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<form:input path="pw"  size="30"/>
					<form:errors path="pw" class="error" />
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<form:input path="email"  size="30"/>
					<form:errors path="email" class="error" />
				</td>
			</tr>
			<tr>
				<th>거주지</th>
				<td>
					<form:input path="addr"  size="30"/>
					<form:errors path="addr" class="error" />
				</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>
					<form:input path="phone"  size="30"/>
					<form:errors path="phone" class="error" />
				</td>
			</tr>
			<tr>
				<th>주민등록번호</th>
				<td>
					<form:input path="jumin1"  size="30"/>
					<form:errors path="jumin1" class="error" />
				</td>
			</tr>
		</table>
		<input type="submit" value="가입하기">
	</form:form>
</body>
</html>