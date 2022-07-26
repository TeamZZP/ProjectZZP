<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<script type="text/javascript">
    $(document).ready(function(){
//form 서브밋//전체 값 미입력 시 submit X
 $("form").submit(function() {
 	var userid = $("#userid").val();
 	var passwd = $("#passwd").val();
 	var passwd2 = $("#passwd2").val();
	var username = $("#username").val();
	var email1 = $("#email1").val();
	var email2 = $("#email2").val();
	var phone = $("#phone").val();
	var sample4_postcode = $("#sample4_postcode").val();
	var sample4_roadAddress = $("#sample4_roadAddress").val();
	var sample4_jibunAddress = $("#sample4_jibunAddress").val();
	
	//아이디 유효성 검사
	var idChk = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,12}$/; 
	if (!idChk.test(userid)) {
		alert("아이디를 형식에 맞게 입력해주세요 :)");
		$("#userid").val("");
		$("#userid").focus();
		event.preventDefault();
	}
	
	//비밀번호 유효성 검사
	var pwChk = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-_])(?=.*[0-9]).{8,25}$/;
	if (!pwChk.test(passwd)) {
		alert("비밀번호를 형식에 맞게 입력해주세요 :)");
		$("#passwd").val("");
		$("#passwd").focus();
		event.preventDefault();
	}
	
	//이름 유효성 검사
	var nameChk = /^(?=.*[가-힣a-zA-Z]).{2,30}$/;
	if (!nameChk.test(username)) {
		alert("이름을 확인해주세요 :)");
		$("#username").val("");
		$("#username").focus();
		event.preventDefault();
	}
	
	//전화번호 유효성 검사
	var numChk = /^[0-9]*.{11}$/; 
	if (!numChk.test(phone)) {
		alert("전화번호를 형식에 맞게 입력해주세요 :)");
		$("#phone").val("");
		$("#phone").focus();
		event.preventDefault();
	}
	
	else if (userid.length==0) {
		alert("아이디를 입력해주세요 :)");
		$("#userid").focus();
		event.preventDefault();
	} else if (passwd.length==0) {
		alert("비밀번호를 입력해주세요 :)");
		$("#passwd").focus();
		event.preventDefault();
	} else if (passwd2.length==0) {
		alert("비밀번호를 확인해주세요 :)");
		$("#passwd2").focus();
		event.preventDefault();
	}  else if (username.length==0) {
		alert("이름을 입력해주세요 :)");
		$("#username").focus();
		event.preventDefault();
	} else if (email1.length==0 || email2.length==0) {
		alert("이메일을 입력해주세요 :)");
		$("#email1").focus();
		event.preventDefault();
	} else if (phone.length==0) {
		alert("전화번호를 입력해주세요 :)");
		$("#phone").focus();
		event.preventDefault();
	} else if (sample4_postcode.length==0||sample4_roadAddress.length==0||sample4_jibunAddress.length==0) {
		alert("주소를 입력해주세요 :)");
		$("#sample4_postcode").focus();
		event.preventDefault();
	}
 	
 	
 });
	
//비번확인//키 이벤트 발생시 패스워드 일치여부 검사 
 $("#passwd2").keyup(function() {
	 var mesg = "비밀번호 불일치";
	 if ($("#passwd").val()==this.value) {
		mesg = "비밀번호 일치";
	}
	 $("#result3").text(mesg);
 });

//이메일 선택 시 값 입력
$("#emailSel").change(function() {
	$("#email2").val(this.value);
});

//아이디 중복 검사
$("#idCheck").click(function() {
	event.preventDefault();
	var popupX = (window.screen.width / 2) - (200 / 2);
	var popupY= (window.screen.height / 4) - (300 / 2);
	window.open("member/idCheckForm.jsp","",'status=no, height=200, width=600, left='+ popupX + ', top='+ popupY);
	
});

//아이디 중복 or 비밀번호 불일치 시 로그인 불가
$("#addMember").click(function() {
	var mesg = $("#result").text();
	var mesg2 = $("#result2").text();
	if (mesg=="중복된 아이디입니다 :(") {
		alert("아이디를 확인해주세요")
		event.preventDefault();
	}
	if (mesg2=="비밀번호 불일치") {
		alert("비밀번호가 일치하지 않습니다 :(")
		event.preventDefault();
	};
});
	
});

</script>    
<div class="container">
<div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header" style="text-align: center; font-weight: bold; font-size: x-large;">ZZP 회원가입</div>
                            <div class="card-body">
                                <form class="form-horizontal" method="post" action="MemberAddServlet">
                                	<!-- 아이디 -->
                                    <div class="form-group">
                                        <label for="userid" class="cols-sm-2 control-label" style="font-weight: bold;">아이디</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                                <input type="text" class="form-control" name="userid" id="userid" placeholder="영문자와 숫자로 이루어진 4~12자리를 입력하세요" />
                                                <button id="idCheck" class="btn btn-outline-success">중복확인</button>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 비밀번호 -->
                                     <div class="form-group">
                                        <label for="passwd" class="cols-sm-2 control-label" style="font-weight: bold;">비밀번호</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                <input type="password" class="form-control" name="passwd" id="passwd" placeholder="영문자,숫자,특수문자를 포함하여 8~25자리를 입력하세요" />
                                                <span id="result2" style="color: red;"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="passwd2" class="cols-sm-2 control-label" style="font-weight: bold;">비밀번호 확인</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                <input type="password" class="form-control" name="passwd2" id="passwd2" placeholder="다시 한번 입력하세요" />
                                                <span id="result3" style="color: red;"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 이름 -->
                                    <div class="form-group">
                                        <label for="username" class="cols-sm-2 control-label" style="font-weight: bold;">이름</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                                <input type="text" class="form-control" name="username" id="username" placeholder="이름을 입력하세요" />
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 이메일 -->
                                   	<div class="form-group">
                   					   <label for="type" class="col-sm-3 control-label" style="font-weight: bold;">이메일</label>
                   					  <div class="row g-3">
									  <div class="col-sm-4">
									    <input type="text" name="email1" id="email1" class="form-control">
									  </div>
									  <div class="col-sm-4">
									    <div class="input-group">
									      <div class="input-group-text">@</div>
									      <input type="text" name="email2"  placeholder="직접입력" id="email2" class="form-control">
									    </div>
									  </div>
									  <div class="col-sm-4">
									   <div class="col-sm">
									    <label class="visually-hidden" for="autoSizingSelect">Preference</label>
									    <select id="emailSel" class="form-select" aria-label="Default select example">
                            				<option value="" selected disabled hidden>이메일선택</option>
									        <option value="daum.net">daum.net</option>
									        <option value="naver.com">naver.com</option>
									        <option value="google.com">google.com</option>
					            		</select>
									  </div>
									</div>
									</div>
								  </div>
                         		    <!-- 전화번호 -->
                                    <div class="form-group">
                                        <label for="number" class="cols-sm-2 control-label" style="font-weight: bold;">전화번호</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                                <input type="text" class="form-control" name="phone" id="phone" placeholder="- 없이 입력하세요" />
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 주소 -->
                                    <div class="form-group">
                                        <label for="address" class="cols-sm-2 control-label" style="font-weight: bold;">주소</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                            	<input type="text" name="post_num" id="sample4_postcode" placeholder="우편번호" class="form-control">
												<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-outline-success"><br>
                                            </div>
                                            <div class="row g-3" style="margin-top: -10px;">
                                            	<div class="col-md-6">
                      								<input type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명주소" class="form-control">
                      						 	</div>
                      						 	<div class="col-md-6">
													<input type="text" name="addr2" id="sample4_jibunAddress" placeholder="지번주소" class="form-control">
												<span id="guide" style="color:#999"></span>    
												</div>                  
                                            </div>
                                        </div>
                                    </div>
                                    <!--  -->
                                    <div class="form-group" style="margin-top: 10px; text-align: center;">
                                        <input type="submit" value="회원가입" id="addMember" class="btn btn-success">
										<input type="reset" value="취소" class="btn btn-success">
                                    </div>
                                   <!--  <div class="login-register">
                                    </div> -->
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>