<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<!-- Basic Page Info -->
		<meta charset="utf-8" />
		<title>거래중</title>

		<!-- Site favicon -->
		<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/vendors/images/bank/hana_logo.png">
		
		
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
		<link
			rel="stylesheet"
			type="text/css"
			href="${pageContext.request.contextPath}/resources/vendors/styles/icon-font.min.css"
		/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendors/styles/style.css" />

		<!-- header를 위한 CSS -->
		<!-- Bootstrap -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainview/plugins/bootstrap/bootstrap.min.css">
		<!-- FontAwesome -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainview/plugins/fontawesome/css/all.min.css">
		<!-- Animation -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainview/plugins/animate-css/animate.css">
		<!-- Template styles-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainview/css/style.css">
		

		<script src="https://code.jquery.com/jquery-3.6.1.js"
				integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
				crossorigin="anonymous"></script>
		
		<style>
		.vl {
			border-left: 2px solid #019591;
			height: 500px;
			position: absolute;
			left: 50%;
			margin-left: -3px;
			top: 0;
		}
		</style>

		<script>
		$(document).ready(function(){
			$('#balanceBtn').click(function(){
				const bankAcctNum = $('#acctNum').val();
				
				$.ajax({
					url:"/transfer/balance",
					type:"POST",
					data:{
						bankAcctNum : bankAcctNum
					},
				})
				.done(function(data){ 
					var bal = JSON.parse(data); // data 객체화 (배열처리)
					
					var html = '';
					html += '<tr>';
					html += '<td>' + bal.bankAcctAlias + '</td>';
					html += '<td>' + bal.bankAcctNum + '</td>';
					html += '<td>' + bal.balanceFm + '</td>';
					html += '</tr>';
					$('#tbody-balance').empty();
					$('#tbody-balance').append(html);
					
				})
				.fail(function(data){
					alert('실패!');
				});
			});
			/* "전액" 버튼 클릭 시 아래 실행 */
			$('#allBtn').click(function(){
				const bankAcctNum = $('#acctNum').val();
				
				$.ajax({
					url:"/transfer/balance",
					type:"POST",
					data:{
						bankAcctNum : bankAcctNum
					},
				})
				.done(function(data){ 
					var bal = JSON.parse(data); // data 객체화 (배열처리)
					//alert(data);
					$("#amount").attr("value", bal.balance);
				})
				.fail(function(data){
					alert('실패!');
				});
			});
			
			/* "1만" 버튼 클릭 시 아래 실행 */
			$('#10000').click(function(){
				const amount = $('#amount').val(); // 금액 입력할 부분
				//CheckIfOverBalance(amount)
				
				if(amount === null || amount === ''){
					$("#amount").attr("value", Number(10000));
				} else {
					$("#amount").attr("value", Number(amount) + Number(10000));
				}
			});
			
			/* "5만" 버튼 클릭 시 아래 실행 */
			$('#50000').click(function(){
				const amount = $('#amount').val(); // 금액 입력할 부분
				//CheckIfOverBalance(amount)
				
				if(amount === null || amount === ''){
					$("#amount").attr("value", Number(50000));
				} else {
					$("#amount").attr("value", Number(amount) + Number(50000));
				}
			});
			
			/* "10만" 버튼 클릭 시 아래 실행 */
			$('#100000').click(function(){
				const amount = $('#amount').val(); // 금액 입력할 부분
				//CheckIfOverBalance(amount)
				
				if(amount === null || amount === ''){
					$("#amount").attr("value", Number(100000));
				} else {
					$("#amount").attr("value", Number(amount) + Number(100000));
				}
			});
			/* "100만" 버튼 클릭 시 아래 실행 */
			$('#1000000').click(function(){
				const amount = $('#amount').val(); // 금액 입력할 부분
				//CheckIfOverBalance(amount)
				
				if(amount === null || amount === ''){
					$("#amount").attr("value", Number(1000000));
				} else {
					$("#amount").attr("value", Number(amount) + Number(1000000));
				}
			});
			/* function CheckIfOverBalance(amount){
				const bankAcctNum = $('#acctNum').val();
				
				$.ajax({
					url:"/transfer/balance",
					type:"POST",
					data:{
						bankAcctNum : bankAcctNum
					},
				})
				.done(function(data){ 
					var bal = JSON.parse(data); // data 객체화 (배열처리)
					if(Number(amount)+ Number(10000) < Number(bal.balance)){
						$("#amount").attr("value", Number(amount) + Number(10000));
					}
				})
				.fail(function(data){
					alert('실패!');
				});
				
				
			} */
			
			$('#confirmBtn').click(function(){
				
				let acctNum = $('#acctNum').val();
				let rcvBank = $('#rcvBank').val();
				let rcvBankAcctNum = $('#rcvBankAcctNum').val();
				let amount = $('#amount').val();
				let acctPw = $('#acctPw').val();
				
				let content = $('#content').val();
				let rcvName = $('#rcvName').val();
				
				const data = {
						acctNum : acctNum,
						rcvBank : rcvBank,
						rcvBankAcctNum : rcvBankAcctNum,
						amount : amount,
						acctPw : acctPw,
						content : content,
						rcvName : rcvName
				}
				
				let num = checkNull(rcvBankAcctNum, amount, acctPw, content, rcvName);
				
				if(num === 1){
					$.ajax({
						url:"/transfer/confirm",
						type:"POST",
						data:data,
					})
					.done(function(data){ 
						var calData = JSON.parse(data); // data 객체화 (배열처리)
						//console.log(calData);
						
						var html = '';
						html += '<tr>';
						html += '<td style="font-size: 11px;">' + calData.bankAcctNum + '</td>';
						html += '<td style="font-size: 11px;">' + calData.rcvBankName + '<br>' + calData.rcvBankAcctNum + '</td>';
						html += '<td style="font-size: 11px;">' + calData.amountFm + '</td>';
						html += '<td style="font-size: 11px;">' + calData.opponentName + '</td>';
						html += '</tr>';
						$('#tbodyInfo').empty();
						$('#tbodyInfo').append(html);
						
					})
					.fail(function(data){
						alert('실패!');
					});
					
					
				}
				
				// account/controller
				$('#resultBtn').click(function(){
					$.ajax({
						url:"/transfer/action",
						type:"POST",
						data:data,
					})
					.done(function(data){ 
						// 결과 페이지로 이동
						location.href='${pageContext.request.contextPath}/transfer/result';
					})
					.fail(function(data){
						alert('실패!');
					});
				});
				
			});
			
			function checkNull(rcvBankAcctNum, amount, acctPw, content, rcvName){
				if(rcvBankAcctNum === ''){
					alert('입금 계좌번호를 입력하세요');
					$('#rcvBankAcctNum').focus();
					return false;
				}
				if(amount === ''){
					alert('이체할 금액을 입력하세요');
					$('#amount').focus();
					return false;
				}
				if(acctPw === ''){
					alert('계좌 비밀번호를 입력하세요');
					$('#acctPw').focus();
					return false;
				}
				if(content === ''){
					content = '실계좌이체';
				}
				if(rcvName === ''){
					rcvName = '${loginVO.name}';
				}
				
				return 1;
			}
		
			$('#transferBtn').click(function(){
				location.href='';
			});
		});			
		
		</script>
		
	</head>
	<body>
		
		<!-- header-->
		<jsp:include page="/WEB-INF/jsp/include/header.jsp">
			<jsp:param value="${dday}" name="dday"/>
		</jsp:include>
		
		<div class="mobile-menu-overlay"></div>
	
	<!-- START -->
	
	<div class="main-container" style="padding-right: 300px;">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<br> <br>
				
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h2>계좌 이체</h2>
								<p>이체정보를 입력해주세요.</p>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a
										href="${pageContext.request.contextPath}/">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">
										blank</li>
								</ol>
							</nav>
						</div>
						<div class="col-md-6 col-sm-12 text-right">
							<div class="dropdown">
								<a class="btn btn-primary dropdown-toggle" href="#"
									role="button" data-toggle="dropdown"> January
									2018 </a>
								<div class="dropdown-menu dropdown-menu-right">
									<a class="dropdown-item" href="#">Export List</a> <a
										class="dropdown-item" href="#">Policies</a> <a
										class="dropdown-item" href="#">View Assets</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				
				<div class="pd-20 bg-white border-radius-4 box-shadow mb-30">
					<!-- 10월 -->
					<!-- div left : 이번달 총 지출, 총 수입 // div right : 분석 버튼-->
					<br> <br>
					<div class="row">
						<div class="col-6 text-center" style="padding: 50px;">
							<h3 style="padding:10px;">STEP 1. 필수정보입력</h3>
							<br>
							
							<div class="row">
								<div class="col-3 text-right">
									<h6>출금계좌번호</h6>
								</div>
								<div class="col-9 text-left">
									<div style="float:left;">
										<select class="form-control" id="acctNum" name="acctNum">
											<c:forEach items="${acctList}" var="account">
												<option value="${account.alias}/${account.acctNum}">
													${account.alias} / ${account.acctNum}
												</option>
											</c:forEach>
										</select>
									</div>
									<div style="float:right; align-content: center;">
										<button id="balanceBtn" type="button" class="btn btn-secondary btn-sm"
												data-toggle="modal" data-target="#balance-modal" style="padding: 12px;">출금가능금액</button>
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-3 text-right">
									<h6>입금은행</h6>
								</div>
								<div class="col-9 text-left">
									<select id="rcvBank" name="rcvBank"
											class="custom-select2 form-control select2-hidden-accessible"
											name="state" style="width: 100%; height: 38px"
											data-select2-id="1" tabindex="-1" aria-hidden="true">
		
										<optgroup label="자주 찾는 은행">
											<option value="99">은행 이름을 선택하세요</option>
											<option value="80">KEB하나은행</option>
											<option value="81">우리은행</option>
											<option value="82">KB국민은행</option>
											<option value="83">신한은행</option>
											<option value="84">기업은행</option>
											<option value="85">대구은행</option>
											<option value="86">산업은행</option>
											<option value="87">삼성증권</option>
											<option value="88">카카오뱅크</option>
										</optgroup>
									</select>
								</div>
							</div>
							<br> 
							
							<div class="row">
								<div class="col-3 text-right">
									<h6>입금계좌번호</h6>
								</div>
								<div class="col-9 text-left">
									<input type="text" class="form-control" id="rcvBankAcctNum" name="rcvBankAcctNum">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-3 text-right">
									<h6>이체금액</h6>
								</div>
								<div class="col-9 text-left">
									<input type="text" class="form-control" id="amount"
										name="amount" placeholder="금액을 입력하세요"><br>
										<button id="allBtn"	 type="button" class="btn btn-secondary btn-sm">전액</button>
										<button id="10000" 	 type="button" class="btn btn-secondary btn-sm">1만</button>
										<button id="50000" 	 type="button" class="btn btn-secondary btn-sm">5만</button>
										<button id="100000"  type="button" class="btn btn-secondary btn-sm">10만</button>
										<button id="1000000" type="button" class="btn btn-secondary btn-sm">100만</button>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-3 text-right">
									<h6>계좌비밀번호</h6>
								</div>
								<div class="col-9 text-left">
									<input type="password" class="form-control" id="acctPw" name="acctPw">
								</div>
							</div>
							<br>
						</div>

						<!-- <div class="col-1 vl text-center "></div> -->
						
						<div class="col-6 text-center" style="padding: 50px;">
							<h3 style="padding:10px;">STEP 2. 선택정보입력</h3>
							<br>
							
							<div class="row">
								<div class="col-3 text-right">
									<h6>내 통장 표시</h6>
								</div>
								<div class="col-9 text-left">
									<input type="text" class="form-control"
											id="content" name="content" placeholder="14자 이내, 통장에는 6자까지 표시">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-3 text-right">
									<h6>받는분 통장 표시</h6>
								</div>
								<div class="col-9 text-left">
									<input type="text" class="form-control"
									id="rcvContent" name="rcvContent" value="${loginVO.name}">
									<!-- placeholder="10자 이내, 입력하지 않으면 예금주명" -->
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-3 text-right">
									<h6>받는분 예금주명</h6>
								</div>
								<div class="col-9 text-left">
									<input type="text" class="form-control"
										id="rcvName" name="rcvName" placeholder="착오송금 방지를 위한 입금계좌 예금주명">
								</div>
							</div>
							<br>
							
						</div>
						
						<div class="padding-bottom-30 row"
								style="max-width: 170px; margin: 0 auto;">
								
								<button id="confirmBtn" type="button"
									class="btn btn-primary btn-lg"
									data-toggle="modal" data-target="#confirm-modal"
									style="margin: 14px; border-color: #019591; background-color: #019591; color: white; display: inline-block; text-align: center;"
									>확인</button>
						</div>

					</div>
				</div>

			</div>

		</div>

		<!-- footer -->
		<jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>

	</div>

	<!-- END -->
	
	<!-- START 모달 -->
	
	<div class="modal fade" id="balance-modal" tabindex="-1" role="dialog"
		style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-body text-center font-12">
					<h3 class="padding-top-30 mb-30 weight-500">
						💡 조회하신 계좌에 대한 잔액 정보입니다<br>
					</h3>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th scope="col">계좌별칭</th>
								<th scope="col">계좌번호</th>
								<th scope="col">잔액</th>
							</tr>
						</thead>
						<tbody id="tbody-balance">

						</tbody>
					</table>
					
					<br>

					<div class="padding-bottom-30 row"
						style="max-width: 170px; margin: 0 auto">

						<div class="col-12">
							<button type="button"
									class="btn btn-primary btn-block"
									style="border-color: #019591; background-color: #019591;"
									data-dismiss="modal">확인</button>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="confirm-modal" tabindex="-1" role="dialog"
		style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-body text-center font-12">
					<div>
						<h3 class="padding-top-30 mb-30 weight-500">
							<%-- 💡 ${calVO.opponentName}님께 ${calVO.amountFm}원 이체하시겠습니까?<br> --%>
							💡 이체하기 전 입력하신 내용을 확인해주세요.
						</h3>
					</div>
					<div>
						<ul style="text-align: left; padding: 20px;">
							<li style="list-style-type: disc;">고객님께서 입력하신 입금은행, 입금계좌번호, 이체금액 및 받는 분을 다시 한 번 확인하세요.</li>
							<li style="list-style-type: disc;">메신저 또는 문자로 송금을 요구받은 경우에는 반드시 사실관계 확인 후 이체하시기 바랍니다.</li>
							<li style="list-style-type: disc;">출금계좌가 이체수수료 면제횟수가 있는 상품일 경우, 잔여 면제횟수 내에서 면제됩니다.</li>
							<li style="list-style-type: disc;">2건 이상 이체할 경우 [이체추가] 버튼을 누르면 더욱 빠르게 이용할 수 있습니다. (10건까지 가능)</li>
							<li style="list-style-type: disc;">이체 도중 오류 발생 시, 반드시 출금계좌 거래내역을 확인하시기 바랍니다.</li>
						</ul>
					</div>
					
					
					<!-- <form class="transaction-form" action="${pageContext.request.contextPath}/transfer/result" 
							method="post" > -->
						<table class="table table-bordered">
							<thead>
								<tr>
									<th scope="col" style="font-size: 12px;">출금계좌번호</th>
									<th scope="col" style="font-size: 12px;">입금계좌번호</th>
									<th scope="col" style="font-size: 12px;">이체금액(원)</th>
									<th scope="col" style="font-size: 12px;">받는분 예금주명</th>
								</tr>
							</thead>
							<tbody id="tbodyInfo">

							</tbody>
						</table>
						<br>

					<div class="padding-bottom-30 row"
						style="max-width: 200px; margin: 0 auto;">
						<div class="col-6">
							<!-- <button type="button"
								class="btn btn-secondary border-radius-100 btn-block confirmation-btn"
								data-dismiss="modal">
							</button> -->
							
							<button type="button"
									class="btn btn-primary btn-block" 
									style="border-color: #019591; background-color: #019591;"
									data-dismiss="modal">취소</button>
						</div>
						<div class="col-6">
							<!-- type="submit" -->
							<!-- <button id="resultBtn" 
								class="btn btn-primary border-radius-100 btn-block confirmation-btn"
								data-dismiss="modal">
								
							</button> -->
							<button type="button" id="resultBtn" 
									class="btn btn-primary btn-block"
									style="border-color: #019591; background-color: #019591;"
									data-dismiss="modal">확인</button>
						</div>
					</div>
						<!-- <input class="btn btn-primary btn-lg btn-block" type="submit" value="Sign In"> -->
					<!-- </form> -->
					
				</div>
			</div>
		</div>
	</div>
	<!-- END -->
	
	
	<!-- js -->
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/core.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/script.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/process.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/layout-settings.js"></script>
	
	<!-- js -->
	<%-- <script
		src="${pageContext.request.contextPath}/resources/src/plugins/fullcalendar/fullcalendar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/scripts/calendar-setting.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>

	<!-- buttons for Export datatable -->
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/dataTables.buttons.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/buttons.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/buttons.print.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/buttons.html5.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/buttons.flash.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/pdfmake.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/vfs_fonts.js"></script>
	<!-- Datatable Setting js -->
	<script
		src="${pageContext.request.contextPath}/resources/vendors/scripts/datatable-setting.js"></script> --%>
	
	</body>
</html>
