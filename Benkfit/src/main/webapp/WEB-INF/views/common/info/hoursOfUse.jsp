<!-- 송운선 2019-01-21 17:43 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<head>
<<<<<<< HEAD
<title>안내 > 이용시간</title>
=======
<title> 안내 > 이용시간안내</title>
>>>>>>> branch 'master' of https://github.com/BENKFIT/benkfit.git
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
td, tr>th, p {
	text-align: center;
}
.table eq-ui-data-table z-depth-1{
	margin-bottom: 100px;
}
thead > tr{
	background: #2980B9;
}
</style>
</head>
<html>
<body>
	<%@ include file="../../Template/top.jsp"%>
	<div style="margin: 200px 0px; text-align: center;">
		<div style="display: inline-block; width: 60%;">
<<<<<<< HEAD
			<span style="float: right;">이용안내 > 예금/적금</span>
=======
			<span class="style">이용안내 > 예금/적금</span>
>>>>>>> branch 'master' of https://github.com/BENKFIT/benkfit.git
			<table class="table eq-ui-data-table z-depth-1">
				<thead>
					<tr>
						<th style="text-align: center; color: #ffffff; width: 50%">구분</th>
						<th style="text-align: center; color: #ffffff; width: 50%">이용시간</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="text-align: center;">각종조회</td>
						<td rowspan="3" style="padding-top: 60px; text-align: center;">24시간</td>
					</tr>
					<tr>
						<td style="text-align: center;">신규</td>
					</tr>
					<tr>
						<td style="text-align: center;">해지</td>
					</tr>
				</tbody>
			</table>

<<<<<<< HEAD
			<div style="margin: 100px 0px; text-align: center;">
			<span style="float: right;">이용안내 > 이체</span>
=======
			<span class="style">이용안내 > 이체</span>
>>>>>>> branch 'master' of https://github.com/BENKFIT/benkfit.git
			<table class="table eq-ui-data-table z-depth-1">
				<thead>
					<tr>
						<th style="width: 50%; color: #ffffff; text-align: center;">구분</th>
						<th style="width: 50%; color: #ffffff; text-align: center;">이용시간</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="text-align: center;">간편이체</td>
						<td rowspan="3" style="padding-top: 60px; text-align: center;">24시간</td>
					</tr>
					<tr>
						<td style="text-align: center;">즉시 이체, 예약이체 (당행 / 타행)</td>
					</tr>
					<tr>
						<td style="text-align: center;">자동이체 등록 및 해지 (계좌간 자동이체 / 타행 자동이체)</td>
					</tr>
				</tbody>
			</table>
		</div>

<<<<<<< HEAD
			<span style="float: right;">이용안내 > 대출</span>
=======
			<span class="style">이용안내 > 대출</span>
>>>>>>> branch 'master' of https://github.com/BENKFIT/benkfit.git
			<table class="table eq-ui-data-table z-depth-1">
				<thead>
					<tr>
						<th style="width: 50%; color: #ffffff; text-align: center;">구분</th>
						<th style="width: 50%; color: #ffffff; text-align: center;">이용시간</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="text-align: center;">대출 이자납입</td>
						<td rowspan="3" style="padding-top: 30px; text-align: center;">24시간</td>
					</tr>
					<tr>
						<td style="text-align: center;">대출 원금 상환 / 한도해지</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<%@ include file="../../Template/footer.jsp"%>
</body>
</html>