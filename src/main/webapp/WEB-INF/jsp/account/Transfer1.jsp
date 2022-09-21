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
		<link
			rel="stylesheet"
			type="text/css"
			href="${pageContext.request.contextPath}/resources/vendors/styles/icon-font.min.css"
		/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendors/styles/style.css" />

		<!-- Global site tag (gtag.js) - Google Analytics -->
		<script
			async
			src="https://www.googletagmanager.com/gtag/js?id=G-GBZ3SGGX85"
		></script>
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
						alert(data);
						var calData = JSON.parse(data); // data 객체화 (배열처리)
						console.log(calData);
						alert(calData.amount);
						
						
						var html = '';
						html += '<tr>';
						html += '<th>1</th>';
						html += '<td>' + calData.bankAcctNum + '</td>';
						html += '<td>' + calData.rcvBankName + '\n' + calData.rcvBankAcctNum + '</td>';
						html += '<td>' + calData.amountFm + '</td>';
						html += '<td>' + calData.opponentName + '</td>';
						if(calData.chkTranStatus === '정상'){
							html += '<td><span class="badge badge-success">' + calData.chkTranStatus + '</span></td>';
						} else {
							html += '<td><span class="badge badge-secondary">' + calData.chkTranStatus + '</span></td>';
						}
						
						html += '</tr>';
						$('#tbodyInfo').empty();
						$('#tbodyInfo').append(html);
						
					})
					.fail(function(data){
						alert('실패!');
					});
					
					
				}
				
				$('#resultBtn').click(function(){
					$.ajax({
						url:"/transfer/action",
						type:"POST",
						data:data,
					})
					.done(function(data){ 
						alert(data);
						
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
		<jsp:include page="/WEB-INF/jsp/include/header.jsp"/>
		<jsp:include page="/WEB-INF/jsp/include/right-sidebar.jsp"/>
		<jsp:include page="/WEB-INF/jsp/include/left-side-bar.jsp"/>
		
		<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h2>계좌 이체</h2>
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
					
					<h3 style="padding:10px;">STEP 1. 이체정보 입력</h3>
					<table border="1" bordercolor="grey" width="500" height="300" align="center">
						<tr align="center" bgcolor="grey">
							<p>
							<td colspan="2" style="color: white">이체정보를 입력해주세요</td>
							</p>
						</tr>
						<tr>
							<td align="center" bgcolor="grey" style="color: white">출금계좌번호</td>
							<td style="padding: 10px;">
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
							</td>
						</tr>
						<tr>
							<td align="center" bgcolor="grey" style="color: white">입금은행</td>
							<td style="padding: 10px;">
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
							</td>

						</tr>
						<tr>
							<td align="center" bgcolor="grey" style="color: white">입금계좌번호</td>
							<td style="padding: 10px;"><input type="text" class="form-control"
								id="rcvBankAcctNum" name="rcvBankAcctNum"></td>
						</tr>
						<tr>
							<td align="center" bgcolor="grey" style="color: white">이체금액</td>
							<td style="padding: 10px;"><input type="text" class="form-control" id="amount"
								name="amount" placeholder="금액을 입력하세요"><br>
								<button id="amtAll" type="button" class="btn btn-secondary btn-sm">전액</button>
								<button id="amt1" type="button" class="btn btn-secondary btn-sm">1만</button>
								<button id="amt5" type="button" class="btn btn-secondary btn-sm">5만</button>
								<button id="amt10" type="button" class="btn btn-secondary btn-sm">10만</button>
								<button id="amt100" type="button" class="btn btn-secondary btn-sm">100만</button>
							</td>
						</tr>
						<tr>
							<td align="center" bgcolor="grey" style="color: white">계좌비밀번호</td>
							<td style="padding: 10px;"><input type="password" class="form-control" id="acctPw"
								name="acctPw"></td>
						</tr>
					</table>
					
					<br><br>
					
					<h3 style="padding:10px;">선택정보입력</h3>
					<table border="1" bordercolor="grey" width="500" height="300" align="center" >
						<tr>
							<td align="center" bgcolor="grey" style="color: white">내 통장 표시</td>
							<td style="padding: 10px;"><input type="text" class="form-control"
								id="content" name="content" placeholder="14자 이내, 통장에는 6자까지 표시"></td>
						</tr>
						<tr>
							<td align="center" bgcolor="grey" style="color: white">받는분 통장 표시</td>
							<td style="padding: 10px;"><input type="text" class="form-control"
								id="rcvContent" name="rcvContent" placeholder="10자 이내, 입력하지 않으면 예금주명"></td>
						</tr>
						<tr>
							<td align="center" bgcolor="grey" style="color: white">받는분 예금주명</td>
							<td style="padding: 5px;"><input type="text" class="form-control"
								id="rcvName" name="rcvName" placeholder="착오송금 방지를 위한 입금계좌 예금주명"></td>
						</tr>
						
					</table>
					<br><br>
					<button id="confirmBtn" type="button" class="btn btn-primary btn-lg"
							data-toggle="modal" data-target="#confirm-modal" >이체하기</button>
				</div>
				
				<br>
<!-- 	
				<div class="pd-20 bg-white border-radius-4 box-shadow mb-30">

					<h3 style="padding:10px;">STEP 2. 이체정보 확인</h3>
					<table id="chkInfo" class="table table-bordered">
						<thead>
							<tr>
								<th scope="col">No.</th>
								<th scope="col">출금계좌번호</th>
								<th scope="col">입금계좌번호</th>
								<th scope="col">이체금액(원)</th>
								<th scope="col">받는분 예금주명</th>
								<th scope="col">결과</th>
							</tr>
						</thead>
						<tbody id="tbodyInfo">
							
						</tbody>
					</table>

					<br>
					<button id="transferBtn" type="button"
						class="btn btn-primary btn-lg">이체하기</button>
				</div>
				 -->			
			</div>

			<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />

		</div>
	</div>

	<div class="modal fade" id="balance-modal" tabindex="-1" role="dialog"
		style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-body text-center font-12">
					<h4 class="padding-top-30 mb-30 weight-500">
						💡 조회하신 계좌에 대한 잔액 정보입니다<br>
					</h4>
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

					<div class="padding-bottom-30 row"
						style="max-width: 170px; margin: 0 auto">

						<div class="col-12">
							<button type="button"
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



	<div class="modal fade" id="confirm-modal" tabindex="-1" role="dialog"
		style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-body text-center font-12">
					<h4 class="padding-top-30 mb-30 weight-500">
						💡 ${calVO.opponentName}님께 ${calVO.amountFm}원 이체하시겠습니까?<br>
					</h4>
					
					<p style="border: 1px; border-color: gray; text-align: left;">
						<ul>
							<li>고객님께서 입력하신 입금은행, 입금계좌번호, 이체금액 및 받는 분을 다시 한 번 확인하세요.</li>
							<li>메신저 또는 문자로 송금을 요구받은 경우에는 반드시 사실관계 확인 후 이체하시기 바랍니다.</li>
							<li>출금계좌가 이체수수료 면제횟수가 있는 상품일 경우, 잔여 면제횟수 내에서 면제됩니다.</li>
							<li>2건 이상 이체할 경우 [이체추가] 버튼을 누르면 더욱 빠르게 이용할 수 있습니다. (10건까지 가능)</li>
							<li>이체 도중 오류 발생 시, 반드시 출금계좌 거래내역을 확인하시기 바랍니다.</li>
						</ul>
					</p>
					<!-- <form class="transaction-form" action="${pageContext.request.contextPath}/transfer/result" 
							method="post" > -->
						<table class="table table-bordered">
							<thead>
								<tr>
									<th scope="col">No.</th>
									<th scope="col">출금계좌번호</th>
									<th scope="col">입금계좌번호</th>
									<th scope="col">이체금액(원)</th>
									<th scope="col">받는분 예금주명</th>
									<th scope="col">결과</th>
								</tr>
							</thead>
							<tbody id="tbodyInfo">

							</tbody>
						</table>
						<br>

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
								class="btn btn-primary border-radius-100 btn-block confirmation-btn"
								data-dismiss="modal">
								<i class="fa fa-check"></i>
							</button>
							확인
						</div>
					</div>
						<!-- <input class="btn btn-primary btn-lg btn-block" type="submit" value="Sign In"> -->
					<!-- </form> -->
					
				</div>
			</div>
		</div>
	</div>
	
	<!-- js -->
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/core.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/script.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/process.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/layout-settings.js"></script>
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
