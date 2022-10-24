<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta name="viewport" content="width=device-width, initial-scale=1"
	charset="utf-8" />
<title>결제취소</title>
<!-- Site favicon -->
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/vendors/images/bank/hana_logo.png">
<link rel="stylesheet" media="screen"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/resources/vendors/styles/kakaopay/payment.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendors/styles/kakaopay/main.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="payment">
		<div class="header">
			<img alt=""
				src="https://newsimg.sedaily.com/2018/10/01/1S5QSELHHE_1.jpg"
				style="width: 10%; height: 10%;">
			<!-- <strong><kakaopay></kakaopay></strong> -->
		</div>
		<div class="body">
			<div class="content">
				<p>결제가 취소되었습니다.</p>
				<p>결제상태: QUIT_PAYMENT</p>
				<p>상품명: ${item[0]}</p>
				<p>취소금액: ${item[1]}원</p>
			</div>

			<br>

			<div class="pay_btn">
				<button class="btn_pay btn_pay_hover" type="button"
					onclick="location.href='${pageContext.request.contextPath}/pay'">돌아가기</button>
			</div>
			<br> <br>
			<div class="alert alert-warning">해당 페이지는 카카오페이에서 제공하는 페이지가
				아닙니다.</div>
		</div>
	</div>
</body>
</html>