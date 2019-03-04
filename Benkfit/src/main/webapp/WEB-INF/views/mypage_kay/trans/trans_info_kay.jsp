<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지 > 이체</title>
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
		<span style="float: right;">마이페이지>이체</span>
			<div class="col-md-12">
				<form class="doc-form" action="transPro" method="post">
					<table>
						<tr>
							<td colspan="4" style="text-align: center;">출금계좌정보</td>
						</tr>
						<tr>
							<td colspan="4">
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-file">
										<a class="btn btn-primary eq-ui-waves-light" data-toggle="tooltip" data-placement="bottom" title="private key파일을 올려주세요."> Upload <input
											id="file" type="file" multiple name="file">
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
										<input id="password" type="password" class="eq-ui-input" name="password">
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
										<input id="to" type="text" class="eq-ui-input" name="to"> <label
											for="to">입금계좌</label>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-field">
										<input id="amount" type="number" class="eq-ui-input" name="amount">
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
	<%@ include file="../../Template/footer.jsp"%>
</body>
</html>