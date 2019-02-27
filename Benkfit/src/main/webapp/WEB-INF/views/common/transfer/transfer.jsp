<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이체</title>
<style>
.modal-body td {
	padding: 10px;
}
</style>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>

	<div class="wrapper">
		<h1>간편송금</h1>
		<hr>
		<table class="table_kay">
			<tr>
				<td colspan="3"><h4>당신의 키스토어와 상대방의 계정 주소로 간단히 이더를 보내세요.</h4></td>
			</tr>
			<tr>
				<th>지갑파일</th>
				<td><input type="file" name="file" id="from"></td>
			</tr>
			<tr>
				<td><input type="button" onclick="Balance();" class="btn btn-primary" value="잔액확인"
					required></td>
				<td colspan="3" id="balance"></td>
			</tr>
			<tr>
				<th>받는계좌</th>
				<td><input type="text" id="to" class="inputStyle" placeholder="ADDRESS"></td>
			</tr>
			<tr>
				<th>보낼이더</th>
				<td><input type="text" id="value" class="inputStyle" placeholder="ETHER"></td>
			</tr>
			<tr>
				<th>비밀번호 입력</th>
				<td><input type="password" name="password" id="password"
					class="inputStyle" required placeholder="PASSWORD"></td>
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
			<button type="button" class="btn btn-primary" onclick="transfer();">송금</button>
		</div>
	</div>
	<%@ include file="../../Template/footer.jsp"%>


	<script type="text/javascript">
	function Balance() {
		/* 계정주소 직접입력으로 잔액 조회하기
		var address = $('#address').val(); 
		var alldata = {"address":address};*/
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
				alert("지갑파일을 선택해주세요.")
			}
		});
	}

	function transfer() {
		var password = $('#password').val();
		var from = $('#from').val();
		var value = $('#value').val();
		var to = $('#to').val();
		var alldata = {
			'password' : password,
			'from' : from,
			'value' : value,
			'to' : to
		}
		$('#success').html("송금을 요청중입니다.");

		$.ajax({
			url : "${pageContext.request.contextPath}/transferPro",
			type : "GET",
			data : alldata,
			dataType : "JSON",
			success : function(data) {
				if(data.chkNum == 1){
					$('#state').html(value + "이더를 전송하였습니다.");
					$('#tx').html("해당거래주소 : "+data.Tx_hash);
				}else{
					$('#state').html("해당 거래가 성사되지 않았습니다.");
				}
			},
			error : function() {
				alert("지갑파일을 선택해주세요.")
				$('#state').html("다시 시도해주세요.");
			}
		});
	}
</script>
</body>
</html>