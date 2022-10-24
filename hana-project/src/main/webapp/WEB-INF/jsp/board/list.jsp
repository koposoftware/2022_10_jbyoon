<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</head>
<body>
 <header>
	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp"></jsp:include>
</header> 
 	<br>
 	<table 	 class="table table-striped" style="width:80%; margin:auto">	
 		<tr>
 			<th>번호</th>
 			<th>제목</th>
 			<th>작성자</th>
 			<th>등록일</th>
 		</tr>
 		
	 	<c:forEach items="${boardlist }" var="board">
	 		<tr>
	 			<td>${board.no }</td>	 			 
	 			<td>	 			 
	 				<a href="${pageContext.request.contextPath }/board/detail/${board.no}">
	 					${board.title } [ ${board.replyCnt }]
 					</a>
				</td>
	 			<td>${board.writer }</td>
	 			<td>${board.regDate}</td> 
			</tr>
		</c:forEach>

	</table>













</body>
</html>