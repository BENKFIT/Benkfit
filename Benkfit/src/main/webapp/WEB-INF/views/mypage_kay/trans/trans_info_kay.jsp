<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="msapplication-tap-highlight" content="no">
<meta name="description"
	content="Implements Google's Material Design in Bootstrap.">
<title>이체</title>
<!-- CSS-->
<link
	href="/benkfit/resources/assets/css/exentriq-bootstrap-material-ui.min.css?v=0.4.5"
	rel="stylesheet">
<link href="/benkfit/resources/assets/css/doc.css?v=0.4.5"
	rel="stylesheet">
<style>
.modal-body td {
	padding: 10px;
}
</style>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>

	<div style="margin: 200px 0px; text-align: center;">
		<div style="display: inline-block; width: 50%;">
		<h5 style="float: right;">마이페이지>이체</h5>
			<div class="col-md-12">
				<form class="doc-form" action="transPro" method="post">
					<table>
						<tr>
							<td colspan="4" style="text-align: center;">출금계좌정보</td>
						</tr>
						<tr>
							<td colspan="4">
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-field">
										<input id="from" type="text" class="eq-ui-input"> <label
											for="from">출금계좌</label>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-file">
										<a class="btn btn-primary eq-ui-waves-light" data-toggle="tooltip" data-placement="bottom" title="private key파일을 올려주세요."> Upload <input
											id="file" type="file" multiple>
										</a>
										<div class="eq-ui-input-file-path">
											<input type="text" class="eq-ui-input"
												placeholder="Upload one or more files" readonly>
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-field">
										<input id="password" type="password" class="eq-ui-input">
										<label for="password">비밀번호</label>
									</div>
								</div>
							</td>
							<td>
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-field">
										<input id="value" type="text" class="eq-ui-input" disabled>
									</div>
								</div>
							</td>
							<td><a class="btn btn-primary eq-ui-waves-light"
								onclick="getBalance();">잔액확인</a></td>
						</tr>
						<tr>
							<td colspan="4" style="text-align: center;">입금계좌정보</td>
						</tr>
						<tr>
							<td colspan="4">
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-field">
										<input id="to" type="text" class="eq-ui-input"> <label
											for="to">입금계좌</label>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-field">
										<input id="amount" type="number" class="eq-ui-input">
										<label for="amount">금액</label>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="4" style="text-align: center;">
								<input type="submit" class="btn btn-primary" value="확인"
								data-toggle="tooltip" data-placement="bottom" title="거래시, 수수료가 발생합니다.">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>

	<!-- <div class="wrapper">
		<h1>계좌이체</h1>
		<hr>
		<table class="table_kay">
			<tr>
				<td><h3>출금정보</h3></td>
			</tr>
			<tr>
				<th>출금계좌</th>
				<td>
					<select id="out">
						<c:forEach var="account" items="${accounts}">
							<option value="${account}">${account}</option>
						</c:forEach>
					</select> <input type="text" id="out" size="40">
				</td>
			</tr>
			<tr>
				<th>출금계좌 private key</th>
				<td><input type="file" name="file" id="keyfile"></td>
			</tr>
			<tr>
				<th>비밀번호 입력</th>
				<td><input type="password" name="password" id="password"
					class="inputStyle" required></td>
			</tr>
			<tr>
				<td><input type="button" onclick="getBalance();" value="잔액확인"
					class="btn btn-primary" required></td>
				<td colspan="3" id="getBalance"></td>
			</tr>

		</table>
		<hr>
		<table class="table_kay" style="margin: 100px 0px;">
			<tr>
				<td><h3>입금정보</h3></td>
			</tr>
			<tr>
				<th>입금계좌번호</th>
				<td><input type="text" class="inputStyle" placeholder="계정주소입력"
					required id="in"></td>
			</tr>
			<tr>
				<th>입금금액</th>
				<td><input type="text" class="inputStyle" placeholder="ether"
					required id="amount"></td>
			</tr>
		</table>
		<hr>
		<div class="trBtn">
			<p>이체시, 수수료(gas)가 발생합니다.</p>
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#trans" onclick="confirm();">확인</button>
		</div>
	</div> -->
	
	<%@ include file="../../common/chatbot.jsp"%>

	<script type="text/javascript">
	$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
			})
	
		function getBalance() {
			//var select = $('#out option:selected').val();
			var select = $('#from').val();
			var file = $('#file').val();
			var password = $('#password').val();
			var account = "account=" + select + "&file=" + file + '&password='
					+ password;

			$("#getBalance").html("잔액을 확인중입니다.");
			$.ajax({
				type : 'post',
				data : account,
				url : '${pageContext.request.contextPath}/getBalance',
				success : function(data) {
					$("#getBalance").html(data);
				},
				error : function() {
					alert("getBalance error");
				}
			});
		}

	</script>
	<!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
	<script
		src="/benkfit/resources/assets/js/vendor/jquery/dist/jquery.min.js?v=2.1.4"></script>
	<script
		src="/benkfit/resources/assets/js/vendor/moment/min/moment.min.js?v=2.13.0"></script>
	<script
		src="/benkfit/resources/assets/js/vendor/jquery-timeago/jquery.timeago.js?v=1.4.3"></script>
	<script
		src="/benkfit/resources/assets/js/exentriq-bootstrap-material-ui.min.js?v=0.4.5"></script>

	<script src="/benkfit/resources/assets/js/tp/tp-color.html"
		type="riot/tag"></script>
	<script
		src="/benkfit/resources/assets/js/vendor/riot/riot+compiler.min.js?v=2.3.0"></script>

	<script src="https://unpkg.com/lodash@4.16.0"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script src="https://unpkg.com/vue@2.5.21/dist/vue.js"></script>

	<script src="/benkfit/resources/assets/js/doc.js?v=0.4.5"></script>
	<script src="/benkfit/resources/assets/js/ctrl/ctrl-color.js"></script>
	<script src="/benkfit/resources/assets/js/vue/collapsible.js"></script>
	<script src="/benkfit/resources/assets/js/vue/dropdown.js"></script>
	<script src="/benkfit/resources/assets/js/vue/tabs.js"></script>

	<!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
	<script>
		(function(b, o, i, l, e, r) {
			b.GoogleAnalyticsObject = l;
			b[l] || (b[l] = function() {
				(b[l].q = b[l].q || []).push(arguments)
			});
			b[l].l = +new Date;
			e = o.createElement(i);
			r = o.getElementsByTagName(i)[0];
			e.src = '//www.google-analytics.com/analytics.js';
			r.parentNode.insertBefore(e, r)
		}(window, document, 'script', 'ga'));
		ga('create', 'UA-XXXXX-X', 'auto');
		ga('send', 'pageview');
	</script>
</body>
</html>