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
				<th>서류 내용</th>
				<th>서류 날짜</th>
			</tr>
			<c:forEach var="doc" items="${docu}">
				<tr>
					<td><input type="text" class=""value="${doc.doc_num}" disabled></td>
					<td><input type="text" 	value="${doc.doc_name}" disabled></td>
					<td><input type="text" value="${doc.doc_content}" disabled></td>
					<td><input type="text" value="${doc.doc_date}" disabled></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<%@ include file="../Template/footer.jsp"%>
</body>
</html>