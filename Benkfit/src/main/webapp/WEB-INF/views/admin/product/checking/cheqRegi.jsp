<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>관리자-예금상품등록</title>
</head>
<body>
	<!-- TOP&SIDE -->
	<%@ include file="../../../Template/top.jsp"%>

	<!-- content -->
	<div style="text-align: center; width: 100%;">
	<div style="display: inline-block; width: 80%">
		<table class="table table-hover" style="margin-top: 200px; height: 20%; width: 100%;">
			<thead>
				<tr>
					<th>예금번호</th>
					<th>예금종류</th>
					<th>예금명</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1913</td>
					<td>정기예금</td>
					<td>실시간 이자로 돈 모으는 재미가 쏠쏠</td>
					<td>john@example.com</td>
				</tr>
			</tbody>
		</table>
		
		<button href="#" class="btn btn-warning">Warning</button>
		</div>
	</div>
	
	<!-- FOOTER  -->
	<%@ include file="../../../Template/footer.jsp"%>
</body>
</html>