<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
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
<link
	href="/benkfit/resources/assets/css/exentriq-bootstrap-material-ui.min.css?v=0.4.5"
	rel="stylesheet">
<link href="/benkfit/resources/assets/css/doc.css?v=0.4.5"
	rel="stylesheet">
</head>
<style>
	tr{
		margin: 30px 0px;
	}
</style>
<body>
	<%@ include file="../Template/top.jsp"%>
	<!-- <div class="wrapper">
		<h1>입금</h1>
		<hr>
		<table class="table_kay">
			<tr>
				<td><h3>입금정보</h3></td>
			</tr>
			<tr>
				<th>입금계좌</th>
				<td>
					<input type="text" name="from" id="from" size="40">
				</td>
			</tr>
			<tr>
				<th>private key</th>
				<td>
					<input type="file" id="file">
				</td>
			</tr>
			<tr>
				<th><input type="button" onclick="getBalance()" class="btn btn-primary" value="잔액확인"></th>
				<td id="getBalance"></td>
			</tr>
			<tr>
				<th>비밀번호 입력</th>
				<td>
					<input type="password" id="password" class="inputStyle" required>
				</td>
			</tr>
		</table>
		<hr>
		<div class="trBtn">
			<p>입금시, 수수료(gas)가 발생합니다.</p>
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#trans" onclick="confirm();">확인</button>
		</div>
	</div>
 -->
	<div style="margin: 200px 0px; text-align: center;">
		<div style="display: inline-block; width: 40%;">
			<h5 style="float: right;">마이페이지>입금</h5>
			<div class="col-md-12">
				<form class="doc-form" action="depositPro" method="post">
					<table>
						<tr>
							<td colspan="4">
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-field">
										<input id="from" type="text" class="eq-ui-input"> <label
											for="from">입금계좌</label>
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
							<td><a class="btn btn-warning eq-ui-waves-light" onclick="getBalance();">잔액확인</a></td>
						</tr>
						<tr>
							<td colspan="4" style="text-align: center;">
								<input type="submit" value="확인" class="btn btn-primary" 
								data-toggle="tooltip" data-placement="bottom" title="입금시, 수수료가 발생합니다.">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	

	<script type="text/javascript">
		$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		})
	
		function getBalance(){
			var select = $('#from').val();
			var file = $('#file').val();
			var password = $('#password').val();
			var account = "account=" + select + "&file=" + file + '&password=' + password;
			$.ajax({
				type : 'post',
				data : account,
				url : '${pageContext.request.contextPath}/getBalance',
				success : function(data) {
					$("#getBalance").html(data);
				},
				error : function() {
					$("#getBalance").html("잔액이 없습니다.");
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