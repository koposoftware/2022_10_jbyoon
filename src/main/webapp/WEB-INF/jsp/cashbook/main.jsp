<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<!-- Basic Page Info -->
		<meta charset="utf-8" />
		<title>DeskApp - Bootstrap Admin Dashboard HTML Template</title>

		<!-- Site favicon -->
		<link
			rel="apple-touch-icon"
			sizes="180x180"
			href="${pageContext.request.contextPath}/resources/vendors/images/apple-touch-icon.png"
		/>
		<link
			rel="icon"
			type="image/png"
			sizes="32x32"
			href="${pageContext.request.contextPath}/resources/vendors/images/favicon-32x32.png"
		/>
		<link
			rel="icon"
			type="image/png"
			sizes="16x16"
			href="${pageContext.request.contextPath}/resources/vendors/images/favicon-16x16.png"
		/>

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

		<!-- Global site tag (gtag.js) - Google Analytics -->
		<script async src="https://www.googletagmanager.com/gtag/js?id=G-GBZ3SGGX85"></script>
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
		
	</head>
	<body>
		<div class="header">
			<div class="header-left">
				<div class="menu-icon bi bi-list"></div>
				<div
					class="search-toggle-icon bi bi-search"
					data-toggle="header_search">
				</div>
				<div class="header-search">
					<form>
						<div class="form-group mb-0">
							<i class="dw dw-search2 search-icon"></i>
							<input
								type="text"
								class="form-control search-input"
								placeholder="Search Here"/>
							<div class="dropdown">
								<a	class="dropdown-toggle no-arrow"
									href="#"
									role="button"
									data-toggle="dropdown">
									<i class="ion-arrow-down-c"></i>
								</a>
								<div class="dropdown-menu dropdown-menu-right">
									<div class="form-group row">
										<label class="col-sm-12 col-md-2 col-form-label">From</label>
										<div class="col-sm-12 col-md-10">
											<input
												class="form-control form-control-sm form-control-line"
												type="text"/>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-12 col-md-2 col-form-label">To</label>
										<div class="col-sm-12 col-md-10">
											<input
												class="form-control form-control-sm form-control-line"
												type="text"/>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-12 col-md-2 col-form-label"
											>Subject</label>
										<div class="col-sm-12 col-md-10">
											<input
												class="form-control form-control-sm form-control-line"
												type="text"/>
										</div>
									</div>
									<div class="text-right">
										<button class="btn btn-primary">Search</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="header-right">
				<div class="dashboard-setting user-notification">
					<div class="dropdown">
						<a
							class="dropdown-toggle no-arrow"
							href="javascript:;"
							data-toggle="right-sidebar"
						>
							<i class="dw dw-settings2"></i>
						</a>
					</div>
				</div>
				<div class="user-notification">
					<div class="dropdown">
						<a
							class="dropdown-toggle no-arrow"
							href="#"
							role="button"
							data-toggle="dropdown">
							
							<i class="icon-copy dw dw-notification"></i>
							<span class="badge notification-active"></span>
						</a>
						<div class="dropdown-menu dropdown-menu-right">
							<div class="notification-list mx-h-350 customscroll">
								<ul>
									<li>
										<a href="#">
											<img src="${pageContext.request.contextPath}/resources/vendors/images/img.jpg" alt="" />
											<h3>John Doe</h3>
											<p>
												Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed...
											</p>
										</a>
									</li>
									<li>
										<a href="#">
											<img src="${pageContext.request.contextPath}/resources/vendors/images/photo1.jpg" alt="" />
											<h3>Lea R. Frith</h3>
											<p>
												Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed...
											</p>
										</a>
									</li>
									<li>
										<a href="#">
											<img src="${pageContext.request.contextPath}/resources/vendors/images/photo2.jpg" alt="" />
											<h3>Erik L. Richards</h3>
											<p>
												Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed...
											</p>
										</a>
									</li>
									<li>
										<a href="#">
											<img src="${pageContext.request.contextPath}/resources/vendors/images/photo3.jpg" alt="" />
											<h3>John Doe</h3>
											<p>
												Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed...
											</p>
										</a>
									</li>
									<li>
										<a href="#">
											<img src="${pageContext.request.contextPath}/resources/vendors/images/photo4.jpg" alt="" />
											<h3>Renee I. Hansen</h3>
											<p>
												Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed...
											</p>
										</a>
									</li>
									<li>
										<a href="#">
											<img src="${pageContext.request.contextPath}/resources/vendors/images/img.jpg" alt="" />
											<h3>Vicki M. Coleman</h3>
											<p>
												Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed...
											</p>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="user-info-dropdown">
					<div class="dropdown">
						<a
							class="dropdown-toggle"
							href="#"
							role="button"
							data-toggle="dropdown"
						>
							<span class="user-icon">
								<img src="${pageContext.request.contextPath}/resources/vendors/images/photo1.jpg" alt="" />
							</span>
							<span class="user-name">Ross C. Lopez</span>
						</a>
						<div
							class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
							<a class="dropdown-item" href="profile.html">
								<i class="dw dw-user1"></i> Profile
							</a>
							<a class="dropdown-item" href="profile.html">
								<i class="dw dw-settings2"></i> Setting
							</a>
							<a class="dropdown-item" href="faq.html">
								<i class="dw dw-help"></i> Help
							</a>
							<a class="dropdown-item" href="login.html">
								<i class="dw dw-logout"></i> Log Out
							</a>
						</div>
					</div>
				</div>
				<div class="github-link">
					<a href="https://github.com/dropways/deskapp" target="_blank"
						><img src="${pageContext.request.contextPath}/resources/vendors/images/github.svg" alt=""
					/></a>
				</div>
			</div>
		</div>

		<div class="right-sidebar">
			<div class="sidebar-title">
				<h3 class="weight-600 font-16 text-blue">
					Layout Settings
					<span class="btn-block font-weight-400 font-12"
						>User Interface Settings</span>
				</h3>
				<div class="close-sidebar" data-toggle="right-sidebar-close">
					<i class="icon-copy ion-close-round"></i>
				</div>
			</div>
			<div class="right-sidebar-body customscroll">
				<div class="right-sidebar-body-content">
					<h4 class="weight-600 font-18 pb-10">Header Background</h4>
					<div class="sidebar-btn-group pb-30 mb-10">
						<a
							href="javascript:void(0);"
							class="btn btn-outline-primary header-white active"
							>White</a>
						<a
							href="javascript:void(0);"
							class="btn btn-outline-primary header-dark"
							>Dark</a>
					</div>

					<h4 class="weight-600 font-18 pb-10">Sidebar Background</h4>
					<div class="sidebar-btn-group pb-30 mb-10">
						<a
							href="javascript:void(0);"
							class="btn btn-outline-primary sidebar-light"
							>White</a>
						<a
							href="javascript:void(0);"
							class="btn btn-outline-primary sidebar-dark active"
							>Dark</a>
					</div>

					<h4 class="weight-600 font-18 pb-10">Menu Dropdown Icon</h4>
					<div class="sidebar-radio-group pb-10 mb-10">
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebaricon-1"
								name="menu-dropdown-icon"
								class="custom-control-input"
								value="icon-style-1"
								checked=""/>
							<label class="custom-control-label" for="sidebaricon-1">
								<i class="fa fa-angle-down"></i>
							</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebaricon-2"
								name="menu-dropdown-icon"
								class="custom-control-input"
								value="icon-style-2"/>
							<label class="custom-control-label" for="sidebaricon-2">
								<i class="ion-plus-round"></i>
							</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebaricon-3"
								name="menu-dropdown-icon"
								class="custom-control-input"
								value="icon-style-3"
							/>
							<label class="custom-control-label" for="sidebaricon-3"
								><i class="fa fa-angle-double-right"></i
							></label>
						</div>
					</div>

					<h4 class="weight-600 font-18 pb-10">Menu List Icon</h4>
					<div class="sidebar-radio-group pb-30 mb-10">
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebariconlist-1"
								name="menu-list-icon"
								class="custom-control-input"
								value="icon-list-style-1"
								checked=""
							/>
							<label class="custom-control-label" for="sidebariconlist-1"
								><i class="ion-minus-round"></i
							></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebariconlist-2"
								name="menu-list-icon"
								class="custom-control-input"
								value="icon-list-style-2"
							/>
							<label class="custom-control-label" for="sidebariconlist-2"
								><i class="fa fa-circle-o" aria-hidden="true"></i
							></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebariconlist-3"
								name="menu-list-icon"
								class="custom-control-input"
								value="icon-list-style-3"
							/>
							<label class="custom-control-label" for="sidebariconlist-3"
								><i class="dw dw-check"></i
							></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebariconlist-4"
								name="menu-list-icon"
								class="custom-control-input"
								value="icon-list-style-4"
								checked=""
							/>
							<label class="custom-control-label" for="sidebariconlist-4"
								><i class="icon-copy dw dw-next-2"></i
							></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebariconlist-5"
								name="menu-list-icon"
								class="custom-control-input"
								value="icon-list-style-5"
							/>
							<label class="custom-control-label" for="sidebariconlist-5"
								><i class="dw dw-fast-forward-1"></i
							></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebariconlist-6"
								name="menu-list-icon"
								class="custom-control-input"
								value="icon-list-style-6"
							/>
							<label class="custom-control-label" for="sidebariconlist-6"
								><i class="dw dw-next"></i
							></label>
						</div>
					</div>

					<div class="reset-options pt-30 text-center">
						<button class="btn btn-danger" id="reset-settings">
							Reset Settings
						</button>
					</div>
				</div>
			</div>
		</div>

		<!-- LEFT-SIDE-BAR -->
		<jsp:include page="/WEB-INF/jsp/include/left-side-bar.jsp"></jsp:include>
		
		<div class="mobile-menu-overlay"></div>

		<div class="main-container">
			<div class="pd-ltr-20 xs-pd-20-10">
				<div class="min-height-200px">
					<div class="page-header">
						<div class="row">
							<div class="col-md-12 col-sm-12">
								<div class="title">
									<h4>현금 및 pay머니 입출금을 기록하는 가계부</h4>
								</div>
								<nav aria-label="breadcrumb" role="navigation">
									<ol class="breadcrumb">
										<li class="breadcrumb-item">
											<a href="{pageContext.request.contextPath}/">Home</a>
										</li>
										<li class="breadcrumb-item active" aria-current="page">
											가계부
										</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
					<div class="pd-20 card-box mb-30">
						<div class="calendar-wrap">
							<div id="calendarCash"></div>
						</div>
	
						<!-- Export Data Table Start -->
						<br><br>

						<div class="card-box mb-30">
							<div class="pd-20">
								<h4 class="text-blue h4">${ loginVO.name }님의 상세 거래내역입니다.</h4>
							</div>
							<div class="pb-20">
								<div id="DataTables_Table_2_wrapper"
									class="dataTables_wrapper dt-bootstrap4 no-footer">
									<table
										class="table hover multiple-select-row data-table-export nowrap dataTable no-footer dtr-inline collapsed"
										id="DataTables_Table_2" role="grid">
										<thead>
											<tr role="row">
												<th class="table-plus datatable-nosort sorting_disabled"
													rowspan="1" colspan="1" aria-label="tranType">입금/출금</th>
												<th class="sorting" tabindex="0"
													aria-controls="DataTables_Table_2" rowspan="1" colspan="1"
													aria-label="Age: activate to sort column ascending"
													>거래처</th>
												<th class="sorting" tabindex="0"
													aria-controls="DataTables_Table_2" rowspan="1" colspan="1"
													aria-label="Office: activate to sort column ascending">통장별칭</th>
												<th class="sorting_asc" tabindex="0"
													aria-controls="DataTables_Table_2" rowspan="1" colspan="1"
													aria-label="Address: activate to sort column descending"
													aria-sort="ascending">거래금액</th>
												<th class="sorting" tabindex="0"
													aria-controls="DataTables_Table_2" rowspan="1" colspan="1"
													aria-label="Start Date: activate to sort column ascending">잔액</th>
												<th class="sorting" tabindex="0"
													aria-controls="DataTables_Table_2" rowspan="1" colspan="1"
													aria-label="Salart: activate to sort column ascending"
													style="display: none;">결제일</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${HanaList}" var="list">
											<tr role="row" class="odd">
												<td class="table-plus" tabindex="0" style="">${list.tranType}</td>
												<td>${list.opponent}</td>
												<td>${list.alias}</td>
												<td class="sorting_1">${list.cost}</td>
												<td>${list.balance}</td>
												<td style="display: none;">${list.tranDt}</td>
											</tr>
										</c:forEach>
											
										</tbody>
									</table>
									
								</div>
							</div>
						</div>

					<!-- End of Export Data Table -->
	
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
									<div class="event-body" id="testModal"></div>
								</div>

								<!-- 모달#1 : event 내용 + close 버튼 1개 -->
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
									<div class="modal-body">
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
												<option value="0">식비</option>
												<option value="1">생활</option>
												<option value="2">카페/간식</option>
												<option value="3">술/유흥</option>
												<option value="4">패션</option>
												<option value="5">미용/뷰티</option>
												<option value="6">교통</option>
												<option value="7">주거/통신</option> 
												<option value="8">의료/건강</option> 
												<option value="9">금융</option> 
												<option value="10">문화/여가</option> 
												<option value="11">여행/숙박</option> 
												<option value="12">교육/학습</option> 
												<option value="13">자녀/육아</option> 
												<option value="14">반려동물</option> 
												<option value="15">경조/선물</option> 
											</select> 
										</div> 
										<div class="form-group"> 
											<label>거래처</label> <input type="text" class="form-control" 
												id="opponentName" name="opponentName" /> 
										</div> 
										<div class="form-group"> 
											<label>거래 방식 선택</label> 
											<select class="form-control" id="acctAlias" name="acctAlias">
												<c:forEach items="" var="pay">
													<option value="pay_OneQ">${pay.alias}</option> 												
												</c:forEach>
												<!-- <option value="하나로카드">하나로 카드</option> 
												<option value="여행카드">여행 카드</option> --> 
												<option value="pay_OneQ">원큐페이</option> 
												<option value="pay_Kakao">카카오페이</option> 
											</select> 
										</div> 
										<div class="form-group"> 
											<!-- calendar-setting.js (L160) -->
											<label>날짜</label> 
											<input type="text" class="form-control" 
													id="selectedDay" name="selectedDay" readonly="readonly"/>
										</div>
										<div class="form-group">
											<label>메모</label>
											<textarea class="form-control" id="content" name="content"></textarea>
										</div>

									</div>
									<div class="modal-footer">
										<button type="button" id="calSubmitBtn" class="btn btn-primary">Save</button>
										<button type="button" class="btn btn-primary"
											data-dismiss="modal">Close</button>
									</div>
									<!-- day값 넣기 -->
									<!-- <input type="hidden" id="dayhidden"> -->
								</form>
							</div>
						</div>
					</div>
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
		
		<script type="text/javascript">
		
		$(document).ready(function(){
			$("#calSubmitBtn").click(function(){
				const tranType = $("#tranType").val();
				const amount = $("#amount").val();
				const categoryCd = $("#categoryCd").val();
				const opponentName = $("#opponentName").val();
				const acctAlias = $("#acctAlias").val();
				const tranDt = $("#selectedDay").val();
				const content = $("#content").val();
				
				const data = {
					tranType : tranType,
					amount : amount,
					categoryCd : categoryCd,
					opponentName : opponentName,
					acctAlias : acctAlias,
					tranDt : tranDt,
					content : content
				}
				
				$.ajax({
					url:"/cashbook/addToCal",
					type:"POST",
					data:data
				})
				.done(function(data){ 
					var calData = JSON.parse(data); // data 객체화 (배열처리)
					console.log(calData);
					
					var str = "";
					str = calData.tranDt + " 총 누적액 : " + calData.dayIn + "원 / " + calData.dayOut + "원";
					console.log(str);
					
					$('#calendar').fullCalendar('refetchEvents');

					// 모달 창 닫기
					$('#modal-view-event-add').modal('hide');
					$('#modal-view-event-add').on('hidden.bs.modal', function (e) {
						document.forms['addForm'].reset();
					});
				})
				.fail(function(data){
					alert('실패!');
				});
				
			});
			
			// fullcalender
			
		});
		
		
		</script>
		
	</body>
</html>
