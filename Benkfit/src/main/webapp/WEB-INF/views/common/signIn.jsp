<!-- 2019/01/25 손리아 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title> 고객 > 회원가입</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="http://cdn.materialdesignicons.com/2.1.99/css/materialdesignicons.min.css" rel="stylesheet" />
<style>
  #file {
    opacity:50;
    overflow: hidden;
    background-color:#fff;
    border:0;
    width: 1px; height: 1px;
    padding: 0; 
    margin: -1px;
    clip:rect(0,0,0,0); 
    border: 0;
    box-shadow:0;
  }
  
  #fileAjax {
   font-size:15px;
   padding:2px;
   text-align:center;
  }
  
  #juminBtn {
    position:relative;
    background-color:#ddd;
    border:0; 
    color:#636363; 
    width:20%;
    height:34px; 
    padding:0px 5px;
  }
  
  #signInBtn {
    position:relative;
    background-color:#FFD662;
    border:0px; 
    color:#636363; 
    width:20%;
    height:34px; 
    padding:0px 5px;
    
  }
  
  #file_text {
    width:80%;
    margin-left:10px;
  }
  
  .termsCheckBox {
    float:left;
    margin:0;
    padding:0;
  }
  
  #agreement {
    background-color:#fff;
    border:0;
    color:#2D5772;
    font-weight:bold;
  }
  
  .wrap-loading{ 
    position: fixed;
    left:0;
    right:0;
    top:0;
    bottom:0;
    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000',endColorstr='#20000000');    /* ie */
}

   .wrap-loading div{ /*로딩 이미지*/
       position: fixed;
       top:50%;
       left:50%;
       margin-left: -21px;
       margin-top: -21px;
   }
   
   .display-none{ /*감추기*/
       display:none;
   }
</style>
<script type="text/javascript">
  //파일업로드 버튼 기능
  function selectFile() {
    document.getElementById("file").click();
  } 
  //업로드할 파일명 보이기, 업로드 직후 텍스트 인식 > 이름 & 주민번호 자동입력
  $(function(){ 
    $('#file').change(function(){
      var path = $('#file').val();
      var path2 = path.split("\\");
      var path3 = path2.length;
      var path4 = path2[path3-1];
      $('#file_text').val(path4);
      $.ajax({
          type: 'post',
          data: "file=" + path4,
          url: "${pageContext.request.contextPath}/getText",
          success: function(data) {
            $("#name").val(data.split("/")[0]);
            $("#fileAjax").css("visibility", "visible");
            $("#fileAjax").css("background-color", "#c4daff");
            $("#fileAjax").html("주민번호 뒷자리:"+data.split("/")[1].split("-")[1]);
            $("#name").css("background-color", "#c4daff");
            $("#jumin1").css("background-color", "#c4daff");
            $("#jumin2").css("background-color", "#c4daff");
            $("#jumin1").val(data.split("/")[1].split("-")[0]);
            $("#jumin2").val(data.split("/")[1].split("-")[1]);
            $("#jumin2").click();
          },
          beforeSend:function(xhr){
        	  //비밀번호 인증시, 아래 한 줄 누락시키면 deniedHandler로 이동
              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
              $('.wrap-loading').removeClass('display-none');
          },
          complete:function(){
              $('.wrap-loading').addClass('display-none');
          },
          error: function() {
              alert("오류");
          }
      });
    })
  });
  //정규식 ajax
  $(function() {
    //아이디 체크
    $("#id").keyup(function() { //keyup: 데이터 입력 끝났을때
      var id = $("#id").val(); //입력한 키워드
      var valid = /^[a-z0-9]{1,15}$/;
      
      if(id.length == 0) { //글자수가 0인 경우
        $("#idVal").html("");
      } else {
        $("#idVal").css("visibility", "visible"); //표시
        if(valid.test(id)) {
          $.ajax({
            type: "POST",
            data: "id=" + id,
            url: "${pageContext.request.contextPath}/idCheck", //{컨트롤러}/이동페이지
            success: function(data) { //콜백함수
              //아이디 글자수 제한
              if(id.length < 6) {
                $("#idVal").css("color", "#C64545");
                $("#idVal").html("id는 6~15자 사이여야합니다");
                $("#register").attr('disabled', true);
                $("#register").css('background-color', '#ddd')
              } else {
                //결과 출력
                if(data == 1) { 
                  $("#idVal").css("color", "#C64545");
                  $("#idVal").html("이미 사용중인 아이디입니다. 다른 아이디를 입력해주세요");
                  $("#register").attr('disabled', true);
                  $("#register").css('background-color', '#ddd')
                }
                else {
                  $("#idVal").css("color", "#2D5772");
                  $("#idVal").html("사용 가능한 아이디입니다");
                  $("#register").attr('disabled', false);
                  $("#register").css('background-color', '#FFD662')
                  
                }
              }
            },
            error: function() {
              alert("오류");
            }
          });
        } else {
          $("#idVal").css("color", "#C64545");
          $("#idVal").html("id는 영소문자와 숫자로만 구성가능합니다.");
          $("#register").attr('disabled', true);
          $("#register").css('background-color', '#ddd')
        } 
      }
    })
    
    //비밀번호 유효성 체크
    $("#pwd").keyup(function() { //keyup: 데이터 입력 끝났을때
      var valid = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!#$^&])(?=.*?[0-9]).{8,15}$/;
      var pwd = $("#pwd").val();
      var msg = "비밀번호는 8~15자의 <br/> 영문 대소문자, 숫자, 특수문자(!#$^&)를 모두 포함해야 합니다"
       
      if(pwd.length == 0) {
        $("#pwdVal").html("");
      }
      else {
        if(valid.test(pwd)) { 
          $("#pwdVal").html("");
          $("#register").attr("disabled", false);
          $("#register").css('background-color', '#FFD662')
        } else {
          $("#register").attr('disabled', true);
          $("#register").css('background-color', '#ddd')
          $("#pwdVal").css("visibility", "visible"); //표시
          $.ajax({
            type: "POST",
            data: "msg=" + msg,
            url: "${pageContext.request.contextPath}/signIn", //{컨트롤러}/이동페이지
            success: function(data) { //콜백함수
              //결과 출력
              $("#pwdVal").html(msg);
            },
            error: function() {
              alert("오류");
            }
          });
        }
      }
    })
    
    // 비밀번호 재입력 일치 여부
    $("#repwd").keyup(function() {
      var pwd = $("#pwd").val();
      var repwd = $("#repwd").val();
      var msg = "비밀번호가 일치하지 않습니다."
         
      if(repwd.length == 0) {
        $("#pwdChk").html("");
      } else {
        if(pwd != repwd) { 
          $("#register").attr('disabled', true);
          $("#register").css('background-color', '#ddd')
          $("#pwdChk").css("visibility", "visible"); //표시
          $.ajax({
            type: "POST",
            data: "msg=" + msg,
            url: "${pageContext.request.contextPath}/signIn", //{컨트롤러}/이동페이지
            success: function(data) { //콜백함수
              //결과 출력
              $("#pwdChk").html(msg);
            },
            error: function() {
              alert("오류");
            }
          });
        } else {
          $("#pwdChk").html("");
          $("#register").attr("disabled", false);
          $("#register").css('background-color', '#FFD662')
        }
      }
    })
    
    //이름 유효성 체크
    $("#name").keyup(function() {
      var valid = /^[가-힣]{2,}$/;
      var name = $("#name").val();
      var msg = "이름은 2자 이상의 한글만 입력가능합니다"
       
      if(name.length == 0) {
        $("#nameVal").html("");
      }
      else {
        if(valid.test(name)) { 
          $("#nameVal").html(""); 
          $("#register").attr('disabled', false);
          $("#register").css('background-color', '#FFD662')
        } else {
          $("#register").attr('disabled', true);
          $("#register").css('background-color', '#ddd')
          $("#nameVal").css("visibility", "visible"); //표시
          $.ajax({
            type: "POST",
            data: "msg=" + msg,
            url: "${pageContext.request.contextPath}/signIn", //{컨트롤러}/이동페이지
            success: function(data) { //콜백함수
              //결과 출력
              $("#nameVal").html(msg);
            },
            error: function() {
              alert("오류");
            }
          });
        }
      }
    })
    
    //주민번호 유효성  체크
    $("#jumin2").keyup(function() {
      juminVal();
    })
    
    $("#jumin2").click(function() {
      juminVal();
    })
    
    //휴대폰 번호 유효성 체크
    $("#hp").blur(function() {
      var valid = /^01([016789])([0-9]{7,8})$/;
      var hp = $("#hp").val();
      var msg = "휴대폰 번호가 올바르지 않습니다"
       
      if(hp.length == 0) {
        $("#hpVal").html("");
      }
      else {
        if(valid.test(hp)) { 
          $("#hpVal").html("") //숨김
          $("#register").attr('disabled', false);
          $("#register").css('background-color', '#FFD662')
        } else {
          $("#hpVal").css("visibility", "visible"); //표시
          $("#register").attr('disabled', true);
          $("#register").css('background-color', '#ddd')
          $.ajax({
            type: "POST",
            data: "msg=" + msg,
            url: "${pageContext.request.contextPath}/signIn", //{컨트롤러}/이동페이지
            success: function(data) { //콜백함수
              //결과 출력
              $("#hpVal").html(msg);
            },
            error: function() {
              alert("오류");
            }
          });
        }
      }
    })
    
    //이메일 유효성 체크
    $("#email").blur(function() {
      var valid = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
      var email = $("#email").val();
      var msg = "이메일 형식이 잘못되었습니다"
      
      if(email.length == 0) {
        $("#emailVal").html("");
      }
      else {
        if(valid.test(email)) { 
          $("#emailVal").html("");
          $("#register").attr('disabled', false);
          $("#register").css('background-color', '#FFD662')
        } else {
          $("#emailVal").css("visibility", "visible"); //표시
          $("#register").attr('disabled', true);
          $("#register").css('background-color', '#ddd')
          $.ajax({
            type: "POST",
            data: "msg=" + msg,
            url: "${pageContext.request.contextPath}/signIn", //{컨트롤러}/이동페이지
            success: function(data) { //콜백함수
              //결과 출력
              $("#emailVal").html(msg);
            },
            error: function() {
              alert("오류");
            }
          });
        }
      }
    })
    
    $("#customControlAutosizing").on('change', function(){
      if(document.signIn.hiddenAgree.value == 0) {
        alert("이용약관을 확인해주십시오");
        $("#customControlAutosizing").prop('checked', false);
      } else {
        return true;
      }
    });
  });
  
  // 주민번호 입력칸 자동 이동
  function nextJumin1() {
    if(document.signIn.jumin1.value.length >= 6) {
      document.signIn.jumin2.focus();
    }
  }
  
  // 주민번호 입력완료되면 유효성 검사 실시
  function nextJumin2() {
    if(document.signIn.jumin2.value.length >= 7) {
      //juminVal();
    }
  }
  
  // 주민번호 유효성 검사
  function juminVal() {
    var jumin1 = document.signIn.jumin1.value;
    var jumin2 = document.signIn.jumin2.value;
    var arrNum1 = new Array();  // 주민번호 앞자리숫자 6개를 담을 배열
    var arrNum2 = new Array();  // 주민번호 뒷자리숫자 7개를 담을 배열
       
    // 주민번호 앞자리 배열에 담기
    for (var i=0; i<jumin1.length; i++) {
        arrNum1[i] = jumin1.charAt(i);
    } 

    // 주민번호 뒷자리 배열에 담기
    for (var i=0; i<jumin2.length; i++) {
        arrNum2[i] = jumin2.charAt(i);
    } 

    var tempSum=0;
  
    // 주민번호 앞자리 유효성 검사 방법으로 더하기
    for (var i=0; i<jumin1.length; i++) {
        tempSum += arrNum1[i] * (2+i);
    } 

    // 주민번호 뒷자리 검사 후 앞자리 검사한 것과 더하기
    for (var i=0; i<jumin2.length-1; i++) {
        if(i>=2) {
            tempSum += arrNum2[i] * i;
        }
        else {
            tempSum += arrNum2[i] * (8+i);
        }
    } 
       
    //유효한 주민번호이면 실명인증 버튼 활성화
    if((11-(tempSum%11))%10 != arrNum2[6]) {
        $("#juminVal").html("주민번호가 올바르지 않습니다");
        $("#juminBtn").attr('disabled', true);
        $("#juminBtn").css('background-color', '#ddd')
        
    } else {
        $("#juminVal").html("");
        $("#juminBtn").attr('disabled', false);
        $("#juminBtn").css('background-color', '#FFD662')
        $("#register").attr('disabled', false);
        $("#register").css('background-color', '#FFD662')
    }
  }
  
  //실명인증 버튼 클릭시 서브창
  function juminSub() {
    var jumin = document.signIn.jumin1.value+"-"+document.signIn.jumin2.value;
    
    if(jumin.length != 14) {
      alert("주민번호를 입력해주세요")
    } else {
        var url = "nameCheck?name="+document.signIn.name.value+"&jumin="+jumin;
        window.open(url, "nameCheck", "menubar=no, width=300, height=200, top=300, left=900");
   }
  }

  // 약관 팝업
  function showTerms() {
	  var url = "terms"
	  window.open(url, "terms", "menubar=no, width=600, height=800, top=50, left=300");
  }

  // 회원가입 버튼 클릭시 실행
  function signInCheck() {
    var addr1 = document.signIn.addr1.value;
    
    //실명인증 클릭여부
    if(document.signIn.hiddenJumin.value == 0) {
      alert("실명인증을 실시해주십시오");
      document.signIn.juminBtn.focus();
      return false;
    }
    
    //실명인증 실패시
    if(document.signIn.hiddenJumin.value == 2) {
      alert("실명인증을 완료해주십시오");
      document.signIn.juminBtn.focus();
      return false;
    }
    
    //주소입력 안하면 회원가입 버튼 비활성화
    if(addr1 == "" || addr1 == null) {
      alert("주소를 입력해주세요");
      return false;
    }
    
    //이용약관 동의여부
    if(!document.signIn.tnc.checked || document.signIn.hiddenAgree.value != 1) {
      alert("이용약관에 동의해주십시오");
      document.signIn.customControlAutosizing.focus();
      return false;
    }
  }
</script>
</head>
<body style="background-color:#ddd">
<%@ include file ="../Template/top.jsp" %>
<div class="container2" style="margin-top:150px; margin-bottom:150px;">
  <div class="row">
    <div class="col-lg-4 col-md-4 mx-auto">
    <div class="card">
      <div class="card-body">
      <form action="./signInPro?${_csrf.parameterName}=${_csrf.token}" method="post" name="signIn" enctype="multipart/form-data" onsubmit="return signInCheck();" >
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      <input type="hidden" name="hiddenJumin" value="0">
      <input type="hidden" name="hiddenAgree" value="0">
      <!-- <input type="hidden" name="shaPwd" value=""> -->
      
        <div class="form-group">
        <label>신분증<span class="text-danger">*</span></label>
          <div style="display:flex">
            <button type="button" class="btn btn-success btn-block" id="signInBtn" name="idCardFile" onclick="selectFile();">파일 선택</button>
            <input type="text" class="form-control" id="file_text" name="idCard_text">
          </div>
          <input type="file" class="form-control" id="file" name="idCard" required>
          <div id="fileAjax"></div>
        </div>
      
        <div class="form-group">
        <label for="id">아이디<span class="text-danger">*</span></label>
        <input type="text" class="form-control" id="id" name="id" maxlength=15 placeholder="아이디 입력" onblur="checkId();" required>
        <div id="idVal"></div>    
        </div>
        
        <div class="form-group">
        <label for="pwd">비밀번호<span class="text-danger">*</span></label>
        <input type="password" class="form-control" id="pwd" name="pwd" maxlength=15 placeholder="비밀번호 입력" onkeyup="checkPwd();"required>
        <div id="pwdVal" style="color:#C64545;"></div>
        </div>
        
        <div class="form-group">
        <label for="repwd">비밀번호 확인<span class="text-danger">*</span></label>
        <input type="password" class="form-control" id="repwd" name="repwd" maxlength=15 placeholder="비밀번호 재입력" required>
        <div id="pwdChk" style="color:#C64545;"></div>
        </div>
        
        <div class="form-group">
        <label for="name">이름<span class="text-danger">*</span></label>
        <input type="text" class="form-control" id="name" name="name" placeholder="이름" value="" required>
        <div id="nameVal" style="color:#C64545;"></div>       
        </div>
        
        <div class="form-group">
          <label for="jumin1">주민번호<span class="text-danger">*</span></label> <!-- onkeyup="nextJumin2();" -->
          <div style="display:flex; vertical-align:middle">
            <input type="text" class="form-control" id="jumin1" name="jumin1" maxlength=6 onkeyup="nextJumin1();" placeholder="123456" style="width:38%;" required>
            &nbsp;-&nbsp;
            <input type="password" class="form-control" id="jumin2" name="jumin2" maxlength=7 placeholder="1234567" style="width:38%; margin-right:10px" required>
            <button type="button" class="btn btn-success btn-block" id="juminBtn" name="juminBtn" onclick="juminSub();" disabled>실명인증</button>
          </div>
          <div id="juminVal" style="color:#C64545;"></div>
          <div id="showJumin2"></div>
        </div>
        
        <div class="form-group">
        <label for="hp">휴대전화<span class="text-danger">*</span></label>
        <input type="text" class="form-control" id="hp" name="hp" maxlength=11 placeholder="01012345678" required>
        <div id="hpVal" style="color:#C64545;"></div>
        </div>
        
        <div class="form-group">
        <label for="email">이메일<span class="text-danger">*</span></label>
        <input type="email" class="form-control" id="email" name="email" placeholder="bankfit@example.com" required>
        <div id="emailVal" style="color:#C64545;"></div>
        </div>
         
        <div class="form-group">
        <label for="addr2">주소<span class="text-danger">*</span></label>
          <div style="display:flex">
            <input type="text" class="form-control" name="post" placeholder="우편번호" style="width:40%; margin-right:10px; cursor:default" readonly required>
            <button type="button" class="btn btn-success btn-block" id="signInBtn" onclick="searchPost();">주소 찾기</button>
          </div>
          &nbsp;
          <input type="text" class="form-control" id="addr1" name="addr1" placeholder="주소" style="cursor:default" readonly required>
          &nbsp;
          <input type="text" class="form-control" id="addr2" name="addr2" placeholder="상세주소">
          <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
          <script>
            function searchPost() {
              new daum.Postcode({
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                oncomplete: function(data) {  
                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var fullAddr = ''; // 최종 주소 변수
                    var extraAddr = ''; // 조합형 주소 변수

                    // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                      fullAddr = data.roadAddress;

                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                      fullAddr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                    if(data.userSelectedType === 'R'){
                        //법정동명이 있을 경우 추가한다.
                        if(data.bname !== ''){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있을 경우 추가한다.
                        if(data.buildingName !== ''){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                        fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.signIn.post.value = data.zonecode; //5자리 새우편번호 사용
                    document.signIn.addr1.value = fullAddr;

                    // 커서를 상세주소 필드로 이동한다.
                    document.signIn.addr2.focus();
                }
              }).open();
            }
          </script>
        </div>
      <div class="form-group">
        <div class="custom-control custom-checkbox">
              <input type="checkbox" class="termsCheckBox" id="customControlAutosizing" name="tnc">
                <button type="button" id="agreement" onclick="showTerms();">이용약관</button>동의
          </div>
      </div>
        <button type="submit" class="btn btn-success btn-block" id="register" style="background:#FFD662; border-color:#FFD662; color:#636363">회원가입</button>
      </form>
      </div>
    </div>
    </div>
  </div>
</div>
<!-- 텍스트 인식 로딩중 -->
<div class="wrap-loading display-none">
    <div><img src="/benkfit/resources/img/loading/478 (7).gif"></div>
</div> 
<%@ include file ="../Template/footer.jsp" %>
</body>
</html>