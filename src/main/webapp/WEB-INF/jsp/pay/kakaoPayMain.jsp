<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.1.js"
		integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
		crossorigin="anonymous"></script>
	
	<!-- 아임포트 라이브러리 -->
	<script type="text/javascript"
		src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
	<!-- 결제 버튼 클릭 시 PG사의 결제 페이지가 열림 -->
	<script>
		function requestPay() {
			var IMP = window.IMP; // 생략가능
			IMP.init('imp71532681'); // 가맹점식별코드
			
			// IMP.request_pay(param, callback) 결제창 호출
			IMP.request_pay({
				pg: 'kakao',
				pay_method: 'card',
				merchant_uid: 'merchant_' + new Date().getTime(),  // 주문번호 : 가맹점에서 구별할 수 있는 고유한id
				/* 
				 *  merchant_uid에 경우 
				 *  https://docs.iamport.kr/implementation/payment
				 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
				 */
				name: '주문명 : 사각새우더블버거',  // 상품명
				// name: '주문명 : ${auction.a_title}' -> model에 담은 정보를 넣어 쓸수도 있습니다.
				amount: 5600,  // 가격
				// amount: ${bid.b_bid},
				buyer_name: '윤정빈',  // 구매자 이름
				buyer_postcode: '123-456',
				}, 
				function (rsp) {
					console.log(rsp);
					if (rsp.success) { // 결제 승인 처리됨 -> 결제 위변조 검증 & DB에 저장
						console.log('빌링키 발급 성공', rsp); // 빌링키 발급 완료되었으니, 서버에 결제 요청
						var msg = '결제가 완료되었습니다.';
						msg += '결제 금액 : ' + rsp.paid_amount;
						// success.submit();
						// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
					} else { 
						var msg = '결제에 실패하였습니다.';
						msg += '에러내용 : ' + rsp.error_msg;
					}
					alert(msg);
				});
			};
	</script>

</head>
<body>
	<%-- <button id="payRequestBtn" type="button" style="border: none; background-color: transparent;">
		<img src="${pageContext.request.contextPath}/resources/vendors/images/bank/payment_icon_yellow_small.png"/>
	</button> --%>

	<form method="post" action="/kakaoPay">
		<button>
			<img
				src="${pageContext.request.contextPath}/resources/vendors/images/bank/payment_icon_yellow_small.png" />
		</button>
	</form>

	<br>
	<br>
	<hr>
	<br>
	<br>

	<button onclick="requestPay()">결제하기</button>
</body>
</html>