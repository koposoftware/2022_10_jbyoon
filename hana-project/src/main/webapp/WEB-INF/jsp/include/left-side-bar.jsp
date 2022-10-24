<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://code.jquery.com/jquery-3.6.1.js"
		integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
		crossorigin="anonymous"></script>
<script>
$(document).ready(function(){
	let id = '${loginVO.id}';

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
	
	
});

</script>
<div class="left-side-bar">
	<div class="brand-logo">
		<a href="/main" title="메인화면으로 이동" style="color: black; text-align: center; "> 
				<img
					src="https://image.kebhana.com/cont/common/img/newmain2021/logo.png"
					alt="하나은행 로고" class="dark-logo" style="margin: auto; display: block;"/>
		</a>
		<div class="close-sidebar" data-toggle="left-sidebar-close">
			<i class="ion-close-round"></i>
		</div>
	</div>

	<%-- <c:choose>
		<c:when test="${loginVO ne null}">
			<jsp:include page="/WEB-INF/jsp/include/left-side-bar-normal.jsp"/>
		</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath}/login"></a>
		</c:otherwise>
	</c:choose> --%>
	<div class="menu-block customscroll">
		<div class="sidebar-menu">
			<ul id="accordion-menu">
				<li class="dropdown">
					<a href="javascript:;" class="dropdown-toggle"> 
						<span class="micon bi bi-house"></span>
						<span class="mtext">나의 계좌</span>
					</a>
					
					<ul class="submenu">
						<c:choose>
							<c:when test="${loginVO ne null}">
								<li><a href="#" data-toggle="modal" data-target="#confirmAcctCreate-modal">계좌개설</a></li>
								<li><a href="${pageContext.request.contextPath}/account/hanalist">계좌조회</a></li>

								<c:choose>
									<c:when test="${loginVO.openChk eq 'Y' }">
										<li><a href="${pageContext.request.contextPath}/account/openlist">다른금융
												계좌조회</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="#" data-toggle="modal"
											data-target="#openChk-Modal">다른금융 계좌조회</a></li>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath}/login" >계좌개설</a></li>
								<li><a href="${pageContext.request.contextPath}/login" >계좌조회</a></li>
								<li><a href="${pageContext.request.contextPath}/login" >다른금융 계좌조회</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</li>
				
				<li class="dropdown">
					<a href="javascript:;" class="dropdown-toggle"> 
						<span class="micon fa fa-money"></span>
						<span class="mtext">이체하기</span>
					</a>
								
					<ul class="submenu">
						<c:choose>
							<c:when test="${loginVO ne null}">
								<li><a href="${pageContext.request.contextPath}/account/transfer1">계좌이체</a></li>
								<c:choose>
									<c:when test="${loginVO.openChk eq 'Y' }">
										<li><a href="${pageContext.request.contextPath}/account/transfer">다른금융 계좌이체</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="#" data-toggle="modal"
											data-target="#openChk-Modal">다른금융 계좌이체</a></li>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath}/login" >계좌이체</a></li>
								<li><a href="${pageContext.request.contextPath}/login" >다른금융 계좌이체</a></li>
							</c:otherwise>
						</c:choose>
						
						
					</ul>
				</li>
				
				<li class="dropdown">
					<a href="javascript:;" class="dropdown-toggle"> 
						<span class="micon fa fa-search"></span>
						<span class="mtext">이체결과 조회</span>
					</a>
					<ul class="submenu">
						<c:choose>
							<c:when test="${loginVO ne null}">
								<li><a href="${pageContext.request.contextPath}/tran/history">이체결과조회</a></li>
								<c:choose>
									<c:when test="${loginVO.openChk eq 'Y' }">
										<li><a href="#">다른금융계좌 이체결과조회</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="#" data-toggle="modal"
											data-target="#openChk-Modal">다른금융계좌 이체결과조회</a></li>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath}/login" >이체결과조회</a></li>
								<li><a href="${pageContext.request.contextPath}/login" >다른금융계좌 이체결과조회</a></li>
							</c:otherwise>
						</c:choose>
						
						
					</ul>
				</li>
				
				<li class="dropdown">
					<a href="javascript:;" class="dropdown-toggle"> 
						<span class="micon fa fa-calculator"></span>
						<span class="mtext">가계부</span>
					</a>
								
					<ul class="submenu">
						<c:choose>
							<c:when test="${loginVO ne null}">
								<li><a href="${pageContext.request.contextPath}/acctbook">거래내역조회</a></li>
								<c:choose>
									<c:when test="${loginVO.payChk eq 'Y' }">
										<li><a href="${pageContext.request.contextPath}/cashbook">현금 거래내역조회</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="#" data-toggle="modal"
											data-target="#confirmCalendar-modal">현금 거래내역조회</a></li>
									</c:otherwise>
								</c:choose>
								<li><a href="${pageContext.request.contextPath}/analysis">분석</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath}/login">거래내역조회</a></li>
								<li><a href="${pageContext.request.contextPath}/login">현금 거래내역조회</a></li>
								<li><a href="${pageContext.request.contextPath}/login">분석</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</li>
				
				
				<li>
					<div class="dropdown-divider"></div>
				</li>
				<li>
					<div class="sidebar-small-cap">Extra</div>
				</li>
				<li><a href="javascript:;" class="dropdown-toggle"> <span
						class="micon bi bi-file-pdf"></span><span class="mtext">Documentation</span>
				</a>
					<ul class="submenu">
						<li><a href="introduction.html">Introduction</a></li>
						<li><a href="getting-started.html">Getting Started</a></li>
						<li><a href="color-settings.html">Color Settings</a></li>
						<li><a href="third-party-plugins.html">Third Party
								Plugins</a></li>
					</ul></li>

				<li><a
					href="https://dropways.github.io/deskapp-free-single-page-website-template/"
					target="_blank" class="dropdown-toggle no-arrow"> <span
						class="micon bi bi-layout-text-window-reverse"></span> <span
						class="mtext">Landing Page <img
							src="${pageContext.request.contextPath}/resources/vendors/images/coming-soon.png" alt="" width="25"
							class="mCS_img_loaded"></span>
				</a></li>
			</ul>
		</div>
	</div>
</div>



<!-- 계좌개설 전 동의 받기 -->
<div class="modal fade" id="confirmAcctCreate-modal" tabindex="-1"
	role="dialog" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-body text-center font-18">
				<h4 class="padding-top-30 mb-30 weight-500">
					💡 본인 확인을 위한 준비물 안내<br>
				</h4>
				<aside style="text-align: left;">
					비대면 계좌 개설을 시작하기 전에 본인 확인이 필요합니다.<br>
					편리한 계좌 개설을 위해 미리 준비해 주세요.<br> 
					(신분증아이콘) 주민등록증, 운전면허증, 여권<br>
					(통장아이콘) 타 금융기관 본인 명의 계좌<br>
				</aside>
				<br>
				<div class="padding-bottom-30 row"
					style="max-width: 170px; margin: 0 auto">
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
							onClick="location.href='${pageContext.request.contextPath}/account/createForm'">
							<i class="fa fa-check"></i>
						</button>
						확인
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