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
	<div class="wrapper">
		<h2>QRcode 카드발급</h2>
		<hr>
		<table class="table_kay">
			<tr>
				<th>아이디</th>
				<td><input id="m_strid" value="${qr.c_id}" class="inputStyle"  disabled></td>
			<tr>
				<th>이름</th>
				<td><input id="m_name"  value="${qr.c_name}"class="inputStyle"  disabled></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input id="m_phone" value="${qr.c_hp}" class="inputStyle" disabled>
				<input type="hidden" value="${qr.c_pwd}" id="m_pwd">
				<input type="hidden" id="m_qr" name="m_qr"  value="${qr.c_qr}">
				</td>
			</tr>
			<tr>
				<td colspan="3" class="trBtn">
					<button id="createBtn" class="btn2 btn2-Info">생성</button>
					<button id="saveBtn" class="btn2 btn2-Info">저장</button>
					<form action="qrPro" name="qrCreate" method="post" onsubmit="return create();">
						<input type="hidden" name="hiddenId" value="0">
						<input type="submit" name="OK" class="btn2 btn2-Info" value="목록"
							onclick="qrOk();">
					</form>
				</td>
			</tr>
			<tr>
				<th> qr이미지</th>
				<td><img id="qrcode" src=" " width="300" >	</td>
			</tr>
		</table>
		<div id="previewImage">
		</div>
	</div>
	<%@ include file="../Template/footer.jsp"%>
</body>
</html>