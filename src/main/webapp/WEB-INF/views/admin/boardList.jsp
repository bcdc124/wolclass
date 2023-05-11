<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>


<%@ include file="../include/adminSide.jsp" %>


<!-- content -->
<div
		style="width: 100%; height: auto; background: white; display: inline-block; box-sizing: border-box; border: 1px">
		<div class="col-xs-12" style="background: #FDC600;height: 99%;padding: 0 0 0 3px;
		">
			<div class="box" style="margin-bottom: 10px; padding: 60px 180px 0 180px; height: 100%">
				<div class="box-header">
					<!-- search  -->
					<div style="display: flex; padding-bottom: 45px;"
						class="search-box">
						<div>
							<h3 class="box-title" style="font-size: x-large;">글 목록</h3>
						</div>
					</div>
				</div>
				<!-- search  -->

				<div class="box-body table-responsive no-padding">
					<table class="table table-hover">
						<tbody>


							<tr>
								<th style="width: 10%; background: #FDC600;border-right: 2px solid;">글번호</th>
								<th style="width: 20%; background: #FDC600;border-right: 2px solid;">카테고리</th>
								<th style="width: 25%; background: #FDC600;border-right: 2px solid;">제목</th>
								<th style="width: 20%; background: #FDC600;border-right: 2px solid;">작성자</th>
								<th style="width: 15%; background: #FDC600;border-right: 2px solid;">작성일</th>
								<th style="width: 10%; background: #FDC600;border-right: 2px solid;">버튼</th>
							</tr>
							<tr>
								<td>${b_no}</td>
								<td>${b_category}</td>
								<td><a href="/admin/readMsg?b_no=">${b_title}</a></td>
								<td>${b_writer}</td>
								<td>${b_regdate}</td>
								<td>버튼</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div>
			<!-- 페이징처리  -->
			<div class="box-footer clearfix">
				<div>
					<%-- <ul class="pagination pagination-sm no-margin " >
						<c:if test="${map.endPage <= map.pageBlock}">
						<li></li>
						</c:if>
						<c:if test="${map.endPage > map.pageBlock}">
						<li><a href="community?b_category=${map.b_category}&search=${map.search}&pageNum=${map.startPage - map.pageBlock}" 
						onclick="backPage();">«</a></li>
						</c:if>
						
						
						<c:forEach var="pageNum" begin="${map.startPage}" end="${map.endPage}">
							<li><a onclick="inputPageNum(pageNum);" href="community?b_category=${map.b_category}
							&search=${map.search}&pageNum=${pageNum}">${pageNum}</a></li>
						</c:forEach>
						
						<c:if test="${map.pageCount <= map.endPage}">
						<li></li>
						</c:if>
						<c:if test="${map.pageCount > map.endPage}">
						<li><a href="community?b_category=${map.b_category}&search=${map.search}&pageNum=${map.startPage + map.pageBlock}" 
						onclick="nextPage();">»</a></li>
						</c:if>
					</ul> --%>
				</div>
			</div>
			<!-- 페이징처리  -->
		</div>
	</div>

<!-- content -->


<%@ include file="../include/adminFooter.jsp" %>