<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8" />
<title>계좌조회</title>

<!-- Site favicon -->
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/vendors/images/bank/hana_logo.png">


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

		<!-- header를 위한 CSS -->
		<!-- Bootstrap -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainview/plugins/bootstrap/bootstrap.min.css">
		<!-- FontAwesome -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainview/plugins/fontawesome/css/all.min.css">
		<!-- Animation -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainview/plugins/animate-css/animate.css">
		<!-- Template styles-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainview/css/style.css">
		


<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>

</head>
<body>
	
	<!-- header-->
	<jsp:include page="/WEB-INF/jsp/include/header.jsp">
		<jsp:param value="${dday}" name="dday"/>
	</jsp:include>
	
	<div class="mobile-menu-overlay"></div>

	<div class="main-container" style="padding-right: 300px;">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
			<br><br>
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h2>${loginVO.name}님의 전체 계좌 목록</h2>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a
										href="${pageContext.request.contextPath}/main">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">
										하나은행 계좌 목록</li>
								</ol>
							</nav>
						</div>
						<div class="col-md-6 col-sm-12 text-right">
							<div class="dropdown">
								<a class="btn btn-primary dropdown-toggle" href="#"
									role="button" data-toggle="dropdown"> January 2018 </a>
								<div class="dropdown-menu dropdown-menu-right">
									<a class="dropdown-item" href="#">Export List</a> <a
										class="dropdown-item" href="#">Policies</a> <a
										class="dropdown-item" href="#">View Assets</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
						<c:forEach var="account" items="${hanaList}">
							<div class="card card-box col-6 col-md-3"
								style="margin: 5px 5px 5px 20px;">
								<img class="card-img-top"
									src="${pageContext.request.contextPath}/resources/vendors/images/bank/${account.imgPath}"
									alt="Card image cap">
								<div class="card-body">
									<h5 class="card-title weight-300">${account.alias}</h5>
									<p class="card-text">
										계좌 : ${account.acctNum}<br> 잔액 : ${account.balView}원
									</p>
									<a href="${pageContext.request.contextPath}/acctbook"
										class="btn btn-primary">거래내역 보기</a>
								</div>
							</div>
						</c:forEach>
					</div>
				
				<!-- <div class="pd-20 bg-white border-radius-4 box-shadow mb-30"></div> -->

				<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />

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
	<!-- Google Tag Manager (noscript) -->
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NXZMQSS"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<!-- End Google Tag Manager (noscript) -->
</body>
</html>
