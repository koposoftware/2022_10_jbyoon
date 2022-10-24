<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<!-- Basic Page Info -->
		<meta charset="utf-8" />
		<title>login</title>

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
								<h2 class="text-center text-primary">로그인이 필요합니다</h2>
							</div>
							
							<form:form class="login-form" action="${ pageContext.request.contextPath }/login" 
										method="post" modelAttribute="memberVO">
								<div class="select-role">
									<div class="btn-group btn-group-toggle" data-toggle="buttons">
										<label class="btn active">
											<input type="radio" name="options" id="admin" />
											<div class="icon">
												<img
													src="${pageContext.request.contextPath}/resources/vendors/images/briefcase.svg"
													class="svg"
													alt=""/>
											</div>
											<span>I'm</span>
											Manager
										</label>
										<label class="btn">
											<input type="radio" name="options" id="user" />
											<div class="icon">
												<img
													src="${pageContext.request.contextPath}/resources/vendors/images/person.svg"
													class="svg"
													alt=""/>
											</div>
											<span>I'm</span>
											Employee
										</label>
									</div>
								</div>
								
								<!-- ID 입력칸 -->
								<div class="input-group custom">
									<form:input path="id" type="text" 
												class="form-control form-control-lg" 
												placeholder="Username"/>
									<form:errors path="id"></form:errors>
									
									<div class="input-group-append custom">
										<span class="input-group-text">
											<i class="icon-copy dw dw-user1"></i>
										</span>
									</div>
								</div>
								
								<!-- PW 입력칸 -->
								<div class="input-group custom">
									<form:input path="pw" type="password" 
												class="form-control form-control-lg" 
												placeholder="**********"/>
									<form:errors path="pw"></form:errors>
									
									<div class="input-group-append custom">
										<span class="input-group-text">
											<i class="dw dw-padlock1"></i>
										</span>
									</div>
								</div>
								
								<div class="row pb-30">
									<div class="col-6">
										<div class="custom-control custom-checkbox">
											<input
												type="checkbox"
												class="custom-control-input"
												id="customCheck1" />
											<label class="custom-control-label" for="customCheck1">
												Remember</label>
										</div>
									</div>
									<div class="col-6">
										<div class="forgot-password">
											<a href="forgot-password.html">Forgot Password</a>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<div class="input-group mb-0">
											<!-- <input class="btn btn-primary btn-lg btn-block" type="submit" value="Sign In"> -->
											<a id="kakao-login-btn"
												href="${kakao_url}"
												class="btn btn-kakao btn-user btn-block"> 
												<img id="kakao-link-btn" src="${pageContext.request.contextPath}/resources/vendors/images/bank/kakao_login_medium_wide.png">
											</a>
										</div>
										<div class="input-group mb-0" style="padding-left: 30px; padding-block: 10px;">
											<input class="btn btn-primary btn-lg btn-block" type="submit" value="하나 계정 로그인" style="width: 300px; height: 45px; background-color: #019591; border-color: #019591;">
										</div>
										<div class="input-group mb-0" style="padding-left: 30px; padding-block: 10px;">
											<a  class="btn btn-outline-primary btn-lg btn-block"
												style="width: 300px; height: 45px; border-color: #019591; color: #019591;"
												href="${pageContext.request.contextPath}/member/register">
												회원가입</a>
										</div>
									</div>
								</div>
							</form:form>
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
			$('#kakao-login-btn').click(function(){
				Kakao.init("1b55a15d629fd7d609f6aba04731f513");
		        Kakao.Link.sendCustom({
		            templateId: 84293
		        });
			});
		</script>
	</body>
</html>
