<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보수정</title>
</head>
<body>
	<%@ include file="../Template/top.jsp"%>
	<div class="wrapper">
	<h1>파일 업로드</h1>
	<form action="uploadResult" method="post" encType="multipart/form-data"> 
		<table class="table_kay">
			<tr>
			  <c:set var="num" value="1" />
				<th>서류번호</th>
				<td><input type="text" name="doc_num" class="inputStyle" value="${num}"></td>
			  <c:set var="num" value="${num+1}" />
			</tr>
			<tr>
				<th>서류명</th>
				<td><input type="text" class="inputStyle" name="doc_name"></td>
			</tr>
			<tr>
				<th>서류내용</th>
				<td><input type="text" class="inputStyle" name="doc_content"></td>
			</tr>
			<tr>
				<th>서류날짜</th>
				<td><input type="date" class="date_kay" name="doc_date"></td>
			</tr>
			<tr>
				<th>파일업로드</th>
				<td colspan="3">
					<input type="file" id="doc_img" class="btn2 btn2-info" name="doc_img"> 
        			<input type="submit" class="btn2 btn2-success" value="업로드"> 
        			<img src=" " id="preview">
				</td>
			</tr>
        </table>
  </form>
	</div>
	<%@ include file="../Template/footer.jsp"%>
</body>
</html>