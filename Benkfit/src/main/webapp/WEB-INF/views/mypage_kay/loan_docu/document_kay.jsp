<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서류 조회</title>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>
	<div class="wrapper">
	<p style="float:right;font-size:12px;">대출관리>내서류>서류목록</p>
	<br>
	<hr>
	<br>
	<table class="table table-hover" >
		<thead style="background-color: #2980b9; color: white;">
			<tr>
				<th>서류 번호</th>
				<th>서류 명</th>
				<th>이름</th>
				<th>서류 날짜</th>
				<th>서류이미지명</th>
				<th style="text-align:right;">조회</th>
			</tr>
		 </thead>
		 <tbody style="background-color:white;">
			<c:forEach var="doc" items="${docu}">
				<tr>
					<td>${doc.doc_num}</td>
					<td>${doc.doc_title}</td>
					<td>${doc.doc_name}</td>
					<td><fmt:formatDate value="${doc.doc_date}" pattern="yyyy.MM.dd"/></td>
					<td>
						<a onclick="openImg('${doc.doc_img}')">${doc.doc_img}</a>
					</td>
					<td  style="text-align:right;"> <button class="btn btn-primary eq-ui-waves-light" onclick="window.location='detaildoc?doc_num=${doc.doc_num}'">조회</button>
				</tr>
			</c:forEach> 
			</tbody>
		</table>
	</div>
	<script>
	 function openImg(img) {
	      imgwin = window.open("", "new", "width=500, height=800, left=600, top=200");
	      imgwin.document.write("<img src=/benkfit/resources/img/doc/"+img+" onclick='self.close()' style='height:750;width:450; cursor:pointer;'>");
	    }
</script>

	<%@ include file="../../Template/footer.jsp"%>
</body>

</html>