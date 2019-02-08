<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp" %> 

<!DOCTYPE html>
<html>
<head>
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
    
</style>
</head>
<body>
<%@ include file ="../Template/top.jsp" %>
 <div id="login">
        <h3 class="text-center text-white pt-5">Login form</h3>
        <div class="div class wrapper">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="loginPro" method="post">
                            <h2 class="text-center text-info"><span class="loginspan">Login</span></h2><br>
                            <div class="form-group">
                                <label for="username" class="text-info"><span class="loginspan">아이디</span></label><br>
                                <input type="text" name="username" id="username" class="form-control" autofocus required>
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info"><span class="loginspan">비밀번호</span></label><br>
                                <input type="password" name="password" id="password" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>
                                  <a class="text-info" href="findMyId" style="text-decoration:none"><span class="loginspan">아이디</span></a>
                                  /
                                  <a class="text-info" href="findMyPwd" style="text-decoration:none"><span class="loginspan">비밀번호 찾기</span></a>
                                  <a class="text-info" href="signIn" style="text-decoration:none"><span class="loginspan" id="reg">회원가입</span></a>
                                </label>
                                
                            </div>
                            <div id="register-link" class="text-center">
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="로그인" style="background-color:#FFD662; border-color:#FFD662; color:#636363">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%@ include file ="../Template/footer.jsp" %>
</body>
</html>