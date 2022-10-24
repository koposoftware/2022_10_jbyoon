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

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=G-GBZ3SGGX85"></script>

<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<script>
	$(document)
			.ready(
					function() {

						var jsonLocation = "${pageContext.request.contextPath}/resources/json/open_accounts.json";
						$
								.getJSON(
										jsonLocation,
										function(data) {
											var html = '';

											//$('#cardBoxDiv').empty();
											for ( var idx in data) {
												//console.log(data[idx].ALIAS);
												//console.log(html);

												html += '<div class="card card-box col-6 col-md-3" style="margin: 5px 5px 5px 5px;">';
												html += '	<img class="card-img-top" src="${pageContext.request.contextPath}/resources/vendors/images/bank/'+ data[idx].imgPath +'" alt="Card image cap">';
												html += '	<div class="card-body">';
												html += '		<h5 class="card-title weight-300">'
														+ data[idx].alias
														+ '</h5>';
												html += '		<p class="card-text">';
												html += '			계좌 : '
														+ data[idx].acctNum
														+ '<br> 잔액 : '
														+ data[idx].balance
														+ '원';
												html += '		</p>';
												html += '		<a href="${pageContext.request.contextPath}/acctbook" class="btn btn-primary">거래내역 보기</a>';
												html += '	</div>';
												html += '</div>';
											}
											$('#cardBoxDiv').append(html);
										});

					});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/header.jsp" />
	<jsp:include page="/WEB-INF/jsp/include/right-sidebar.jsp" />
	<jsp:include page="/WEB-INF/jsp/include/left-side-bar.jsp" />

	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h2>다른은행 계좌조회</h2>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a
										href="${pageContext.request.contextPath}/main">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">
										다른은행 계좌 목록</li>
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
				<div class="pd-20 bg-white border-radius-4 box-shadow mb-30">
					<!-- 방법#1) getJSON으로 데이터 가져오는 방법 -->
					<div class="row" id="cardBoxDiv"></div>

					<!-- 방법#2) 오픈 api로 데이터 가져오는 방법 -->
					<div class="container">
						<table class="table" style="border: thin; border-color: black;">
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
												<input type="hidden" id="access_token" name="access_token"
													value="${access_token}"></input> <input type="hidden"
													name="bank_tran_id" value="${useCode}+U"></input> <input
													type="hidden" id="fintech_use_num" name="fintech_use_num"
													value="${account.fintech_use_num}"></input>
												<button type="submit">잔액조회</button>
											</form>
										</td>
										<c:if test="${account.account_num_masked eq '5234234***'}">
											<td>주계좌</td>
										</c:if>
										<td>
											<form method="get" action="/transfer"
												if="${account.account_num_masked}=='5234234***'">
												<input type="hidden" name="access_token"
													value="${access_token}"></input> <input type="hidden"
													name="fintech_use_num" value="${account.fintech_use_num}"></input>
												<input type="hidden" name="account_num"
													value="${account.account_num_masked}"></input> <input
													type="hidden" name="bank_tran_id" value="${useCode}+U"></input>
												<input type="hidden" name="req_client_name"
													value="${account.account_holder_name}"></input>
												<button type="submit">간편송금</button>
											</form>
										</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
						<button type="button" id="backBtn" class="btn btn-info"
							style="margin: 0 auto;">돌아가기</button>
						<button type="button" id="openTranBtn" class="btn btn-info"
							style="margin: 0 auto;">계좌이체</button>
						<button type="button" id="openTranHisBtn" class="btn btn-info"
							style="margin: 0 auto;">이체내역조회</button>
						<%-- <a type="button" href="${pageContext.request.contextPath}/main">뒤로가기</a> --%>
					</div>
				</div>

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

</body>
</html>
