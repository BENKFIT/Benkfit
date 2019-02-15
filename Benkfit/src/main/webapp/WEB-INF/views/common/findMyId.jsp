<!-- 19/02/01 손리아 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
    #login {
      height:100%;
      background-color:#ddd;
    }
    
    #login .div class wrapper #login-row #login-column #login-box {
      margin-top: 120px;
      max-width: 600px;
      height: 320px;
      border: 1px solid #31708f;
      background-color: #fff;
      text-align:center;
    }
    
    #login .div class wrapper #login-row #login-column #login-box #login-form {
      padding: 20px; 
    }
    
    #login .div class wrapper #login-row #login-column #login-box #login-form label a {
      margin-top:-20px; 
    }
    
    .loginspan {
      color:#636363;
    }
    
    #reg {
      margin-left:110px;
    }
    
    #find_result, #gotologin {
      text-align:center;
      font-size:20px;
      margin-top:15px;
    }
</style>
<script type="text/javascript">
    function inputChk() {
    	var name = document.findForm.name;
    	var email = document.findForm.email;
    	
    	if(name.value == "") {
	    		alert("이름을 입력해주세요");
	    		name.focus();
    	} else if(email.value == "") {
	    		alert("이메일을 입력해주세요");
	    		email.focus();
    	} else if(name.value != null && email.value!= null) {
    		  $(function() {
	           var name = $("#name").val();
	           var email = $("#email").val();
	           
	           $.ajax({
	             type: "POST",
	             data: "name="+name+"&email="+email,
	             url: "${pageContext.request.contextPath}/findAccount",
	             success: function(data) {
		              if(data == 0) {
		            	     $("#find_result").css("visibility", "visible");
	                     $("#find_result").html("일치하는 정보가 없습니다");
	                     $("#gotologin").css("visibility", "invisible");
		              } else {
		            	     $("#find_result").css("visibility", "visible");
		                   $("#find_result").html("아이디는 " + data + " 입니다."); 
		                   $("#gotologin").css("visibility", "visible");
		              }
	             },
	             error: function() {
	            	  alert("오류")
	             }
	           });
	         }); 
    	 }
    }
</script>
</head>
<body>
<%@ include file ="../Template/top.jsp" %>

<div id="login">
        <h3 class="text-center text-white pt-5"></h3>
        <div class="div class wrapper">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" style="width:70%;">
                    <div id="login-box" class="col-md-12">
                    <form id="login-form" class="form" action="" method="post" name="findForm">
                            <h3 class="text-center text-info"><span class="loginspan">아이디 찾기</span></h3><br>
                            <div class="form-group">
                                <label for="name" class="text-info"><span class="loginspan">이름</span></label><br>
                                <input type="text" name="name" id="name" class="form-control" placeholder="한글 이름 입력" autofocus required>
                            </div>
                            <div class="form-group">
                                <label for="email" class="text-info"><span class="loginspan">가입시 등록한 이메일</span></label><br>
                                <input type="email" name="email" id="email" class="form-control" placeholder="benkfit@benkfit.com" required>
                            </div>
                            <div id="register-link" class="text-center">
                                <button type="button" id="search" name="search" class="btn btn-info btn-md" onclick="inputChk();" style="background-color:#FFD662; border-color:#FFD662; color:#636363">
                                                            확인</button>
                            </div>
                        </form>
                        <div id="find_result"></div>
                        <div id="gotologin" style="visibility:hidden">
											    <a href="login">로그인하러 가기</a>
											  </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
<%@ include file ="../Template/footer.jsp" %>
</body>
</html>