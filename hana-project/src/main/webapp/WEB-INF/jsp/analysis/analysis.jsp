<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8" />
<title>가계부 분석</title>

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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/mainview/plugins/bootstrap/bootstrap.min.css">
<!-- FontAwesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/mainview/plugins/fontawesome/css/all.min.css">
<!-- Animation -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/mainview/plugins/animate-css/animate.css">
<!-- Template styles-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/mainview/css/style.css">

<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.7.0"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script> -->

</head>
<body>

	<!-- header-->
	<jsp:include page="/WEB-INF/jsp/include/header.jsp">
		<jsp:param value="${dday}" name="dday" />
	</jsp:include>

	<div class="mobile-menu-overlay"></div>

	<div class="main-container" style="padding-right: 300px;">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<br>
				<br>
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h2>${loginVO.name}님의 이번 달 가계부 분석 내용입니다.</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="pd-20 bg-white border-radius-4 box-shadow mb-30">
					<!-- 그래프 모음 -->
					<div class="wrap" style="padding: 30px;">
						<div class="row">
							<div class="col-md-6 pr-md-1">
								<div id="area-monthly" style="border: 1px solid #dbd5d5; padding: 10px;"></div>
							</div>
							<div class="col-md-6 pr-md-1">
								<div id="area-quarterly" style="border: 1px solid #dbd5d5; padding: 10px;"></div>
							</div>
						</div>
						
						<br>
						<div class="row">
							<div id="area-weekly" style="border: 1px solid #dbd5d5; padding: 10px;" class="col-12"></div>
						</div>
						<br>
						<div class="row">
							<div id="area-payTypeCnt" class="col-8" style="border-bottom: 1px solid #dbd5d5;border-left: 1px solid #dbd5d5;border-top: 1px solid #dbd5d5;"></div>
							<div class="col-4 text-center" style="
								border-bottom: 1px solid #dbd5d5; border-right: 1px solid #dbd5d5; border-top: 1px solid #dbd5d5;
								text-align: center;
								padding: 20px 10px 10px 20px;">
								<!-- 위 오 왼 아래 -->
								<span> <strong> < 결제 방법 별 결제 횟수 > </strong> </span>
								<br><br>
								<ol style="text-align: left; list-style-type: decimal; padding-left: 135px;" start="1">
									<li><h3>하나로통장</h3></li>
									<li><h4>원큐페이</h4></li>
									<li><h5>카카오페이</h5></li>
									<li>현금</li>
								</ol>
								<br> 
								<span>윤정빈님은 결제 방식으로<br>
									<strong style="font-size: large;">하나로통장, 원큐페이</strong><br>
									를 가장 많이 쓰셨네요!
								</span>

							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-1"></div>
							<div class="col-10" style="text-align: center;">
								<strong> < 소비 카테고리별 지출 & 비율 > </strong><br>
								<span style="font-style: italic;">
									윤정빈님과 비슷한 연령대인 <strong style="font-size: medium;">20대 여성</strong>들은 평균적으로<br>
									<strong style="font-size: large;">금융 (50.41%), 카페 (14.22%), 음식점 (13.70%)</strong>
									에 많이 소비합니다.<br>
									'음식점'에 대한 소비를 줄이고 '금융'에 대한 투자를 늘리는게 어떤가요?
								</span>
							</div>
							<div class="col-1"></div>
						</div>
						<div class="row" style="border: 1px solid #dbd5d5; padding:20px;">
							<canvas id="pie-chart" class="col-6"></canvas>
                        	<canvas id="other-pie-chart" class="col-6"></canvas>
						</div>
					</div>
					
					<!-- <div class="row">
						<div id="chart-quarter" class="col-12"></div>
					</div>
					<div class="row">
						<div id="chart-year" class="col-12"></div>
					</div> -->
				</div>
			</div>
			<br>
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
	<%-- <script src="${pageContext.request.contextPath}/resources/vendors/scripts/apexcharts.min.js"></script> --%>
	
	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	


	<script src="${pageContext.request.contextPath}/resources/vendors/scripts/graph.js"></script>

	<script>
	
    // 월별 총 지출액
	
		 
       
        
        /* 
        // 요일별 매장 방문자 수
        $.ajax({
           url: "/analysis/drawGraph",
           data: {
        	   type : "weekly"
           },
           type: "post",
           dataType: "json",
           async: false,

           success: function(resp) {
              $("#area-weekly").empty();
              console.log(resp);
               let val = [];
              let date = [];
              for (let i = 0; i < resp.onSitePayment.length; i++) {
                 val[i] = resp.onSitePayment[i].CNT;
                 date[i] = resp.onSitePayment[i].TODAY;
              }
              optionsArea.series[0].name = "방문자 수";
              optionsArea.series[0].data = val;

              optionsArea.xaxis.categories = date;

              var chartArea = new ApexCharts(document.querySelector('#area-weekly'), options);
              chartArea.render();
           },
           error: function(request, status, error) {
              console.log(request.status);
              console.log(request.responseText);
              console.log(request.error);
           }
        }); */
        
		</script>

</body>
</html>
