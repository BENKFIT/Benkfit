<!-- 김아영 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta charset="UTF-8">
<title>계좌해지</title>
<script>
$(document).ready(function() {
	swal("계좌에 잔액이 남아있을 시 해지가 불가능합니다.");
}); 
</script>
</head>
<body >
	<%@ include file="../Template/top.jsp"%>
	<div class="wrapper">
		<form action="account" method="post">
			<div class="PW">
				<h2>비밀번호 확인</h2>
				<p>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 확인합니다.</p>
				<table id="pwCheck">
					<tr>
						<th>해지할  [${account}] 계좌의 비밀번호를 입력하세요.
						<input type="hidden" name="account" value="${account}">
						</th>
					</tr>
					<tr>
						<th>
							<input type="password" class="inputstyle" name="pwd" required autofocus>
						</th>
						<th>
							<input type="submit" class="btn2 btn2-success" value="확인">
						</th>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<%@ include file="../Template/footer.jsp"%>
</body>
</html>