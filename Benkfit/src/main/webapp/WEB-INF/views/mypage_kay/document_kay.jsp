<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서류 조회</title>
</head>
<body>
	<%@ include file="../Template/top.jsp"%>
	<div class="wrapper">
		<table class="upinfo">
			<tr>
				<th>서류 번호</th>
				<th>서류 명</th>
				<th>이름</th>
				<th>서류 날짜</th>
				<th>조회</th>
			</tr>
			<c:forEach var="doc" items="${docu}">
				<tr>
					<td><input type="text" id="doc_num" class="inputStyle" value="${doc.doc_num}" disabled></td>
					<td><input type="text" id="doc_title" class="inputStyle"value="${doc.doc_title}" disabled></td>
					<td><input type="text" id="doc_name" class="inputStyle"value="${doc.doc_name}" disabled></td>
					<td><input type="text" id="doc_date" class="inputStyle"value="${doc.doc_date}" disabled></td>
					<td><button class="btn2 btn2-info" onclick="window.location='detaildoc?doc_num=${doc.doc_num}'">조회</button></td>
				</tr>
			</c:forEach> 
		</table>
		<div>
			<img src=" " id="preview">
		</div>
	</div>
	<%@ include file="../Template/footer.jsp"%>
</body>
</html>