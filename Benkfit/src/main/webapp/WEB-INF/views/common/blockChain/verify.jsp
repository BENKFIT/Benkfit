<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래검증소</title>
<style>
.modal-body td {
	padding: 10px;
}
</style>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>

	<div class="wrapper">
		<h1>거래검증소</h1>
		<hr>
		<table class="table_kay">
			<tr>
				<td colspan="4"><h4>Tx_hash로 당신의 거래를 검증하세요.</h4></td>
			</tr>
			<tr>
				<th>Tx_hash</th>
				<td colspan="6"><input type="text" name="value" id="value"
					class="inputStyle" placeholder="Tx_hash" required></td>
			</tr>
			<tr>
				<th>CoinBase</th>
				<td colspan="2" id="coinBase"></td>
				<td colspan="2" id="coinBase4"></td>
			</tr>
			<tr>
				<th>State</th>
				<td colspan="2" id="state"></td>
				<td colspan="2" id="state4"></td>
			</tr>
			<tr>
				<th>From</th>
				<td colspan="2" id="from"></td>
				<td colspan="2" id="from4"></td>
			</tr>
			<tr>
				<th>to</th>
				<td colspan="2" id="to"></td>
				<td colspan="2" id="to4"></td>
			</tr>
			<tr>
				<th>Block Number</th>
				<td colspan="2" id="bn"></td>
				<td colspan="2" id="bn4"></td>
			</tr>
			<tr>
				<th>Gas Limit</th>
				<td colspan="2" id="g_limit"></td>
				<td colspan="2" id="g_limit4"></td>
			</tr>
			<tr>
				<th>Gas Used</th>
				<td colspan="2" id="g_used"></td>
				<td colspan="2" id="g_used4"></td>
			</tr>
			<tr>
				<th>Miner</th>
				<td colspan="2" id="miner"></td>
				<td colspan="2" id="miner4"></td>
			</tr>
			<tr>
				<th>Parent Block</th>
				<td colspan="3" id="parent"></td>
				<!-- <td colspan="2" id="parent4"></td> -->
			</tr>
			<tr>
				<th>Root Block</th>
				<td colspan="3" id="root"></td>
				<!-- <td colspan="2" id="root4"></td> -->
			</tr>
			<tr>
				<th>Time Stamp</th>
				<td colspan="2" id="time"></td>
				<td colspan="2" id="time4"></td>
			</tr>			
		</table>
		<hr>
		<div class="trBtn">
			<p id="">검증은 수수료(gas)가 발생하지 않습니다.</p>
			<button type="button" class="btn btn-primary" onclick="verify();">검증</button>
		</div>
	</div>
	<%@ include file="../../Template/footer.jsp"%>
</body>
<script type="text/javascript">
	function verify() {
		var value = $('#value').val();
		var alldata = {
			'value' : value
		};
		$('#state').html("검증중입니다. 잠시만 기다려주세요.");

		$.ajax({
			url : "${pageContext.request.contextPath}/verifyPro",
			type : "GET",
			data : alldata,
			dataType : "JSON",
			success : function(data) {
				if (data.chkNum != 0) {
					$('#coinBase').html(data.coinBase);
					$('#coinBase4').html(data.coinBase4);
					$('#state').html("해당노드 정상.");
					$('#state4').html("해당노드 정상.");
					$('#from').html(data.from);
					$('#from4').html(data.from4);
					$('#to').html(data.to);
					$('#to4').html(data.to4);
					$('#bn').html(data.bn);
					$('#bn4').html(data.bn4);
					$('#g_limit').html(data.g_limit);
					$('#g_limit4').html(data.g_limit4);
					$('#g_used').html(data.g_used);
					$('#g_used4').html(data.g_used4);
					$('#miner').html(data.miner);
					$('#miner4').html(data.miner4);
					$('#parent').html(data.parent);
					$('#parent4').html(data.parent4);
					$('#root').html(data.root);
					$('#root4').html(data.root4);
					$('#time').html(data.time);
					$('#time4').html(data.time4);
				} else {
					$('#success').html("정상거래가 아닙니다. 고객센터에 문의해주세요.");
				}
			},
			error : function() {
				alert("컨트랙트 주소를 입력해주세요.");
				$('#state').html("다시 시도해주세요.");
			}
		});
	}
</script>
</html>