<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


  
 
.btn-backlist {
font-weight:bold;
font-size:15px;
border-radius:6px; 
 	width: 300px; 
 	height: 45px;
 background: #C9BA9B;
}
.btn-backlist:active {
 background: #A58C59;
 color: white;
 border: 3px gray inset;
}


.btn-write {
font-weight:bold;
font-size:15px;
border-radius:6px; 
 	width: 300px; 
 	height: 45px;
 background: #C9BA9B;
}
.btn-write:active {
 border: 3px gray inset;
 background: #A58C59;
 color: white;
}


</style>

</head>
<body>
	<!-- header  -->
	<%@ include file="../include/header.jsp"%>
	<!-- header  -->

	<!-- body  -->
	<div style="margin: 45px 0;">
	<div style="padding-left:20px; position: relative;" >
	<hr style="width: 8%;position: absolute; ">
		<h1 style="margin-left: 10%;line-height: inherit;">커뮤니티 - 글 작성 </h1>
	</div>
</div>
	


	<div
		style="width: 100%; height: auto; background: white; display: inline-block; box-sizing: border-box; border: 1px">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<!-- search  -->
					<div style="display: flex; padding-bottom: 30px; margin-left: 31%;" class="search-box">
						<div>
							<h3 class="box-title" style="font-size: x-large;">글 작성</h3>
						</div>



					</div>
					<!-- content  -->
					<form role="form" method="post">
					<div style="display: flex;">
						<div class="category-search" style="margin: 2px 4% 0 20%;">
							<select style="width: 125px; height: 45px; font-size: 20px;"
								name="b_category">
								<option value="board">자유게시글</option>
								<option value="recruit">모집글</option>
							</select>
							<input type="hidden" value="${Sessionscope.m_id}" >
							
						</div>
						<div style="display: block;width: 40%;border: solid 1px gray;padding: 55px;border-radius: 5px;">
							<div style="display: block; width: 100%;">
								<label>글 제목</label>
								<input style="margin-bottom: 30px;border: 1px solid gray;"
									type="text" name="b_title" placeholder="제목을 입력해주세요.">
							</div>
							<div style="">
								<label>글 내용</label>
								<textarea rows="15" name="b_content" placeholder=" 내용을 입력해주세요." 
								style="width:100%; overflow: initial"></textarea>
							</div>
							<!-- button   -->
							<div style="display: flex; margin: 30px 0 30px; justify-content: space-between;">
								<div>
									<button type="submit" class="btn-write">작성하기 </button>
								</div>
								<div>
									<button class="btn-backlist" onclick="location.href='/sw/community';"> 목록으로 </button>
								</div>
							</div>
							<!-- button   -->
						</div>
						
					</div>
					</form>
					</fieldset>
					<!-- content  -->
				</div>
			</div>
		</div>
	</div>
	<!-- body  -->

	<!-- footer  -->
	<%@ include file="../include/footer.jsp"%>
	<!-- footer  -->

</body>
</html>