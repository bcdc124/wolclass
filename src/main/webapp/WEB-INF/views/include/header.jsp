<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>WolClass</title>
<meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

        <!-- Place favicon.ico  the root directory -->
<!--         <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"> -->
<!--         <link rel="icon" href="favicon.ico" type="image/x-icon"> -->

		<!-- adminlte -->
		<link rel="stylesheet" href="/resources/admibower_components/bootstrap/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="/resources/admibower_components/bootstrap-daterangepicker/daterangepicker.css">
		<link rel="stylesheet" href="/resources/admibower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
		<link rel="stylesheet" href="/resources/admibower_components/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="/resources/admibower_components/Ionicons/css/ionicons.min.css">
		<link rel="stylesheet" href="/resources/admibower_components/morris.js/morris.css">
		<link rel="stylesheet" href="/resources/admibower_components/jvectormap/jquery-jvectormap.css">
		<link rel="stylesheet" href="/resources/admidist/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="/resources/admidist/css/skins/skin-blue.min.css">
		<link rel="stylesheet" href="/resources/admidist/css/AdminLTE.min.css">
		<link rel="stylesheet" href="/resources/admiplugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
		<!-- Google Font -->
		<link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
		<!-- adminlte -->

        <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="/resources/css/animate.css" media="screen">
        <link rel="stylesheet" href="/resources/assets/fonts/icon-7-stroke/css/helper.css">
        <link rel="stylesheet" href="/resources/assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css">
        <link rel="stylesheet" href="/resources/assets/css/normalize.css">
        <link rel="stylesheet" href="/resources/assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="/resources/assets/css/fontello.css">
        <link rel="stylesheet" href="/resources/assets/css/bootstrap-select.min.css"> 
        <link rel="stylesheet" href="/resources/assets/css/icheck.min_all.css">
        <link rel="stylesheet" href="/resources/assets/css/price-range.css">
        <link rel="stylesheet" href="/resources/assets/css/owl.carousel.css">  
        <link rel="stylesheet" href="/resources/assets/css/owl.theme.css">
        <link rel="stylesheet" href="/resources/assets/css/owl.transitions.css">
        <link rel="stylesheet" href="/resources/assets/css/jquery.slitslider.css">
        <link rel="stylesheet" href="/resources/assets/css/style.css">
        <link rel="stylesheet" href="/resources/assets/css/responsive.css">
        <noscript>
        <link rel="stylesheet" type="text/css" href="/resources/assets/css/styleNoJS.css" />
        </noscript>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        
        <!-- Font Awesome CSS -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" 
		integrity="sha512-......" 
		crossorigin="anonymous" />
        <!-- Font Awesome CSS -->
        
<!-- 알림 버튼 css -->
<style type="text/css">
.button {
  display: flex;
  justify-content: center;
  align-items: center;
}

#notification-button {
  position: relative;
  background-color: transparent;
  border: none;
  outline: none;
  cursor: pointer;
  font-size: 20px;
  color: #555;
}

.notification-count {
  position: absolute;
  top: -5px;
  right: -10px;
  background-color: red;
  color: white;
  font-size: 10px;
  padding: 2px 5px;
  border-radius: 50%;
}

.notification-container {
  position: relative;
}

.notification-popup {
  position: absolute;
  right: 0;
  bottom: -310px;
  width: 250px;
  height: 300px;
  background-color: #fff;
  border: 1px solid #ccc;
  display: none;
}

</style>
<!-- 알림 버튼 css -->
    </head>
<body>
<nav class="navbar navbar-default " style="position: ; top: 0; left: 0; width: 100%; z-index: 9999; padding-bottom: 10px;">
                <div class="navbar-header" style="margin-left: 100px;">
<!--                         <span class="">WolClass</span> -->
<!--                     <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navigation"> -->
<!--                         <span class="icon-bar"></span> -->
<!--                         <span class="icon-bar"></span> -->
<!--                         <span class="icon-bar"></span> -->
<!--                     </button> -->
                    <a class="navbar-brand" href="/tj/main"><img src="/resources/img/logo.PNG" alt="wolClass" style="height: 90px;"></a>
                </div>
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse yamm" id="navigation">
 <div class="search-form wow pulse animated" data-wow-delay="0.8s" style="visibility: visible; animation-delay: 0.8s; border: 0px; box-shadow: 0px 0px 0px; 
  animation-name: pulse; background: none;">
                            <form action="" class=" form-inline">
                                <button class="btn  toggle-btn" type="button"><i class="fa fa-bars"></i></button>

                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Key word">
                                </div>
                                <button class="btn search-btn" type="submit"><i class="fa fa-search"></i></button>
								<div class="button navbar-right" style="padding: 0px;">
								<c:choose>
								  <c:when test="${sessionScope.m_id.equals('admin') }">
                       			  <button class="navbar-btn nav-button wow bounceInRight class" data-wow-delay="0.4s">관리자</button>
								  </c:when>
								  <c:otherwise>
                       			  <button class="navbar-btn nav-button wow bounceInRight class" data-wow-delay="0.4s" 
                       			  style="margin-right: 30px;" id="addClass">클래스 등록</button>
								  </c:otherwise>
								</c:choose>
                       			  
								<c:if test="${empty sessionScope.m_id }">
                       			  <button class="navbar-btn nav-button wow bounceInRight login" data-wow-delay="0.4s">로그인</button>
                      			  <button class="navbar-btn nav-button wow fadeInRight" id="join" data-wow-delay="0.5s">회원가입</button>
								</c:if>
								
								<c:if test="${not empty sessionScope.m_id }">
                      			  <button class="navbar-btn nav-button wow fadeInRight"  data-wow-delay="0.5s">
                      			   <i class="fas fa-user-circle"></i>마이페이지</button>
								<!-- 알림 버튼 -->
                       			  <div class="notification-container">
									  <button id="notification-button">
									    <i class="fa fa-bell"></i>
									    <span class="notification-count">10</span>
									  </button>
									  <div id="notification-popup" class="notification-popup"></div>
									</div>
								<!-- 알림 버튼 -->
								</c:if>
                  			    </div>
                  			    
                                <div style="display: none;" class="search-toggle">

                                    <div class="search-row">   

                                        <div class="form-group mar-r-20">
                                            <label for="price-range">Price range ($):</label>
                                            <div class="slider-selection" style="left: 0%; width: 75%;"></div>
                                            <div class="slider-handle round left-round" style="left: 0%;"></div>
                                            <div class="slider-handle round" style="left: 75%;"></div>
                                            <div class="tooltip top" style="top: -14px; left: 0px;">
                                            	<div class="tooltip-arrow"></div><div class="tooltip-inner">0 : 450
                                            	</div>
                                            </div>
                                            <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[0,450]" id="price-range" style="">
                                            <br>
                                            <b class="pull-left color">2000$</b> 
                                            <b class="pull-right color">100000$</b>
                                        </div>
                                        <!-- End of  -->  

                                        <div class="form-group mar-l-20">
                                            <label for="property-geo">Property geo (m2) :</label>
                                            <div class="slider-selection" style="left: 8.33333%; width: 66.6667%;">
                                            </div>
                                            <div class="slider-handle round left-round" style="left: 8.33333%;"></div>
                                            <div class="slider-handle round" style="left: 75%;"></div><div class="tooltip top" style="top: -14px; left: 0px;">
                                            <div class="tooltip-arrow"></div>
                                            <div class="tooltip-inner">50 : 450</div></div>
                                            <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[50,450]" id="property-geo" style="">
                                            <br>
                                            <b class="pull-left color">40m</b> 
                                            <b class="pull-right color">12000m</b>
                                        </div>
                                        <!-- End of  --> 
                                    </div>

                                    <div class="search-row">

                                        <div class="form-group mar-r-20">
                                            <label for="price-range">Min baths :</label>
                                            <div class="slider-selection" style="left: 41.6667%; width: 33.3333%;"></div>
                                            <div class="slider-handle round left-round" style="left: 41.6667%;"></div>
                                            <div class="slider-handle round" style="left: 75%;"></div>
                                            <div class="tooltip top" style="top: -14px; left: 0px;">
                                            <div class="tooltip-arrow"></div><div class="tooltip-inner">250 : 450</div>
                                            </div>
                                            <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="min-baths" style=""><br>
                                            <b class="pull-left color">1</b> 
                                            <b class="pull-right color">120</b>
                                        </div>
                                        <!-- End of  --> 

                                        <div class="form-group mar-l-20">
                                            <label for="property-geo">Min bed :</label>
		                                            <div class="slider-selection" style="left: 41.6667%; width: 33.3333%;"></div>
		                                            <div class="slider-handle round left-round" style="left: 41.6667%;"></div>
		                                            <div class="slider-handle round" style="left: 75%;"></div>
                                            <div class="tooltip top" style="top: -14px; left: 0px;">
                                            <div class="tooltip-arrow"></div>
                                            <div class="tooltip-inner">250 : 450</div>
                                        </div>
                                        <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="min-bed" style="">
                                            <br>
                                            <b class="pull-left color">1</b> 
                                            <b class="pull-right color">120</b>
                                        </div>
                                        <!-- End of  --> 

                                    </div>
                                    <br>
                                    <div class="search-row">  

                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
                                                     Fire Place(3100)
                                                </label>
                                            </div>
                                        </div>
                                        <!-- End of  -->  

                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
                                                     Dual Sinks(500)
                                                </label>
                                            </div>
                                        </div>
                                        <!-- End of  --> 

                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
                                                     Hurricane Shutters(99)
                                                </label>
                                            </div>
                                        </div>
                                        <!-- End of  --> 
                                    </div>

                                    <div class="search-row">  

                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
                                                    Swimming Pool(1190)
                                                </label>
                                            </div>
                                        </div>
                                        <!-- End of  -->  

                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                  <input type="checkbox" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
                                                   2 Stories(4600)
                                                </label>
                                            </div>
                                        </div>
                                        <!-- End of  --> 

                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
                                                     Emergency Exit(200)
                                                </label>
                                            </div>
                                        </div>
                                        <!-- End of  --> 
                                    </div>                                    

                                    <div class="search-row">  

                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
                                        			 Laundry Room(10073)
                                                </label>
                                            </div>
                                        </div>
                                        <!-- End of  -->  

                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
                                                   Jog Path(1503)
                                                </label>
                                            </div>
                                        </div>
                                        <!-- End of  --> 

                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
                                                   26' Ceilings(1200)
                                                </label>
                                            </div>
                                        </div>
                                        <!-- End of  --> 
                                        <br>
                                        <hr>
                                    </div>                             
                                    <button class="btn search-btn prop-btm-sheaerch" type="submit"><i class="fa fa-search"></i></button>  
                                    
                                </div>                    
							  
                            </form>
                    <ul class="main-nav nav navbar-nav navbar-right">

                    </ul>
				</div>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
        <!-- End of nav bar -->

<script type="text/javascript">
	$(document).ready(function(){
		$('#join').click(function(){
			alert('회원가입');
			location.href="/db/join";
			return false;
		})
		
		$('#addClass').click(function(){
			alert('클래스 등록');
			location.href="/tj/addClass";
			return false;
		});
	});
	
	// 알림창 js 코드 - 태준
	const notificationButton = document.getElementById('notification-button');
	const notificationPopup = document.getElementById('notification-popup');

	notificationButton.addEventListener('click', function() {
	// toggle notification popup
	notificationPopup.style.display = notificationPopup.style.display === 'block' ? 'none' : 'block';

	// close notification popup when clicked outside of it
	window.addEventListener('click', function(e) {
    if (!notificationPopup.contains(e.target) && !notificationButton.contains(e.target)) {
      notificationPopup.style.display = 'none';
      }
    });

   // prevent notification popup from closing when clicked inside of it
   notificationPopup.addEventListener('click', function(e) {
  	 e.stopPropagation();
	   });
	});
	// 알림창 js 코드 - 태준

</script>