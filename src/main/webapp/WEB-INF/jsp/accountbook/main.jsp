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
								<h4>계좌 가계부</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a
										href="{pageContext.request.contextPath}/">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">
										가계부</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

				<!-- tab 으로 이루어진 페이지 -->
				<div class="pd-20 card-box mb-30">

					<h5 class="h4 text-blue mb-20" style="color: #019591;">계좌 가계부</h5>
					<div class="tab">
						<ul class="nav nav-tabs customtab" role="tablist" style="color: #019591;">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#calendarView" role="tab"
								aria-selected="true" style="color: #019591;">달력</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#listView" role="tab" aria-selected="false"
								style="color: #019591;">거래내역</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#graphView" role="tab" aria-selected="false"
								style="color: #019591;">분석</a></li>
						</ul>
						<div class="tab-content">
							<!-- tab#1 : 달력 화면 -->
							<div class="tab-pane fade active show" id="calendarView"
								role="tabpanel">
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
													<div style="display: inline-block;">
														<button id="1" type="button"
															class="btn btn-secondary btn-sm"
															style="border-color: #019591; background-color: #019591; color: white;">당일</button>
														<button id="7" type="button"
															class="btn btn-secondary btn-sm"
															style="border-color: #019591; background-color: #019591; color: white;">1주일</button>
														<button id="30" type="button"
															class="btn btn-secondary btn-sm"
															style="border-color: #019591; background-color: #019591; color: white;">1개월</button>
														<button id="90" type="button"
															class="btn btn-secondary btn-sm"
															style="border-color: #019591; background-color: #019591; color: white;">3개월</button>
														<button id="180" type="button"
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
								<br>

								<div class="calendar-wrap">
									<div id="calendarAcct"></div>
								</div>
								<div class="pd-20"></div>
							</div>

							<!-- tab#2 : 거래내역 목록 화면 -->
							<div class="tab-pane fade" id="listView" role="tabpanel">
								<div class="pd-20">
									<h4 class="text-blue h4">${ loginVO.name }님의 상세 거래내역입니다.</h4>
								</div>
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
														aria-controls="DataTables_Table_2" rowspan="1" colspan="1"
														aria-label="Salart: activate to sort column ascending"
														style="display: none;">결제일</th>
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
														aria-sort="ascending">거래금액</th>
													<th class="sorting" tabindex="0"
														aria-controls="DataTables_Table_2" rowspan="1" colspan="1"
														aria-label="Start Date: activate to sort column ascending">잔액</th>
													
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${tranList}" var="list">
													<tr role="row" class="odd">
														<td style="display: none;">${list.tranDt}</td>
														<td class="table-plus" tabindex="0">
															<c:choose>
																<c:when test="${list.tranType eq '-'}">출금</c:when>
																<c:otherwise>입금</c:otherwise>
															</c:choose>
														</td>
														<td>${list.opponentName}</td>
														<td>${list.bankAcctAlias}</td>
														<td class="sorting_1">${list.amount}</td>
														<td>${list.balance}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>

									</div>
								</div>
								<br>
							</div>

							<!-- tab#3 : 데이터 분석 화면 -->
							<div class="tab-pane fade" id="graphView" role="tabpanel">
								<div class="pd-20">페이지 수정 중</div>
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

				<!-- 모달#2 : 입력 form + save/close 버튼 2개 -->
				
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
			
			/* 1. 달력 페이지 */
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
								console.log(list);
								
								
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
											html += '		<th scope="col">계좌별칭</th>';
											html += '		<th scope="col">계좌번호</th>';
											html += '		<th scope="col">거래처</th>';
											html += '		<th scope="col">거래금액</th>';
											html += '	</tr>';
											html += '</thead>';
											
											html += '<tbody id="tbody-shortinfo">';
											
											for(let j = 0; j < description.length; j++){
												// console.log(item.tranDt + " / " + description[j].tranDt);
												console.log(description[j].tranDt);
												if(item.tranDt === description[j].tranDt){
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
			
			
		});
		
		</script>
		
	</body>
</html>
