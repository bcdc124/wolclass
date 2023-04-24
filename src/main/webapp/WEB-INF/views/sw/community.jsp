<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.clearfix li {
	float: none;
}

.clearfix {
	display: flex;
	justify-content: center;
}
th{
background: #FDC600;
}



</style>


</head>
<body>
	<!-- header  -->
	<%@ include file="../include/header.jsp"%>
	<!-- header  -->

	<!-- body  -->
	<div style="margin: 45px 0;">
		<div style="padding-left: 20px; position: relative;">
			<hr style="width: 8%; position: absolute;">
			<h1 style="margin-left: 10%; line-height: inherit;">커뮤니티</h1>
		</div>
	</div>

	<!-- list  -->
	<div
		style="width: 100%; height: auto; background: white; display: inline-block; box-sizing: border-box; border: 1px">
		<div class="col-xs-12">
			<div class="box" style="margin-bottom: 10px; padding: 60px 180px;">
				<div class="box-header">
					<!-- search  -->
					<div style="display: flex; padding-bottom: 45px;"
						class="search-box">
						<div>
							<h3 class="box-title" style="font-size: x-large;">글 목록</h3>
						</div>
							<form role="form" method="get" style="margin-left: 68%; display: flex;">
								<div class="category-search">
									<select style="width: 100px;" name="boardCategory">
										<option value="board | recruit | announcement">전체글</option>
										<option value="board">일반글</option>
										<option value="recruit">모집글</option>
										<option value="announcement">공지사항</option>
									</select>
								</div>

								<div class="box-tools">
									<div class="input-group input-group-sm hidden-xs">
										<input style="width: 200px; margin-left: 58px;" type="text"
											name="table_search" class="form-control pull-right"
											placeholder="키워드를 입력해주세요">

										<div class="input-group-btn">
											<button type="submit" class="btn btn-default" onclick="">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
								</div>
							</form>

					</div>
				</div>
				<!-- search  -->

				<div class="box-body table-responsive no-padding">
					<table class="table table-hover">
						<tbody>


							<tr>
								<th style="width: 10%">글번호</th>
								<th style="width: 20%">카테고리</th>
								<th style="width: 25%">제목</th>
								<th style="width: 20%">작성자</th>
								<th style="width: 10%">조회수</th>
								<th style="width: 15%">작성일</th>
							</tr>
							<c:forEach var="vo" items="${boardList }">
								<tr>
									<td>${vo.b_no }</td>
									<td>
									${vo.b_category }
									<%-- <c:if test="${vo.b_category }='board'">
									일반글</c:if>
									<c:if test="${vo.b_category }='recruit'">
									모집글</c:if>
									<c:if test="${vo.b_category }='announcement'">
									공지사항</c:if> --%>
									</td>
									<td><a href="/sw/swRead?b_no=${vo.b_no }">
											${vo.b_title } </a></td>
									<td>${vo.b_writer }</td>
									<td><span class="badge bg-yellow"> ${vo.b_viewcnt }
									</span></td>
									<td>${vo.b_regdate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div></div>
			</div>
			<%-- <c:if test="${Sessionscope.id} = null">
			<button style="margin: 10px 0 30px 85%; width: 100px; height: 30px;">
				<a href="/sw/login">글작성</a>
			</button>
			</c:if> --%>
			<%-- <c:if test="${Sessionscope.id} != null"> --%>
			<button style="margin: 10px 0 30px 85%; width: 100px; height: 30px;">
				<a href="/sw/swWrite">글작성</a>
			</button>
			<%-- </c:if> --%>
		</div>

		<div>
			<!-- 페이징처리  -->
			<div class="box-footer clearfix">
				<div>
					<ul class="pagination pagination-sm no-margin pull-right">
						<li><a href="#">«</a></li>
						<c:forEach var="i" begin="1" end="${totalPage}" step="1">
							<li><a href="community?viewpage=${i}">i</a></li>
						</c:forEach>
						<li><a href="#">»</a></li>
					</ul>
				</div>
			</div>
			<!-- 페이징처리  -->
		</div>
	</div>
	<!-- list  -->

	<!-- body  -->
	<script type="text/javascript">
		var result = "${result}";

		if (result == "ok") {
			alert("정상적으로 글 작성 완료!");
		}
		if (result == "updOK") {
			alert("글 수정 완료!");
		}
		if (result == "delOK") {
			alert("글 삭제 완료!");
		}
	</script>



	<!-- footer  -->
	<%@ include file="../include/footer.jsp"%>
	<!-- footer  -->

</body>
</html>