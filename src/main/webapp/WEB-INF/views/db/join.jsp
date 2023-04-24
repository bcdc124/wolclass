<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<div class="col-md-6" style="position: absolute; display: contents;">
                    <div class="box-for overflow">
                        <div class="col-md-12 col-xs-12 register-blocks">
                            <h2>회원가입 </h2> 
                            <form id="join_form" method="post"> 
                                <div class="form-group">
                                    <label for="m_id">아이디</label> <span style="color: red">(필수)</span> 
                                    <input type="text" class="form-control" id="m_id" name="m_id" required
                                      placeholder="아이디를 입력하세요. (영문,숫자 조합하여 8~16자)" maxlength="16">
	                                <span class="id_input_re_1" style="color: green; display: none">사용 가능한 아이디입니다.</span>
								    <span class="id_input_re_2" style="color: red; display: none">아이디가 이미 존재합니다.</span>
								    <span class="id_input_re_3" style="color: red; display: none">형식에 맞게 입력하시오.</span>
		                            <span class="final_id_ck" style="display: none">아이디를 입력해주세요.</span>
                                </div>
								
                                <div class="form-group">
                                    <label for="m_pw">비밀번호</label>  <span style="color: red">(필수)</span>
                                    <input type="password" class="form-control" id="m_pw" name="m_pw" required
                                    placeholder="비밀번호를 입력하세요. (영문,숫자,특수문자 조합하여 8~16자)" maxlength="16">

                                    <span class="final_pw_ck" style="display: none">비밀번호를 입력해주세요.</span>
                					<span class="pwck_input_re_3" style="color: red; display: none">형식에 맞게 입력하시오.</span>
                                </div>
                                <div class="form-group">
                                    <label for="m_pw2">비밀번호 확인</label> 
                                    <input type="password" class="form-control" id="m_pw2" name="m_pw2"
                                    placeholder="비밀번호를 다시 입력하세요.">
                                    <span class="final_pwck_ck" style="display: none">비밀번호 확인을 입력해주세요.</span>
                                    <span class="pwck_input_re_1" style="color: green; display: none">비밀번호가 일치합니다.</span>
                					<span class="pwck_input_re_2" style="color: red; display: none">비밀번호가 일치하지 않습니다.</span>
                                </div>
                                <div class="form-group">
                                    <label for="m_email">이메일</label>  <span style="color: red">(필수)</span>
                                    <input type="text" class="form-control" id="m_email" name="m_email" required>
                                    <button class="btn btn-warning" id="email_auth_btn">인증번호 전송</button>
                                    <span class="final_mail_ck" style="display: none">이메일을 입력해주세요.</span>
									<sapn class="mail_input_box_warn"></sapn>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" id="email_auth_key"  placeholder="인증번호 입력"
                                      disabled="disabled">
                                    <span id="mail_check_input_box_warn"></span>
                                </div>
                                  <div class="form-group">
                                    <label for="m_name">이름</label>  <span style="color: red">(필수)</span>
                                    <input type="text" class="form-control" id="m_name" name="m_name"
                                    placeholder="이름을 입력하세요.">
                                    <span class="final_name_ck" style="display: none">이름을 입력해주세요.</span>
                                </div>
                                  <div class="form-group">
                                    <label for="m_nick">닉네임</label>  <span>(선택)</span>
                                    <input type="text" class="form-control" id="m_nick" name="m_nick"
                                     placeholder="닉네임을 입력하세요.">
                                </div>
                                  <div class="form-group">
                                    <label for="m_phone">전화번호</label>  <span style="color: red">(필수)</span>
                                    <input type="text" class="form-control" id="m_phone" name="m_phone" required
                                     oninput="hypenTel(this)" maxlength="13" placeholder="전화번호를 입력하세요">
                                     <span class="final_phone_ck" style="display: none">전화번호를 입력해주세요.</span>
                                </div>
                                  <div class="form-group">
                                    <label for="m_dogtype">반려견 종류</label>   <span>(선택)</span>
                                    <input type="radio" class="form-control" id="m_dogtype" name="m_dogtype" value="대형">대형
                                    <input type="radio" class="form-control" id="m_dogtype" name="m_dogtype" value="중형">중형
                                    <input type="radio" class="form-control" id="m_dogtype" name="m_dogtype" value="소형">소형
                                </div>
                                  <div class="form-group">
                                    <label for="m_dogbirth">반려견 생일</label>  <span>(선택)</span>
                                    <input type="date" class="form-control" id="m_dogbirth" name="m_dogbirth">
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-default">회원가입</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"/>         -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
// 전화번호 - 자동 붙이기 - 다빈
var autoHypenPhone = function(str){
      str = str.replace(/[^0-9]/g, '');
      var tmp = '';
      if( str.length < 4){
          return str;
      }else if(str.length < 7){
          tmp += str.substr(0, 3);
          tmp += '-';
          tmp += str.substr(3);
          return tmp;
      }else if(str.length < 11){
          tmp += str.substr(0, 3);
          tmp += '-';
          tmp += str.substr(3, 3);
          tmp += '-';
          tmp += str.substr(6);
          return tmp;
      }else{              
          tmp += str.substr(0, 3);
          tmp += '-';
          tmp += str.substr(3, 4);
          tmp += '-';
          tmp += str.substr(7);
          return tmp;
      }
      return str;
}


var phoneNum = document.getElementById('m_phone');

phoneNum.onkeyup = function(){
  console.log(this.value);
  this.value = autoHypenPhone( this.value ) ;  
}

var code = ""; // 이메일전송 인증번호 저장위한 코드

$(document).ready(function(){
	// 유효성 검사 통과유무 변수
	var idCheck = false; // 아이디
	var idckCheck = false; // 아이디 중복검사
	var pwCheck = false; // 비번
	var pwckCheck = false; // 비번 확인
	var pwckcorCheck = false; // 비번 불일치 확인
	var nameCheck = false; // 이름
	var mailCheck = false; // 이메일
    var mailnumCheck = false; // 이메일 인증번호 확인
    var phoneCheck = false; // 전화번호 
    
	// 회원가입 버튼(기능) - 다빈
	$(".btn-default").click(function(){

		var id = $("#m_id").val();             // id 입력란
		var pw = $("#m_pw").val(); 			   // 비밀번호 입력란
		var pwck = $("#m_pw2").val();		   // 비밀번호 확인 입력란
		var name = $("#m_name").val();         // 이름 입력란
		var mail = $("#m_email").val();        // 이메일 입력란
		var phone = $("#m_phone").val();       // 전화번호 입력란
		
		// 아이디 유효성검사
		if(id == ""){
			$(".final_id_ck").css('display','block');
			idCheck = false;
		}else{
			$(".final_id_ck").css('display','none');
			idCheck = true;
		}
		
		// 비밀번호 유효성검사
		if(pw == ""){
			$('.final_pw_ck').css('display','block');
			pwCheck = false;
		}else{
			$('.final_pw_ck').css('display','none');
			pwCheck = true;			
		}
		// 비밀번호 확인 유효성검사
		if(pwck == ""){
			$('.final_pwck_ck').css('display','block');
			pwckCheck = false;			
		}else{
			$('.final_pwck_ck').css('display','none');
			pwckCheck = true;			
		}
		// 이름 유효성 검사
		if(name == ""){
			$('.final_name_ck').css('display','block');
			nameCheck = false;
		}else{
			$('.final_name_ck').css('display','none');
			nameCheck = true;			
		}
		// 이메일 유효성 검사
		if(mail == ""){
			$('.final_mail_ck').css('display','block');
			mailCheck = false;
		}else{
			$('.final_mail_ck').css('display','none');
			mailCheck = true;			
		}
		// 전화번호 유효성 검사
		if(phone == ""){
			$('.final_phone_ck').css('display','block');
			phoneCheck = false;
		}else{
			$('.final_phone_ck').css('display','none');
			phoneCheck = true;
		}
		// 최종 유효성 검사
		if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&mailCheck&&mailnumCheck&&phoneCheck&&nameCheck){
		 	$("#join_form").submit(); // &&phoneCheck&&nameCheck
        }
	});
    
	// 이메일 인증번호 전송
	$(".btn-warning").click(function(){
		var email = $('#m_email').val();
		var checkBox = $("#email_auth_key");
		var checkBtn = $("#email_auth_btn");
		var warnMsg = $(".mail_input_box_warn");
		
		if(mailFormCheck(email)){
			warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
			warnMsg.css("display","inline-block");
		}else{
			warnMsg.html("올바르지 못한 이메일 형식입니다.");
			warnMsg.css("display","inline-block");
			return false;
		}
		
		$.ajax({
			type : "GET",
			url : "mailCheck?email="+email,
			success : function(data){
				checkBox.attr("disabled",false);
				checkBtn.attr("id","email_auth_btn_true");
			    code = data;
			}
		});
	});
	
	// 인증번호 비교
	$("#email_auth_key").blur(function(){
		var inputCode = $("#email_auth_key").val();  // 입력코드
		var checkResult = $("#mail_check_input_box_warn"); // 비교 결과
	
		if(inputCode == code){
			checkResult.css("color","green");
			checkResult.html("인증번호가 일치합니다.");
			checkResult.attr("class","correct");
			mailnumCheck = true;
		} else{
			checkResult.css("color","red");
			checkResult.html("인증번호를 다시 확인해주세요.");
			checkResult.attr("class","incorrect");
			mailnumCheck = false;
		}
	});
	
	
});

// 아이디 중복검사 - 다빈
$('#m_id').on('input',function(){
	var m_id = $('#m_id').val();
	var data = {m_id : m_id}
	var idRegex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,16}$/; 
	
	if(!idRegex.test(m_id)){
		$('.id_input_re_3').css("display","inline-block");
		$('.id_input_re_1').css("display","none");
		$('.id_input_re_2').css("display", "none");
		idckCheck = false;
		return;
	}
	
	$.ajax({
		url : "/db/memberIdChk",
		type : "post",
		data : data,
		success : function(result){
			if(result != 'fail'){
				$('.id_input_re_1').css("display","inline-block");
				$('.id_input_re_2').css("display", "none");		
				$('.id_input_re_3').css("display","none");
				idckCheck = true;
			} else {
				$('.id_input_re_2').css("display","inline-block");
				$('.id_input_re_1').css("display", "none");
				$('.id_input_re_3').css("display","none");
				idckCheck = false;
			}
		}
	});
});

// 비밀버호 재확인 - 다빈
$("#m_pw2").on('input',function(){
	var pw = $("#m_pw").val();
	var pwck = $("#m_pw2").val();
	var pwRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,16}$/;
	$('.final_pwck_ck').css('display','none');
	
	if(!pwRegex.test(pw)){
		$('.pwck_input_re_3').css("display","inline-block");
		pwCheck = false;
	}else {
		$('.pwck_input_re_3').css("display","none");
		pwCheck = true;
	}
	
	if(pw == pwck){
		$('.pwck_input_re_1').css('display','block');
		$('.pwck_input_re_2').css('display','none');
		pwckcorCheck = true;
	}else{
		$('.pwck_input_re_1').css('display','none');
		$('.pwck_input_re_2').css('display','block');
		pwckcorCheck = false;
	}
});

// 입력 이메일 형식 유효성 검사
function mailFormCheck(email){
   var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	return form.test(email);
}

</script>
                
<%@ include file="../include/footer.jsp" %>