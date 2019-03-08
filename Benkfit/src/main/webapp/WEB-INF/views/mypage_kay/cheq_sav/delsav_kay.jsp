<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title> 마이페이지 > 적금계좌해지</title>
<style>
/* @import url(https://fonts.googleapis.com/css?family=Roboto:300); */
.form {
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 360px;
	margin: 0 auto 100px;
	padding: 45px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
}
.form .message {
	margin: 15px 0 0;
	color: #b3b3b3;
	font-size: 12px;
} 
</style>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>
	 <div class="wrapper">
	 	<div class="login-page">
			<div class="form">
				<h4>계좌해지</h4>
				<br>
				<h6 >해지 할  [${account}] 계좌의 <br>비밀번호를 입력하세요.</h6>
				<br>
				<form action="del_sav?${_csrf.parameterName}=${_csrf.token}" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<p class="message">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 확인합니다.</p>
						<input type="hidden" name="account" value="${account}">
					<div class="row">
						<div class="col-md-12"><br>
							<div class="eq-ui-form-group eq-ui-input-field">
								<input id="password" name="pwd" type="password" class="eq-ui-input" placeholder="비밀번호를 입력하세요" required autofocus>
								<label for="password" style="text-align:left;">Password</label>
							</div>
						</div>
					</div>
					<input type="submit" class="btn btn-primary" value="확인">
				</form>
			</div>
		</div>
	</div>
<script>
$(document).ready(function() {
	swal("적금해지","계좌에 잔액이 남아있을 시 해지가 불가능합니다.","warning");
}); 
</script>
<%@ include file="../../Template/footer.jsp"%>
</body>
</html>