<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>온라인 간편결제 모듈페이지</title>
	<!-- Site favicon -->
	<link rel="icon" type="image/png"
		href="${pageContext.request.contextPath}/resources/vendors/images/bank/hana_logo.png">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/styles/kakaopay/main.css">
	<link rel="stylesheet" media="screen"
			href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.6.1.js"
			integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
			crossorigin="anonymous"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
	<div id="kakaoIndex">
		<a href="#kakaoBody">본문 바로가기</a>
	</div>
	<div class="wrap_demo" id="kakaoWrap">
		<header id="kakaoHead">
			<h1 class="tit_kakaopay">카카오페이</h1>
			<hr class="hide">
			<main id="kakaoContent">
				<br><br>
				
				<article id="mArticle">
					<h2 class="tit_demo" id="kakaoBody"><strong>상품 QR 결제를 시작합니다.</strong></h2><br><br>
					<h5><strong>결제하기 전, 아래의 절차대로 준비해주세요.</strong></h5><br>
					<div class="row txt_demo">
						<div class="col-3 txt_demo"></div>
						<div class="col-9 txt_demo text-left" style="font-weight: bold; ">
							
						1. 하나은행 홈페이지 로그인 > 회원정보 > 간편결제를 위한 QR코드 스캐너 (카메라 촬영 동의하기)
						   또는 간편결제 앱을 실행합니다.<br><br>
						2. 아래의 두 가지 결제 방법 중 하나를 선택합니다.<br><br>
						3. QR코드 촬영 : 소비자는 간편결제 앱 또는 하나은행 홈페이지의 QR코드 촬영 모드로 QR코드를 촬영합니다.<br><br>
						4. 소비자는 결제 정보를 확인하고 결제를 진행합니다.<br><br>
						</div>
						<!-- <div class="col-1 txt_demo"></div> -->					
					</div>
					<br><br><br>
					<div class="pay_btn">
						<button class="btn_pay btn_pay_hover" type="button" id="kakao_btn"
							onclick="payment('kakao')">카카오페이 결제</button>
							<button class="btn_pay btn_pay_hover" type="button" id="kakao_btn"
							onclick="payment('oneq')">원큐페이 결제</button>
						<!-- <button class="btn_pay btn_pay_hover" type="button"
							onclick="payment('web')">원큐페이 결제</button> -->
					</div>
					
					<!-- <p class="txt_append">모바일 결제는 모바일 기기로 접속시 가능합니다.</p> -->
				</article>
			</main>
		</header>
	</div>
	
	<script>
		$(document).ready(function() {
			if (!/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
				$('#mobile').attr('disabled', 'disabled');
				$('#mobile').removeClass('btn_pay_hover');
				$('#mobile').css('cursor', 'no-drop');
			}
		});
		
		function payment(userAgent) {
			var url = '';
			// var qrContent = 'http://192.168.35.238:8080/pay/oneq/transfer'; // wifi > 모바일에서 IPv4:port 주소로 localhost 접속
			var qrContent = 'http://192.168.0.3:8080/pay/oneq/transfer'; // 재철오빠 집 ipv4
			console.log(userAgent);
			if(userAgent == 'kakao'){
				url = '/pay/kakao/begin';
			} else {
				url = '/showQRCode?qrContent=' + qrContent;
			}
			location.href = url;
			
			/* 
			var params = {
				agent : userAgent,
				itemCode : '1',
				quantity : '1',
			}
			location.href = url + '?' + $.param(params) */
		}
	</script>
</body>

</html>