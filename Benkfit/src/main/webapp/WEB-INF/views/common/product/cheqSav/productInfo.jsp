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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="msapplication-tap-highlight" content="no">
    <meta name="description" content="Implements Google's Material Design in Bootstrap.">
     <link href="/benkfit/resources/assets/css/exentriq-bootstrap-material-ui.min.css?v=0.4.5" rel="stylesheet">
    <link href="/benkfit/resources/assets/css/doc.css?v=0.4.5" rel="stylesheet">
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
	margin: 10px 5px;
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
	margin: 10px 0px;
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

.div1 {
	height: 500px;
	background: rgba(0, 0, 0, 0.1);
	text-align: center;
}

.div1-1 {
	display: inline-block;
	margin: 200px;
}

.div2 {
	height: 500px;
	text-align: center;
}

.div2-1 {
	display: inline-block;
	margin: 200px;
}

.div3 {
	height: 500px;
	background: rgba(0, 0, 0, 0.1);
	text-align: center;
}

.div3-1 {
	display: inline-block;
	margin: 200px;
}

.div4 {
	text-align: center;
	width: 100%;
}

.div4-1 {
	display: inline-block;
	margin: 100px 0px 200px 0px;
}

p {
	font-size: 30px;
}

.limit {
	width: 120px;
	border-radius: 5px;
	margin: 10px 5px;
}

.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
#cheqModal td, #savModal td{
	color: black;
}
</style>
</head>
<body>
	<!-- TOP&SIDE -->
	<%@ include file="../../../Template/top.jsp"%>
	<c:if test="${type == 'cheq'}">
		<div style="text-align: center; background-color: #C64545; width: 100%; height: 60%;">
			<div style="display: inline-block; margin-top: 200px;">
				<table style="text-align: center;">
					<tr>
						<td>${info.cheq_type}</td>
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
							<td style="padding: 5px 10px;">연 ${info.cheq_rate} %</td>
						</tr>
					</table>
					<table class="infoTbl">
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
								<sec:authorize access="isAnonymous()">
									<button type="button" class="btn btn-primary"
									style="color: white; border: 1px solid white; background-color: #C64545; border-radius: 5px; width: 200px; font-size: 20px;"
									data-toggle="modal" data-target="#loginFail">가입하기</button>
								</sec:authorize>
								<sec:authorize access="isAuthenticated()">
									<button type="button" class="btn btn-primary" id="joinBtn1"
									data-toggle="modal" data-target="#cheqModal">가입하기</button>
								</sec:authorize>
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
							<td>${info.cheq_target}등급이상</td>
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
							<td>${info.cheq_type}</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>저축금액</th>
						</tr>
						<tr>
							<td>${info.cheq_limit}</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>계약기간</th>
						</tr>
						<tr>
							<td>${info.cheq_period}</td>
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
	<c:if test="${type == 'sav'}">
		<!-- #2D5772 -->
		<div
			style="text-align: center; background-color: #2D5772; width: 100%; height: 60%;">
			<div style="display: inline-block; margin-top: 200px;">
				<table style="text-align: center;">
					<tr>
						<td>${info.sav_type}</td>
					</tr>
					<tr>
						<td style="font-size: 50px;">매일, 매주, 매월</td>
					</tr>
					<tr>
						<td style="font-size: 50px;">${info.sav_name}</td>
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
						<td style="padding: 5px 10px;">연 ${info.sav_rate} %</td>
					</tr>
				</table>
				<table class="infoTbl">
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
							<sec:authorize access="isAnonymous()">
								<button type="button" class="btn btn-primary"
									style="color: white; border: 1px solid white; background-color: #2D5772; border-radius: 5px; width: 200px; font-size: 20px; margin: 10px 0px;"
									data-toggle="modal" data-target="#loginFail">가입하기</button>
							</sec:authorize> 
							<sec:authorize access="isAuthenticated()">
								<button type="button" class="btn btn-primary" id="joinBtn2"
									data-toggle="modal" data-target="#savModal">가입하기</button>
							</sec:authorize>
						</td>
					</tr>
				</table>

				<%-- <form action="createAccount" method="get">
						<input type="hidden" name="num" value="${info.sav_num}">
						<input type="hidden" name="type" value="${info.sav_type}">
						<table class="infoTbl">
							<tr>
								<td style="border-right: 1px solid white; padding: 5px 10px;">최소</td>
								<td style="padding: 5px 10px;">1년 기준(세전)</td>
							</tr>
							<tr>
								<td style="border-right: 1px solid white; padding: 5px 10px;">1개월부터</td>
								<td style="padding: 5px 10px;">연 ${info.sav_rate} %</td>
							</tr>
						</table>
						<table class="infoTbl">
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td><sec:authorize access="isAuthenticated()">
										<input type="submit" value="가입하기" id="joinBtn2">
									</sec:authorize></td>
							</tr>
						</table>
					</form> --%>
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
							<td>${info.sav_target}등급이상</td>
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
							<td>${info.sav_type}</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>저축금액</th>
						</tr>
						<tr>
							<td>${info.sav_limit}</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>계약기간</th>
						</tr>
						<tr>
							<td>${info.sav_period}</td>
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
	<%-- <c:if test="${info.cheq_num%3 == 0}">
		<!-- #1AA85C -->
		<div
			style="text-align: center; background-color: #1AA85C; width: 100%; height: 60%;">
			<div style="display: inline-block; margin-top: 200px;">
				<table style="text-align: center;">
					<tr>
						<td>${info.cheq_type}</td>
					</tr>
					<tr>
						<td style="font-size: 50px;">실시간 이자로</td>
					</tr>
					<tr>
						<td style="font-size: 50px;">돈 모으는 재미가 쏠쏠</td>
					</tr>
				</table>
				<br /> <br />
				<form action="#" method="get">
				<table class="infoTbl">
					<tr>
						<td style="border-right: 1px solid white; padding: 5px 10px;">기간</td>
						<td style="padding: 5px 10px;">~ ${info.cheq_period}</td>
					</tr>
					<tr>
						<td style="border-right: 1px solid white; padding: 5px 10px;">1개월부터</td>
						<td style="padding: 5px 10px;">연 ${info.cheq_rate} %</td>
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
						<td><input type="submit" value="가입하기" id="joinBtn3">
						</td>
					</tr>
				</table>
				</form>
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
							<td>${info.cheq_target} 등급이상</td>
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
							<td>${info.cheq_type}</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>저축금액</th>
						</tr>
						<tr>
							<td>${info.cheq_limit}</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>계약기간</th>
						</tr>
						<tr>
							<td>${info.cheq_period}</td>
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
	</c:if> --%>

	<!-- 로그인-Modal1 -->
	<div class="modal fade" id="loginFail" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content" style="width: 500px;">
				<div class="modal-body" style="text-align: center;">
					<div style="display: inline-block;">
						<span>로그인이 필요한 상품입니다.</span>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 예금상품Modal -->
	<c:if test="${type == 'cheq'}">
	<div class="modal fade" id="cheqModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content" style="width: 500px;">
				<div class="modal-header" style="text-align: center;">
					<div style="display: inline-block;">내용을 입력하세요.</div>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="text-align: center;">
					<div style="display: inline-block;">
						<form action="createCheq" method="post">
						<input type="hidden" value="${info.cheq_num}" name="num">
							<table>
								<tr>
									<td>비밀번호</td>
									<td>
										<input type="password" name="password">
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<input type="submit" value="가입하기">
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	</c:if>
	
	<!-- 적금상품Modal -->
	<c:if test="${type == 'sav'}">
	<div class="modal fade" id="savModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content"  style="width: 500px;">
				<div class="modal-header" style="text-align: center;">
					<div style="display: inline-block;">내용을 입력하세요.</div>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="text-align: center;">
					<div style="display: inline-block;">
						<form action="createSav" method="post">
						<input type="hidden" value="${info.sav_num}" name="num">
							<table>
								<tr>
									<td>비밀번호</td>
									<td>
										<input type="password" name="password">
									</td>
								</tr>
								<tr>
									<td>가입기간</td>
									<td>
										<select name="period">
											<option value="12">12개월</option>
											<option value="24">24개월</option>
											<option value="36">36개월</option>
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<input type="submit" value="가입하기">
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	</c:if>
</body>
</html>