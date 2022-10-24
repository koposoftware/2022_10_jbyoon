<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.error{
		color:red
	}
</style>
</head>
<body>

<header>
	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp"></jsp:include>
</header>

	write.jsp입니다.
	<form:form action="${pageContext.request.contextPath }/board/write" method="post" modelAttribute="boardVO1">
		<table>
			<tr>
				<th>제목</th>
				<td>
					<form:input path="title" size="30" />  
					<form:errors path ="title" class="error"></form:errors>	
				</td>
			</tr>
			
			<tr>
				<th>작성자</th>
				<td>
					<form:input path="writer" size="30" />
					<form:errors path="writer" class="error"></form:errors>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<form:textarea path="content" cols="40" rows="6"/>
					<form:errors path="content" class="error"></form:errors>
				</td>
			</tr>
		</table>
		<input type="submit" value="입력">
	</form:form>
	
	
	
</body>
</html>







