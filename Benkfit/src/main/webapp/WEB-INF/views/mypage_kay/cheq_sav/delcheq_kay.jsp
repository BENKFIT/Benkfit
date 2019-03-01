<!-- 예금해지 폼  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="msapplication-tap-highlight" content="no">
<meta name="description"
	content="Implements Google's Material Design in Bootstrap.">
<title>계좌해지</title>
<script>
$(document).ready(function() {
	swal("예금해지","계좌에 잔액이 남아있을 시 해지가 불가능합니다.","warning");
}); 
</script>
<style>
/* @import url(https://fonts.googleapis.com/css?family=Roboto:300); */
/* .form {
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
}  */
</style>
<!-- CSS-->
<link
	href="/benkfit/resources/assets/css/exentriq-bootstrap-material-ui.min.css?v=0.4.5"
	rel="stylesheet">
<link href="/benkfit/resources/assets/css/doc.css?v=0.4.5"
	rel="stylesheet">
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>
	<div class="wrapper">
		<div class="login-page">
			<div class="form">
				<h2>계좌해지</h2>
				<br>
				<h6 >해지 할  [${account}] 계좌의 <br>비밀번호를 입력하세요.</h6>
				<br>
				<form action="account" method="post">
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
	<%@ include file="../../common/chatbot.jsp"%>
</body>
<script
	src="/benkfit/resources/assets/js/vendor/jquery/dist/jquery.min.js?v=2.1.4"></script>
<script
	src="/benkfit/resources/assets/js/vendor/moment/min/moment.min.js?v=2.13.0"></script>
<script
	src="/benkfit/resources/assets/js/vendor/jquery-timeago/jquery.timeago.js?v=1.4.3"></script>
<script
	src="/benkfit/resources/assets/js/exentriq-bootstrap-material-ui.min.js?v=0.4.5"></script>

<script src="/benkfit/resources/assets/js/tp/tp-color.html"
	type="riot/tag"></script>
<script
	src="/benkfit/resources/assets/js/vendor/riot/riot+compiler.min.js?v=2.3.0"></script>

<script src="https://unpkg.com/lodash@4.16.0"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://unpkg.com/vue@2.5.21/dist/vue.js"></script>

<script src="/benkfit/resources/assets/js/doc.js?v=0.4.5"></script>
<script src="/benkfit/resources/assets/js/ctrl/ctrl-color.js"></script>
<script src="/benkfit/resources/assets/js/vue/collapsible.js"></script>
<script src="/benkfit/resources/assets/js/vue/dropdown.js"></script>
<script src="/benkfit/resources/assets/js/vue/tabs.js"></script>

</html>