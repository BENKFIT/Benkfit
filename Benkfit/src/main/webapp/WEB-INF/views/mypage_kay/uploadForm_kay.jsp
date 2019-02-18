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
		<div class="document">
			<h1>파일 업로드</h1>
			<span style="text-align: right;"><P>1</P></span>
			<hr>
			<form action="uploadResult" method="post" name="fileup"
				enctype="multipart/form-data">
				<table class="table_kay">
					<tr>
						<th>서류명</th>
						<td><input type="text" class="inputStyle" name="doc_name"></td>
						<td></td>
					</tr>
					<tr>
						<th>서류내용</th>
						<td><input type="text" class="inputStyle" name="doc_content">
						<input type="hidden" class="inputStyle" value="${imgfile}">
						</td>
						<td></td>
					</tr>
					<tr>
						<th>파일업로드</th>
						<td colspan="3"><input type="file" id="img" 
							class="btn2 btn2-info" name="img"> 
							<input type="submit" class="btn2 btn2-success" id="fileup" value="업로드"
							onchange="javascript:document.getElementById('fileName').value = this.value"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<%@ include file="../Template/footer.jsp"%>
</body>
</html>