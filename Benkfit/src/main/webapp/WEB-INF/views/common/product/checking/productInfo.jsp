<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1./js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>예/적금상품안내</title>
<style type="text/css">
td {
	color: white;
}

summary {
	font-size: 20px;
}

details td {
	color: black;
}

.periodBox {
	color: black;
	border-radius: 5px;
	margin: 10px 0px;
}

#joinBtn1 {
	color: white;
	border: 1px solid white;
	background-color: #C64545;
	border-radius: 5px;
	width: 200px;
	font-size: 20px;
}
#joinBtn2 {
	color: white;
	border: 1px solid white;
	background-color: #2D5772;
	border-radius: 5px;
	width: 200px;
	font-size: 20px;
}
#joinBtn3 {
	color: white;
	border: 1px solid white;
	background-color: #1AA85C;
	border-radius: 5px;
	width: 200px;
	font-size: 20px;
}

.infoTbl {
	display: inline;
	margin: 0px 20px;
}
.div1{
	height: 500px; 
	background: rgba(0, 0, 0, 0.1); 
	text-align: center;
}
.div1-1{
	display: inline-block; 
	margin: 200px;
}
.div2{
	height: 500px; 
	text-align: center;
}
.div2-1{
	display: inline-block; 
	margin: 200px;
}
.div3{
	 height: 500px; 
	 background: rgba(0, 0, 0, 0.1); 
	 text-align: center;
}
.div3-1{
	display: inline-block; 
	margin: 200px;
}
.div4{
	text-align: center;
	width: 100%;
}
.div4-1{
	display: inline-block; 
	margin: 100px 0px 200px 0px;
}
p{
	font-size: 30px;
}
</style>
</head>
<body>
	<!-- TOP&SIDE -->
	<%@ include file="../../../Template/top.jsp"%>

	<c:if test="${kind == '1'}">
		<div
			style="text-align: center; background-color: #C64545; width: 100%; height: 60%;">
			<div style="display: inline-block; margin-top: 200px;">
				<table style="text-align: center;">
					<tr>
						<td>입출금통장</td>
					</tr>
					<tr>
						<td style="font-size: 50px;">까다로운 계좌 개설도</td>
					</tr>
					<tr>
						<td style="font-size: 50px;">정말 손쉽게</td>
					</tr>
				</table>
				<br /> <br />
				<table class="infoTbl">
					<tr>
						<td style="border-right: 1px solid white; padding: 5px 10px;">최소</td>
						<td style="padding: 5px 10px;">1년 기준(세전)</td>
					</tr>
					<tr>
						<td style="border-right: 1px solid white; padding: 5px 10px;">1개월부터</td>
						<td style="padding: 5px 10px;">연 2.50%</td>
					</tr>
				</table>
				<table class="infoTbl">
					<tr>
						<td style="text-align: center;"><select name="period" class="periodBox">
								<option value="6">6개월</option>
								<option value="12">12개월</option>
								<option value="18">18개월</option>
								<option value="24">24개월</option>
								<option value="36">36개월</option>
						</select></td>
					</tr>
					<tr>
						<td><input type="button" value="가입하기" id="joinBtn1">
						</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="div1">
			<div class="div1-1">
				<p>누구나 쉽고 스마트하게</p>
			</div>
		</div>

		<div class="div2" >
			<div class="div2-1">
				<p>또 하나의 공간 세이프 박스</p>
			</div>
		</div>

		<div class="div3">
			<div class="div3-1">
				<p>이체는 더욱 간편하게</p>
			</div>
		</div>

		<div class="div4">
			<div class="div4-1">
				<details>
					<summary>상품안내</summary>
					<table>
						<tr>
							<th>가입대상</th>
						</tr>
						<tr>
							<td>실명의 개인</td>
						</tr>
						<tr>
							<td>주민등록증 또는 운전면허증을 소지한 만 17세 이상 내국인</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>예금종류</th>
						</tr>
						<tr>
							<td>보통예금</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>저축금액</th>
						</tr>
						<tr>
							<td>제한없음</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>계약기간</th>
						</tr>
						<tr>
							<td>제한없음</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>예금자보호대상</th>
						</tr>
						<tr>
							<td>1인당 최고 5천만원이며, 초과하는 나머지금액은 보호하지 않습니다.</td>
						</tr>
					</table>
				</details>
			</div>
		</div>
	</c:if>
	<c:if test="${kind == '2'}">
		<!-- #2D5772 -->
		<div
			style="text-align: center; background-color: #2D5772; width: 100%; height: 60%;">
			<div style="display: inline-block; margin-top: 200px;">
				<table style="text-align: center;">
					<tr>
						<td>자유적금</td>
					</tr>
					<tr>
						<td style="font-size: 50px;">매일, 매주, 매월</td>
					</tr>
					<tr>
						<td style="font-size: 50px;">26주적금도 자유롭게</td>
					</tr>
				</table>
				<br /> <br />
				<table class="infoTbl">
					<tr>
						<td style="border-right: 1px solid white; padding: 5px 10px;">1년기준</td>
						<td style="padding: 5px 10px;">연2.50%</td>
					</tr>
					<tr>
						<td style="border-right: 1px solid white; padding: 5px 10px;">자동이체
							시</td>
						<td style="padding: 5px 10px;">+연 0.20%</td>
					</tr>
				</table>
				<table class="infoTbl">
					<tr>
						<td style="text-align: center;"><select name="period" class="periodBox">
								<option value="6">6개월</option>
								<option value="12">12개월</option>
								<option value="18">18개월</option>
								<option value="24">24개월</option>
								<option value="36">36개월</option>
						</select></td>
					</tr>
					<tr>
						<td><input type="button" value="가입하기" id="joinBtn2">
						</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="div1">
			<div class="div1-1">
				<p>누구나 쉽고 스마트하게</p>
			</div>
		</div>

		<div class="div2">
			<div class="div2-1">
				<p>또 하나의 공간 세이프 박스</p>
			</div>
		</div>

		<div class="div3">
			<div class="div3-1">
				<p>이체는 더욱 간편하게</p>
			</div>
		</div>

		<div class="div4">
			<div class="div4-1">
				<details>
					<summary>상품안내</summary>
					<table>
						<tr>
							<th>가입대상</th>
						</tr>
						<tr>
							<td>실명의 개인</td>
						</tr>
						<tr>
							<td>주민등록증 또는 운전면허증을 소지한 만 17세 이상 내국인</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>예금종류</th>
						</tr>
						<tr>
							<td>정기적금</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>저축금액</th>
						</tr>
						<tr>
							<td>1천원~300만원</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>계약기간</th>
						</tr>
						<tr>
							<td>6개월~36개월</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>예금자보호대상</th>
						</tr>
						<tr>
							<td>1인당 최고 5천만원이며, 초과하는 나머지금액은 보호하지 않습니다.</td>
						</tr>
					</table>
				</details>
			</div>
		</div>
	</c:if>
	<c:if test="${kind == '3'}">
		<!-- #1AA85C -->
		<div
			style="text-align: center; background-color: #1AA85C; width: 100%; height: 60%;">
			<div style="display: inline-block; margin-top: 200px;">
				<table style="text-align: center;">
					<tr>
						<td>정기예금</td>
					</tr>
					<tr>
						<td style="font-size: 50px;">실시간 이자로</td>
					</tr>
					<tr>
						<td style="font-size: 50px;">돈 모으는 재미가 쏠쏠</td>
					</tr>
				</table>
				<br /> <br />
				<table class="infoTbl">
					<tr>
						<td style="border-right: 1px solid white; padding: 5px 10px;">최소</td>
						<td style="padding: 5px 10px;">1개월</td>
					</tr>
					<tr>
						<td style="border-right: 1px solid white; padding: 5px 10px;">1개월부터</td>
						<td style="padding: 5px 10px;">연 2.50%</td>
					</tr>
				</table>
				<table class="infoTbl">
					<tr>
						<td style="text-align: center;"><select name="period" class="periodBox">
								<option value="6">6개월</option>
								<option value="12">12개월</option>
								<option value="18">18개월</option>
								<option value="24">24개월</option>
								<option value="36">36개월</option>
						</select></td>
					</tr>
					<tr>
						<td><input type="button" value="가입하기" id="joinBtn3">
						</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="div1">
			<div class="div1-1">
				<p>누구나 쉽고 스마트하게</p>
			</div>
		</div>

		<div class="div2">
			<div class="div2-1">
				<p>또 하나의 공간 세이프 박스</p>
			</div>
		</div>

		<div class="div3">
			<div class="div3-1">
				<p>이체는 더욱 간편하게</p>
			</div>
		</div>

		<div class="div4">
			<div class="div4-1">
				<details>
					<summary>상품안내</summary>
					<table>
						<tr>
							<th>가입대상</th>
						</tr>
						<tr>
							<td>실명의 개인</td>
						</tr>
						<tr>
							<td>주민등록증 또는 운전면허증을 소지한 만 17세 이상 내국인</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>예금종류</th>
						</tr>
						<tr>
							<td>정기예금</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>저축금액</th>
						</tr>
						<tr>
							<td>100만원~제한없음</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>계약기간</th>
						</tr>
						<tr>
							<td>1개월~36개월</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>예금자보호대상</th>
						</tr>
						<tr>
							<td>1인당 최고 5천만원이며, 초과하는 나머지금액은 보호하지 않습니다.</td>
						</tr>
					</table>
				</details>
			</div>
		</div>
	</c:if>


	<!-- FOOTER  -->
	<%@ include file="../../../Template/footer.jsp"%>
</body>
</html>