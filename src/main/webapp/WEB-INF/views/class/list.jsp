<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>

<!-- 팝업창 제어 -->
<input type="hidden" id="srchdata" value='${jsonStr}'>
<script type="text/javascript">
function openMap(option){
	let popup = window.open('./popupMap','지도 검색','width=500,height=800,top=50%,left=50%,location=no');
	window.addEventListener("beforeunload", function() {
		popup.close();
	});
}
</script>
<!-- 팝업창 제어 -->
<!-- 클래스 리스트 hj -->
<div class="col-md-12 padding-top-40 properties-page">
	<!-- 버튼 컨테이너 -->
	<div class="col-md-12 "> 
		<!-- 인기검색어 출력  -->
		<div class="col-xs-10 page-subheader sorting pl0">
			인기 검색어<br>
			<c:if test="${psList != null && psList.size() > 0}">
			<c:forEach var="ps" items="${psList }">
				<button class="btn border-btn more-black"
				onclick="location.href='/class/list?search=${ps }'">${ps }</button>
			</c:forEach>
			</c:if>
		</div>
		<!-- 인기검색어 출력  -->
		<!-- 지도 열기 버튼  -->
        <div class="col-xs-2 layout-switcher">
            <button class="btn border-btn more-black" onclick="openMap('local')"><i class="fa fa-map-marker"></i> 내 주변 검색</button>
            <button class="btn border-btn more-black" onclick="openMap('marker')"><i class="fa fa-map-marker"></i> 지도 열기</button>
        </div>
		<!-- 지도 열기 버튼  -->
		<!-- 정렬 조건 설정  -->

		<!-- 정렬 조건 설정  -->
        
	</div>
	<!-- 버튼 컨테이너 -->
	<!-- 리스트 컨테이너 -->
	<div class="col-md-12 "> 
		<div id="list-type" class="proerty-th">
			<!-- 검색된 클래스 데이터 출력 -->
			<c:if test="${classVOList != null && classVOList.size() > 0}">
			<c:forEach var="vo" items="${classVOList }">
			<div class="col-sm-6 col-md-3 p0">
		        <div class="box-two proerty-item">
		            <div class="item-thumb">
		                <a href="/class/detail?c_no=${vo.c_no }">
		                	<img src="/resources/img/${vo.c_img }" 
		                	onerror="this.onerror=null; this.src='/resources/img/no_img.PNG'">
	                	</a>
		            </div>
					<div class="item-entry overflow">
					    <h4><a href="/class/detail?c_no=${vo.c_no }">${vo.c_name }</a></h4>
					    <span class="pull-left"><b>${vo.c_addr1 }&nbsp;${vo.c_addr2 }</b> </span><br>
					    <span class="proerty-price pull-left"><fmt:formatNumber value="${vo.c_price}" type="currency" currencyCode="KRW" /></span>
					    <span class="pull-right"> 평점 : ${vo.score } </span>
					</div>
			    </div>
			</div> 
			</c:forEach>
			</c:if>
			<!-- 검색된 클래스 데이터 출력 -->
		
			<!-- 페이징 처리  -->
			<div class="col-md-12"> 
			    <div class="pull-right">
			        <div class="pagination">
						<ul>
							<c:if test="${map.startPage > map.pageBlock }">
							<li><a id="prev">이전</a></li>
							</c:if>
							<c:forEach var="i" begin="${map.startPage }" end="${map.endPage }">
							<li><a class="pageNumbers">${i }</a></li>
							</c:forEach>
							<c:if test="${map.pageCount > map.endPage }">
							<li><a id="next">다음</a></li>
							</c:if>
						</ul>
			        </div>
			    </div>                
			</div>
			<!-- 페이징 처리 -->
			
			<!-- 페이지 이동시 데이터 처리 -->
			<form role="srch_frm" method="get">
				<input type="hidden" name="timestart" value="${map.timestart }">
				<input type="hidden" name="timeend" value="${map.timeend }">
				<input type="hidden" name="pricestart" value="${map.pricestart }">
				<input type="hidden" name="priceend" value="${map.priceend }">
				<input type="hidden" name="lowlv" value="${map.lowlv }">
				<input type="hidden" name="midlv" value="${map.midlv }">
				<input type="hidden" name="highlv" value="${map.highlv }">
				<input type="hidden" name="category" value="${map.category }">
				<input type="hidden" name="addr" value="${map.addr }">
				<input type="hidden" name="order" value="${map.order }">
				<input type="hidden" name="search" value="${map.search }">
				<input type="hidden" name="pageNum" value="${map.pageNum }">
			</form>
			<script type="text/javascript">
			$(document).ready(function(){
				var formObj = $("form[role='srch_frm']");
				
				// prev
				$("#prev").click(function(){
					$('input[name="pageNum"]').val("${map.startPage-1}");
					formObj.submit();
				});
				
				// pageNum			
				$(".pageNumbers").click(function(){
					$('input[name="pageNum"]').val($(this).html());
					formObj.submit();
				});	
				
				// next
				$("#next").click(function(){
					$('input[name="pageNum"]').val("${map.endPage+1}");
					formObj.submit();
				});	
			});
			</script> 
			<!-- 페이지 이동시 데이터 처리 -->
		</div>
	</div>
	<!-- 리스트 컨테이너 -->
</div>
<!-- 클래스 리스트 hj-->

<%@ include file="../include/footer.jsp" %>