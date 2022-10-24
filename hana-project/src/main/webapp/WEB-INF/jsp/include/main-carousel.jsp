<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Start of Carousel -->
<div id="carouselExampleCaptions" class="carousel slide"
	data-ride="carousel">
	<ol class="carousel-indicators">
		<li data-target="#carouselExampleCaptions" data-slide-to="0"
			class="active"></li>
		<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
		<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
	</ol>
	<div class="carousel-inner">
		<div class="carousel-item active">
			<img class="d-block w-100"
				src="${pageContext.request.contextPath}/resources/vendors/images/bank/expense_track_flow.png"
				alt="First slide"
				style="width:100%;height:510px;">
		</div>
		<div class="carousel-item">
			<img class="d-block w-100"
				src=""
				alt="Second slide"
				style="width:100%;height:510px;">
			<div class="carousel-caption d-none d-md-block">
				<!-- <h5 class="color-black">하이뱅킹</h5>
				<p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p> -->
			</div>
		</div>
		<div class="carousel-item">
			<img class="d-block w-100" 
				 src="https://oimg1.kbstar.com/img/ocommon/news/2022/0907_typhoonDamage.png" 
				 alt="「태풍피해지역 피해복구지원」 갑작스러운 태풍으로 인해 피해를 입은 우리 이웃들이 다시 힘을 내고 하루빨리 일상으로 돌아갈 수 있도록 여러분의 마음을 보내주세요." 
				 style="width:100%;height:510px;">
		</div>
	</div>
	<a class="carousel-control-prev" href="#carouselExampleCaptions"
		role="button" data-slide="prev"  style="color: black;"> <span
		class="carousel-control-prev-icon" aria-hidden="true" style="color: black;"></span> <span
		class="sr-only">Previous</span>
	</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
		role="button" data-slide="next"> <span
		class="carousel-control-next-icon" aria-hidden="true"></span> <span
		class="sr-only">Next</span>
	</a>
</div>
<!-- End of Carousel -->