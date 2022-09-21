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
		<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->
		<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/src/plugins/bootstrap/bootstrap.min.css"> -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendors/styles/core.css" />
		<link
			rel="stylesheet"
			type="text/css"
			href="${pageContext.request.contextPath}/resources/vendors/styles/icon-font.min.css"
		/>
		<link
			rel="stylesheet"
			type="text/css"
			href="${pageContext.request.contextPath}/resources/src/plugins/datatables/css/dataTables.bootstrap4.min.css"
		/>
		<link
			rel="stylesheet"
			type="text/css"
			href="${pageContext.request.contextPath}/resources/src/plugins/datatables/css/responsive.bootstrap4.min.css"
		/>
		<link 
			rel="stylesheet" 
			type="text/css" 
			href="${pageContext.request.contextPath}/resources/vendors/styles/style.css" />

		<!-- Global site tag (gtag.js) - Google Analytics -->
		<script
			async
			src="https://www.googletagmanager.com/gtag/js?id=G-GBZ3SGGX85"
		></script>
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
		<!-- pre-loader -->
		<!-- <jsp:include page="/WEB-INF/jsp/include/pre-loader.jsp"></jsp:include> -->

		<!-- header-->
		<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
		
		<!-- RIGHT-SIDEBAR -->
		<jsp:include page="/WEB-INF/jsp/include/right-sidebar.jsp"></jsp:include>
		
		<!-- LEFT-SIDE-BAR -->
		<jsp:include page="/WEB-INF/jsp/include/left-side-bar.jsp"></jsp:include>
		
		<div class="mobile-menu-overlay"></div>

		<div class="main-container">
			<div class="pd-ltr-20">
				<div class="card-box pd-20 height-100-p mb-30">
					<div class="row align-items-center">
						<div class="col-md-4">
							<img src="${pageContext.request.contextPath}/resources/vendors/images/banner-img.png" alt="" />
						</div>
						<div class="col-md-8">
							<h4 class="font-20 weight-500 mb-10 text-capitalize">
							Welcome back
							<c:choose>
								<c:when test="${not empty loginVO}">
									<div class="weight-600 font-30 text-blue">안녕하세요 ${loginVO.name}님</div>
								</c:when>
								<c:otherwise>
									<div class="weight-600 font-30 text-blue">하나은행 서비스를 시작하시겠습니까? <br> 로그인이 필요합니다.</div>
								</c:otherwise>
							</c:choose>
							
							</h4>
							
							<p class="font-18 max-width-600">
								Lorem ipsum dolor sit amet, consectetur adipisicing elit. Unde
								hic non repellendus debitis iure, doloremque assumenda. Autem
								modi, corrupti, nobis ea iure fugiat, veniam non quaerat
								mollitia animi error corporis.
							</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-3 mb-30">
						<div class="card-box height-100-p widget-style1">
							<div class="d-flex flex-wrap align-items-center">
								<div class="progress-data">
									<div id="chart"></div>
								</div>
								<div class="widget-data">
									<div class="h4 mb-0">2020</div>
									<div class="weight-600 font-14">Contact</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 mb-30">
						<div class="card-box height-100-p widget-style1">
							<div class="d-flex flex-wrap align-items-center">
								<div class="progress-data">
									<div id="chart2"></div>
								</div>
								<div class="widget-data">
									<div class="h4 mb-0">400</div>
									<div class="weight-600 font-14">Deals</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 mb-30">
						<div class="card-box height-100-p widget-style1">
							<div class="d-flex flex-wrap align-items-center">
								<div class="progress-data">
									<div id="chart3"></div>
								</div>
								<div class="widget-data">
									<div class="h4 mb-0">350</div>
									<div class="weight-600 font-14">Campaign</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 mb-30">
						<div class="card-box height-100-p widget-style1">
							<div class="d-flex flex-wrap align-items-center">
								<div class="progress-data">
									<div id="chart4"></div>
								</div>
								<div class="widget-data">
									<div class="h4 mb-0">$6060</div>
									<div class="weight-600 font-14">Worth</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-8 mb-30">
						<div class="card-box height-100-p pd-20">
							<h2 class="h4 mb-20">Activity</h2>
							<div id="chart5"></div>
						</div>
					</div>
					<div class="col-xl-4 mb-30">
						<div class="card-box height-100-p pd-20">
							<h2 class="h4 mb-20">Lead Target</h2>
							<div id="chart6"></div>
						</div>
					</div>
				</div>
				<div class="card-box mb-30">
					<h2 class="h4 pd-20">Best Selling Products</h2>
					<table class="data-table table nowrap">
						<thead>
							<tr>
								<th class="table-plus datatable-nosort">Product</th>
								<th>Name</th>
								<th>Color</th>
								<th>Size</th>
								<th>Price</th>
								<th>Oty</th>
								<th class="datatable-nosort">Action</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="table-plus">
									<img
										src="${pageContext.request.contextPath}/resources/vendors/images/product-1.jpg"
										width="70"
										height="70"
										alt=""
									/>
								</td>
								<td>
									<h5 class="font-16">Shirt</h5>
									by John Doe
								</td>
								<td>Black</td>
								<td>M</td>
								<td>$1000</td>
								<td>1</td>
								<td>
									<div class="dropdown">
										<a
											class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
											href="#"
											role="button"
											data-toggle="dropdown"
										>
											<i class="dw dw-more"></i>
										</a>
										<div
											class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list"
										>
											<a class="dropdown-item" href="#"
												><i class="dw dw-eye"></i> View</a
											>
											<a class="dropdown-item" href="#"
												><i class="dw dw-edit2"></i> Edit</a
											>
											<a class="dropdown-item" href="#"
												><i class="dw dw-delete-3"></i> Delete</a
											>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td class="table-plus">
									<img
										src="${pageContext.request.contextPath}/resources/vendors/images/product-2.jpg"
										width="70"
										height="70"
										alt=""
									/>
								</td>
								<td>
									<h5 class="font-16">Boots</h5>
									by Lea R. Frith
								</td>
								<td>brown</td>
								<td>9UK</td>
								<td>$900</td>
								<td>1</td>
								<td>
									<div class="dropdown">
										<a
											class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
											href="#"
											role="button"
											data-toggle="dropdown"
										>
											<i class="dw dw-more"></i>
										</a>
										<div
											class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list"
										>
											<a class="dropdown-item" href="#"
												><i class="dw dw-eye"></i> View</a
											>
											<a class="dropdown-item" href="#"
												><i class="dw dw-edit2"></i> Edit</a
											>
											<a class="dropdown-item" href="#"
												><i class="dw dw-delete-3"></i> Delete</a
											>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td class="table-plus">
									<img
										src="${pageContext.request.contextPath}/resources/vendors/images/product-3.jpg"
										width="70"
										height="70"
										alt=""/>
								</td>
								<td>
									<h5 class="font-16">Hat</h5>
									by Erik L. Richards
								</td>
								<td>Orange</td>
								<td>M</td>
								<td>$100</td>
								<td>4</td>
								<td>
									<div class="dropdown">
										<a
											class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
											href="#"
											role="button"
											data-toggle="dropdown"
										>
											<i class="dw dw-more"></i>
										</a>
										<div
											class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list"
										>
											<a class="dropdown-item" href="#"
												><i class="dw dw-eye"></i> View</a
											>
											<a class="dropdown-item" href="#"
												><i class="dw dw-edit2"></i> Edit</a
											>
											<a class="dropdown-item" href="#"
												><i class="dw dw-delete-3"></i> Delete</a
											>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td class="table-plus">
									<img
										src="${pageContext.request.contextPath}/resources/vendors/images/product-4.jpg"
										width="70"
										height="70"
										alt=""
									/>
								</td>
								<td>
									<h5 class="font-16">Long Dress</h5>
									by Renee I. Hansen
								</td>
								<td>Gray</td>
								<td>L</td>
								<td>$1000</td>
								<td>1</td>
								<td>
									<div class="dropdown">
										<a
											class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
											href="#"
											role="button"
											data-toggle="dropdown"
										>
											<i class="dw dw-more"></i>
										</a>
										<div
											class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list"
										>
											<a class="dropdown-item" href="#"
												><i class="dw dw-eye"></i> View</a
											>
											<a class="dropdown-item" href="#"
												><i class="dw dw-edit2"></i> Edit</a
											>
											<a class="dropdown-item" href="#"
												><i class="dw dw-delete-3"></i> Delete</a
											>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td class="table-plus">
									<img
										src="${pageContext.request.contextPath}/resources/vendors/images/product-5.jpg"
										width="70"
										height="70"
										alt=""
									/>
								</td>
								<td>
									<h5 class="font-16">Blazer</h5>
									by Vicki M. Coleman
								</td>
								<td>Blue</td>
								<td>M</td>
								<td>$1000</td>
								<td>1</td>
								<td>
									<div class="dropdown">
										<a
											class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
											href="#"
											role="button"
											data-toggle="dropdown"
										>
											<i class="dw dw-more"></i>
										</a>
										<div
											class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list"
										>
											<a class="dropdown-item" href="#"
												><i class="dw dw-eye"></i> View</a
											>
											<a class="dropdown-item" href="#"
												><i class="dw dw-edit2"></i> Edit</a
											>
											<a class="dropdown-item" href="#"
												><i class="dw dw-delete-3"></i> Delete</a
											>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<!-- 
				<div class="footer-wrap pd-20 mb-20 card-box">
					DeskApp - Bootstrap 4 Admin Template By
					<a href="https://github.com/dropways" target="_blank"
						>Ankit Hingarajiya</a
					>
				</div>
				 -->
				<!-- footer -->
				<jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>
				
			</div>
		</div>
		<!-- welcome modal start -->
		<%-- <jsp:include page="/WEB-INF/jsp/include/welcome-modal.jsp"></jsp:include> --%>
		<!-- welcome modal end -->
		<!-- js -->
		<script src="${pageContext.request.contextPath}/resources/src/plugins/bootstrap/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/core.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/script.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/process.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/layout-settings.js"></script>
		<script src="${pageContext.request.contextPath}/resources/src/plugins/apexcharts/apexcharts.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/dashboard.js"></script>
		<!-- Google Tag Manager (noscript) -->
		<noscript
			><iframe
				src="https://www.googletagmanager.com/ns.html?id=GTM-NXZMQSS"
				height="0"
				width="0"
				style="display: none; visibility: hidden"
			></iframe
		></noscript>
		<!-- End Google Tag Manager (noscript) -->
	</body>
</html>
