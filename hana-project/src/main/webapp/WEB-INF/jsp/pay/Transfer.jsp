<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8" />
<title>결제 진행</title>

<!-- Site favicon -->
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/vendors/images/bank/oneqpay_icon.png">

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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendors/styles/policy.css" />

<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>


</head>
<body>

	<div class="main-container">
		<!-- <div class="pd-ltr-20 xs-pd-20-10">
			
		</div> -->
		<div class="min-height-200px" style="padding: 20px; margin: auto;">
			<div class="pd-20 bg-white border-radius-4 box-shadow mb-30" style="width: 360px; height: auto;">
				<h3 style="text-align: center;">결제중</h3>

				<br> <br>

				<h5 style="text-align: center;">페이머니 가용 포인트를 확인하세요.</h5><br>
				<p style="text-align: center;">결제하기를 클릭하여 결제를 진행하세요.</p><br>
				<img src="/resources/vendors/images/bank/oneqpay_money_card.png" alt="Card image cap"
					 style="width:370px; height: auto;">
					 
				<br><br>
				
				<div class="card card-box col-12 col-md-3">
					
					<div class="card-body">
						<div class="row">
							<h5 class="card-title weight-300">하나머니</h5>
						</div>
						<div class="row">
							<div class="card-text col-6">충전계좌</div>
							<div class="card-text col-6" style="text-align: right;">${payAcct.bankAcctAlias} ${payAcct.bankAcctNum}</div>
						</div>
						<div class="row">
							<div class="card-text col-6">현재잔액</div>
							<div class="card-text col-6" style="text-align: right;">${payAcct.balanceFm}원</div>
						</div>
						
						<!-- <a href="/acctbook" class="btn btn-primary">결제하기</a> -->
					</div>
				</div>

				<br>

				<!-- <button id="" type="button" class="btn btn-info" style=""></button> -->
				<button id="modalBtn" type="button" class="btn btn-secondary btn-sm"
						data-toggle="modal" data-target="#oneq-tran-modal" 
						style="display: block; margin: auto; padding: 12px;">결제하기</button>
			</div>
		</div>
	</div>

	<!-- 모달 -->
	<div class="modal fade" id="oneq-tran-modal" tabindex="-1" role="dialog"
		style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-body text-center font-12">
					<h4 class="padding-top-30 mb-30 weight-500">
						💡 결제 정보를 확인해주세요.<br>
					</h4>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th scope="col">거래처</th>
								<th scope="col">상품명</th>
								<th scope="col">금액(원)</th>
							</tr>
						</thead>
						<tbody id="tbody-product">

						</tbody>
					</table>
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
							<button id="tranActionBtn"
								onclick="location.href='${pageContext.request.contextPath}/pay/success?type=mobile'"
								class="btn btn-primary border-radius-100 btn-block confirmation-btn"
								data-dismiss="modal">
								<i class="fa fa-check"></i>
							</button>
							결제
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

	<script>
		$('#modalBtn').click(function() {
			$.ajax({
					url:"/pay/trandata",
					type:"POST",
				})
				.done(function(data){ 
					var info = JSON.parse(data);
					console.log(data);
					console.log(info.amount);
					
					$.each(info, function(idx, val) {
						console.log(idx + " " + val);
					}); 
					
					var html = '';
					html += '<tr>';
					html += '<td>' + info.opponentName + '</td>';
					html += '<td>' + info.itemName + '</td>';
					html += '<td>' + info.amountFm + '</td>';
					html += '</tr>';
					$('#tbody-product').empty();
					$('#tbody-product').append(html);
					
				})
				.fail(function(data){
					alert('실패!');
				});
			
		});
		
	</script>
</body>


</html>
