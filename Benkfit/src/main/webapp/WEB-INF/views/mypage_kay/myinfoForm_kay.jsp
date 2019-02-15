<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta charset="UTF-8">
<title>회원정보수정-폼</title>
</head>
<body>
	<%@ include file="../Template/top.jsp"%>
		<c:if test="${selCnt != 1}">
		<script>
			alert("비밀번호오류");
			window.location = "myinfoPw";
		</script>
	</c:if>
	<div class="wrapper">
	<form action="myinfoPro" method="post">
		<h2>정보수정</h2>
		<hr>
		<table class="table_kay" >
			<tr>
				<th>id</th>
				<td><input type="text" class="inputStyle"  value="${vo.c_id}" disabled></td>
				<th>고객등급</th>
				<td><input type="text" class="inputStyle" value="${vo.c_level}"  disabled></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" class="inputStyle" id="pwd" name="pwd" required autofocus></td>
				<th>비밀번호 확인</th>
				<td><input type="password" class="inputStyle" id="repwd" name="pwd" required></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" class="inputStyle" name="name"  value="${vo.c_name}" required></td>
				<th>연락처</th>
				<td><input type="text" class="inputStyle" name="hp" value="${vo.c_hp}" required></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text" class="inputStyle" name="post" value="${vo.c_post}" required></td>
				<th>주소</th>
				<td><input type="text" class="inputStyle" name="address" value="${vo.c_address}" required></td>
			</tr>
			<tr>
				<th>주민번호1 + 주민번호2</th>
				<td><input type="text" class="inputStyle" value="${vo.c_jumin1} - ${vo.c_jumin2}" disabled not-allowed></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" class="inputStyle" name="email" value="${vo.c_email}" required></td>
			</tr>
			<tr>
				<th>가입날짜</th>
				<td><input type="text" class="inputStyle" value="${vo.c_regDate}" disabled></td>
			</tr>
			<tr>
				<td colspan="4" style="text-align:center;">
				<input type="submit" class="btn2 btn2-success" value="저장"></td>
			</tr>
		</table>
		</form>
	</div>
	<%@ include file="../Template/footer.jsp"%>
</body>
</html>