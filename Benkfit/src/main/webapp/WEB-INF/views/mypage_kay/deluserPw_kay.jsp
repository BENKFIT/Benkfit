<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta charset="UTF-8">
<title>비밀번호 확인(회원정보수정)</title>
</head>
<body>
	<%@ include file="../Template/top.jsp"%>
	<div class="wrapper">
		<form action="#" method="post">
			<div class="PW">
				<h2>비밀번호 확인</h2>
				<p>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 확인합니다.
				<p>
				<table id="pwCheck">
					<tr>
						<th>비밀번호를 입력하세요.</th>
					</tr>
					<tr>
						<th><input type="password" required autofocus></th>
						<th><input type="submit" class="btn2 btn2-success" value="확인">
						</th>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<%@ include file="../Template/footer.jsp"%>
</body>
</html>