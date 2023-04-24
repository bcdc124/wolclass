<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="text" id="lat">
<input type="text" id="lng">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0855a981db011b9c4778f98b0871b031&libraries=services"></script>
<script>
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('부산광역시 부산진구 부전동 동천로 109', function(result, status) {
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
			document.getElementById('lat').value = result[0].y;
			document.getElementById('lng').value = result[0].x;
	    } 
	});
</script>
  
</body>
</html>