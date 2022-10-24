<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8" />
<title>가계부현금</title>

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

				<!-- tab 으로 이루어진 페이지 -->
				<div class="pd-30 card-box mb-30">

					<h5 class="h4 text-blue mb-20" style="color: #019591;">현금 가계부</h5>
					<div class="tab">
						<ul class="nav nav-tabs customtab" role="tablist"
							style="color: #019591;">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#calendarView" role="tab"
								aria-selected="true" style="color: #019591;">달력</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#listView" role="tab" aria-selected="false"
								style="color: #019591;">거래내역</a></li>
						</ul>
						<div class="tab-content">
							<br>
							<!-- tab#1 : 달력 화면 -->
							<div class="tab-pane fade active show" id="calendarView"
								role="tabpanel">

								<div class="pd-10 row">
									<div class="col-4"></div>
									<div class="col-4"
										style="border: 3px solid #019591; border-radius: 10px;">
										<div class="col-8" style="float: left;">
											<h4 style="color: #019591; padding-top: 15px;">이번 달 현황</h4>
											<p>
												<strong>지출 : ${minus}원</strong><br> <strong>수입
													: ${plus }원</strong>
											</p>
										</div>
										<div class="col-4" style="float: left; padding-top: 42.5px;">

											<c:choose>
												<c:when test="${budgetChk eq 'N'}">
													<button type="button"
														class="btn btn-secondary btn-sm float-right"
														onclick="location.href = '${pageContext.request.contextPath}/budget'"
														style="border-color: #019591; background-color: #019591; color: white; display: inline-block; text-align: center; margin-left: 10px;">챌린지도전</button>
												</c:when>
												<c:otherwise>
													<button type="button"
														class="btn btn-secondary btn-sm float-right"
														onclick="location.href = '${pageContext.request.contextPath}/budget'"
														style="border-color: #019591; background-color: #019591; color: white; display: inline-block; text-align: center; margin-left: 10px;">예산
														확인</button>
												</c:otherwise>
											</c:choose>

										</div>
									</div>
									<div class="col-4"></div>
								</div>

								<div class="calendar-wrap" style="padding: 20px;">
									<div id="calendarCash"></div>
								</div>
								<div class="pd-20"></div>
							</div>

							<!-- tab#2 : 거래내역 목록 화면 -->
							<div class="tab-pane fade" id="listView" role="tabpanel"
								style="padding: 40px;">
								<div class="pd-20">
									<h4 style="color: #019591;">${ loginVO.name }님의 상세 거래내역입니다.</h4>
								</div>

								<br>

								<div>
									<ul>
										<li>계속해서 다른 페이의 거래내역을 조회하려면 거래방법을 선택한 후 [조회] 버튼을 누르세요.</li>
										<li>달력은 월 단위만 선택할 수 있습니다.</li>
									</ul>
								</div>

								<br>

								<div class="table-responsive" id="result-table">
									<table class="table table-bordered">
										<tbody>
											<tr>
												<td align="center"
													style="background-color: #019591; color: white;"
													valign="middle">거래방법</td>
												<td style="padding: 10px;">
													<div class="form-group col-md-5 col-sm-12">
														<select class="form-control" id="bankAcctAlias"
															name="bankAcctAlias">
															<c:forEach items="${payList}" var="pay"
																varStatus="status">
																<option value="${status.index}">${pay}</option>
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
													</div> <br>
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
									<button id="calFilterBtn" type="button"
										class="btn btn-secondary btn-sm"
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
													<!-- aria-label="Salart: activate to sort column ascending" -->
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
														aria-label="Office: activate to sort column ascending">거래수단</th>
													<th class="sorting_asc" tabindex="0"
														aria-controls="DataTables_Table_2" rowspan="1" colspan="1"
														aria-label="Address: activate to sort column descending"
														aria-sort="ascending">거래금액(원)</th>
													<th class="sorting" tabindex="0"
														aria-controls="DataTables_Table_2" rowspan="1" colspan="1"
														aria-label="Start Date: activate to sort column ascending">비고</th>
												</tr>
											</thead>
											<tbody id="tbody-cashbook-tranlist">
												<c:forEach items="${tranList}" var="list" varStatus="status">
													<tr role="row" class="odd">
														<td>${status.index + 1}</td>
														<td>${list.tranDt}</td>
														<td class="table-plus" tabindex="0"><c:choose>
																<c:when test="${list.tranType eq '-'}">출금</c:when>
																<c:otherwise>입금</c:otherwise>
															</c:choose></td>
														<td>${list.opponentName}</td>
														<td>${list.bankAcctAlias}</td>
														<td class="sorting_1">${list.amountFm}</td>
														<td>${list.content}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>

									</div>
								</div>
								<br>
							</div>

						</div>
					</div>

				</div>

				<!-- END of tab 으로 이루어진 페이지 -->

				<!-- 모달#1 : 거래내역 간단하게 보여줌 -->
				<div id="modal-view-event"
					class="modal modal-top fade calendar-modal">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-body">
								<h4 class="h4">
									<span class="event-icon weight-400 mr-3"></span><span
										class="event-title"></span>
								</h4>
								<div class="event-body"></div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>

				<!-- 모달#2 : 입력 form + save/close 버튼 2개 -->
				<div id="modal-view-event-add"
					class="modal modal-top fade calendar-modal">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<!-- form tag: action="${pageContext.request.contextPath}/acctbook/addNewTran" -->
							<form name="addForm">
								<div class="modal-body" style="padding: 40px;">
									<h4 class="text-blue h4 mb-10">거래내역 입력 창</h4>
									<div class="form-group">
										<label>입출금</label> <select class="form-control" id="tranType"
											name="tranType">
											<option value="-">보냈어요(출금)</option>
											<option value="+">받았어요(입금)</option>
										</select>
									</div>
									<div class="form-group">
										<label>금액(원)</label> <input type="text" class="form-control"
											id="amount" name="amount" />
									</div>

									<div class="form-group">
										<label>소비 카테고리</label> <select class="form-control"
											id="categoryCd" name="categoryCd">
											<option value="513121">의류/잡화</option>
											<option value="513211">가구</option>
											<option value="521100">슈퍼마켓</option>
											<option value="521910">백화점</option>
											<option value="521912">대형마트</option>
											<option value="521992">편의점</option>
											<option value="525102">정보통신</option>
											<option value="552101">음식점</option>
											<option value="111111">카페</option>
											<option value="601000">교통</option>
											<option value="630600">여행</option>
											<option value="659201">금융</option>
											<option value="842110">교육/학습</option>
											<option value="851113">종합병원</option>
											<option value="863000">의료/건강</option>
											<option value="924313">오락/문화</option>
											<option value="0">기타</option>
										</select>
									</div>
									<div class="form-group">
										<label>거래처</label> <input type="text" class="form-control"
											id="opponentName" name="opponentName" />
									</div>
									<div class="form-group">
										<label>거래수단</label> <select class="form-control" id="payType"
											name="payType">
											<c:forEach items="${payList}" var="pay" varStatus="status">
												<option value="${status.index}">${pay}</option>
											</c:forEach>
										</select>
									</div>
									<div class="form-group">
										<!-- calendar-setting.js (L160) -->
										<label>날짜</label> <input type="text" class="form-control"
											id="selectedDay" name="selectedDay" readonly="readonly" />
									</div>
									<div class="form-group">
										<label>비고</label>
										<textarea class="form-control" id="content" name="content"></textarea>
									</div>

								</div>
								<div class="modal-footer">
									<button type="button" id="calSubmitBtn" class="btn btn-primary">확인</button>
									<button type="button" class="btn btn-primary"
										data-dismiss="modal">취소</button>
								</div>
								<!-- day값 넣기 -->
								<!-- <input type="hidden" id="dayhidden"> -->
							</form>
						</div>
					</div>
				</div>
			</div>

			<!-- footer -->
			<jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>

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


	<script
		src="${pageContext.request.contextPath}/resources/vendors/scripts/calendar-setting.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>

	<!-- buttons for Export datatable -->
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/dataTables.buttons.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/buttons.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/buttons.print.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/buttons.html5.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/buttons.flash.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/pdfmake.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/vfs_fonts.js"></script>
	<!-- Datatable Setting js -->
	<script
		src="${pageContext.request.contextPath}/resources/vendors/scripts/datatable-setting.js"></script>

	<script type="text/javascript">
	$(document).ready(function(){
		
		/* 1. 달력 파트 설정 부분들 */
		let promise = new Promise((resolve, reject) => {
			$.ajax({        
				url: '/cashbook/calModalResult',        
				type: 'POST',   
				success : function(result){
					var calData = JSON.parse(result);
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
				/* 달력 그리기 */
				jQuery("#calendarCash").fullCalendar({
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
							url: "/cashbook/dayResult",
							type: "POST"
						})
						.done(function(data) {
							//alert('설마 여길 들어오겠어...');
							var list = JSON.parse(data);
							var title = '';
							//console.log('test : ' + list);
							
							
							list.forEach(function(item) {
								//console.log("item.tranDt : " + item.tranDt);
								//console.log("description[0].tranDt : " + description[0].tranDt);
								
								if (item.tranType === '+') title = '수입';
								else title = '지출';
								events.push({
									title: title + ' ' + item.amountFm + '원',
									description: function(){
										var html = '';
										html += '<br>';
										html += '<table class="table table-bordered">';
										html += '<thead style="text-align: center;">';
										html += '	<tr style="background-color: #019591; color: white;">';
										html += '		<th scope="col">거래방법</th>';
										html += '		<th scope="col">거래처</th>';
										html += '		<th scope="col">거래금액</th>';
										html += '	</tr>';
										html += '</thead>';
										
										html += '<tbody id="tbody-shortinfo">';
										for(let j = 0; j < description.length; j++){
											//console.log(item.tranDt + " / " + description[j].tranDt);
											//console.log(description[j].tranDt);
											
											if(item.tranDt === description[j].tranDt.substr(0,10)
													&& item.tranType === description[j].tranType){
												html += '<tr>';
												html += '<td>' + description[j].bankAcctAlias + '</td>';
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
						
						// 거래내역 입력 모달 띄우고 DB에 저장
						jQuery("#modal-view-event-add").modal();
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
		
		
		/* 달력 네모칸 클릭 > 새로운 거래내역 입력 > DB 저장 */
		$("#calSubmitBtn").click(function(){
			const tranType = $("#tranType").val();
			const amount = $("#amount").val();
			const categoryCd = $("#categoryCd").val();
			const opponentName = $("#opponentName").val();
			const payType = $("#payType").val();
			const tranDt = $("#selectedDay").val();
			const content = $("#content").val();

			//console.log(payType);
			
			if(payType == 0 || payType == null){
				alert('거래수단을 선택해주세요.');
				$('#payType').focus();
				return false;
			} else {
				const data = {
						tranType : tranType,
						amount : amount,
						categoryCd : categoryCd,
						opponentName : opponentName,
						payType : payType,
						tranDt : tranDt,
						content : content
				}
				
				$.ajax({
					url:"/cashbook/action",
					type:"POST",
					data:data
				})
				.done(function(data){ 
					// 방금 입력한 데이터까지 포함해서 달력 다시 그려주기
					$('#calendarCash').fullCalendar('refetchEvents');
					// 모달 창 닫기
					$('#modal-view-event-add').modal('hide');
					$('#modal-view-event-add').on('hidden.bs.modal', function (e) {
						document.forms['addForm'].reset();
					});
				})
				.fail(function(data){
					alert('실패!');
				});
			}
			
		});
		
		
		/* ----------------------------------------------------------------------------- */
		/* 2. 거래내역 파트 설정 부분들 */
		$('#calFilterBtn').click(function(){
			var bankAcctAlias = '';
			
			if($('#bankAcctAlias').val() === 0){
				alert('거래수단을 선택해주세요.');
				$('#payType').focus();
				return false;
			} else {
				if($('#bankAcctAlias').val() === '1'){
					bankAcctAlias = 'cash money';
				} else if($('#bankAcctAlias').val() === '2'){
					bankAcctAlias = '원큐페이';
				} else {
					bankAcctAlias = '카카오페이';
				} 
			}
			var startDate = $('#startDate').val();
			var endDate = $('#endDate').val();
			
			$.ajax({
				url: "/cashbook/calTranHisFilter",
				type: "POST",
				data: {
					bankAcctAlias,
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
					html += '<td>' + val.content + '</td>';
					html += '</tr>';
				})
				$('#tbody-cashbook-tranlist').empty()
				$('#tbody-cashbook-tranlist').append(html);
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
	});
	</script>

</body>
</html>
