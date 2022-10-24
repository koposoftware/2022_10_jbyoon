<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8" />
<title>문의하기</title>

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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainview/plugins/bootstrap/bootstrap.min.css">
		<!-- FontAwesome -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainview/plugins/fontawesome/css/all.min.css">
		<!-- Animation -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainview/plugins/animate-css/animate.css">
		<!-- Template styles-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainview/css/style.css">
		


<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=G-GBZ3SGGX85"></script>
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
	<!-- header-->
	<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>

	<!-- RIGHT-SIDEBAR -->
	<jsp:include page="/WEB-INF/jsp/include/right-sidebar.jsp"></jsp:include>

	<!-- LEFT-SIDE-BAR -->
	<jsp:include page="/WEB-INF/jsp/include/left-side-bar.jsp"></jsp:include>

	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px"><br><br>
				<div class="page-header">
					<div class="row">
						<div class="col-md-12 col-sm-12">
							<div class="title">
								<h4>Frequently asked questions</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">Home</a>
									</li>
									<li class="breadcrumb-item active" aria-current="page">
										FAQ</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
				<div class="faq-wrap">
					<h4 class="mb-20 h4 text-blue">Accordion example</h4>
					<div id="accordion">
						<div class="card">
							<div class="card-header">
								<button class="btn btn-block" data-toggle="collapse"
									data-target="#faq1">Collapsible Group Item
									#1</button>
							</div>
							<div id="faq1" class="collapse show" data-parent="#accordion">
								<div class="card-body">Anim pariatur cliche reprehenderit,
									enim eiusmod high life accusamus terry richardson ad squid. 3
									wolf moon officia aute, non cupidatat skateboard dolor brunch.
									Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
									tempor, sunt aliqua put a bird on it squid single-origin coffee
									nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
									craft beer labore wes anderson cred nesciunt sapiente ea
									proident. Ad vegan excepteur butcher vice lomo. Leggings
									occaecat craft beer farm-to-table, raw denim aesthetic synth
									nesciunt you probably haven't heard of them accusamus labore
									sustainable VHS.</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header">
								<button class="btn btn-block collapsed" data-toggle="collapse"
									data-target="#faq2">Collapsible Group Item
									#2</button>
							</div>
							<div id="faq2" class="collapse" data-parent="#accordion">
								<div class="card-body">Anim pariatur cliche reprehenderit,
									enim eiusmod high life accusamus terry richardson ad squid. 3
									wolf moon officia aute, non cupidatat skateboard dolor brunch.
									Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
									tempor, sunt aliqua put a bird on it squid single-origin coffee
									nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
									craft beer labore wes anderson cred nesciunt sapiente ea
									proident. Ad vegan excepteur butcher vice lomo. Leggings
									occaecat craft beer farm-to-table, raw denim aesthetic synth
									nesciunt you probably haven't heard of them accusamus labore
									sustainable VHS.</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header">
								<button class="btn btn-block collapsed" data-toggle="collapse"
									data-target="#faq3">Collapsible Group Item
									#3</button>
							</div>
							<div id="faq3" class="collapse" data-parent="#accordion">
								<div class="card-body">
									<p>Anim pariatur cliche reprehenderit, enim eiusmod high
										life accusamus terry richardson ad squid. 3 wolf moon officia
										aute, non cupidatat skateboard dolor brunch. Food truck quinoa
										nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt
										aliqua put a bird on it squid single-origin coffee nulla
										assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft
										beer labore wes anderson cred nesciunt sapiente ea proident.
										Ad vegan excepteur butcher vice lomo. Leggings occaecat craft
										beer farm-to-table, raw denim aesthetic synth nesciunt you
										probably haven't heard of them accusamus labore sustainable
										VHS.</p>
									<p class="mb-0">Anim pariatur cliche reprehenderit, enim
										eiusmod high life accusamus terry richardson ad squid. 3 wolf
										moon officia aute, non cupidatat skateboard dolor brunch. Food
										truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
										tempor, sunt aliqua put a bird on it squid single-origin
										coffee nulla assumenda shoreditch et. Nihil anim keffiyeh
										helvetica, craft beer labore wes anderson cred nesciunt
										sapiente ea proident. Ad vegan excepteur butcher vice lomo.
										Leggings occaecat craft beer farm-to-table, raw denim
										aesthetic synth nesciunt you probably haven't heard of them
										accusamus labore sustainable VHS.</p>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header">
								<button class="btn btn-block collapsed" data-toggle="collapse"
									data-target="#faq4">Collapsible Group Item
									#4</button>
							</div>
							<div id="faq4" class="collapse" data-parent="#accordion">
								<div class="card-body">Anim pariatur cliche reprehenderit,
									enim eiusmod high life accusamus terry richardson ad squid. 3
									wolf moon officia aute, non cupidatat skateboard dolor brunch.
									Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
									tempor, sunt aliqua put a bird on it squid single-origin coffee
									nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
									craft beer labore wes anderson cred nesciunt sapiente ea
									proident. Ad vegan excepteur butcher vice lomo. Leggings
									occaecat craft beer farm-to-table, raw denim aesthetic synth
									nesciunt you probably haven't heard of them accusamus labore
									sustainable VHS.</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header">
								<button class="btn btn-block collapsed" data-toggle="collapse"
									data-target="#faq5">Collapsible Group Item
									#5</button>
							</div>
							<div id="faq5" class="collapse" data-parent="#accordion">
								<div class="card-body">Anim pariatur cliche reprehenderit,
									enim eiusmod high life accusamus terry richardson ad squid. 3
									wolf moon officia aute, non cupidatat skateboard dolor brunch.
									Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
									tempor, sunt aliqua put a bird on it squid single-origin coffee
									nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
									craft beer labore wes anderson cred nesciunt sapiente ea
									proident. Ad vegan excepteur butcher vice lomo. Leggings
									occaecat craft beer farm-to-table, raw denim aesthetic synth
									nesciunt you probably haven't heard of them accusamus labore
									sustainable VHS.</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header">
								<button class="btn btn-block collapsed" data-toggle="collapse"
									data-target="#faq6">Collapsible Group Item
									#6</button>
							</div>
							<div id="faq6" class="collapse" data-parent="#accordion">
								<div class="card-body">
									<p>Anim pariatur cliche reprehenderit, enim eiusmod high
										life accusamus terry richardson ad squid. 3 wolf moon officia
										aute, non cupidatat skateboard dolor brunch. Food truck quinoa
										nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt
										aliqua put a bird on it squid single-origin coffee nulla
										assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft
										beer labore wes anderson cred nesciunt sapiente ea proident.
										Ad vegan excepteur butcher vice lomo. Leggings occaecat craft
										beer farm-to-table, raw denim aesthetic synth nesciunt you
										probably haven't heard of them accusamus labore sustainable
										VHS.</p>
									<p class="mb-0">Anim pariatur cliche reprehenderit, enim
										eiusmod high life accusamus terry richardson ad squid. 3 wolf
										moon officia aute, non cupidatat skateboard dolor brunch. Food
										truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
										tempor, sunt aliqua put a bird on it squid single-origin
										coffee nulla assumenda shoreditch et. Nihil anim keffiyeh
										helvetica, craft beer labore wes anderson cred nesciunt
										sapiente ea proident. Ad vegan excepteur butcher vice lomo.
										Leggings occaecat craft beer farm-to-table, raw denim
										aesthetic synth nesciunt you probably haven't heard of them
										accusamus labore sustainable VHS.</p>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- footer-->
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

</body>
</html>
