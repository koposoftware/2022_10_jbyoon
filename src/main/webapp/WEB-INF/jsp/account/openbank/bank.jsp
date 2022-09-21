<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증완료화면</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<body>

<a>${bankResponseToken.access_token}</a>
<a type="hidden">${bankResponseToken.user_seq_no}</a>
<br>

<form id="acount" method="get" action="/account/list">
    <input type="hidden" id="token" name="access_token" value="${bankResponseToken.access_token}">${bankResponseToken.access_token}</input>
    <input type="hidden" id="user_seq_no" name="user_seq_no" value="${bankResponseToken.user_seq_no}">${bankResponseToken.user_seq_no}</input>
    <input type="hidden" id="include_cancel_yn" name="include_cancel_yn" value="Y">${bankResponseToken.user_seq_no}</input>
    <input type="hidden" id="sort_order" name="sort_order" value="D"><c:out value="${bankResponseToken.user_seq_no}"></c:out></input>
    <button type="submit">계좌조회</button>
</form>
</body>
</html>