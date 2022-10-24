<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8" />
<title>예산 설정</title>

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
	href="${pageContext.request.contextPath}/resources/src/plugins/fullcalendar/fullcalendar.css" />
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

<style>
.vl {
	border-left: 2px solid #019591;
	height: 500px;
	position: absolute;
	left: 50%;
	margin-left: -3px;
	top: 0;
}
</style>
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
				<br> <br>
				<div class="pd-20 bg-white border-radius-4 box-shadow mb-30">
					<!-- 10월 -->
					<!-- div left : 이번달 총 지출, 총 수입 // div right : 분석 버튼-->
					<br> <br>
					<div class="row">
						<div class="col-6 text-center">
							<div class="row">
								<div class="col-4"></div>
								<div class="col-4">

									<h4>${month}</h4>
									<br>지출 : ${minus} 원 <br>수입 : ${plus} 원
								</div>
								<div class="col-4"></div>
							</div>

							<br> <br>

							<c:choose>
								<c:when test="${cnt eq 0}">
									<div class="row">
										<div class="col-12">
											<h5 class="text-center h5 mb-0">한 달 예산을 세워볼까요?</h5>
											<p class="text-center text-muted font-14">예산을 설정하고 계획적으로
												관리 해보세요.</p>
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-4">
											<label class="col-sm-12 col-md-12 col-form-label"
												style="padding: 0px; text-align: right;">예산</label>
										</div>
										<div class="col-4">
											<input id="initValue" class="form-control" type="text"
												style="text-align: right;" placeholder="0">
										</div>
										<div class="col-4 text-left" style="padding: 0px;">원</div>
									</div>

									<br>

									<div class="row">
										<div class="col-2"></div>
										<div class="col-8">
											<input id="setBudget"
												class="btn btn-primary btn-lg btn-block" type="button"
												value="예산 설정"
												style="border-color: #019591; background-color: #019591; color: white;">

											<div class="input-group mb-0">
												<a class="btn btn-outline-primary btn-lg btn-block"
													style="border-color: #019591; color: #019591;" href="#!">
													이전 예산 복사하기</a>
											</div>
										</div>
										<div class="col-2"></div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="row">
										<div class="col-12">
											<h5 class="text-center h5 mb-0">이번 달 예산을 확인하세요.</h5>
											<p class="text-center text-muted font-14">설정된 예산을 참고하여
												계획적으로 관리 해보세요.</p>
										</div>
									</div>
									<br>
									<c:forEach items="${budgetList}" var="data">
										<div class="row">
											<div class="col-6 text-right">
												<h6>한 달 예산</h6>
											</div>
											<div class="col-4 text-left">${data.limitFm}원</div>
											<div class="col-2"></div>
										</div>
									</c:forEach>

									<br>
									<br>

									<div class="row">
										<div class="col-2"></div>
										<div class="col-8">
											<input id="updateBudgetBtn"
												class="btn btn-primary btn-lg btn-block" type="button"
												value="예산 수정" data-toggle="modal"
												data-target="#bgtUpdate-modal"
												style="border-color: #019591; background-color: #019591; color: white;">
										</div>
										<div class="col-2"></div>
									</div>
								</c:otherwise>
							</c:choose>
							<br> <br>

						</div>
						<!-- <div class="col-1 vl text-center "></div> -->
						<c:choose>
							<c:when test="${cnt eq 0}">
								<div class="col-6 text-center">
									<br> <br>
									<div class="row">
										<div class="col-1"></div>
										<div class="col-10">
											<br>
											<div class="progress mb-20" style="height: 25px">
												<div class="progress-bar bg-info" role="progressbar"
													style="width: 0%" aria-valuenow="0" aria-valuemin="0"
													aria-valuemax="100">0%</div>
											</div>
										</div>
										<div class="col-1"></div>
									</div>

									<br> <br>

									<div class="col-12">
										<h5 class="text-center h5 mb-0">내가 얼마를 더 쓸 수 있을까?</h5><br>
										<p class="text-center text-muted font-14">
											예산을 설정하면 지출 현황을 분석할 수 있습니다.<br>
											해당 챌린지는 매달 1일에 예산 금액을 설정하여 예산 내에서 소비합니다.<br>(*챌린지 참여는 꼭 1일이 아니어도 가능합니다.)<br><br>
											꾸준히 가계부를 쓸 수 있도록 알림 메세지를 보내드립니다.<br>
										</p>
										<ol style="text-align: left; list-style-type: decimal; padding-left: 100px; font:bold;">
											<li>
												지출이 예산 설정 금액을 초과하는 경우
											</li>
											<li>
												하루 권장 지출이 5000원 미만일 경우 
											</li>
											<li>
												매달 말일 챌린지 결과 알림 (성공 시 +1000 하나머니 제공)
											</li>
										</ol>
									</div>
									<br>
									<div class="row">
										<div class="col-12">
											<img alt="mascott"
												src="${pageContext.request.contextPath}/resources/vendors/images/bank/emoji_fun.png">
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col-6 text-center">
									<br>
									<div class="row">
										<div class="col-12 text-center">
											<h6>지출 현황 분석</h6>
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-1"></div>
										<div class="col-10">
											<div class="progress mb-20" style="height: 25px;">
												<div class="progress-bar bg-info" role="progressbar"
													style="width: ${percentage}%; background-color: #019591;"
													aria-valuenow="${percentage}" aria-valuemin="0"
													aria-valuemax="100">${percentage}%</div>
											</div>
										</div>
										<div class="col-1"></div>
									</div>
									<br>
									<c:forEach items="${budgetList}" var="data">
										<div class="row">
											<div class="col-6 text-right">
												<h6>한 달 예산</h6>
											</div>
											<div class="col-4 text-left">${data.limitFm}원</div>
											<div class="col-2"></div>
										</div>
										<br>
										<div class="row">
											<div class="col-6 text-right">
												<h6>마지막 날까지</h6>
											</div>
											<c:choose>
												<c:when test="${result eq 'fail'}">
													<div class="col-4 text-left">${amtLeft}원 남음</div>
												</c:when>
												<c:otherwise>
													<div class="col-4 text-left">${data.leftOverFm}원 남음</div>
												</c:otherwise>
											</c:choose>
											
											<div class="col-2"></div>
										</div>
										<br>
										<div class="row">
											<div class="col-6 text-right">
												<h6>총 예상 지출</h6>
											</div>
											<div class="col-4 text-left">${data.expectedExpenseFm}
												원</div>
											<div class="col-2"></div>
										</div>
										<br>
										<div class="row">
											<div class="col-6 text-right">
												<h6>오늘까지 권장 지출</h6>
											</div>
											<div class="col-4 text-left">${data.dayLimitFm}원</div>
											<div class="col-2"></div>
										</div>
									</c:forEach>

									<br>
									<div class="row">
										<div class="col-6">
											<img alt="mascott"
												src="${pageContext.request.contextPath}/resources/vendors/images/bank/emoji_fighting.png">
										</div>
										<div class="col-6"
											style="display: flex; justify-content: center; align-items: center;">
											<button id="graphBtn" type="button"
												class="btn btn-secondary btn-sm"
												onclick="location.href = '${pageContext.request.contextPath}/analysis'"
												style="border-color: #019591; background-color: #019591; color: white; display: inline-block; text-align: center;">분석</button>
											<!-- <button id="messageBtn" type="button" class="btn btn-secondary btn-sm"
																style="border-color: #019591; background-color: #019591; color: white; display: inline-block; text-align: center;">메세지</button> -->
										</div>
									</div>
									<br> <br>
								</div>
							</c:otherwise>
						</c:choose>

					</div>
				</div>

			</div>

			<!-- 모달#2 : 예산 금액 수정 -->
			<div class="modal fade" id="bgtUpdate-modal" tabindex="-1"
				role="dialog" style="display: none;" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-body text-center font-12">
							<h4 class="padding-top-30 mb-30 weight-500">새로 설정할 예산 금액을
								입력하세요.</h4>

							<c:forEach items="${budgetList}" var="data">
								<div class="row">
									<div class="col-6 text-right">
										<h6>바꾸기 전</h6>
									</div>
									<div class="col-6 text-left" style="padding: 0px;">
										<h6>${data.limitFm}원</h6>
									</div>
								</div>
							</c:forEach>
							<br>
							<div class="row">
								<div class="col-6 text-right">
									<h6>바꾼 후</h6>
								</div>
								<div class="col-2 text-left" style="padding: 0px;">
									<!-- <h6 style="border-bottom: 1px solid; padding-bottom: 2px;">fdsfa</h6> -->
									<input id="newBgtAmt" class="input-group mb-3" placeholder="0"
										style="padding: 0px; border: 0; outline: 0; background: transparent; border-bottom: 1px solid black; font-size: 16px;">
								</div>
								<div class="col-4 text-left" style="padding: 0px;">
									<h6>원</h6>
								</div>
							</div>

							<div class="padding-bottom-30 row"
								style="max-width: 170px; margin: 0 auto;">
								<button id="cancelBtn" type="button"
									class="btn btn-secondary btn-sm col-4"
									style="margin: 14px; border-color: #019591; background-color: #019591; color: white; display: inline-block; text-align: center;"
									data-dismiss="modal">취소</button>
								<button id="saveNewBgtBtn" type="button"
									class="btn btn-secondary btn-sm col-4"
									style="margin: 14px; border-color: #019591; background-color: #019591; color: white; display: inline-block; text-align: center;"
									data-dismiss="modal">확인</button>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

		<!-- footer -->
		<jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>

	</div>

	<!-- 성공 모달 -->
	<div class="modal fade" id="challenge-result-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" style="display: none;"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content" style="width: 550px;">
				<div class="modal-body text-center font-18" style="padding: 50px; width: 550px;">
					<c:choose>
						<c:when test="${result eq 'success'}">
							<h2 class="mb-20">챌린지 성공!</h2>
							<br>
							<div class="mb-30 text-center">
								<%-- <img src="${pageContext.request.contextPath}/resources/vendors/images/success.png"> --%>
								<img src="${pageContext.request.contextPath}/resources/vendors/images/bank/emoji_shinnanda.png"
									style="width: 200px; height: 200px;">
							</div>
							이 달의 챌린지 목표 도달에 성공하셨습니다!<br>
							보상으로 하나머니 +1000 포인트가 적립될 예정입니다.
							<br>
							<br>
							<strong>다음 달 챌린지도 도전하시겠습니까?</strong>
						</c:when>
						<c:otherwise>
							<h2 class="mb-20">챌린지 실패..</h2>
							<br>
							<div class="mb-30 text-center">
								<img src="${pageContext.request.contextPath}/resources/vendors/images/bank/emoji_oneq_cartoon.png"
									style="width: 350px; height: 350px;">
							</div>
							아쉽게도 이번 달 소비 줄이기 챌린지에 실패하셨네요.<br>
							소비패턴 분석과 알림 서비스를 통해<br><br>
							<strong>다음 달에는 지출을 줄여볼까요?</strong>
						</c:otherwise>
					</c:choose>
					
				</div>
				<div class="modal-footer justify-content-center">
					<button type="button" class="btn btn-primary" data-dismiss="modal">
						취소</button>
      				&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-primary" data-dismiss="modal">
						도전</button>
				</div>
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
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/fullcalendar/fullcalendar.min.js"></script>

	<script>
		$(document).ready(function(){
			//if('${today}' === '${budget[0].endDt}'){
			if('${today}' === '21'){
				$('#challenge-result-modal').modal('show');
			}
			
			$('#initValue, #newBgtAmt').bind('keyup', function(e){
				var rgx1 = /\D/g;
				var rgx2 = /(\d+)(\d{3})/;
				var num = this.value.replace(rgx1,"");
				
				while (rgx2.test(num)) num = num.replace(rgx2, '$1' + ',' + '$2');
				this.value = num;
			});
			
			$('#setBudget').click(function(){
				var currAmt = '${minus}';
				var budgetAmt = document.getElementById('initValue').value;
				// var ym = '${month}';
				//console.log('budgetAmt : ' + budgetAmt);
				//console.log('currAmt : ' + currAmt);
				
				$.ajax({
					url: "/acctbook/budget/setting",
					type: "POST",
					data: {
						budgetAmt,
						currAmt
					},
					dataType: 'text'
				})
				.done(function(data) {
					//alert(data);
					if(data === 'success'){
						location.href = '${pageContext.request.contextPath}/acctbook';
					}
				});
				
			});
			
			$('#saveNewBgtBtn').click(function(){
				var newBgtAmt = document.getElementById('newBgtAmt').value;
				location.href='${pageContext.request.contextPath}/budget/update/goal?bgt=' + newBgtAmt; 
			})
			
			$('#messageBtn').click(function(){
				$.ajax({
					url: "/message",
					type: "POST"
				})
				.done(function(data) {
					//alert(data);
					if(data === 'success'){
						location.href = '${pageContext.request.contextPath}/acctbook';
					}
				});
			})
			
		});
		
		</script>

</body>
</html>
