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
	<div style="text-align: center;">
		<!-- 	<div
		style="margin-top: 200px; height: 70%; width: 100%; text-align: center;"> -->
		<div
			style="display: inline-block; width: 60%; height: 70%; margin-top: 200px;">
			<h2>이용 수수료 안내</h2>
			<br>
			<p style="font-size: 20px;">예금 / 적금</p>
			<table class="table table-hover" style="width: 100%;">
				<thead>
					<tr style="background: #FFD662">
						<th colspan="2" style="width: 50%">구분</th>
						<th style="width: 50%">수수료</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td rowspan="7" style="padding-top: 128px">제직 증명서 발급</td>
						<td>예금잔액증명서</td>
						<td>1,000원 (부수당)</td>
					</tr>
					<tr>
						<td>거래내역서</td>
						<td>1,000원 (부수당)</td>
					</tr>
					<tr>
						<td>계좌개설확인서</td>
						<td rowspan="4" style="padding-top: 70px">무료</td>
					</tr>
					<tr>
						<td>이체확인증</td>
					</tr>
					<tr>
						<td>금융소득원천징수내역조회표</td>
					</tr>
					<tr>
						<td>지급조서</td>
					</tr>
					<tr>
						<td>은행조회서</td>
						<td>수신 10,000원 / 여수신 30,000원</td>
					</tr>
					<tr>
						<td>질권설정</td>
						<td></td>
						<td>5,000원 (건당)</td>
					</tr>
					<tr>
						<td>명의변경</td>
						<td></td>
						<td>5,000원 (고객당) - 단, 개인 고객의 개명에 의한 변경시는 면제</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="container" style="height: 40%; width: 62%;">
		<br>
		<p style="font-size: 20px;">이체</p>
		<table class="table table-hover">
			<thead>
				<tr style="background: #FFD662">
					<th style="width: 50%">구분</th>
					<th style="width: 50%">수수료</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>간편이체</td>
					<td>면제</td>
				</tr>
				<tr>
					<td>당행이체</td>
					<td>무료</td>
				</tr>
				<tr>
					<td>타행이체</td>
					<td>면제</td>
				</tr>
				<tr>
					<td>타행 자동이체</td>
					<td>면제</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="container" style="height: 57%; width: 62%;">
		<br>
		<p style="font-size: 20px;">대출</p>
		<table class="table table-hover">
			<thead>
				<tr style="background: #FFD662">
					<th style="width: 50%">구분</th>
					<th style="width: 50%">수수료</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>금융거래확인서</td>
					<td rowspan="2" style="padding-top: 27px">1,000원 (부수당)</td>
				</tr>
				<tr>
					<td>부채증명서</td>
				</tr>
				<tr>
					<td>대출금계산서</td>
					<td rowspan="5" style="padding-top: 90px">무료</td>
				</tr>
				<tr>
					<td>대출이자상환증명서</td>
				</tr>
				<tr>
					<td>연체완납확인서</td>
				</tr>
				<tr>
					<td>대출금완제확인서</td>
				</tr>
				<tr>
					<td>대위변제증명서</td>
				</tr>
				<tr>
					<td>중도상환해약금</td>
					<td>면제</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="container" style="height: 50%; width: 62%;">
		<br>
		<p style="font-size: 20px;">카드</p>
		<table class="table table-hover">
			<thead>
				<tr style="background: #FFD662">
					<th style="width: 50%">구분</th>
					<th style="width: 50%">수수료</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>체크카드 재발급 수수료</td>
					<td>2,000원 (건당)</td>
				</tr>
				<tr>
					<td>해외가맹점 이용 - 해외브랜드 수수료</td>
					<td>1%</td>
				</tr>
				<tr>
					<td>해외가맹점 이용 - 해외이용 수수료</td>
					<td>0.25%</td>
				</tr>
				<tr>
					<td>해외 ATM 현금인출 - 해외브랜드 수수료</td>
					<td>1%</td>
				</tr>
				<tr>
					<td>해외 ATM 현금인출 - 해외이용 수수료</td>
					<td>US $3</td>
				</tr>
				<tr>
					<td>해외 ATM 잔액조회 - 해외브랜드 수수료</td>
					<td>US $0.5</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="container" style="height: 60%; width: 62%;">
		<br>
		<p style="font-size: 20px;">외환</p>
		<table class="table table-hover">
			<thead>
				<tr style="background: #FFD662">
					<th colspan="2" style="width: 25%">구분</th>
					<th style="width: 25%">해외송금 국가</th>
					<th style="width: 25%">해외송금 금액</th>
					<th style="width: 25%">해외송금 수수료</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td rowspan="5" style="padding-top: 86px">헤외계좌송금</td>
					<td rowspan="3" style="padding-top: 47px">당발송금</td>
					<td rowspan="2">미국, 캐나다, 영국, 호주, 싱가포르, 홍콩, 뉴질랜드, 인도, 유럽 11개국</td>
					<td>송금액 미화 5,000불 이하</td>
					<td>5,000원 (건당)</td>
				</tr>
				<tr>
					<td>송금액 미화 5,000불 초과</td>
					<td>10,000원 (건당)</td>
				</tr>
				<tr>
					<td>일본, 필리핀, 태국</td>
					<td>송금액 무관</td>
					<td>8,000원 (건당)</td>
				</tr>
				<tr>
					<td rowspan="2" style="padding-top: 28px">타발송금</td>
					<td rowspan="2" style="padding-top: 28px">-</td>
					<td>송금액 미화 100불 미만</td>
					<td>면제 (2017년 8월 23일부터 시행)</td>
				</tr>
				<tr>
					<td>송금액 미화 100불 이상</td>
					<td>5,000원 (건당)</td>
				</tr>
				<tr>
					<td rowspan="3" style="padding-top: 47px">WU빠른해외송금</td>
					<td rowspan="2" style="padding-top: 28px">타발송금</td>
					<td rowspan="2" style="padding-top: 28px">전세계 200여개국</td>
					<td>송금액 미화 3,000불 이하</td>
					<td>$6</td>
				</tr>
				<tr>
					<td>송금액 미화 3,000불 초과</td>
					<td>$12</td>
				</tr>
				<tr>
					<td>타발송금</td>
					<td>-</td>
					<td>송금액 무관</td>
					<td>해당없음</td>
				</tr>
			</tbody>
		</table>
	</div>

	<%@ include file="../../Template/footer.jsp"%>
</body>
</html>