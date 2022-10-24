<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QR code</title>
	<!-- Site favicon -->
	<link rel="icon" type="image/png"
		href="${pageContext.request.contextPath}/resources/vendors/images/bank/oneqpay_icon.png">

	<link rel="stylesheet" media="screen"
		href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/vendors/styles/oneqpay/index.min.css">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/vendors/styles/oneqpay/reset.min.css">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/vendors/styles/oneqpay/swiper-4.5.1.min.css">
	<!-- <link rel="stylesheet" href="https://t1.daumcdn.net/kakaopay/tesla/20211007/css/swiper-4.5.1.min.css"> -->
	<script src="https://code.jquery.com/jquery-3.6.1.js"
				integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
				crossorigin="anonymous"></script>
</head>
<body>

	<div class="card-box">
		
		<h1 class="logo-kakaopay">
			<img alt="oneqpay_icon" src="${pageContext.request.contextPath}/resources/vendors/images/bank/oneqpay_icon.png"
				 style="width:60px; height:60px;">
			<span class="blind">원큐페이아이콘</span>
		</h1>
		<button class="button-close btn_close" id="close_btn" aria-label="카카오페이 결제화면 닫기">
			<img alt="oneqpay_icon" src="${pageContext.request.contextPath}/resources/vendors/images/bank/close_btn.png"
				 style="width:40px; height:40px;">
		</button>

		<div class="paper-box">
			<div
				class="menu-box swiper-pagination-clickable swiper-pagination-bullets">
				<button
					class="swiper-pagination-bullet button-menu qr swiper-pagination-bullet-active"
					tabindex="0" role="button" aria-label="Go to slide 1">QR결제</button>
				<button class="swiper-pagination-bullet button-menu kakaotalk"
					tabindex="0" role="button" aria-label="Go to slide 2">연락처결제</button>
			</div>
			<div
				class="swiper-container payment-box swiper-container-initialized swiper-container-horizontal">
				<div class="swiper-wrapper"
					style="transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">
					<div class="swiper-slide payment swiper-slide-active"
						style="width: 420px;">
						<h2 class="blind">QR결제</h2>
						<h3 class="payment-title">
							휴대폰으로 스캔하면<br>결제 화면으로 이동합니다.
						</h3>
						<p class="payment-text">스마트폰 카메라 및 모든 QR스캐너로 가능</p>
						<div class="qr-box">
							<div id="img_qr" class="qr">
								<img src="${qrCodeContent}" />
								<!-- <img
									src="data:image/png;base64,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"
									class="qr-image"> -->
							</div>
						</div>
						
						<br>
						
						<div class="pay_success" style="padding: 80px;">
								<button id="pay_success_btn" type="button" class="btn btn-outline-info btn-lg btn-block"
										><strong>결제 완료</strong></button>
							</div>
					</div>
					<div class="swiper-slide payment swiper-slide-next"
						style="width: 420px;">
						<h2 class="blind">연락처로결제</h2>
						<h3 class="payment-title">
							결제요청 메시지를 카카오톡으로<br>보내기 위해 입력해주세요.
						</h3>
						<form class="form" id="userPost" method="post"
							action="/v1/ba5b680b512fe3568846fc5c2419083a102f38d6956df8f342a50b41b471a92a/uinfo">
							<fieldset>
								<legend class="blind">결제 정보 입력</legend>
								<ul>
									<li class="input-box"><label> <!-- 인풋창 포커스, 인풋창에 값이 입력되면 placeholder-shown 클래스 제거 -->
											<input id="userPhone" placeholder="-없이 입력"
											class="input placeholder-shown" title="휴대폰 번호를 -없이 입력해주세요">
											<span class="input-title">휴대폰 번호</span> <span
											class="error-text"></span>
									</label></li>
									<li class="input-box"><label> <input
											id="userBirth" placeholder="예) 930616"
											class="input placeholder-shown" title="생년월일을 입력해주세요">
											<span class="input-title">생년월일</span> <span
											class="error-text"></span>
									</label></li>
								</ul>
								<button class="button-request btn_payask" disabled="">결제요청</button>
							</fieldset>
						</form>
					</div>
				</div>
				<span class="swiper-notification" aria-live="assertive"
					aria-atomic="true"></span>
			</div>
		</div>
		<form id="actionPost" action="approval" method="post"></form>

		<!-- swiper 4.5.1 까지만 IE9 까지 대응합니다. -->
		<!-- swiperjs api : https://swiperjs.com/swiper-api#methods-and-properties -->
		<script src="https://t1.daumcdn.net/kakaopay/tesla/20210722/js/swiper-4.5.1.min.js"></script>
		<script>
			window.onload = function() {
				/** 1. 스와이퍼 UI 스크립트 */
				var swiper = new Swiper(
						".payment-box",
						{
							allowTouchMove : false,
							pagination : {
								el : ".menu-box",
								clickable : true,
								renderBullet : function(index, className) {
									console
											.log(userInfo.val.isIssuedSubscriptionOrder);

									if (userInfo.val.isIssuedSubscriptionOrder) {
										return index === 0 ? '<button class="' + className + ' button-menu qr">QR등록</button>'
												: '<button class="' + className + ' button-menu kakaotalk">카톡등록</button>';
									}

									return index === 0 ? '<button class="' + className + ' button-menu qr">QR결제</button>'
											: '<button class="' + className + ' button-menu kakaotalk">카톡결제</button>';
								},
							},
						});

				/** 2. input 모션관련 클래스명 제어 (UI 확인용 스크립트) */
				var inputTags = document.querySelectorAll(".input");
				var buttonRequest = document.querySelector(".button-request");

				/**
				 * 숫자인지 아닌지 반환
				 * @param {string} value
				 * @returns boolean
				 */
				var isAllNumber = function(value) {
					var reg = /^[0-9]+$/;
					return reg.test(value);
				};

				/**
				 * 에러메세지에 문구 넣기
				 * @param {error-message element} target
				 * @param {string} message
				 */
				var setErrorMessage = function(targetErrorElement, message) {
					targetErrorElement.innerHTML = message;
				};

				/**
				 * placeholder 보여주기
				 * @param {input element} targetInput
				 * @param {boolean} show
				 */
				var setPlaceholderShown = function(targetInputElement, show) {
					if (show) {
						targetInputElement.classList.add("placeholder-shown");
					} else {
						targetInputElement.classList
								.remove("placeholder-shown");
					}
				};

				/** 흰박스 숨기기 */
				var foldPaperBox = function() {
					document.querySelector(".paper-box").classList
							.add("is-folded");
					setTimeout(function() {
						document.querySelector(".is-folded").classList
								.add("is-hidden");
					}, 1000); // 0.1초 후 hidden 시켜주세요 (이후 키보드 등의 접근 방지)
				};

				/** 완료화면 보이기 */
				var showStepBox = function() {
					document.querySelector(".step-box").classList
							.add("is-visible");
				};

				/** 이벤트핸들러 : focus in */
				var handlerFocusIn = function(e) {
					if (e.target === document.activeElement) {
						setPlaceholderShown(e.target, false);
					}
				};

				/** 이벤트핸들러 : focus out */
				var handlerFocusOut = function(e) {
					if (!e.target.value) {
						setPlaceholderShown(e.target, true);
					}
				};

				/** 이벤트핸들러 : change */
				var handlerChangeInputValue = function(e) {
					/** 모든값이 true 인지 확인 */
					var isValid = false;

					/** 입력값이 숫자가 아닐때 에러메세지 표시 */
					for (var i = 0; i < inputTags.length; i++) {
						if (inputTags[i].value.length !== 0
								&& isAllNumber(inputTags[i].value)) {
							isValid = true;
							setErrorMessage(inputTags[i].parentNode
									.querySelector(".error-text"), "");
						} else if (inputTags[i].value.length !== 0
								&& !isAllNumber(inputTags[i].value)) {
							isValid = false;
							setErrorMessage(inputTags[i].parentNode
									.querySelector(".error-text"), "숫자만 입력");
						} else {
							isValid = false;
							setErrorMessage(inputTags[i].parentNode
									.querySelector(".error-text"), "");
						}
					}

					/** 버튼 활성화, 아니면 비활성화 */
					/*          if (isValid) {
					 document.querySelector(".button-request").disabled = false;
					 } else {
					 document.querySelector(".button-request").disabled = true;
					 }*/
				};

				/** 이벤트 리스너 추가 */
				for (var i = 0; i < inputTags.length; i++) {
					inputTags[i].addEventListener("focusin", handlerFocusIn);
					inputTags[i].addEventListener("focusout", handlerFocusOut);
					inputTags[i].addEventListener("keyup",
							handlerChangeInputValue);
				}
				/*
				buttonRequest.addEventListener("click", function (e) {
				  alert("결제요청 클릭");
				  foldPaperBox();
				  showStepBox();
				  e.preventDefault();
				});*/

				function isIE() {
					return window.navigator.userAgent
							.match(/MSIE|Internet Explorer|Trident/i)
				}

				//function to show alert if it's IE
				function showIEAlert() {
					if (isIE()) {
						var isIeEnd = true;
						var extraCss = {
							'width' : '600px',
							'top' : '40%',
							'left' : '40%'
						};
						if (isIeEnd) {
							$("div[class='card-box']").remove();
							payAlert(
									'<h3 style="font-weight: 700;">Internet Explorer 11 지원 종료 안내</h3><br/><br/>'
											+ 'Microsoft사의 정책변경으로 Internet Explorer11(이하IE11) 브라우저의 지원이<br/>'
											+ '<b style="font-weight: 700;">2022년 6월 15일자</b>로 종료되었습니다.<br/><br/>'
											+ '해당 팝업을 닫으실 경우 브라우저가 종료될 예정이오니,<br/>'
											+ 'Chrome 등 다른 브라우저를 이용해주세요.<br/>',
									function() {
										window.close();
									}, extraCss);
						} else {
							payAlert(
									'<h3 style="font-weight: 700;">Internet Explorer 11 지원 종료 안내</h3><br/><br/>'
											+ 'Microsoft 사의 정책 변경으로 Internet Explorer11(이하 IE 11)<br/>'
											+ '브라우저의 지원이 <b style="font-weight: 700;">2022년 6월 15일자</b>로 종료될 예정입니다.<br/><br/>'
											+ '종료일 이후 IE 11으로 접속 시 결제가 불가하오니 Chrome 등 <br/>다른 브라우저를 이용해주세요.',
									false, extraCss);
						}
					}
				}

				showIEAlert();

			};
			
			
			$('#close_btn').click(function(){
				var item_name = "갤럭시S9";
				var total_amount = "2100";
				location.href='${pageContext.request.contextPath}/pay/cancel?name=' + item_name + '&price=' + total_amount;
			});
			
			$('#pay_success_btn').click(function(){
				// location.href='${pageContext.request.contextPath}/pay/success?type=pc';
				location.href='http://192.168.0.3:8080/pay/success?type=pc';
			});
		</script>
	</div>




	<%-- <div class="container">
	    <a href="/main" class="btn btn-link">Back to home</a>
	    <br />
	    <img src="${qrCodeContent}" />
	</div> --%>
</body>
</html>