<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8" />
<title>회원정보</title>

<!-- Site favicon -->
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/vendors/images/bank/hana_logo.png">


<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta http-equiv="X-UA-Compatible" content="ie=edge">
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
	href="${pageContext.request.contextPath}/resources/src/plugins/cropperjs/dist/cropper.css" />
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
		
	
	
<!-- <script src="https://unpkg.com/html5-qrcode" type="text/javascript"></script> -->
	<script src="${pageContext.request.contextPath}/resources/vendors/scripts/html5-qrcode.min.js"></script>


</head>
<body>
	<!-- header-->
	<jsp:include page="/WEB-INF/jsp/include/header.jsp">
		<jsp:param value="${dday}" name="dday" />
	</jsp:include>
	<div class="mobile-menu-overlay"></div>
	<div>
		<div>
			<div>

				<div class="main-container" style="padding-right: 300px;">
					<div class="pd-ltr-20 xs-pd-20-10">
						<div class="min-height-200px">
							<div class="row">
								<!-- <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 mb-30"> -->
									<div class="card-box" style="padding-top: 30px; width:350px; margin-left: 35px;">
										<h5 class="text-center h5 mb-0">${loginVO.name}</h5>
										<p class="text-center text-muted font-14">20대 중반 여성</p>
										<div class="profile-info" style="width:400px;">
											<h5 class="h5">개인정보 수정</h5>
											<ul>
												<li><span>이메일 주소</span>
													${loginVO.email}</li>
												<li><span>휴대폰번호</span>${phone}</li>
												<li><span>Address:</span>${loginVO.addr}</li>
											</ul>
										</div>
									</div>
									<br><br>
								<!-- </div> -->
								<div class="col-xl-8 col-lg-8 col-md-8 col-sm-12 mb-30" style="width: 380px; margin-left: 15px;">
									<div class="card-box height-100-p overflow-hidden" style="padding: 20px;">
										<div class="profile-tab height-100-p">
											<div class="tab height-100-p">
												<ul class="nav nav-tabs customtab" role="tablist">
													<li class="nav-item"><a class="nav-link active"
														data-toggle="tab" href="#QR" role="tab">QR코드스캔</a></li>
													<li class="nav-item"><a class="nav-link"
														data-toggle="tab" href="#tasks" role="tab">Tasks</a></li>
												</ul>
												
												<div class="tab-content">
													<!-- START QR코드 Tab -->
													<div class="tab-pane fade show active" id="QR"
														role="tabpanel">
														<div class="pd-20">
															<div class="profile-QR-headline">
																<div class="profile-QR-scanner">
																<br>
																	<h5 class="text-center h5 mb-0">코드 스캔</h5>
																	<p class="text-center text-muted font-14">
																		QR 코드를 스캔하거나 QR 이미지를 업로드 해보세요.<br>
																		(송금, 결제 등 이용가능)
																	</p>
																	<br>
																	<!-- style="width: 340px; height: 340px;" -->
																	<div id="reader"></div>
																	<br>
																	
																	<!-- <input type="file" id="qr-input-file" accept="image/*"> -->
																	<!-- Or add captured if you only want to enable smartphone camera, PC browsers will ignore it. -->
																	<input type="file" id="qr-input-file" accept="image/*" capture>
																		
																	<script>
																	
																	const html5QrCode = new Html5Qrcode("reader");
																	const qrCodeSuccessCallback = (decodedText, decodedResult) => {     
																	    /* handle success */
																	    alert('아래의 주소로 이동합니다: \n' + decodedText);
																	    document.getElementById("resultBtn").setAttribute('data-url',decodedText);
																	    
																	    $('#payment-modal').modal('show');
																	};
																	const config = { fps: 10, qrbox: { width: 250, height: 250 } };

																	// If you want to prefer back camera
																	//html5QrCode.start({ facingMode: "environment" }, config, qrCodeSuccessCallback);

																	// Select back camera or fail with `OverconstrainedError`.
																	html5QrCode.start({ facingMode: { exact: "environment"} }, config, qrCodeSuccessCallback);
																	//html5QrCode.start({ facingMode: "user" }, config, qrCodeSuccessCallback);
																	
																	function clickTohref(e){
																		location.href = $(e).attr('data-url');
																	}
										
																	</script>
																	
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- END of QR코드 Tab -->
									
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
		</div>
	</div>

	
	<div class="modal fade" id="payment-modal" tabindex="-1" role="dialog"
		style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-body text-center font-12">
					<h5 class="padding-top-30 mb-30 weight-200">
						결제 요청 페이지로 이동합니다.
					</h5>
					
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
							<!-- type="submit" -->
							<button id="resultBtn" 
								onclick="clickTohref(this)"
								class="btn btn-primary border-radius-100 btn-block confirmation-btn"
								data-dismiss="modal">
								<i class="fa fa-check"></i>
							</button>
							확인
						</div>
					</div>
					
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
		src="${pageContext.request.contextPath}/resources/src/plugins/cropperjs/dist/cropper.js"></script>

	<script>
	$('#resultBtn').click(function(){
		//location.href = '';
	});
	</script>
</body>
</html>
