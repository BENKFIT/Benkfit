<!-- 2019/01/31 손리아 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp" %> 

<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
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
    <form id="login-form" action="${pageContext.request.contextPath}/loginPro" method="post" style="margin-top:250px;">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    <div class="row">
       <div class="row">
           <div class="col-md-12">
               <div class="eq-ui-form-group eq-ui-input-field">
                   <h3>로그인</h3>
                   <span style="color:red;">${errMsg}</span>
               </div>
           </div>
       </div>
    </div>
    <div class="row" style="margin-bottom:20px;">
       <div class="row">
           <div class="col-md-12">
               <div class="eq-ui-form-group eq-ui-input-field">
                   <input id="username" name="userid" type="text" class="eq-ui-input">
                   <label for="username" data-error="wrong" data-success="right">ID</label>
               </div>
           </div>
       </div>
    </div>
    <div class="row" style="margin-bottom:20px;">
       <div class="row">
           <div class="col-md-12">
               <div class="eq-ui-form-group eq-ui-input-field">
                   <input id="password" name="passwd" type="password" class="eq-ui-input">
                   <label for="password" data-error="wrong" data-success="right">PASSWORD</label>
               </div>
           </div>
       </div>
    </div>
    <input type="submit" class="btn btn-default" value="로그인" style="background-color:#2D5772; color:#fff; margin-top:5px;">
    <div id="links">
	    <a class="btn btn-default eq-ui-btn-flat eq-ui-waves" href="findMyId?${_csrf.parameterName}=${_csrf.token}">아이디</a> /
	    <a class="btn btn-default eq-ui-btn-flat eq-ui-waves" href="findMyPwd?${_csrf.parameterName}=${_csrf.token}">비밀번호 찾기</a>
	    <a class="btn btn-default eq-ui-btn-flat eq-ui-waves" href="signIn?${_csrf.parameterName}=${_csrf.token}">회원가입</a>
    </div>
   </form>
  </div>
</div>
<%@ include file ="../Template/footer.jsp" %>
</body>
</html>