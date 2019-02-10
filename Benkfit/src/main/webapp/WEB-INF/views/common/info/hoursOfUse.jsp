<!-- 송운선 2019-01-21 17:43 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<head>
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
</style>
</head>
<html>
<body>
	<%@ include file="../../Template/top.jsp"%>
	<div style="margin-top: 200px; height: 40%; width: 100%; text-align: center;">
		<div style="display: inline-block; width: 60%;">
			<h2>이용시간안내</h2>
			<br>
			<p style="font-size: 20px;">예금 / 적금</p>
			<table class="table table-hover" style="width: 100%;">
				<thead>
					<tr style="background: #FFD662">
						<th style="width: 50%">구분</th>
						<th style="width: 50%">이용시간</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>각종조회</td>
						<td rowspan="3" style="padding-top: 45px">24시간</td>
					</tr>
					<tr>
						<td>신규</td>
					</tr>
					<tr>
						<td>해지</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<div class="container" style="height: 30%; width: 62%;">
		<br>
		<p style="font-size: 20px;">이체</p>
		<table class="table table-hover">
			<thead>
				<tr style="background: #FFD662">
					<th style="width: 50%">구분</th>
					<th style="width: 50%">이용시간</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>간편이체</td>
					<td rowspan="3" style="padding-top: 45px">24시간</td>
				</tr>
				<tr>
					<td>즉시 이체, 예약이체 (당행 / 타행)</td>
				</tr>
				<tr>
					<td>자동이체 등록 및 해지 (계좌간 자동이체 / 타행 자동이체)</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="container" style="height: 30%; width: 62%;">
		<br>
		<p style="font-size: 20px;">대출</p>
		<table class="table table-hover">
			<thead>
				<tr style="background: #FFD662">
					<th style="width: 50%">구분</th>
					<th style="width: 50%">이용시간</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>대출 신청 / 연장</td>
					<td>매일 06:00 ~ 23:00</td>
				</tr>
				<tr>
					<td>대출 이자납입</td>
					<td rowspan="2" style="padding-top: 27px">24시간</td>
				</tr>
				<tr>
					<td>대출 원금 상환 / 한도해지</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="container" style="height: 35%; width: 62%;">
		<br>
		<p style="font-size: 20px;">카드</p>
		<table class="table table-hover">
			<thead>
				<tr style="background: #FFD662">
					<th style="width: 50%">구분</th>
					<th style="width: 50%">이용시간</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>각종조회</td>
					<td rowspan="3" style="padding-top: 45px">24시간</td>
				</tr>
				<tr>
					<td>카드 신청 / 해지</td>
				</tr>
				<tr>
					<td>카드승인</td>
				</tr>
				<tr>
					<td>한도변경거래</td>
					<td>매일 06:00 ~ 24:00</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div style="height: 40%; width: 100%; text-align: center;">
		<br>
		<p style="font-size: 20px;">외환</p>
		<div style="display: inline-block; width: 61%;">
			<table class="table table-hover">
				<thead>
					<tr style="background: #FFD662">
						<th style="width: 50%">구분</th>
						<th style="width: 50%">이용시간</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>해외 송금 (당발 / 타발송금)</td>
						<td>24시간</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<%@ include file="../../Template/footer.jsp"%>
</body>
</html>