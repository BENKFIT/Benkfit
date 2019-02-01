<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qrCode</title>
</head>
<body>
<%@ include file="../Template/top.jsp"%>
	<script type="text/javascript">
	</script>
	<div class="wrapper">
		<h2>QRcode 카드발급</h2>
			<hr>
		<table class="table_kay">
			<tr>
				<th>아이디</th>
				<td><input id="m_strid"  class="inputStyle" value="${qrcode.c_id}" disabled></td>
			<tr>
				<th>이름</th>
				<td><input id="m_name"  class="inputStyle" value="${qrcode.c_name}" disabled></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input id="m_phone"  class="inputStyle" value="${qrcode.c_hp}" disabled></td>
			</tr>
			<tr>
				<th colspan="3" id="qr_create">
					<button id="createBtn" class="btn2 btn2-Info">발급</button>
					<button class="btn2 btn2-danger">저장</button>
				</th>
			</tr>
		<!-- 	<tr>
				<th colspan="3">
					<img id="qrcode" src="" />
				</th>
			</tr> -->
		</table>
		<div class>
			<img id="qrcode" src="" />
		</div>
	</div>
	<%@ include file="../Template/footer.jsp"%>
</body>
</html>