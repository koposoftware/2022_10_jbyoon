<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>잔액조회</title>
</head>
<body>
	${accountBalance}
	
	<br><br><br>
		잔액
		<p><c:out value="${accountBalance.balance_amt}"></c:out></p>
		은행
		<p>${accountBalance.bank_name}</p>
		
</body>
</html>