<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<meta charset="UTF-8">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" ></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" ></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
<title>Insert title here</title>
<script type="text/javascript">
//특정날짜들 배열
//var disabledDays = ["2023-4-23","2023-4-24","2023-5-1"];
var ableDays = new Array();
var c_no = ${classVO.c_no};
var date = null;
var time = null;
var t_start = new Array();
var pNum = null;
	var $ = jQuery;
$( function() {
	console.log(date)
	$("#time").hide();
	$("#pNum").hide();
    $( "#thdatepicker" ).datepicker({
    	 dateFormat: 'yy-mm-dd',
         prevText: '이전 달',
         nextText: '다음 달',
         monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
         monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
         dayNames: ['일', '월', '화', '수', '목', '금', '토'],
         dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
         showMonthAfterYear: true,
         yearSuffix: '년',
         minDate: 0,
         beforeShowDay: ableAllTheseDays,
         onSelect: getTime

    });
    

    function getTime() { 
   	 date = $.datepicker.formatDate("yy-mm-dd",$("#thdatepicker").datepicker("getDate")); 
                                 
   	 date = $("#thdatepicker").val();
        alert(date);
        if(date!=null){
       	 console.log(date+"null아님~!1111");
       	 
       	 //시간 선택
       	 $.ajax({
				url:"/th/getTime",
				type:"post",
			 	data: JSON.stringify({t_date:date, c_no:c_no}),
			 	contentType: "application/json; charset=utf-8",
				dataType:"json",
				success:function(data){
					alert("성공");
					console.log(data);
				/* 	for(i=0; i<data.length; i++) {
						t_start[i] = data[i].t_start;
						$("#time").append(t_start[i]);
					}  */
					
				 	$("#time").show();
					/*
					$('select').empty();
					$('select').append("<option>"+data[0].t_start+"</option>");
					$('#timeBtn').append("<input type='button' value="+data[0].t_start+">");
*/
			        var $time = $("#time");
			        $time.empty(); // 기존 옵션을 모두 지웁니다.
			       	var $dft = $("<option>").text("시간 선택").val(null);
			        $time.append($dft);
			        $.each(data, function(index, time) {
			            var $option = $("<option>").text(time.t_start).val(time.t_start); 
			            $time.append($option);
			          
			        }); // each문 닫기

				},	
				error:function(data){
					alert("실패");
					// 페이지 이동 후 실패했을 때 동작
				}
			}); // 시간 선택 ajax
        }
 
    } 
/*     time = $time.val();
    if(time!=null){
    	alert(time+"dd");
    getPNum
    }
    function getPNum(){
    	 // 인원 선택 
    	 alert("getPNum");
    	 
    } */

    
    
}); // function() 끝
function timeSelected(){
	   // if($("#time").val()!=null){
	    	time = $("#time").val();
	    	alert(time+"dd");
	    	
	    	
	       	 // 최대 인원 가져오기ajax
	       	 $.ajax({
					url:"/th/getPNum",
					type:"post",
				 	data: JSON.stringify({t_date:date, c_no:c_no, t_start:time}),
				 	contentType: "application/json; charset=utf-8",
					dataType:"json",
					success:function(data){
						alert("인원 가져오기 성공");
						console.log(data.t_rem_p);
						pNum=data.t_rem_p;
						console.log(pNum);
					 	$("#pNum").show();
					 	$("#pNum").attr('max', pNum);
					 	$('#pNum').attr('placeholder', '예약 가능한 최대 인원은 '+pNum+'명 입니다');
					 	


					},	
					error:function(data){
						alert("실패");
						// 페이지 이동 후 실패했을 때 동작
					}
				}); // 최대 인원 가져오기 ajax

	    };

function changePNum(){
 	if($("#pNum").val()>pNum){
	 	alert($("#pNum").val());
	 	alert(pNum+"이하로 입력하세요");

	 	}
}
$(document).ready(function(){
	  $('#pNum').on('input', function(){
	    var price = ${classVO.c_price}*$("#pNum").val();
        var formattedPrice = new Intl.NumberFormat('ko-KR').format(price); // 가격을 포맷합니다
        $("#priceDisplay").text(formattedPrice + "원"); // 가격을 출력합니다
	   
	  });
	});	    
	    
	$(document).ready(function(){
      fnDatepicker("#thdatepicker");
      $("#thdatepicker").val(getToday('yyyy-mm-dd'));
    });


    // 현재 날짜
    function getToday(type){
      var date = new Date();
      var year = date.getFullYear();
      var month = date.getMonth()+1;
      var day = date.getDate();
      if(month < 10){
        month = "0"+month;
      }
      if(day < 10){
        day = "0"+day;
      }

      var today = '';
      if(type == 'yyyy-mm-dd'){
        today = year + "-" + month + "-" + day;
      }else {
        today = year + "" + month + "" + day;
      }

      return today;
    }
    
    // 특정일 선택막기
    function disableAllTheseDays(date) {
        var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
        for (i = 0; i < disabledDays.length; i++) {
            if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
                return [false];
            }
        }
        return [true];
    }
	 
	 // 특정일 선택막기
    function ableAllTheseDays(date) {
        var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
        for (i = 0; i < ableDays.length; i++) {
            if($.inArray(y + '-' +(m+1) + '-' + d,ableDays) != -1) {
                return [true];
            }
        }
        return [false];
    }
	 
var vaildDates = '${dateList }';
var vaildDatesArr = vaildDates.split('t_date=');
for(var i=1; i<vaildDatesArr.length; i++){
	ableDays.push(vaildDatesArr[i].split(',')[0].replaceAll('-0','-'));
}


for(var i=0; i<ableDays.length; i++){
	console.log(ableDays[i]);
}

</script>
<body>

        <!-- property area -->
        <div class="content-area single-property" style="background-color: #FCFCFC;">&nbsp;
            <div class="container">   

                <div class="clearfix padding-top-40" >

                    <div class="col-md-8 single-property-content prp-style-1 ">
                        <div class="row">
                            <div class="light-slide-item">            
                                <div class="clearfix">
                                    <div class="favorite-and-print">
                                        <a class="add-to-fav" href="#login-modal" data-toggle="modal">
                                            <i class="fa fa-star-o"></i>
                                        </a>
                                        <a class="printer-icon " href="javascript:window.print()">
                                            <i class="fa fa-print"></i> 
                                        </a>
                                    </div> 

                                    <ul id="image-gallery" class="gallery list-unstyled cS-hidden">
                                        <li data-thumb="assets/img/property-1/property1.jpg"> 
                                            <img src="assets/img/property-1/property1.jpg" />
                                        </li>
                                        <li data-thumb="assets/img/property-1/property2.jpg"> 
                                            <img src="assets/img/property-1/property3.jpg" />
                                        </li>
                                        <li data-thumb="assets/img/property-1/property3.jpg"> 
                                            <img src="assets/img/property-1/property3.jpg" />
                                        </li>
                                        <li data-thumb="assets/img/property-1/property4.jpg"> 
                                            <img src="assets/img/property-1/property4.jpg" />
                                        </li>                                         
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="single-property-wrapper">
                            <div class="single-property-header">                                          
                                <h1 class="property-title pull-left">${classVO.c_name }</h1>
                                <span class="property-price pull-right">
                               <fmt:formatNumber value="${classVO.c_price }" groupingUsed="true"/>
                                </span>
                            </div>

                            <div class="property-meta entry-meta clearfix ">   

                                <div class="col-xs-6 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info icon-area">
                                        <img src="assets/img/icon/room-orange.png">
                                    </span>
                                    <span class="property-info-entry">
                                        <span class="property-info-label">주소</span>
                                        <span class="property-info-value">${classVO.c_addr1 }<b class="property-info-unit">Sq Ft</b></span>
                                    </span>
                                </div>
                                
                                <div class="col-xs-6 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info-icon icon-tag">                                        
                                        <img src="assets/img/icon/sale-orange.png">
                                    </span>
                                    <span class="property-info-entry">
                                        <span class="property-info-label">수업소요시간</span>
                                        <span class="property-info-value">${classVO.c_time }</span>
                                    </span>
                                </div>


                                <div class="col-xs-6 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info-icon icon-bed">
                                        <img src="assets/img/icon/bed-orange.png">
                                    </span>
                                    <span class="property-info-entry">
                                        <span class="property-info-label">레벨</span>
                                        <span class="property-info-value">${classVO.c_level }</span>
                                    </span>
                                </div>

                                <div class="col-xs-6 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info-icon icon-bed">
                                        <img src="assets/img/icon/cars-orange.png">
                                    </span>
                                    <span class="property-info-entry">
                                        <span class="property-info-label">최대인원</span>
                                        <span class="property-info-value">${classVO.c_maxperson }</span>
                                    </span>
                                </div>


                            </div>
                            <!-- .property-meta -->

                            <div class="section">
                                <h4 class="s-property-title">Description</h4>
                                <div class="s-property-content">
									<p>${classVO.c_content }</p>
                                </div>
                            </div>
                            <!-- End description area  -->

                            <div class="section additional-details">

                                <h4 class="s-property-title">Additional Details</h4>

                                <ul class="additional-details-list clearfix">
                                    <li>
                                        <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">Waterfront</span>
                                        <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">Yes</span>
                                    </li>

                                    <li>
                                        <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">Built In</span>
                                        <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">2003</span>
                                    </li>
                                    <li>
                                        <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">Parking</span>
                                        <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">2 Or More Spaces,Covered Parking,Valet Parking</span>
                                    </li>

                                    <li>
                                        <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">Waterfront</span>
                                        <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">Yes</span>
                                    </li>

                                    <li>
                                        <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">View</span>
                                        <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">Intracoastal View,Direct ew</span>
                                    </li>

                                    <li>
                                        <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">Waterfront Description:</span>
                                        <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">Intracoastal Front,Ocean Access</span>
                                    </li> 

                                </ul>
                            </div>  
                            <!-- End additional-details area  -->

                            <div class="section property-features">      

                                <h4 class="s-property-title">Features</h4>                            
                                <ul>
                                    <li><a href="properties.html">Swimming Pool</a></li>   
                                    <li><a href="properties.html">3 Stories</a></li>
                                    <li><a href="properties.html">Central Cooling</a></li>
                                    <li><a href="properties.html">Jog Path 2</a></li>
                                    <li><a href="properties.html">2 Lawn</a></li>
                                    <li><a href="properties.html">Bike Path</a></li>
                                </ul>

                            </div>
                            <!-- End features area  -->

                            <div class="section property-video"> 
                                <h4 class="s-property-title">Property Video</h4> 
                                <div class="video-thumb">
                                    <a class="video-popup" href="yout" title="Virtual Tour">
                                        <img src="assets/img/property-video.jpg" class="img-responsive wp-post-image" alt="Exterior">            
                                    </a>
                                </div>
                            </div>
                            <!-- End video area  -->
                            
                            

                            <div class="section property-share"> 
                                <h4 class="s-property-title">Share width your friends </h4> 
                                <div class="roperty-social">
                                    <ul> 
                                        <li><a title="Share this on dribbble " href="#"><img src="assets/img/social_big/dribbble_grey.png"></a></li>                                         
                                        <li><a title="Share this on facebok " href="#"><img src="assets/img/social_big/facebook_grey.png"></a></li> 
                                        <li><a title="Share this on delicious " href="#"><img src="assets/img/social_big/delicious_grey.png"></a></li> 
                                        <li><a title="Share this on tumblr " href="#"><img src="assets/img/social_big/tumblr_grey.png"></a></li> 
                                        <li><a title="Share this on digg " href="#"><img src="assets/img/social_big/digg_grey.png"></a></li> 
                                        <li><a title="Share this on twitter " href="#"><img src="assets/img/social_big/twitter_grey.png"></a></li> 
                                        <li><a title="Share this on linkedin " href="#"><img src="assets/img/social_big/linkedin_grey.png"></a></li>                                        
                                    </ul>
                                </div>
                            </div>
                            <!-- End video area  -->
                            
                        </div>
                    </div>


                    <div class="col-md-4 p0">
                        <aside class="sidebar sidebar-property blog-asside-right">
                       
                     <div id="thdatepicker"></div>
                     <select id="time" class="selectpicker show-tick form-control" onchange="timeSelected()"></select>
                     
                     <!-- <div id="timeBtn"></div> -->
                     <input type="number" id="pNum"class="selectpicker show-tick form-control" min="1" onchange="changePNum">


						<div id="price" class="single-property-header">
							<span id="priceDisplay" class="property-price pull-right"> 
<%-- 							<fmt:formatNumber value="${price }" groupingUsed="true" />원 --%>
							</span>
						</div>


							<!--                             <div class="dealer-widget">
                                <div class="dealer-content">
                                    <div class="inner-wrapper">

                                        <div class="clear">
                                            <div class="col-xs-4 col-sm-4 dealer-face">
                                                <a href="">
                                                    <img src="assets/img/client-face1.png" class="img-circle">
                                                </a>
                                            </div>
                                            <div class="col-xs-8 col-sm-8 ">
                                                <h3 class="dealer-name">
                                                    <a href="">Nathan James</a>
                                                    <span>Real Estate Agent</span>        
                                                </h3>
                                                <div class="dealer-social-media">
                                                    <a class="twitter" target="_blank" href="">
                                                        <i class="fa fa-twitter"></i>
                                                    </a>
                                                    <a class="facebook" target="_blank" href="">
                                                        <i class="fa fa-facebook"></i>
                                                    </a>
                                                    <a class="gplus" target="_blank" href="">
                                                        <i class="fa fa-google-plus"></i>
                                                    </a>
                                                    <a class="linkedin" target="_blank" href="">
                                                        <i class="fa fa-linkedin"></i>
                                                    </a> 
                                                    <a class="instagram" target="_blank" href="">
                                                        <i class="fa fa-instagram"></i>
                                                    </a>       
                                                </div>

                                            </div>
                                        </div>

                                        <div class="clear">
                                            <ul class="dealer-contacts">                                       
                                                <li><i class="pe-7s-map-marker strong"> </i> 9089 your adress her</li>
                                                <li><i class="pe-7s-mail strong"> </i> email@yourcompany.com</li>
                                                <li><i class="pe-7s-call strong"> </i> +1 908 967 5906</li>
                                            </ul>
                                            <p>Duis mollis  blandit tempus porttitor curabiturDuis mollis  blandit tempus porttitor curabitur , est non…</p>
                                        </div>

                                    </div>
                                </div>
                            </div> -->

							<div
								class="panel panel-default sidebar-menu similar-property-wdg wow fadeInRight animated">
								<div class="panel-heading">
									<h3 class="panel-title">Similar Properties</h3>
								</div>
								<div class="panel-body recent-property-widget">
									<ul>
										<li>
											<div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
												<a href="single.html"><img
													src="assets/img/demo/small-property-2.jpg"></a> <span
													class="property-seeker"> <b class="b-1">A</b> <b
													class="b-2">S</b>
												</span>
											</div>
											<div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
												<h6>
													<a href="single.html">Super nice villa </a>
												</h6>
												<span class="property-price">3000000$</span>
											</div>
										</li>
										<li>
											<div class="col-md-3 col-sm-3  col-xs-3 blg-thumb p0">
												<a href="single.html"><img
													src="assets/img/demo/small-property-1.jpg"></a> <span
													class="property-seeker"> <b class="b-1">A</b> <b
													class="b-2">S</b>
												</span>
											</div>
											<div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
												<h6>
													<a href="single.html">Super nice villa </a>
												</h6>
												<span class="property-price">3000000$</span>
											</div>
										</li>
										<li>
											<div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
												<a href="single.html"><img
													src="assets/img/demo/small-property-3.jpg"></a> <span
													class="property-seeker"> <b class="b-1">A</b> <b
													class="b-2">S</b>
												</span>
											</div>
											<div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
												<h6>
													<a href="single.html">Super nice villa </a>
												</h6>
												<span class="property-price">3000000$</span>
											</div>
										</li>

										<li>
											<div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
												<a href="single.html"><img
													src="assets/img/demo/small-property-2.jpg"></a> <span
													class="property-seeker"> <b class="b-1">A</b> <b
													class="b-2">S</b>
												</span>
											</div>
											<div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
												<h6>
													<a href="single.html">Super nice villa </a>
												</h6>
												<span class="property-price">3000000$</span>
											</div>
										</li>

									</ul>
								</div>
							</div>

							<div
								class="panel panel-default sidebar-menu wow fadeInRight animated">
								<div class="panel-heading">
									<h3 class="panel-title">Ads her</h3>
								</div>
								<div class="panel-body recent-property-widget">
									<img src="assets/img/ads.jpg">
								</div>
							</div>

							<div
								class="panel panel-default sidebar-menu wow fadeInRight animated">
								<div class="panel-heading">
									<h3 class="panel-title">Smart search</h3>
								</div>
								<div class="panel-body search-widget">
									<form action="" class=" form-inline">
										<fieldset>
											<div class="row">
												<div class="col-xs-12">
													<input type="text" class="form-control"
														placeholder="Key word">
												</div>
											</div>
										</fieldset>

										<fieldset>
											<div class="row">
												<div class="col-xs-6">

													<select id="lunchBegins" class="selectpicker"
														data-live-search="true" data-live-search-style="begins"
														title="Select Your City">

														<option>New york, CA</option>
														<option>Paris</option>
														<option>Casablanca</option>
														<option>Tokyo</option>
														<option>Marraekch</option>
														<option>kyoto , shibua</option>
													</select>
												</div>
												<div class="col-xs-6">

													<select id="basic"
														class="selectpicker show-tick form-control">
														<option>-Status-</option>
														<option>Rent</option>
														<option>Boy</option>
														<option>used</option>

													</select>
												</div>
											</div>
										</fieldset>

										<fieldset class="padding-5">
											<div class="row">
												<div class="col-xs-6">
													<label for="price-range">Price range ($):</label> <input
														type="text" class="span2" value="" data-slider-min="0"
														data-slider-max="600" data-slider-step="5"
														data-slider-value="[0,450]" id="price-range"><br />
													<b class="pull-left color">2000$</b> <b
														class="pull-right color">100000$</b>
												</div>
												<div class="col-xs-6">
													<label for="property-geo">Property geo (m2) :</label> <input
														type="text" class="span2" value="" data-slider-min="0"
														data-slider-max="600" data-slider-step="5"
														data-slider-value="[50,450]" id="property-geo"><br />
													<b class="pull-left color">40m</b> <b
														class="pull-right color">12000m</b>
												</div>
											</div>
										</fieldset>

										<fieldset class="padding-5">
											<div class="row">
												<div class="col-xs-6">
													<label for="price-range">Min baths :</label> <input
														type="text" class="span2" value="" data-slider-min="0"
														data-slider-max="600" data-slider-step="5"
														data-slider-value="[250,450]" id="min-baths"><br />
													<b class="pull-left color">1</b> <b
														class="pull-right color">120</b>
												</div>

												<div class="col-xs-6">
													<label for="property-geo">Min bed :</label> <input
														type="text" class="span2" value="" data-slider-min="0"
														data-slider-max="600" data-slider-step="5"
														data-slider-value="[250,450]" id="min-bed"><br />
													<b class="pull-left color">1</b> <b
														class="pull-right color">120</b>

												</div>
											</div>
										</fieldset>

										<fieldset class="padding-5">
											<div class="row">
												<div class="col-xs-6">
													<div class="checkbox">
														<label> <input type="checkbox" checked>
															Fire Place
														</label>
													</div>
												</div>

												<div class="col-xs-6">
													<div class="checkbox">
														<label> <input type="checkbox"> Dual Sinks
														</label>
													</div>
												</div>
											</div>
										</fieldset>

										<fieldset class="padding-5">
											<div class="row">
												<div class="col-xs-6">
													<div class="checkbox">
														<label> <input type="checkbox" checked>
															Swimming Pool
														</label>
													</div>
												</div>
												<div class="col-xs-6">
													<div class="checkbox">
														<label> <input type="checkbox" checked> 2
															Stories
														</label>
													</div>
												</div>
											</div>
										</fieldset>

										<fieldset class="padding-5">
											<div class="row">
												<div class="col-xs-6">
													<div class="checkbox">
														<label><input type="checkbox"> Laundry
															Room </label>
													</div>
												</div>
												<div class="col-xs-6">
													<div class="checkbox">
														<label> <input type="checkbox"> Emergency
															Exit
														</label>
													</div>
												</div>
											</div>
										</fieldset>

										<fieldset class="padding-5">
											<div class="row">
												<div class="col-xs-6">
													<div class="checkbox">
														<label> <input type="checkbox" checked>
															Jog Path
														</label>
													</div>
												</div>
												<div class="col-xs-6">
													<div class="checkbox">
														<label> <input type="checkbox"> 26'
															Ceilings
														</label>
													</div>
												</div>
											</div>
										</fieldset>

										<fieldset class="padding-5">
											<div class="row">
												<div class="col-xs-12">
													<div class="checkbox">
														<label> <input type="checkbox"> Hurricane
															Shutters
														</label>
													</div>
												</div>
											</div>
										</fieldset>

										<fieldset>
											<div class="row">
												<div class="col-xs-12">
													<input class="button btn largesearch-btn" value="Search"
														type="submit">
												</div>
											</div>
										</fieldset>
									</form>
								</div>
							</div>
					</aside>
                    </div>
                </div>

            </div>
        </div>


        <script>
            $(document).ready(function () {

                $('#image-gallery').lightSlider({
                    gallery: true,
                    item: 1,
                    thumbItem: 9,
                    slideMargin: 0,
                    speed: 500,
                    auto: true,
                    loop: true,
                    onSliderLoad: function () {
                        $('#image-gallery').removeClass('cS-hidden');
                    }
                });
            });
        </script>
</body>
<%-- <%@ include file="../include/footer.jsp" %> --%>
