<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>

<style>
/* 위시리스트 */
.wishlist-btn {
  position: absolute;
  top: 10px;
  right: 10px;
  background-color: transparent;
  border: none;
  cursor: pointer;
  outline: none;
  font-size: 24px;
  color: #ccc;
  transition: all 0.3s ease;
}

.wishlist-btn.active i:first-child {
  display: none;
}

.wishlist-btn.active i:last-child {
  display: inline;
  color: #f44336;
}
/* 위시리스트 */

</style>


<div class="slider-area">
	<div class="slider">
		<div id="bg-slider" class="owl-carousel owl-theme"
			style="opacity: 1; display: block;">

			<div class="owl-wrapper-outer">
				<div class="owl-wrapper"
					style="width: 11418px; left: 0px; display: block; transition: all 0ms ease 0s; transform: translate3d(-3806px, 0px, 0px); transform-origin: 4757.5px center; perspective-origin: 4757.5px center;">
					<div class="owl-item" style="width: 1903px;">
						<div class="item">
							<a href="#">
							<img src="/resources/img/sub.PNG" alt="구독">
							</a>
						</div>
					</div>
					
					<div class="owl-item" style="width: 1903px;">
						<div class="item">
							<a href="/tj/sub"> <img src="/resources/img/review.PNG"
								alt="리뷰"> </a>
						</div>
					</div>
					<div class="owl-item" style="width: 1903px;">
						<div class="item">
							<a href="#"> <img src="/resources/img/no_img.PNG"
								alt="국제 강아지의 날"> </a>
						</div>
					</div>
				</div>
			</div>



			<div class="owl-controls clickable">
				<div class="owl-pagination">
					<div class="owl-page">
						<span class=""></span>
					</div>
					<div class="owl-page">
						<span class=""></span>
					</div>
					<div class="owl-page active">
						<span class=""></span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="content-area home-area-1 recent-property"
	style="background-color: #FCFCFC; padding-bottom: 55px;">
	<div class="container">
		<div class="row">
			<div
				class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
				<!-- /.feature title -->
				<h2>인기/추천 검색어</h2>
				<p>내 주변 검색 & 지도</p>
			</div>
		</div>
		
		<!-- 추천리스트 -->
		<div class="row">
			<div class="proerty-th">
			<c:if test="${not empty recClass }">
			<div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
					<h2>${sessionScope.id }님의 추천 클래스</h2>
				</div>
				<c:forEach items="${recClass }" var="rvo">
					<div class="col-sm-6 col-md-3 p0">
						<div class="box-two proerty-item">
							<div class="item-thumb">
								<a href="/class/detail?c_no=${rvo.c_no }"><img src="/resources/img/no_img.PNG"></a>
							</div>
							<div class="item-entry overflow">
					    <h4><a href="/class/detail?c_no=${rvo.c_no }">${rvo.c_name }</a></h4>
					    <span class="pull-left"><b>${rvo.c_addr1 }</b> </span><br>
					    <span class="proerty-price pull-left">
					    <fmt:formatNumber value="${rvo.c_price }"/> 원
					    </span>
					    <span class="pull-right"> 평점 :  </span>
					</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
			</div>
		</div>
		<!-- 추천리스트 -->

		<!-- 일반 리스트 -->
		<div class="row">
			<div class="proerty-th">
				<c:forEach items="${categoryList}" var="vo">
				<div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
					<h2>${vo.key }</h2>
				</div>
				  <c:forEach items="${vo.value }" var="classVO">
				  <div class="col-sm-6 col-md-3 p0">
				    <div class="box-two proerty-item">
				      <div class="item-thumb">
				        <a href="/class/detail?c_no=${classVO.c_no }"><img src="/resources/img/no_img.PNG"></a>
				      </div>
				      <div class="item-entry overflow">
				        <h4><a href="/class/detail?c_no=${classVO.c_no}">${classVO.c_name}</a></h4>
				        <span class="pull-left"><b>${classVO.c_addr1}</b> </span><br>
				        <span class="proerty-price pull-left">
				          <fmt:formatNumber value="${classVO.c_price}"/> 원
				        </span>
				        <span class="pull-right"> 평점 : </span>
				        <!-- 위시리스트 버튼 -->
				        <button class="wishlist-btn">
				          <i class="fas fa-heart"></i>
				        </button>
				        <!-- 위시리스트 버튼 -->
				      </div>
				    </div>
				  </div>
				  </c:forEach>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
// 위시 리스트 
const wishlistBtns = document.querySelectorAll('.wishlist-btn');
wishlistBtns.forEach(function(btn) {
  btn.addEventListener('click', function() {
    btn.classList.toggle('active');
  });
});
// 위시 리스트 

</script>

<%@ include file="../include/footer.jsp"%>
