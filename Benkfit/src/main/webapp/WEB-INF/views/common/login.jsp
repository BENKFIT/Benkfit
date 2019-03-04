<!-- 2019/01/31 손리아 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp" %> 

<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
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
  }
  label {
    text-align:left;
  }
  #links {
    margin-top:20px;
  }
  #links a {
    border:0;
  }
</style>
</head>
<body>
<%@ include file ="../Template/top.jsp" %>
<div id="logindiv1">
  <div id="logindiv2">
    <form id="login-form" action="loginPro" method="post" style="margin-top:250px;">
    <div class="row">
       <div class="row">
           <div class="col-md-12">
               <div class="eq-ui-form-group eq-ui-input-field">
                   <h3>로그인</h3>
               </div>
           </div>
       </div>
    </div>
    <div class="row" style="margin-bottom:20px;">
       <div class="row">
           <div class="col-md-12">
               <div class="eq-ui-form-group eq-ui-input-field">
                   <input id="username" name="username" type="text" class="eq-ui-input">
                   <label for="username" data-error="wrong" data-success="right">ID</label>
               </div>
           </div>
       </div>
    </div>
    <div class="row" style="margin-bottom:20px;">
       <div class="row">
           <div class="col-md-12">
               <div class="eq-ui-form-group eq-ui-input-field">
                   <input id="password" name="password" type="password" class="eq-ui-input">
                   <label for="password" data-error="wrong" data-success="right">PASSWORD</label>
               </div>
           </div>
       </div>
    </div>
    <input type="submit" class="btn btn-default" value="로그인" style="background-color:#2D5772; color:#fff; margin-top:5px;">
    <div id="links">
	    <a class="btn btn-default eq-ui-btn-flat eq-ui-waves" href="findMyId">아이디</a> /
	    <a class="btn btn-default eq-ui-btn-flat eq-ui-waves" href="findMyPwd">비밀번호 찾기</a>
	    <a class="btn btn-default eq-ui-btn-flat eq-ui-waves" href="signIn">회원가입</a>
    </div>
   </form>
  </div>
</div>
<%@ include file ="../Template/footer.jsp" %>
</body>
</html>