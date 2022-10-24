<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta name="viewport" content="width=device-width, initial-scale=1"
	charset="utf-8" />
<title>결제완료</title>
<!-- Site favicon -->
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/vendors/images/bank/hana_logo.png">
<link rel="stylesheet" media="screen"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/resources/vendors/styles/kakaopay/payment.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendors/styles/kakaopay/main.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="payment">
		<div class="header">
			<img alt=""
				src="https://newsimg.sedaily.com/2018/10/01/1S5QSELHHE_1.jpg"
				style="width: 10%; height: 10%;">
			<!-- <strong><kakaopay></kakaopay></strong> -->
		</div>
		<div class="body">
			<div class="min-height-200px" style="padding: 20px; margin: auto;">
				<div class="pd-20 bg-white border-radius-4 box-shadow mb-30"
					style="width: 800px; height: auto; padding: 60px;">
					<h3 style="text-align: center;">결제 성공</h3>
					<br> <br>

					<h5 style="text-align: center;">
						페이머니 결제가 정상적으로<br>완료되었습니다.
					</h5>
					<br>
					<p style="text-align: flex;">자세한 거래내역 정보는 하나은행 홈페이지 > '가계부' >
						'현금 거래내역조회' 에서 확인하시길 바랍니다.</p>

					<br>

					<table class="table table-bordered">

						<c:choose>
							<c:when test="${payCd eq 'oneq'}">
								<!-- 하나은행 원큐페이로 결제한 내역 -->
								<div class="form-group row">
									<label class="col-sm-12 col-md-2 col-form-label">결제일시</label>
									<div class="col-sm-12 col-md-10">
										<input class="form-control" type="text" value="${vo.tranDt}"
											readonly="readonly">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-12 col-md-2 col-form-label">거래처</label>
									<div class="col-sm-12 col-md-10">
										<input class="form-control" type="text"
											value="${vo.opponentName}" readonly="readonly">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-12 col-md-2 col-form-label">상품명</label>
									<div class="col-sm-12 col-md-10">
										<input class="form-control" type="text" value="${vo.itemName}"
											readonly="readonly">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-12 col-md-2 col-form-label">결제금액(원)</label>
									<div class="col-sm-12 col-md-10">
										<input class="form-control" type="text"
											value="${vo.amountFm}원" readonly="readonly">
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<!-- 카카오페이로 결제한 내역 -->
								<div class="form-group row">
									<label class="col-sm-12 col-md-2 col-form-label">결제일시</label>
									<div class="col-sm-12 col-md-10">
										<input class="form-control" type="text"
											value="${info.approved_at}" readonly="readonly">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-12 col-md-2 col-form-label">주문번호</label>
									<div class="col-sm-12 col-md-10">
										<input class="form-control" type="text"
											value="${info.partner_order_id}" readonly="readonly">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-12 col-md-2 col-form-label">상품명</label>
									<div class="col-sm-12 col-md-10">
										<input class="form-control" type="text"
											value="${info.item_name}" readonly="readonly">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-12 col-md-2 col-form-label">상품수량</label>
									<div class="col-sm-12 col-md-10">
										<input class="form-control" type="text"
											value="${info.quantity}" readonly="readonly">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-12 col-md-2 col-form-label">결제금액(원)</label>
									<div class="col-sm-12 col-md-10">
										<input class="form-control" type="text" value="${info.total}원"
											readonly="readonly">
									</div>
								</div>

							</c:otherwise>
						</c:choose>

						<br>
						<br>

						<div class="form-group row" style="display: flex; justify-content: center;">
							<div>
								<button id="backBtn" type="button"
									class="btn btn-secondary btn-sm"
									style="border-color: #019591; background-color: #019591; color: white; display: inline-block;">첫
									화면으로 돌아가기</button>
								<!-- <button id="closeBtn" type="button"
									class="btn btn-secondary btn-sm"
									style="width: 80px; height: 40px; border-color: #019591; background-color: #019591; color: white; display: inline-block;">
									창 닫기</button> -->
							</div>
						</div>

					</table>
				</div>
			</div>

			<%-- <div class="content">
				<p>결제가 완료되었습니다.</p>
				
				<p>상품명: ${item[0]}</p>
				<p>취소금액: ${item[1]}원</p>
			</div> --%>

		</div>
	</div>

	<script>
		$('#backBtn').click(function() {
			//location.href = 'http://192.168.35.238:8080/pay';
			location.href = 'http://192.168.0.3:8080/pay';
		});
		
		/*
		$('#closeBtn').click(function() {
			//location.href = 'http://192.168.0.3:8080/pay';
			//var check = "GOODJOB";
			//window.parent.postMessage('Done', '*');
			
			//opener.SetValue(check);
			window.close();
			//window.parent.postMessage({ childData : 'test data' }, 'http://192.168.0.3:8080/order/205');
			//window.parent.postMessage({ childData : 'test data' }, 'http://localhost:8080/order/205');
		});
		*/
	</script>
</body>
</html>