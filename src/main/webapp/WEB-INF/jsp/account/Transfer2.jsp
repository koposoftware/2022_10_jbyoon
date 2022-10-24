<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- Basic Page Info -->
		<meta charset="utf-8" />
		<title>즉시이체 내역조회</title>

		<!-- Site favicon -->
		<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/vendors/images/bank/hana_logo.png">
		

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
		
		<!-- header를 위한 CSS -->
		<!-- Bootstrap -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainview/plugins/bootstrap/bootstrap.min.css">
		<!-- FontAwesome -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainview/plugins/fontawesome/css/all.min.css">
		<!-- Animation -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainview/plugins/animate-css/animate.css">
		<!-- Template styles-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainview/css/style.css">
		
		
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
					<div class="page-header">
						<div class="row">
							<div class="col-md-6 col-sm-12">
								<div class="title">
									<h2>계좌이체</h2>
									<p>즉시이체가 완료되었습니다.<br>
									타행계좌로의 이체는 해당 은행의 사정에 따라 입금이 다소 지연될 수 있습니다.</p>
								</div>
								<nav aria-label="breadcrumb" role="navigation">
									<ol class="breadcrumb">
										<li class="breadcrumb-item">
											<a href="${pageContext.request.contextPath}/">개인뱅킹</a>
										</li>
										<li class="breadcrumb-item active" aria-current="page">
											이체
										</li>
										<li class="breadcrumb-item active" aria-current="page">
											계좌이체
										</li>
									</ol>
								</nav>
							</div>
							<div class="col-md-6 col-sm-12 text-right">
								<div class="dropdown">
									<a
										class="btn btn-primary dropdown-toggle"
										href="#"
										role="button"
										data-toggle="dropdown"
									>
										January 2018
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a class="dropdown-item" href="#">Export List</a>
										<a class="dropdown-item" href="#">Policies</a>
										<a class="dropdown-item" href="#">View Assets</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="pd-20 bg-white border-radius-4 box-shadow mb-30">
						<h5 style="margin:10px;">이체결과 확인</h5>
						<div>
							<table class="table table-bordered">
							<thead>
								<tr>
									<th scope="col">출금계좌번호</th>
									<th scope="col">입금계좌번호</th>
									<th scope="col">이체금액(원)</th>
									<th scope="col">받는분 예금주명</th>
									<th scope="col">결과</th>
								</tr>
							</thead>
							<tbody id="tbodyInfo">
								<tr>
									<td>${calVO.bankAcctNum}</td>
									<td>${calVO.rcvBankName}<br>${calVO.rcvBankAcctNum}</td>
									<td>${calVO.amountFm}</td>
									<td>${calVO.opponentName}</td>
									<td><span class="badge badge-success">${calVO.chkTranStatus}</span></td>
								</tr>
							</tbody>
						</table>
						
						</div>
						<div style="display: flex;justify-content: flex-end;">
							이체 후 잔액 : ${calVO.balanceFm}원
						</div>
						<br>
						<hr>
						<br>
						<div style="display: flex; justify-content: center; pad">
							<button type="button" class="btn btn-secondary btn-sm" 
									style="padding: 12px;" onclick="location.href='${pageContext.request.contextPath}/acctbook'">이체결과 조회</button>
							&nbsp&nbsp&nbsp
							&nbsp&nbsp&nbsp
							<button type="button" class="btn btn-secondary btn-sm" 
									style="padding: 12px;" onclick="location.href='${pageContext.request.contextPath}/account/transfer1'">이체 다시하기</button>
						</div>
					</div>
					
					<div class="pd-20 bg-white border-radius-4 box-shadow mb-30" style="border: 1px; border-color: gray;">
						<ul style="list-style-type: square; padding-left: 20px;">
							<li>인터넷뱅킹 종료 시, 안전한 금융거래를 위하여 반드시 [로그아웃] 버튼을 눌러 종료하시기 바랍니다.</li>
							<li>고객님의 소중한 금융자산 보호를 위해 이체한도 조회 후 평소 이체금액을 감안하여 이체한도를 조정할 수 있습니다.</li>
							<li>이체한도 감액은 인터넷뱅킹, KEB하나은행 앱, KEB하나은행 영업점에서 처리할 수 있습니다.</li>
							<li>이체한도 증액은 본인이 직접 신분증 지참 후 영업점에 방문하시거나, 하나은행 로그인 후 "이체한도 조회/변경" 메뉴에서 본인인증을 통해 처리하실 수 있습니다.</li>
						</ul>
					</div>
					
				</div>
				
				<jsp:include page="/WEB-INF/jsp/include/footer.jsp"/>
				
			</div>
		</div>
		
		<!-- js -->
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/core.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/script.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/process.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/layout-settings.js"></script>
		
	</body>
</html>
