<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>간편은행</title>
<style>
.modal-body td {
	padding: 10px;
}
</style>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>

	<div class="wrapper">
		<h1>간편은행</h1>
		<hr>
		<table class="table_kay">
			<tr>
				<td colspan="3"><h4>당신의 지갑으로 예금을 간편히 즐기세요. 이더를 간직하고 보관하세요!</h4></td>
			</tr>
			<tr>
				<th>지갑파일y</th>
				<td><input type="file" name="file" id="from"></td>
			</tr>
			<tr>
				<td><input type="button" onclick="Balance();" class="btn btn-primary" value="잔액확인"
					required></td>
				<td colspan="3" id="balance"></td>
			</tr>
			<tr>
				<th>거래이더</th>
				<td><input type="text" id="value" class="inputStyle" placeholder="ETHER"></td>
			</tr>
			<tr>
				<th>비밀번호 입력</th>
				<td><input type="password" name="password" id="password"
					class="inputStyle" placeholder="PASSWORD" required></td>
			</tr>
			<tr>
				<th>State</th>
				<td colspan="3" id="state"></td>
			</tr>
			<tr>
				<th>Tx_hash</th>
				<td colspan="3" id="tx"></td>
			</tr>

		</table>
		<hr>
		<div class="trBtn">
			<p id="">거래시, 수수료(gas)가 발생합니다.</p>
			<button type="button" class="btn btn-primary" onclick="deposit();">입금</button>
			<button type="button" class="btn btn-primary" onclick="bankWithdraw();">출금</button>
			<button type="button" class="btn btn-primary" onclick="bankBalance();">예금조회</button>
		</div>
	</div>
	<%@ include file="../../Template/footer.jsp"%>
</body>
<script type="text/javascript">
	function Balance() {
		var from = $('#from').val();
		var alldata = {
			"from" : from
		};
		$('#balance').html("잔액을 조회중입니다.");

		$.ajax({
			url : "${pageContext.request.contextPath}/Balance",
			type : "GET",
			data : alldata,
			success : function(data) {
				$('#balance').html(data);
			},
			error : function() {
				alert("지갑파일과 비밀번호를 확인해주세요.");
			}
		});
	}

	function deposit() {
		var from = $('#from').val();
		var value = $('#value').val();
		var password = $('#password').val();
		var alldata = {
			'from' : from,
			'value' : value,
			'password' : password
		};
		$('#state').html("입금중입니다.");

		$.ajax({
			url : "${pageContext.request.contextPath}/depositPro_Eth",
			type : "GET",
			data : alldata,
			dataType : "JSON",
			success : function(data) {
				if(data.chkNum == 1){
					$('#state').html("입금완료되었습니다. 잔액을 확인해보세요.");
					$('#tx').html(data.Tx_hash);
				}else{
					$('#success').html("해당 거래가 성사되지 않았습니다.");
				}
			},
			error : function() {
				alert("지갑파일과 비밀번호를 확인해주세요.");
			}
		});
	}

	function bankBalance() {
		var from = $('#from').val();
		var password = $('#password').val();
		var alldata = {
			'from' : from,
			'password' : password
		};
		$('#state').html("통장 잔액을 조회중입니다.");

		$.ajax({
			url : "${pageContext.request.contextPath}/bankBalance",
			type : "GET",
			data : alldata,
			success : function(data) {
				$('#state').html("통장의 잔액은 " + data + "ETH 입니다.");
			},
			error : function() {
				alert("지갑파일과 비밀번호를 확인해주세요.");
			}
		});
	}

	function bankWithdraw() {
		var from = $('#from').val();
		var value = $('#value').val();
		var password = $('#password').val();
		var alldata = {
			'from' : from,
			'value' : value,
			'password' : password
		};
		$('#state').html("출금중입니다.");

		$.ajax({
			url : "${pageContext.request.contextPath}/bankWithdraw",
			type : "GET",
			data : alldata,
			dataType : "JSON",
			success : function(data) {
				if(data.chkNum == 1){
					$('#state').html("출금완료되었습니다. 잔액을 확인해보세요.");
					$('#tx').html(data.Tx_hash);
				}else{
					$('#success').html("해당 거래가 성사되지 않았습니다.");
				}
			},
			error : function() {
				alert("지갑파일과 비밀번호를 확인해주세요.");
			}
		});
	}
</script>
</html>