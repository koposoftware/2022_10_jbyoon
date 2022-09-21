<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	
	$(document).ready(function(){
		$(document).on('click', '.delBtn', function(){
			
			let replyNo = $(this).attr('id');
			//ajax호출
			//url : /reply/3/15
			//		''/reply/${board.no}/' replyNo + 
			//type: delete
			
			$.ajax({
				 
				url		:	'${pageContext.request.contextPath}/reply/${board.no}/'+ replyNo,
				type	:	'delete',
				success	:	function(){
					alert('성성공공');
					getAllReply();
				},
				error	:	function(){
					alert('에러');
				}
				
			})
			
			
		})	
	})
	
	
	
	
	function getAllReply(){
		$.ajax({ 
			url		:	'${pageContext.request.contextPath}/reply/${board.no}'	,
			type	:	'get'	,
			success	:	 function(data){
				
				$('#replyList').empty();
				console.log(typeof data)
				console.log(data)
				let list = JSON.parse(data);
				console.log(list)
				$(list).each(function(){
					let str ='';
					str += '<hr>';
					str += '<div>';
					str += '  <strong> 댓글' + this.content + '</strong>  ' ;
					str += 'writer:  ' + this.writer  + '   ' ;
					str += '등록일: ' +this.regDate + '   ' ;
					str	+= '<button class="delBtn" id=' +this.no+ '> 삭제 </button>'
					str += '</div>'
					
					$('#replyList').append(str);
				})
			},
			error	:	function(){
				alert('실패')
			}			
		})
	}
	
	
	$(document).ready(function(){
		getAllReply();
		
		$('#AddReplyBtn').click(function(){
			let r_content = document.rform.content.value;
			let r_writer = document.rform.writer.value;
			$.ajax({
				 
				url		:	'${pageContext.request.contextPath}/reply',
				method	:	'post',
				data	:	{
					boardNo:	${board.no},
					content:	r_content,
					writer:		r_writer
				},
				success:	function(){
					alert('성공');
					getAllReply();
				},
				error	:	function(){
					alert('실패');
				},
				complete	:function(){
					 document.rform.content.value ='';
					 document.rform.writer.value ='';
				}				
			})			
		})
	})
</script>
</head>
<body>

<header>
	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp"></jsp:include>
</header>

상세게시글 detail.jsp입니다.
 
	<table class="table table-striped" style="width:80%; margin:auto">
		<tr>
			<th>제목</th>
			<td>${board.title }</td>
		</tr>
		
		<tr>
			<th>작성자</th>
			<td>${board.writer }</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${board.regDate }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${board.content }</td>
		</tr> 
	</table>

	<form name="rform">
		댓글: <input type="text" size="30" name="content">
		작성자: <input type="text" size = "20" name="writer">
		<input type="button" value="댓글작성" id="AddReplyBtn">
	</form>
	
	<div id="replyList"></div>

</body>
</html>
















