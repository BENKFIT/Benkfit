<!-- 2019/01/31 손리아 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp" %> 

<!DOCTYPE html>
<html>
<head>
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
    /* text-align:center; */
    display:inline-block;
  }
  
  label {
    text-align:left;
  }
  
  #links {
    margin-top:10px;
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
    
    <form id="login-form" action="loginPro" method="post" style="margin-top:300px;">
    
    <div class="row">
            <div class="row">
                <div class="col-md-12">
                    <div class="eq-ui-form-group eq-ui-input-field">
                        <input id="username" name="username" type="text" class="eq-ui-input">
                        <label for="username" data-error="wrong" data-success="right">ID</label>
                    </div>
                </div>
            </div>
    </div>
    <div class="row">
            <div class="row">
                <div class="col-md-12">
                    <div class="eq-ui-form-group eq-ui-input-field">
                        <input id="password" name="password" type="password" class="eq-ui-input">
                        <label for="password" data-error="wrong" data-success="right">PASSWORD</label>
                    </div>
                </div>
            </div>
    </div>
    <input type="submit" class="btn btn-default" value="로그인" style="background-color:#2D5772; color:#fff">
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