<!-- 2019/02/01 손리아 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인  > 비밀번호 찾기</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="msapplication-tap-highlight" content="no">
<meta name="description" content="Implements Google's Material Design in Bootstrap.">
<!-- CSS-->
<link href="/benkfit/resources/assets/css/exentriq-bootstrap-material-ui.min.css?v=0.4.5" rel="stylesheet">
<link href="/benkfit/resources/assets/css/doc.css?v=0.4.5" rel="stylesheet">
<script src="/benkfit/resources/assets/js/vendor/jquery/dist/jquery.min.js?v=2.1.4"></script>
<script src="/benkfit/resources/assets/js/vendor/moment/min/moment.min.js?v=2.13.0"></script>
<script src="/benkfit/resources/assets/js/vendor/jquery-timeago/jquery.timeago.js?v=1.4.3"></script>
<script src="/benkfit/resources/assets/js/exentriq-bootstrap-material-ui.min.js?v=0.4.5"></script>
<script src="/benkfit/resources/assets/js/tp/tp-color.html" type="riot/tag"></script>
<script src="/benkfit/resources/assets/js/vendor/riot/riot+compiler.min.js?v=2.3.0"></script>
<script src="https://unpkg.com/lodash@4.16.0"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://unpkg.com/vue@2.5.21/dist/vue.js"></script>
<script src="/benkfit/resources/assets/js/doc.js?v=0.4.5"></script>
<script src="/benkfit/resources/assets/js/ctrl/ctrl-color.js"></script>
<script src="/benkfit/resources/assets/js/vue/collapsible.js"></script>
<script src="/benkfit/resources/assets/js/vue/dropdown.js"></script>
<script src="/benkfit/resources/assets/js/vue/tabs.js"></script>
<script>
    (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
    function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
    e=o.createElement(i);r=o.getElementsByTagName(i)[0];
    e.src='//www.google-analytics.com/analytics.js';
    r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
    ga('create','UA-XXXXX-X','auto');ga('send','pageview');
</script>
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
    	   window.location="pwdEmail?id="+id.value+"&email="+email.value;
       }
    }
    
    function gotologin() {
        window.location="login";
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
        <a href="login">로그인하러 가기</a>
      </div>
   </form>
  </div>
</div>  

<%@ include file ="../Template/footer.jsp" %>
</body>
</html>