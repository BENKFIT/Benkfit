<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지갑생성</title>
<style>
.modal-body td {
	padding: 10px;
}
</style>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>

	<div class="wrapper">
		<h1>지갑만들기</h1>
		<hr>
		<table class="table_kay">
			<tr>
				<td colspan="3"><h4>당신의 지갑으로 예금을 간편히 즐기세요. 이더를 간직하고 보관하세요!</h4></td>
			</tr>
			<tr>
				<th>비밀번호 입력</th>
				<td><input type="password" name="password" id="password"
					class="inputStyle" required placeholder="PASSWORD" required></td>
			</tr>
			<tr>
				<th>State</th>
				<td colspan="3" id="state"></td>
			</tr>
		</table>
		<hr>
		<div class="trBtn">
			<p id="">생성시, 수수료(gas)가 발생하지 않습니다.</p>
			<p id="">계정이 생성되면 자동으로 10ETH를 드립니다.</p>
			<button type="button" class="btn btn-primary" onclick="create();">생성</button>
		</div>
	</div>
	<%@ include file="../../Template/footer.jsp"%>
</body>
<script type="text/javascript">
	function create() {
		var password = $('#password').val();
		var alldata = {
			'password' : password
		};
		$('#state').html("계정을 생성중입니다.");

		$.ajax({
			url : "${pageContext.request.contextPath}/createAccount",
			type : "GET",
			data : alldata,
			success : function(data) {
				if (data) {
					$('#state').html("생성된 계정 : " + data);
				} else {
					$('#state').html("다시 시도해주세요.");
				}
			},
			error : function() {
				alert("계정이 생성되지 않았습니다.");
				$('#state').html("다시 시도해주세요.");
			}
		});
	}
</script>
</html>