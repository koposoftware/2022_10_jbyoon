<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.jquery.com/jquery-3.6.1.js"
		integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
		crossorigin="anonymous"></script>
		
<script>
$(document).ready(function(){
	let id = '${loginVO.id}';

	var test = $('#alarm').attr('value');
	// h3 속성부여
	// $("#dayLeft").attr("value");
	$('#dayLeft').attr('value', test);
	var ttt = $("#dayLeft").attr('value');
	console.log(test);
	console.log(ttt);
	
	$('#btnHanaTran').click(function(){
		$.ajax({
			url: "${pageContext.request.contextPath}/calendar/OnlyHana",
			type: "POST",
			data: {
				id : id
			},
			dataType: "text",
			success: function(result){
				alert(result);
				location.href="${pageContext.request.contextPath}/calendar";
			},
			error: function(result){
				console.log("error : " + result);
				alert('하나은행 계좌 거래내역을 조회할 수 없습니다.');
			}
		})
	});
	
	$('#loginBtn').click(function(){
		location.href = '${pageContext.request.contextPath}/login';
	});
	
});

</script>

<header id="header" class="header-two">
	<div class="site-navigation navbar-fixed">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<nav class="navbar navbar-expand-lg navbar-light p-0">

						<div class="logo">
							<a class="d-block" href="${pageContext.request.contextPath}/main"> <img loading="lazy"
								src="https://image.kebhana.com/cont/common/img/newmain2021/logo.png"
								alt="Hana">
							</a>
						</div>
						<!-- logo end -->

						<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target=".navbar-collapse"
								aria-controls="navbar-collapse" aria-expanded="false"
								aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>

						<div id="navbar-collapse" class="collapse navbar-collapse">
							<ul class="nav navbar-nav ml-auto align-items-center">
								<li class="nav-item dropdown active"><a href="#"
									class="nav-link dropdown-toggle" data-toggle="dropdown">나의
										계좌 &nbsp<i class="fa fa-angle-down"></i>
								</a>
									<ul class="dropdown-menu" role="menu">
										<c:choose>
											<c:when test="${loginVO ne null}">
												<li><a href="#" data-toggle="modal" data-target="#confirmAcctCreate-modal">계좌개설</a></li>
												<li><a href="${pageContext.request.contextPath}/account/hanalist">계좌조회</a></li>
												<li><a href="${pageContext.request.contextPath}/account/transfer1">이체하기</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="${pageContext.request.contextPath}/login">계좌개설</a></li>
												<li><a href="${pageContext.request.contextPath}/login">계좌조회</a></li>
												<li><a href="${pageContext.request.contextPath}/login">이체하기</a></li>
											</c:otherwise>
										</c:choose>
										
									</ul></li>
								&nbsp&nbsp&nbsp
								<li class="nav-item dropdown"><a href="#"
									class="nav-link dropdown-toggle" data-toggle="dropdown">가계부 &nbsp <i
										class="fa fa-angle-down"></i></a>
									<ul class="dropdown-menu" role="menu">
										<c:choose>
											<c:when test="${loginVO ne null}">
												<li><a href="${pageContext.request.contextPath}/tran/history">이체결과조회</a></li>
												<li><a href="${pageContext.request.contextPath}/acctbook">계좌 거래내역</a></li>
												
												<c:choose>
													<c:when test="${loginVO.payChk eq 'Y' }">
														<li><a href="${pageContext.request.contextPath}/cashbook">현금 거래내역</a></li>
													</c:when>
													<c:otherwise>
														<li><a href="#" data-toggle="modal"
															data-target="#confirmCalendar-modal">현금 거래내역조회</a></li>
													</c:otherwise>
												</c:choose>
												
												<li><a href="${pageContext.request.contextPath}/budget">예산 설정</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="${pageContext.request.contextPath}/login">이체내역조회</a></li>
												<li><a href="${pageContext.request.contextPath}/login">계좌 거래내역</a></li>
												<li><a href="${pageContext.request.contextPath}/login">현금 거래내역</a></li>
												<li><a href="${pageContext.request.contextPath}/login">예산 설정</a></li>
											</c:otherwise>
										</c:choose>
									
										
									</ul>
								</li>
								
								&nbsp&nbsp&nbsp
								
								<c:choose>
									<c:when test="${loginVO ne null}">
										<li><a href="${pageContext.request.contextPath}/analysis">내역 분석</a></li>
									</c:when>
									<c:otherwise>
										<li class="nav-item"><a class="nav-link"
											href="${pageContext.request.contextPath}/login">내역 분석</a></li>
									</c:otherwise>
								</c:choose>
								
								&nbsp&nbsp&nbsp
								
								<li class="nav-item dropdown"><a href="#"
									class="nav-link dropdown-toggle" data-toggle="dropdown">설정 &nbsp<i
										class="fa fa-angle-down"></i></a>
									<ul class="dropdown-menu" role="menu">
										<li><a href="${pageContext.request.contextPath}/member/profile">나의 정보</a></li>
										<li><a href="#">설정</a></li>
										<li><a href="${pageContext.request.contextPath}/faq">문의하기</a></li>
									</ul>
								</li>
								
								&nbsp&nbsp&nbsp
								
								<li class="nav-item dropdown"><a href="#"
									class="nav-link dropdown-toggle" data-toggle="dropdown">알림 &nbsp<i
										class="fa fa-angle-down"></i></a>
									<ul class="dropdown-menu" role="menu">
										<c:choose>
											<c:when test="${loginVO ne null}">
												<li><a href="${pageContext.request.contextPath}/budget">
													<h3 id="dayLeft" value>
														<img
															src="${pageContext.request.contextPath}/resources/vendors/images/bank/emoji_shinnanda.png"
															alt="" class="mCS_img_loaded"
															style="width: 75px; height: 75px;">D-${param.dday}
													</h3>
													<p>
														지출을 줄여주는<br>예산 챌린지!<br> 정산일 D-Day로부터 ${param.dday}일 남았어요.<br>
														파이팅하세요!
													</p>
												</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="#">
													<p>
														알림이 없습니다.<br>
														로그인이 필요합니다.
													</p>
												</a></li>
											</c:otherwise>
										</c:choose>
									</ul>
								</li>
								
								&nbsp&nbsp&nbsp

								<c:choose>
									<c:when test="${not empty loginVO}">
										<li class="header-get-a-quote">
											<a class="btn btn-primary" href="#!">${loginVO.name}</a>
										</li>
										<li class="header-get-a-quote">
											<a class="btn btn-primary" href="${pageContext.request.contextPath}/logout">로그아웃</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="header-get-a-quote">
											<a class="btn btn-primary" href="${pageContext.request.contextPath}/login">로그인</a>
										</li>
									</c:otherwise>
								</c:choose>


							</ul>
						</div>
					</nav>
				</div>
				<!--/ Col end -->
			</div>
			<!--/ Row end -->
		</div>
		<!--/ Container end -->

	</div>
	<!--/ Navigation end -->
</header>


<!-- 계좌개설 전 동의 받기 -->
<div class="modal fade" id="confirmAcctCreate-modal" tabindex="-1"
	role="dialog" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-body text-center font-18" style="padding: 30px;">
				<h4 class="padding-top-30 mb-30 weight-500">
					💡 본인 확인을 위한 준비물 안내<br>
				</h4>
				 	비대면 계좌 개설을 시작하기 전에 본인 확인이 필요합니다.<br>
					편리한 계좌 개설을 위해 미리 준비해 주세요.<br> <br>
					<i class="icon-copy fa fa-id-card-o" aria-hidden="true"></i>
					<strong>주민등록증, 운전면허증, 여권</strong><br>
					<!-- (통장아이콘) 타 금융기관 본인 명의 계좌<br> -->
				<br>
				<div class="padding-bottom-10 row" style="max-width: 170px; margin: 0 auto">
					<div class="col-6">
						<button type="button" class="btn btn-secondary btn-sm btn-block" 
								style="border-color: #6C757D; background-color: #6C757D; color: white;"
								data-dismiss="modal">
								취소</button>
					
						<!-- <button type="button"
							class="btn btn-secondary border-radius-100 btn-block confirmation-btn"
							data-dismiss="modal">
						</button>
						취소 -->
					</div>
					
					<div class="col-6">
					
						<button type="button" class="btn btn-secondary btn-sm btn-block" 
								style="border-color: #019591; background-color: #019591; color: white;"
								data-dismiss="modal"
								onClick="location.href='${pageContext.request.contextPath}/account/createForm'">
								확인</button>
					
						<%-- <button type="button"
								class="btn btn-primary border-radius-100 btn-block"
								data-dismiss="modal"
								onClick="location.href='${pageContext.request.contextPath}/account/createForm'">
								확인
						</button> --%>
						<%-- <button type="button"
							class="btn btn-primary border-radius-100 btn-block confirmation-btn"
							data-dismiss="modal"
							onClick="location.href='${pageContext.request.contextPath}/account/createForm'">
							<i class="fa fa-check"></i>
						</button>
						확인 --%>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 서비스 제공 전 오픈뱅킹 동의 받기 -->
<div class="modal fade" id="openChk-Modal" tabindex="-1"
	role="dialog" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-body text-center font-18">
				<h4 class="padding-top-30 mb-30 weight-500">
					💡 오픈뱅킹 서비스 이용 동의
				</h4>
				다른 은행 계좌 정보를 불러오기 전에 최초 1회 오픈뱅킹 서비스 이용<br>
				동의가 필요합니다. 진행하시겠습니까?<br>
				<div class="padding-bottom-30 row"
					style="max-width: 170px; margin: 0 auto;">
					<div class="col-6">
						<button type="button"
							class="btn btn-secondary border-radius-100 btn-block confirmation-btn"
							data-dismiss="modal">
							<i class="fa fa-times"></i>
						</button>
						취소
					</div>
					<div class="col-6">
						<button type="button"
							class="btn btn-primary border-radius-100 btn-block confirmation-btn"
							data-dismiss="modal"
							onClick="location.href='${pageContext.request.contextPath}/open/auth'">
							<i class="fa fa-check"></i>
						</button>
						확인
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 가계부 서비스 제공 -->
<div class="modal fade" id="confirmCalendar-modal" tabindex="-1"
	role="dialog" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-body text-center font-18">
				<h4 class="padding-top-30 mb-30 weight-500" >
					💡 간편결제 정보 이용 동의
				</h4>
				<h6 style="font-style: normal;">
					현금 거래내역 조회 서비스는 원큐페이, 카카오페이<br>
					간편결제 시스템을 사용하는 하나은행 회원들을 대상으로<br>
					페이머니 거래내역 정보를 수집합니다.<br><br>
					또한, 현장에서 사용한 종이 현금 거래에 대한 정보를<br>
					직접 기입하여 보다 꼼꼼하고 편리한 서비스를 제공하도록 합니다.<br> 
				</h6>
				<br>
				<div class="padding-bottom-30 row"
					style="max-width: 170px; margin: 0 auto;">
					<div class="col-6">
						<button type="button"
							class="btn btn-secondary border-radius-100 btn-block confirmation-btn"
							data-dismiss="modal">
							<i class="fa fa-times"></i>
						</button>
						취소
					</div>
					<div class="col-6">
						<button type="button"
							class="btn btn-primary border-radius-100 btn-block confirmation-btn"
							data-dismiss="modal"
							onClick="location.href='${pageContext.request.contextPath}/cashbook'">
							<i class="fa fa-check"></i>
						</button>
						확인
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

