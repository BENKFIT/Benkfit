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
	<h3>서류목록</h3>
	<br>
	<table class="table table-hover">
        <thead>
			<tr>
				<th>서류 번호</th>
				<th>서류 명</th>
				<th>이름</th>
				<th>서류 날짜</th>
				<th>조회</th>
			</tr>
		 </thead>
		 <tbody>
			<c:forEach var="doc" items="${docu}">
				<tr>
					<td>${doc.doc_num}</td>
					<td>${doc.doc_title}</td>
					<td>${doc.doc_name}</td>
					<td><fmt:formatDate value="${doc.doc_date}" pattern="yyyy.MM.dd"/></td>
					<td> <a class="btn btn-primary eq-ui-waves-light eq-desert-orange-500" onclick="window.location='detaildoc?doc_num=${doc.doc_num}'">조회</a>
				</tr>
			</c:forEach> 
			</tbody>
		</table>
	</div>
	<%@ include file="../Template/footer.jsp"%>
</body>
</html>