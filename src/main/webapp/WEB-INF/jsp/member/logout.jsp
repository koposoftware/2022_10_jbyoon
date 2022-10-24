<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<!-- Basic Page Info -->
		<meta charset="utf-8" />
		<title>로그아웃</title>

		<!-- Site favicon -->
		<link 
			rel="icon" type="image/png"
			href="${pageContext.request.contextPath}/resources/vendors/images/bank/hana_logo.png">

		<!-- Mobile Specific Metas -->
		<meta
			name="viewport"
			content="width=device-width, initial-scale=1, maximum-scale=1"
		/>

		<!-- Google Font -->
		<link
			href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
			rel="stylesheet"
		/>
		<!-- CSS -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendors/styles/core.css" />
		<link
			rel="stylesheet"
			type="text/css"
			href="${pageContext.request.contextPath}/resources/vendors/styles/icon-font.min.css"
		/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendors/styles/style.css" />

	
	</head>
	<body class="login-page">
		<div class="login-header box-shadow">
			<div class="container-fluid d-flex justify-content-between align-items-center">
				<div class="brand-logo">
					<a href="/main" title="메인화면으로 이동"
						style="color: black; text-align: center;"> <img
						src="https://image.kebhana.com/cont/common/img/newmain2021/logo.png"
						alt="하나은행 로고" class="dark-logo"
						style="margin: auto; display: block;" />
					</a>
				</div>
				<%-- <div class="login-menu">
					<ul>
						<li><a href="${pageContext.request.contextPath}/register">Register</a></li>
					</ul>
				</div> --%>
			</div>
		</div>
		<div
			class="login-wrap d-flex align-items-center flex-wrap justify-content-center"
		>
			<div class="container">
				<div class="row align-items-center">
					<div class="col-md-6 col-lg-7">
						<!-- <img src="${pageContext.request.contextPath}/resources/vendors/images/bank/hai_banking.jpg" alt="" /> -->
						<img src="${pageContext.request.contextPath}/resources/vendors/images/login-page-img.png" alt=""/>
					</div>
					<div class="col-md-6 col-lg-5">
					<div class="login-box bg-white box-shadow border-radius-10">
						<div class="login-title">
							<h2 class="text-center">정상적으로 로그아웃되었습니다.</h2>
							<p>
								하나은행을 방문해주셔서 감사합니다.<br> 즐거운 하루 보내시기 바랍니다.<br> <strong>확인</strong>을
								누르시면 메인화면으로 이동합니다.<br>
							</p>
						</div>

						<div class="input-group mb-0"
							style="padding-left: 30px; padding-block: 10px;">
							<input id="backToMainBtn" class="btn btn-primary btn-lg btn-block" type="button"
								value="확인"
								style="width: 300px; height: 45px; background-color: #019591; border-color: #019591;">
						</div>

					</div>
				</div>
				</div>
			</div>
		</div>
		
		<!-- js -->
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/core.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/script.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/process.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/layout-settings.js"></script>
		
		<script>
		$('#backToMainBtn').click(function(){
			location.href='${pageContext.request.contextPath}/main';
		});
		
		</script>
		
	</body>
</html>
