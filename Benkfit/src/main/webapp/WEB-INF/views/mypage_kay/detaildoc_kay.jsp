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
		<hr>
		<div class="document">
			<form action="upresult" method="post" name="fileup"
				enctype="multipart/form-data">
				<table class="table_kay">
					<tr>
						<th>서류명</th>
						<td><input type="text" class="inputStyle" value="${vo.doc_title}" id="doc_title">
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" class="inputStyle" value="${vo.doc_name}" id="doc_name" ></td>
					</tr>
					<tr>
						<th>주민번호</th>
						<td><input type="text" class="inputStyle" value="${vo.doc_jumin1}"id="doc_jumin1">
						-	<input type="text" class="inputStyle" value="${vo.doc_jumin2}" id="doc_jumin2" >	
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3"><input type="text" class="inputStyle" value="${vo.doc_perAddress}" id="doc_perAddress"  size="65"></td>
					</tr>
					<tr>
						<th>회사명</th>
						<td><input type="text" class="inputStyle" value="${vo.doc_comName}" id="doc_comName" ></td>
					</tr>
					<tr>
						<th>소속</th>
						<td><input type="text" class="inputStyle" value="${vo.doc_comName}" id="doc_department" >
						</td>
					</tr>
					<tr>
						<th>직위</th>
						<td><input type="text" class="inputStyle" value="${vo.doc_position}" id="doc_position" ></td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3"><input type="text" class="inputStyle" value="${vo.doc_comAddress}" id="doc_comAddress" size="65"></td>
					</tr>
					<tr>
						<th>기간</th>
						<td>
						  <input type="text" class="inputStyle" value="${vo.doc_period_from}" id="doc_period_from" >
						~ <input type="text" class="inputStyle" value="${vo.doc_period_to}" id="doc_period_to" >
						</td>
					</tr>
					<tr>
						<th><input type="button" class="btn2 btn2-success" value="삭제" onclick="location.href='deletedocu?doc_num=${vo.doc_num}';">
						</th>
						<th><input type="button" class="btn2 btn2-success" value="목록"
						onclick="window.location='document'">
						</th>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<%@ include file="../Template/footer.jsp"%>
</body>
</html>