<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
      var id = document.findForm.id;
      var email = document.findForm.email;
      
      if(id.value == "") {
          alert("이름을 입력해주세요");
          id.focus();
      } else if(email.value == "") {
          alert("이메일을 입력해주세요");
          email.focus();
      } else if(id.value != null && email.value!= null) {
    	   alert("임시 비밀번호를 등록된 이메일로 발송하였습니다.");
    	   window.location="pwdEmail?id="+id.value+"&email="+email.value;
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
                            <h3 class="text-center text-info"><span class="loginspan">비밀번호 찾기</span></h3><br>
                            <div class="form-group">
                                <label for="id" class="text-info"><span class="loginspan">아이디</span></label><br>
                                <input type="text" name="id" id="id" class="form-control" autofocus required>
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
<!-- <form action="" method="post" name="findForm" style="margin-top:200px">

  <div id="result"></div>
  <label for="id">아이디
   <input type="text" id="id" name="id" placeholder="아이디 입력">
  </label>
  
  <label for="email">이메일
    <input type="email" id="email" name="email" placeholder="benkfit@benkfit.com">
  </label>
  
  <button type="button" id="search" name="search" onclick="inputChk();">확인</button>
  
</form>   -->

<%@ include file ="../Template/footer.jsp" %>
</body>
</html>