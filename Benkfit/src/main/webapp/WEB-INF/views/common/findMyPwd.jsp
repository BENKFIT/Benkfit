<!-- 2019/02/01 손리아 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
   #logindiv1 {
    text-align:center;
  }
  
  #logindiv2 {
    display:inline-block;
    width:30%;
  }
  
  label {
    text-align:left;
  }
  
  #find_result {
    text-align:center;
    font-size:20px;
    margin-top:40px;
    color:#ff0000;
  }
  
  #gotologin {
      text-align:center;
      font-size:20px;
      margin-top:15px;
    } 
    
   #gotologin a {
     text-decoration:none;
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
    	   window.location="pwdEmail?id="+id.value+"&email="+email.value&${_csrf.parameterName}=${_csrf.token};
       }
    }
    
    function gotologin() {
        window.location="login?${_csrf.parameterName}=${_csrf.token}";
      }
</script>
</head>
<body>
<%@ include file ="../Template/top.jsp" %>

<div id="logindiv1">
  <div id="logindiv2">
    
    <form id="login-form" name="findForm" action="" method="post" style="margin-top:250px;">
    
      <div class="row">
         <div class="eq-ui-form-group eq-ui-input-field">
             <h3>비밀번호 찾기</h3>
         </div>
      </div>
      
      <div class="row" style="margin-bottom:20px;">
         <div class="eq-ui-form-group eq-ui-input-field">
            <input id="id" name="id" type="text" class="eq-ui-input">
            <label for="id">아이디</label>
         </div>
      </div>
      
      <div class="row" style="margin-bottom:20px;">
        <div class="eq-ui-form-group eq-ui-input-field">
            <input id="email" name="email" type="email" class="eq-ui-input">
            <label for="email">가입시 등록한 이메일 (예: benkfit@benkfit.com )</label>
        </div>
      </div>
      
      <div class="row" style="margin-top:20px;">
        <input type="button" class="btn btn-default" id="search" name="search" onclick="inputChk();" value="확인" style="background-color:#2D5772; color:#fff;">
        <input type="button" class="btn btn-default" id="cancel" name="cancel" onclick="gotologin();" value="취소" style="background-color:#2D5772; color:#fff;">
      </div>
      
      <div id="find_result"></div>
      <div id="gotologin" style="visibility:hidden">
        <a href="login?${_csrf.parameterName}=${_csrf.token}">로그인하러 가기</a>
      </div>
   </form>
  </div>
</div>  

<%@ include file ="../Template/footer.jsp" %>
</body>
</html>