<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8" />
<title>예산 설정 확인</title>

<!-- Site favicon -->
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/vendors/images/bank/oneqpay_icon.png">

<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet" />
<!-- CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendors/styles/core.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendors/styles/icon-font.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendors/styles/style.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendors/styles/policy.css" />

<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>


</head>
<body>

	<div class="main-container">
		<div class="min-height-200px" style="padding: 20px; margin: auto;">
			<div class="pd-20 bg-white border-radius-4 box-shadow mb-30" style="width: 360px; height: auto;">
				<h3 style="text-align: center;">예산 설정중</h3>

				<br> <br>

				<h5 style="text-align: center;">예산 설정을 완료하였습니다.</h5><br>
				<p style="text-align: center;">예산 확인 화면으로 이동합니다.</p><br>

				<br>

				<!-- <button id="" type="button" class="btn btn-info" style=""></button> -->
				<button id="successBtn" type="button" class="btn btn-secondary btn-sm"
						onclick="location.href='${pageContext.request.contextPath}/acctbook'"
						style="display: block; margin: auto; padding: 12px;">확인</button>
			</div>
		</div>
	</div>

	<!-- js -->
	<script
		src="${pageContext.request.contextPath}/resources/vendors/scripts/core.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/scripts/script.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/scripts/process.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/scripts/layout-settings.js"></script>

</body>

</html>
