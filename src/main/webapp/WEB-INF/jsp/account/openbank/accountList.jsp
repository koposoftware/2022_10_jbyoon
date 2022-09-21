<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계좌조회성공</title>
</head>
<body>
<div class="container">
<table class="table">
    <thead>
    <tr>
        <th scope="col">계좌번호</th>
        <th scope="col">은행</th>
        <th scope="col">소유주</th>
    </tr>
    </thead>
    <tbody>
    
    <c:forEach var="account" items="${bankAccounts.getRes_list()}">
    <tr>
        <th><c:out value="${account.getAccount_num_masked()}"></c:out></th>
        <td><c:out value="${account.account_num}"></c:out></td>
        <td><c:out value="${account.getBank_name()}"></c:out></td>
        <td><c:out value="${account.getAccount_holder_name()}"></c:out></td>
        
        <td>
	        <form method="get" action="/balance">
	            <input type="hidden" id="access_token"
	                   name="access_token" value="${access_token}"></input>
	            <input type="hidden" name="bank_tran_id" value="${useCode}+U"></input>
	            <input type="hidden" id="fintech_use_num"
	                   name="fintech_use_num" value="${account.fintech_use_num}"></input>
	            <button type="submit">잔액조회</button>
	        </form>
        </td>
        <c:if test="${account.account_num_masked eq '5234234***'}">
	        <td>주계좌</td>
        </c:if>
        <td>
            <form method="get" action="/transfer" if="${account.account_num_masked}=='5234234***'">
                <input type="hidden" name="access_token" value="${access_token}"></input>
                <input type="hidden" name="fintech_use_num" value="${account.fintech_use_num}"></input>
                <input type="hidden" name="account_num" value="${account.account_num_masked}"></input>
                <input type="hidden" name="bank_tran_id" value="${useCode}+U"></input>
                <input type="hidden" name="req_client_name" value="${account.account_holder_name}"></input>
                <button type="submit">간편송금</button>
        </form>
        </td>
    </tr>
    </c:forEach>
    
    </tbody>
</table>
    <a type="button" href="${pageContext.request.contextPath}/">뒤로가기</a>
</div>

</body>
</html>