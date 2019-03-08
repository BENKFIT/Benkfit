<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<html>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
p, a {
	color: rgb(119, 119, 119);
	font-weight: 12px;
}

.title {
	font-size: 50px;
	text-align: center;
}

#machine {
	text-align: center;
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
<title> 체험관 > 거래검증소 </title>
<body>
	<!-- TOP&SIDE -->
	<%@ include file="../../Template/top.jsp"%>
	<div style="margin-top: -30px; width: 100%; text-align: center;">
		<div style="display: inline-block; width: 60%; margin: 200px 0px 0px 0px;">
			<h3 style="padding-left: 22px; text-align: center;">Easy
				Verification</h3>
			<span class="style">체험관 > 거래검증소</span> <br>
			<hr style="width: 1100px;">
			<table style="width: 300px; display: inline">
				<tr>
					<td colspan="8"><p>Tx_hash로 당신의 거래를 검증하세요.</p></td>
				</tr>
				<tr>
					<td>
						<div class="eq-ui-form-group eq-ui-input-field">
							<input id="value" type="text" class="eq-ui-input validate"
								style="width: 375px;"> <label for="textarea_field">TX_hash</label>
						</div>
					</td>
				</tr>
			</table>
			</br>

			<table class="table eq-ui-data-table eq-ui-striped z-depth-1" display: inline">
				<tr>
					<th>CoinBase</th>
					<td colspan="2" id="coinBase" style="width:350px;"></td>
					<td colspan="2" id="coinBase4" style="width:350px;"></td>
				</tr>
				<tr>
					<th>State</th>
					<td colspan="2" id="state"></td>
					<td colspan="2" id="state4"></td>
				</tr>
				<tr>
					<th>From</th>
					<td colspan="2" id="from1"></td>
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
				<button type="button" class="btn btn-success" onclick="verify();">검증</button>
			</div>
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
		$('#state4').html("검증중입니다. 잠시만 기다려주세요.");

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
					$('#from1').html(data.from);
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
			beforeSend:function(xhr){
	              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	              $('.wrap-loading').removeClass('display-none');
	        },
			error : function() {
				alert("컨트랙트 주소를 입력해주세요.");
				$('#state').html("다시 시도해주세요.");
			}
		});
	}
</script>
</html>