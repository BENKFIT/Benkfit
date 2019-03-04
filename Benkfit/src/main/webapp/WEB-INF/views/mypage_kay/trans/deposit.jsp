<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>이체</title>
</head>
<style>
	tr{
		margin: 30px 0px;
	}
</style>
<body>
	<%@ include file="../../Template/top.jsp"%>

	<div class="wrapper">
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


	<div style="margin: 200px 0px; text-align: center;">
		<div style="display: inline-block; width: 40%;">
			<h5 style="float: right;">마이페이지>입금</h5>
			<div class="col-md-12">
				<form class="doc-form" action="deposit" method="post">
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
	<%@ include file="../../common/chatbot.jsp"%>

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
					alert("getBalance error");
				}
			});
		}
	</script>
	<%@ include file="../../Template/footer.jsp"%>
</body>

</html>