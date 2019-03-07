<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>상품 > 대출</title>
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
	background-color: #C64545;
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

#cheqModal td, #savModal td {
	color: black;
}

#from {
	padding: 6px 10px;
	margin: 4px 0;
	display: inline-block;
	border: 1px solid #FFD662;
	border-radius: 4px;
	box-sizing: border-box;
}
</style>
</head>
<body>
	<!-- TOP&SIDE -->
	<%@ include file="../../../Template/top.jsp"%>
	<div
		style="text-align: center; background-color: #C64545; width: 100%; height: 60%;">
		<div style="display: inline-block; margin-top: 200px;">
			<table style="text-align: center;">
				<tr>
					<td>${info.loan_name}</td>
				</tr>
				<tr>
					<td style="font-size: 50px;">어려운 대출도</td>
				</tr>
				<tr>
					<td style="font-size: 50px;">매우 간단하게</td>
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
					<td style="padding: 5px 10px;">연 ${info.loan_rate} %</td>
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
			<p>새롭고 간편한 대출</p>
		</div>
	</div>

	<div class="div3">
		<div class="div3-1">
			<p>신청과 동시에 파바박!</p>
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
						<td>${info.loan_target}</td>
					</tr>
					<tr>
						<td>대한민국인</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>대출종류</th>
					</tr>
					<tr>
						<td>${info.loan_reMethod}</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>대출금액</th>
					</tr>
					<tr>
						<td>${info.loan_amount}</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>대출만기</th>
					</tr>
					<tr>
						<td>${info.loan_period}</td>
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

	<!-- 로그인-Modal1 -->
	<div class="modal fade" id="loginFail" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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

	<!-- 대출상품Modal -->
	<div class="modal fade" id="cheqModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
						<form action="loanApply" method="post">
							<input type="hidden" value="${info.loan_num}" name="num">
							<input type="hidden" value="${info.loan_rate}" name="rate">
							<table>
								<tr>
									<td>
										<!-- <input class="btn btn-primary" type="file" id="from"> -->
										<div class="eq-ui-form-group eq-ui-input-file">
											<a class="btn btn-primary eq-ui-waves-light"
												style="color: white;"> Upload <input
												class="btn btn-primary" id="from" name="from" type="file"
												multiple>
											</a>
											<div class="eq-ui-input-file-path">
												<input type="text" class="eq-ui-input"
													placeholder="Upload private key files" readonly
													style="width: 300px;">
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="eq-ui-form-group eq-ui-input-field">
											<input id="password" type="password" class="eq-ui-input"
												name="password" style="width: 300px;"> <label
												for="password">비밀번호</label>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="eq-ui-form-group eq-ui-input-field">
											<input id="amount" type="text" class="eq-ui-input"
												name="amount" style="width: 300px;"> <label
												for="amount">대출금액</label>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="eq-ui-form-group eq-ui-input-field" id="state">
										</div>
									</td>
								</tr>
							</table>
							<div class="modal-footer">
								<input type="submit" value="신청하기" class="btn btn-primary"
									data-toggle="tooltip" data-placement="bottom"
									title="입금시, 수수료가 발생합니다." onclick="state();">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- FOOTER  -->
	<%@ include file="../../../Template/footer.jsp"%>

</body>
<script type="text/javascript">
	function state(){
		$('#state').html("대출을 신청중입니다.");
	}
</script>
</html>