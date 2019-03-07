<!-- 송운선 2019-01-21 17:43 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<head>
<title>안내 > 이용 수수료</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
tr>td, tr>th, p {
	text-align: center;
}
.table eq-ui-data-table z-depth-1{
	margin-bottom: 100px;
}
table > thead > tr > th{
	background: #2980B9;
	color: #ffffff;
}
</style>
</head>
<html>
<body>
	<%@ include file="../../Template/top.jsp"%>
	<div style="text-align: center;">
		<div style="display: inline-block; width: 60%; height: 62%; margin-top: 200px;">
		<span style="float: right;">이용안내 > 예금/적금</span>
			<table class="table eq-ui-data-table z-depth-1">
				<thead>
					<tr>
						<th colspan="2" style="width: 50%; color: #ffffff; text-align: center;">구분</th>
						<th style="width: 50%; color: #ffffff; text-align: center;">수수료</th>
					</tr>
				</thead>
				<tbody >
					<tr>
						<td rowspan="7" style="padding-top: 157px; text-align: center;">제직 증명서 발급</td>
						<td style="text-align: center;">예금잔액증명서</td>
						<td style="text-align: center;">1,000원 (부수당)</td>
					</tr>
					<tr>
						<td style="text-align: center;">거래내역서</td>
						<td style="text-align: center;">1,000원 (부수당)</td>
					</tr>
					<tr>
						<td style="text-align: center;">계좌개설확인서</td>
						<td rowspan="4" style="padding-top: 83px; text-align: center;">무료</td>
					</tr>
					<tr>
						<td style="text-align: center;">이체확인증</td>
					</tr>
					<tr>
						<td style="text-align: center;">금융소득원천징수내역조회표</td>
					</tr>
					<tr>
						<td style="text-align: center;">지급조서</td>
					</tr>
					<tr>
						<td style="text-align: center;">은행조회서</td>
						<td style="text-align: center;">수신 10,000원 / 여수신 30,000원</td>
					</tr>
					<tr>
						<td style="text-align: center;">질권설정</td>
						<td style="text-align: center;"></td>
						<td style="text-align: center;">5,000원 (건당)</td>
					</tr>
					<tr>
						<td style="text-align: center;">명의변경</td>
						<td style="text-align: center;"></td>
						<td style="text-align: center;">5,000원 (고객당) - 단, 개인 고객의 개명에 의한 변경시는 면제</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="container" style="height: 40%; width: 62%;">
		<br>
		<span style="float: right;">이용안내 > 이체</span>
		<table class="table eq-ui-data-table z-depth-1">
			<thead>
				<tr>
					<th style="width: 50%; color: #ffffff; text-align: center;">구분</th>
					<th style="width: 50%; color: #ffffff; text-align: center;">수수료</th>
				</tr>
			</thead>
			<tbody >
				<tr>
					<td style="text-align: center;">간편이체</td>
					<td style="text-align: center;">면제</td>
				</tr>
				<tr>
					<td style="text-align: center;">당행이체</td>
					<td style="text-align: center;">무료</td>
				</tr>
				<tr>
					<td style="text-align: center;">타행이체</td>
					<td style="text-align: center;">면제</td>
				</tr>
				<tr>
					<td style="text-align: center;">타행 자동이체</td>
					<td style="text-align: center;">면제</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="container" style="height: 57%; width: 62%;">
		<br>
		<span style="float: right;">이용안내 > 대출</span>
		<table class="table eq-ui-data-table z-depth-1">
			<thead>
				<tr>
					<th style="width: 50%; color: #ffffff; text-align: center;">구분</th>
					<th style="width: 50%; color: #ffffff; text-align: center;">수수료</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="text-align: center;">금융거래확인서</td>
					<td rowspan="2" style="padding-top: 27px; text-align: center;">1,000원 (부수당)</td>
				</tr>
				<tr>
					<td style="text-align: center;">부채증명서</td>
				</tr>
				<tr>
					<td style="text-align: center;">대출금계산서</td>
					<td rowspan="5" style="padding-top: 107px; text-align: center;">무료</td>
				</tr>
				<tr>
					<td style="text-align: center;">대출이자상환증명서</td>
				</tr>
				<tr>
					<td style="text-align: center;">연체완납확인서</td>
				</tr>
				<tr>
					<td style="text-align: center;">대출금완제확인서</td>
				</tr>
				<tr>
					<td style="text-align: center;">대위변제증명서</td>
				</tr>
				<tr>
					<td style="text-align: center;">중도상환해약금</td>
					<td style="text-align: center;">면제</td>
				</tr>
			</tbody>
		</table>
	</div>

	<%@ include file="../../Template/footer.jsp"%>
</body>
</html>