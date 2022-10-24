<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<!-- Basic Page Info -->
		<meta charset="utf-8" />
		<title>가계부계좌</title>

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
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendors/styles/icon-font.min.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/src/plugins/fullcalendar/fullcalendar.css"/>
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
			<jsp:param value="${dday}" name="dday"/>
		</jsp:include>
		
		<div class="mobile-menu-overlay"></div>

		<div class="main-container" style="padding-right: 300px;">
			<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<br><br>
				<!-- tab 으로 이루어진 페이지 -->
				<div class="pd-30 card-box mb-30">

					<h5 class="h4 text-blue mb-20" style="color: #019591;">계좌 가계부</h5>
					<div class="tab">
						<ul class="nav nav-tabs customtab" role="tablist" style="color: #019591;">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#calendarView" role="tab"
								aria-selected="true" style="color: #019591;">달력</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#listView" role="tab" aria-selected="false"
								style="color: #019591;">거래내역</a></li>
							<!-- <li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#budgetView" role="tab" aria-selected="false"
								style="color: #019591;">예산</a></li> -->
						</ul>
						<div class="tab-content">
							<br>
							<!-- tab#1 : 달력 화면 -->
							<div class="tab-pane fade active show" id="calendarView" role="tabpanel">
								<div class="pd-10 row">
									<div class="col-4"></div>
									<div class="col-4" style="border: 3px solid #019591; border-radius: 10px;">
										<div class="col-8" style="float: left;">
											<h4 style="color: #019591; padding-top: 15px;">이번 달 현황</h4>
											<p>
												<strong>지출 : ${minus}원</strong><br>
												<strong>수입 : ${plus }원</strong> 
											</p>
										</div>
										<div class="col-4" style="float: left; padding-top: 42.5px;">
											
											<c:choose>
												<c:when test="${budgetChk eq 'N'}">
													<button type="button" class="btn btn-secondary btn-sm float-right"
															onclick="location.href = '${pageContext.request.contextPath}/budget'"
															style="border-color: #019591; background-color: #019591; color: white; 
																	display: inline-block; text-align: center; margin-left: 10px;">챌린지 도전</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="btn btn-secondary btn-sm float-right"
															onclick="location.href = '${pageContext.request.contextPath}/budget'"
															style="border-color: #019591; background-color: #019591; color: white; 
																	display: inline-block; text-align: center; margin-left: 10px;">예산 확인</button>
												</c:otherwise>
											</c:choose>
										
										</div>
									</div>
									<div class="col-4"></div>
								</div>
								
								<div class="calendar-wrap" style="padding: 20px;">
									<div id="calendarAcct"></div>
								</div>
								<div class="pd-20"></div>
							</div>

							<!-- tab#2 : 거래내역 목록 화면 -->
							<div class="tab-pane fade" id="listView" role="tabpanel" style="padding: 40px;">
								<div class="pd-20">
									<h4 style="color: #019591;">${ loginVO.name }님의 상세 거래내역입니다.</h4>
								</div>
								
								<br>

								<div>
									<ul>
										<li>계속해서 다른 계좌의 거래내역을 조회하려면 계좌번호를 선택한 후 [조회] 버튼을 누르세요.</li>
										<li>달력은 월 단위만 선택할 수 있습니다.</li>
									</ul>
								</div>

								<br>

								<div class="table-responsive" id="result-table">
									<table class="table table-bordered">
										<tbody>
											<tr>
												<td align="center"
													style="background-color: #019591; color: white;" valign="middle" >계좌번호</td>
												<td style="padding: 10px;">
													<div class="form-group col-md-5 col-sm-12" >
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
												<td align="center"
													style="background-color: #019591; color: white;">조회기간</td>
												<td style="padding: 10px;">
													<div>
														<div class="form-group col-md-5 col-sm-12"
															style="float: left;">
															<input id="startDate" name="startDate"
																class="form-control date-picker" placeholder="시작일"
																type="text">
														</div>
														<div class="form-group col-md-1 col-sm-12"
															style="float: left; text-align: center; vertical-align: middle; line-height: 45px;">
															~</div>
														<div class="form-group col-md-5 col-sm-12"
															style="float: left;">
															<input id="endDate" name="endDate"
																class="form-control date-picker" placeholder="종료일"
																type="text">
														</div>
													</div>
													<br>
													<div style="display: inline-block;">
														<button id="1DayBtn" type="button"
															class="btn btn-secondary btn-sm"
															style="border-color: #019591; background-color: #019591; color: white;">당일</button>
														<button id="1WeekBtn" type="button"
															class="btn btn-secondary btn-sm"
															style="border-color: #019591; background-color: #019591; color: white;">1주일</button>
														<button id="1MonthBtn" type="button"
															class="btn btn-secondary btn-sm"
															style="border-color: #019591; background-color: #019591; color: white;">1개월</button>
														<button id="3MonthBtn" type="button"
															class="btn btn-secondary btn-sm"
															style="border-color: #019591; background-color: #019591; color: white;">3개월</button>
														<button id="6MonthBtn" type="button"
															class="btn btn-secondary btn-sm"
															style="border-color: #019591; background-color: #019591; color: white;">6개월</button>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>


								<div style="display: flex; justify-content: center;">
									<button id="calFilterBtn" type="button" class="btn btn-secondary btn-sm"
											style="border-color: #019591; background-color: #019591; color: white; display: inline-block;">조회</button>
								</div>
								
								<br>
								
								<div class="pb-20">
									<div id="DataTables_Table_2_wrapper"
										class="dataTables_wrapper dt-bootstrap4 no-footer">
										<!-- 이 위치에 pdf 버튼 들어가있음!! -->
										
										<table
											class="table hover multiple-select-row data-table-export nowrap dataTable no-footer dtr-inline collapsed"
											id="DataTables_Table_2" role="grid">
											<thead>
												<tr role="row">
													<th class="sorting" tabindex="0"
														aria-controls="DataTables_Table_2" rowspan="1" colspan="1">No.</th>
													<th class="sorting" tabindex="0"
														aria-controls="DataTables_Table_2" rowspan="1" colspan="1"
														aria-label="Salart: activate to sort column ascending">거래일</th>	
													<th class="table-plus datatable-nosort sorting_disabled"
														rowspan="1" colspan="1" aria-label="tranType">입금/출금</th>
													<th class="sorting" tabindex="0"
														aria-controls="DataTables_Table_2" rowspan="1" colspan="1"
														aria-label="Age: activate to sort column ascending">거래처</th>
													<th class="sorting" tabindex="0"
														aria-controls="DataTables_Table_2" rowspan="1" colspan="1"
														aria-label="Office: activate to sort column ascending">통장별칭</th>
													<th class="sorting_asc" tabindex="0"
														aria-controls="DataTables_Table_2" rowspan="1" colspan="1"
														aria-label="Address: activate to sort column descending"
														aria-sort="ascending">거래금액(원)</th>
													<th class="sorting" tabindex="0"
														aria-controls="DataTables_Table_2" rowspan="1" colspan="1"
														aria-label="Start Date: activate to sort column ascending">잔액</th>
													<th class="sorting" tabindex="0"
														aria-controls="DataTables_Table_2" rowspan="1" colspan="1"
														aria-label="Start Date: activate to sort column ascending">비고</th>
												</tr>
											</thead>
											<tbody id="tbody-acctbook-tranlist">
												<c:forEach items="${tranList}" var="list" varStatus="status">
													<tr role="row" class="odd">
														<td>${status.index + 1}</td>
														<td>${list.tranDt}</td>
														<td class="table-plus" tabindex="0">
															<c:choose>
																<c:when test="${list.tranType eq '-'}">출금</c:when>
																<c:when test="${list.tranType eq '이체'}">이체</c:when>
																<c:otherwise>입금</c:otherwise>
															</c:choose>
														</td>
														<td>${list.opponentName}</td>
														<td>${list.bankAcctAlias}</td>
														<td class="sorting_1">${list.amountFm}</td>
														<td>${list.balanceFm}</td>
														<td>${list.content}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>

									</div>
								</div>
								<br>
							</div>

							<!-- tab#3 : 예산 설정 화면 -->
							<%-- <div class="tab-pane fade" id="budgetView" role="tabpanel">
								<!-- 10월 -->
								<!-- div left : 이번달 총 지출, 총 수입 // div right : 분석 버튼-->
								<br><br><br><br>
								<div class="row">
									<div class="col-6 text-center">
										<div class="row">
											<div class="col-4"></div>
											<div class="col-4">
												
												<h4>${month}</h4>
												<br>지출 : ${minus} 원
												<br>수입 : ${plus} 원
											</div>
											<div class="col-4"></div>
										</div>
										
										<br><br>
										
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
														<label class="col-sm-12 col-md-12 col-form-label" style="padding: 0px; text-align: right;">예산</label>
													</div>
													<div class="col-4">
														<input id="initValue" class="form-control" type="text" style="text-align: right;" placeholder="0">
													</div>
													<div class="col-4 text-left" style="padding: 0px;">원</div>
												</div>
												
												<br>
												
												<div class="row">
													<div class="col-2"></div>
													<div class="col-8">
														<input id="setBudget" class="btn btn-primary btn-lg btn-block" type="button" value="예산 설정"
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
														<p class="text-center text-muted font-14">설정된 예산을 참고하여 계획적으로
															관리 해보세요.</p>
													</div>
												</div>
												<br>
												<c:forEach items="${budgetList}" var="data">
													<div class="row">
														<div class="col-6 text-right"><h6>한 달 예산</h6></div>
														<div class="col-4 text-left">${data.limitFm} 원</div>
														<div class="col-2"></div>
													</div>
												</c:forEach>
												
												<br><br>
												
												<div class="row">
													<div class="col-2"></div>
													<div class="col-8">
														<input id="updateBudgetBtn" class="btn btn-primary btn-lg btn-block" type="button" 
																value="예산 수정" data-toggle="modal" data-target="#bgtUpdate-modal"
																style="border-color: #019591; background-color: #019591; color: white;">
													</div>
													<div class="col-2"></div>
												</div>
											</c:otherwise>
										</c:choose>
												<br>
												<br>
									
									</div>
									<!-- <div class="col-1 vl text-center "></div> -->
									<c:choose>
										<c:when test="${cnt eq 0}">
											<div class="col-6 text-center">
												<br>
												<br>
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

												<br>
												<br>

												<div class="col-12">
													<h5 class="text-center h5 mb-0">내가 얼마를 더 쓸 수 있을까?</h5>
													<p class="text-center text-muted font-14">
														예산을 설정하면 지출 현황을 분석할 수 있습니다.<br>
														그리고 꾸준히 가계부를 쓸 수 있도록 알림 메세지를 보내드립니다.<br>
													</p>
												</div>
												<br>
												<div class="row">
													<div class="col-12">
														<img alt="mascott" src="${pageContext.request.contextPath}/resources/vendors/images/bank/emoji_fun.png">
													</div>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="col-6 text-center">
												<br>
												<div class="row">
													<div class="col-12 text-center"><h6>지출 현황 분석</h6></div>
												</div>
												<br>
												<div class="row">
													<div class="col-1"></div>
													<div class="col-10">
														<div class="progress mb-20" style="height: 25px;">
															<div class="progress-bar bg-info" role="progressbar"
																style="width: ${percentage}%; background-color: #019591;" aria-valuenow="${percentage}" aria-valuemin="0"
																aria-valuemax="100">${percentage}%</div>
														</div>
													</div>
													<div class="col-1"></div>
												</div>
												<br>
												<c:forEach items="${budgetList}" var="data">
													<div class="row">
														<div class="col-6 text-right"><h6>한 달 예산</h6></div>
														<div class="col-4 text-left">${data.limitFm} 원</div>
														<div class="col-2"></div>
													</div>
													<br>
													<div class="row">
														<div class="col-6 text-right"><h6>마지막 날까지</h6></div>
														<div class="col-4 text-left">${data.leftOverFm} 원 남음</div>
														<div class="col-2"></div>
													</div>
													<br>
													<div class="row">
														<div class="col-6 text-right"><h6>총 예상 지출</h6></div>
														<div class="col-4 text-left">${data.expectedExpenseFm} 원</div>
														<div class="col-2"></div>
													</div>
													<br>
													<div class="row">
														<div class="col-6 text-right"><h6>오늘까지 권장 지출</h6></div>
														<div class="col-4 text-left">${data.dayLimitFm} 원</div>
														<div class="col-2"></div>
													</div>
												</c:forEach>
												
												<br>
												<div class="row">
													<div class="col-6">
														<img alt="mascott" src="${pageContext.request.contextPath}/resources/vendors/images/bank/emoji_fighting.png">
													</div>
													<div class="col-6" style="display: flex; justify-content: center; align-items: center;">
														<button id="graphBtn" type="button" class="btn btn-secondary btn-sm"
																style="border-color: #019591; background-color: #019591; color: white; display: inline-block; text-align: center;">분석</button>
														<!-- <button id="messageBtn" type="button" class="btn btn-secondary btn-sm"
																style="border-color: #019591; background-color: #019591; color: white; display: inline-block; text-align: center;">메세지</button> -->
													</div>
												</div>
												<br>
												<br>
											</div>
										</c:otherwise>
									</c:choose>

								</div>
							</div> --%>
						</div>
					</div>
				</div>
				</div>
				<!-- END of tab 으로 이루어진 페이지 -->

				<!-- 모달#1 : 거래내역 간단하게 보여줌 -->
				<div id="modal-view-event" class="modal modal-top fade calendar-modal">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-body">
								<h4 class="h4">
									<span class="event-icon weight-400 mr-3"></span><span
										class="event-title"></span>
								</h4>
								<div class="event-body" id="testModal">
									
								</div>
							</div>

							<!-- 모달#1 : event 내용 + close 버튼 1개 -->
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">Close</button>
							</div>
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
		</div>
		
		
		<!-- js -->
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/core.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/script.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/process.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/layout-settings.js"></script>
		<script src="${pageContext.request.contextPath}/resources/src/plugins/fullcalendar/fullcalendar.min.js"></script>
		
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/calendar-setting.js"></script>
		<script src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
		
		<!-- buttons for Export datatable -->
		<script src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/dataTables.buttons.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/buttons.bootstrap4.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/buttons.print.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/buttons.html5.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/buttons.flash.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/pdfmake.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/vfs_fonts.js"></script>
		<!-- Datatable Setting js -->
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/datatable-setting.js"></script>
		
		<script>
		$(document).ready(function(){
			
			/* 1. 달력 파트 설정 부분들 */
			let promise = new Promise((resolve, reject) => {
				$.ajax({        
					url: '/acctbook/calModalResult',        
					type: 'POST',   
					success : function(result){
						var calData = JSON.parse(result); // data 객체화 (배열처리)
						if(calData != null){
							resolve(calData);							
						} else {
							reject('모달 description 불러오다가 에러 발생');
						}
					}
				});
			});
			
			promise
				.then((description) => {
					//console.log("promise 진입 : \n");
					//console.log(description.length);
					//for(let i = 0; i < description.length; i++) {
					//	console.log(description[i]);
					//}
					
					/* 달력 그리기 */
					jQuery("#calendarAcct").fullCalendar({
						themeSystem: "bootstrap4",
						businessHours: false,
						defaultView: "month",
						editable: false, // draggable, editable
						header: {
							left: "title",
							center: "거래내역",  // "month,agendaWeek,agendaDay"
							right: "today prev,next",
						},
						events: function(start, end, timezone, callback) {
							var events = [];
							
							// 캘린더 로드될 때 일별 지출,수입 출력
							$.ajax({
								url: "/acctbook/dayResult",
								type: "POST"
							})
							.done(function(data) {
								//alert('설마 여길 들어오겠어...');
								var list = JSON.parse(data);
								var title = '';
								// console.log(list);
								
								
								list.forEach(function(item) {
									//console.log("item.tranDt : " + item.tranDt);
									//console.log("description[0].tranDt : " + description[0].tranDt);
									
									if (item.tranType === '+') title = '수입';
									else if(item.tranType === '-') title = '지출'
									else title = '이체';
									
									events.push({
										title: title + ' ' + item.amountFm + '원',
										description: function(){
											var html = '';
											html += '<br>';
											html += '<table class="table table-bordered">';
											html += '<thead style="text-align: center;">';
											html += '	<tr style="background-color: #019591; color: white;">';
											html += '		<th scope="col">계좌별칭</th>';
											html += '		<th scope="col">계좌번호</th>';
											html += '		<th scope="col">거래처</th>';
											html += '		<th scope="col">거래금액</th>';
											html += '	</tr>';
											html += '</thead>';
											
											html += '<tbody id="tbody-shortinfo">';
											
											for(let j = 0; j < description.length; j++){
												console.log(item.tranDt + " / " + description[j].tranDt);
												
												console.log(description[j].opponentName);
												console.log(description[j].amountFm);
												
												if(item.tranDt === description[j].tranDt.substr(0, 10)
														&& item.tranType === description[j].tranType){
													html += '<tr>';
													html += '<td>' + description[j].bankAcctAlias + '</td>';
													html += '<td>' + description[j].bankAcctNum + '</td>';
													html += '<td>' + description[j].opponentName + '</td>';
													html += '<td>' + description[j].amountFm + '원</td>';
													html += '</tr>';
												} else {
													continue;
												}
											}
											
											html += '</tbody>';
											html += '</table>';
											
											return html;
										}, // 작은 모달창 안에 들어갈 내용
										start: item.tranDt, // .format('YYYY-MM-DD')  
										end: item.tranDt,
										className: "fc-bg-default",
										icon: "circle",
									});
								});
								callback(events);
							}); // ajax done.
						}, // events done.
						displayEventTime: false,
						
						dayClick: function (date, jsEvent, view) {
							
							const aa = new Date(date);
							
							function padTo2Digits(num) {
								return num.toString().padStart(2, '0');
							}
							const year = aa.getFullYear();
							const month = padTo2Digits(aa.getMonth() + 1);
							const day = padTo2Digits(aa.getDate());
							
							const selectedDay = [year, month, day].join('.');     //  날짜 형식 바꾸기!!!
							console.log(selectedDay); // 2022.09.01
							
							$("#selectedDay").val(selectedDay);
							
						},
						eventClick: function (event, jsEvent, view) {
							jQuery(".event-icon").html("<i class='fa fa-" + event.icon + "'></i>");
							jQuery(".event-title").html(event.title);
							jQuery(".event-body").html(event.description);
							jQuery(".eventUrl").attr("href", event.url);
							jQuery("#modal-view-event").modal();
						},
					});
				})
				.catch((error) => {
					console.log(error);
				});
			
			/* ----------------------------------------------------------------------------- */
			/* 2. 거래내역 파트 설정 부분들 */
			$('#calFilterBtn').click(function(){
				const acctNum = $('#acctNum').val();
				const startDate = $('#startDate').val();
				const endDate = $('#endDate').val();
				
				$.ajax({
					url: "/acctbook/calTranHisFilter",
					type: "POST",
					data: {
						acctNum,
						startDate,
						endDate
					},
					dataType: 'text'
				})
				.done(function(data) {
					var list = JSON.parse(data); // data 객체화 (배열처리)
					console.log(list);
					
					var html = '';
					$.each(list, function(index, val){
						html += '<tr>';
						html += '<td>' + (index+1) + '</td>';
						html += '<td>' + val.tranDt + '</td>';
						
						if(val.tranType === '-'){
							html += '<td>출금</td>';
						} else {
							html += '<td>입금</td>';
						}
						
						html += '<td>' + val.opponentName + '</td>';
						html += '<td>' + val.bankAcctAlias + '</td>';
						html += '<td>' + val.amountFm + '</td>';
						html += '<td>' + val.balanceFm + '</td>';
						html += '<td>' + val.content + '</td>';
						html += '</tr>';
					})
					$('#tbody-acctbook-tranlist').empty()
					$('#tbody-acctbook-tranlist').append(html);
				});
			});
			
			/* 거래내역 조회에 필요한 기간 설정 버튼 */
			function getDateStr(date){
				var year = date.getFullYear();
				var month = (date.getMonth() + 1);
				var day = date.getDate();
				
				month = (month < 10) ? "0" + String(month) : month;
				day = (day < 10) ? "0" + String(day) : day;
				
				return year + '.' + month + '.' + day;
			}
			
			
			$('#1DayBtn').click(function(){
				var now = new Date();
				
				$("#startDate").attr("value", getDateStr(now));
			    $("#endDate").attr("value", getDateStr(now));
			}); 
			$('#1WeekBtn').click(function(){
				var now = new Date();
			    $("#endDate").attr("value", getDateStr(now));
			    
				var dayOfMonth = now.getDate();
				now.setDate(dayOfMonth - 7);
			    $("#startDate").attr("value", getDateStr(now));
			});
			$('#1MonthBtn').click(function(){
				var now = new Date();
			    $("#endDate").attr("value", getDateStr(now));
			    
				var monthOfYear = now.getMonth();
				now.setMonth(monthOfYear - 1);
			    $("#startDate").attr("value", getDateStr(now));
			});
			$('#3MonthBtn').click(function(){
				var now = new Date();
			    $("#endDate").attr("value", getDateStr(now));
			    
				var monthOfYear = now.getMonth();
				now.setMonth(monthOfYear - 3);
			    $("#startDate").attr("value", getDateStr(now));
			});
			$('#6MonthBtn').click(function(){
				var now = new Date();
			    $("#endDate").attr("value", getDateStr(now));
			    
				var monthOfYear = now.getMonth();
				now.setMonth(monthOfYear - 6);
			    $("#startDate").attr("value", getDateStr(now));
			});
			
			/* ----------------------------------------------------------------------------- */
			/* 3. 예산 파트 설정 부분들 */
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
