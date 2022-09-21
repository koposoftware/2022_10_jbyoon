<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8" />
<title>이체 결과 조회</title>

<!-- Site favicon -->
<link rel="apple-touch-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/resources/vendors/images/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/resources/vendors/images/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/resources/vendors/images/favicon-16x16.png" />

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
			window.dataLayer = window.dataLayer || [];
			function gtag() {
				dataLayer.push(arguments);
			}
			gtag("js", new Date());

			gtag("config", "G-GBZ3SGGX85");
		</script>
<!-- Google Tag Manager -->
<script>
			(function (w, d, s, l, i) {
				w[l] = w[l] || [];
				w[l].push({ "gtm.start": new Date().getTime(), event: "gtm.js" });
				var f = d.getElementsByTagName(s)[0],
					j = d.createElement(s),
					dl = l != "dataLayer" ? "&l=" + l : "";
				j.async = true;
				j.src = "https://www.googletagmanager.com/gtm.js?id=" + i + dl;
				f.parentNode.insertBefore(j, f);
			})(window, document, "script", "dataLayer", "GTM-NXZMQSS");
		</script>
<!-- End Google Tag Manager -->

<script>
	$(document).ready(function(){
		/* 이체 결과 조회 */
		$('#searchBtn').click(function(){
			
			const acctNum = $('#acctNum').val();
			const startDate = $('#startDate').val();
			const endDate = $('#endDate').val();
			const rcvBankAcctNum = $('#rcvBankAcctNum').val();
			
			var url = "";
			if(rcvBankAcctNum === ''){
				url = "/tran/historyList";
			} else {
				url = "/tran/historyListFilter";
			}
			
			const data = {
					acctNum : acctNum,
					startDate : startDate,
					endDate : endDate,
					rcvBankAcctNum : rcvBankAcctNum
			}
			
			$.ajax({
				url:url,
				type:"POST",
				data:data
			})
			.done(function(data){ 
				alert('fdsfds');
				var list = JSON.parse(data); // data 객체화 (배열처리)
				console.log(list);
				
				var html = '';
				
				html = '계좌번호 : ' + acctNum;
				//$('#result-table').append(html);
				$('#temp').empty()
				$('#temp').append(html);
				
				$.each(list, function(index, val){
					html += '<tr>';
					html += '<th>' + (index+1) + '</th>';
					html += '<td>' + val.tranDt + '</td>';
					html += '<td>' + val.rcvBankName + '</td>';
					html += '<td>' + val.rcvBankAcctNum + '</td>';
					html += '<td>' + val.balanceFm + '</td>';
					html += '<td>' + val.opponentName + '</td>';
					html += '<td>' + val.content + '</td>';
					html += '</tr>';
				})
				$('#tbody-historylist').empty()
				$('#tbody-historylist').append(html);
				
			})
			.fail(function(data){
				alert('실패!');
			});
			
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
								<h2>계좌이체결과 조회</h2>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a
										href="${pageContext.request.contextPath}/">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">
										blank</li>
								</ol>
							</nav>
						</div>
						<div class="col-md-6 col-sm-12 text-right">
							<div class="dropdown">
								<a class="btn btn-primary dropdown-toggle" href="#"
									role="button" data-toggle="dropdown"> January
									2018 </a>
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

					<table class="table" style="border-color: #019591; border: 10px;">
						<tr>
							<td align="center"
								style="background-color: #019591; color: white;">*계좌번호</td>
							<td style="padding: 10px;">
								<div class="form-group col-md-5 col-sm-12">
									<select class="form-control" id="acctNum" name="acctNum">
										<c:forEach items="${acctList}" var="account">
											<option value="${account.acctNum}">${account.alias}
												/ ${account.acctNum}</option>
										</c:forEach>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<!-- script.min.js (L100) : date-picker -->
							<td align="center"
								style="background-color: #019591; color: white;">*조회기간</td>
							<td style="padding: 10px;">
								<div class="form-group col-md-5 col-sm-12" style="float: left;">
									<input id="startDate" name="startDate"
										class="form-control date-picker" placeholder="시작일" type="text">
								</div>
								<div class="form-group col-md-1 col-sm-12"
									style="float: left; text-align: center; vertical-align: middle; line-height: 45px;">
									~</div>
								<div class="form-group col-md-5 col-sm-12" style="float: left;">
									<input id="endDate" name="endDate"
										class="form-control date-picker" placeholder="종료일" type="text">
								</div>
								<br>
								<div>
									<button id="1" type="button" class="btn btn-secondary btn-sm"
										style="border-color: #019591; background-color: #019591; color: white;">당일</button>
									<button id="7" type="button" class="btn btn-secondary btn-sm"
										style="border-color: #019591; background-color: #019591; color: white;">1주일</button>
									<button id="30" type="button" class="btn btn-secondary btn-sm"
										style="border-color: #019591; background-color: #019591; color: white;">1개월</button>
									<button id="90" type="button" class="btn btn-secondary btn-sm"
										style="border-color: #019591; background-color: #019591; color: white;">3개월</button>
									<button id="180" type="button" class="btn btn-secondary btn-sm"
										style="border-color: #019591; background-color: #019591; color: white;">6개월</button>
								</div>
							</td>
						</tr>
						<tr>
							<td align="center"
								style="background-color: #019591; color: white;">상대입금계좌</td>
							<td style="padding: 10px;"><input type="text"
								class="form-control" id="rcvBankAcctNum" name="rcvBankAcctNum">
							</td>
						</tr>
					</table>

					<button id="searchBtn" type="button"
						class="btn btn-secondary btn-sm"
						style="border-color: #019591; background-color: #019591; color: white;">확인</button>

				</div>

				<br>
				<div class="pd-20 bg-white border-radius-4 box-shadow mb-30">
					<div id="temp"
						style="width: auto; height: auto; text-align: center; -webkit-text-stroke: medium;"></div>
					<br>

					<div class="table-responsive" id="result-table">
						<table class="table table-bordered">
							<thead>
								<tr style="background-color: #019591; color: white;">
									<th scope="col">No.</th>
									<th scope="col">이체일시</th>
									<th scope="col">입금은행</th>
									<th scope="col">입금계좌</th>
									<th scope="col">출금액(원)</th>
									<th scope="col">받는분</th>
									<th scope="col">내통장표시내용</th>
								</tr>
							</thead>
							<tbody id="tbody-historylist">

							</tbody>
						</table>
					</div>

					<br>

				</div>






			</div>

			<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />

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
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
	<!-- Datatable Setting js -->
	<script
		src="${pageContext.request.contextPath}/resources/vendors/scripts/datatable-setting.js"></script>
	<!-- Google Tag Manager (noscript) 
		<noscript
			><iframe
				src="https://www.googletagmanager.com/ns.html?id=GTM-NXZMQSS"
				height="0"
				width="0"
				style="display: none; visibility: hidden"
			></iframe
		></noscript>
		-->
	<!-- End Google Tag Manager (noscript) -->
</body>


</html>
