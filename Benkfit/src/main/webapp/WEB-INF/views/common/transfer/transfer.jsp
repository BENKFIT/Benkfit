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
<title> 체험관 > 간편송금 </title>
<body>
	<!-- TOP&SIDE -->
	<%@ include file="../../Template/top.jsp"%>

	<div style="margin-top: -30px; width: 100%; text-align: center;">
		<div
			style="display: inline-block; width: 60%; margin: 200px 0px 0px 0px;">
			<h3 style="padding-left: 22px; text-align: center;">Easy
				Transfer</h3>
			<span class="style">체험관 > 간편송금</span> <br>
				<hr style="width: 1100px;">
			<table style="width: 300px; display: inline">
				<tr>
					<td colspan="8"><p>당신의 키스토어와 상대방의 계정 주소로 간단히 이더를 보내세요.</p></td>
				</tr>
				<tr>
					<td>
						<!-- <input class="btn btn-primary" type="file" id="from"> -->
						<div class="eq-ui-form-group eq-ui-input-file">
							<a class="btn btn-primary eq-ui-waves-light"
								style="color: white;"> Upload <input class="btn btn-primary"
								id="from" type="file" multiple>
							</a>
							<div class="eq-ui-input-file-path">
								<input type="text" class="eq-ui-input"
									placeholder="Upload private key files" readonly
									style="width: 500px;">
							</div>
						</div>
					</td>
				</tr>
			</table>

			<table style="width: 500px; display: inline">
				<tr>
					<div class="eq-ui-form-group eq-ui-input-field">
						<input class="btn btn-info" type="button" value="잔고확인"
							onClick="Balance();">
					</div>
					<td align="center" id="balance"></td>
				</tr>
				<tr>
					<td>
						<div class="eq-ui-form-group eq-ui-input-field">
							<input id="to" type="text" class="eq-ui-input validate"
								style="width: 375px;"> <label for="textarea_field">Address</label>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="eq-ui-form-group eq-ui-input-field">
							<input id="value" type="text" class="eq-ui-input validate"
								style="width: 375px;"> <label for="textarea_field">ETHER</label>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="eq-ui-form-group eq-ui-input-field">
							<input id="password" type="password" class="eq-ui-input validate"
								style="width: 375px;"> <label for="textarea_field">Password</label>
						</div>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td colspan="8" align="center" id="state">state</td>
				</tr>
				<tr>
					<td colspan="8" align="center" id="tx">TX_hash</td>
				</tr>
			</table>
			<hr>
			<div class="trBtn">
				<p id="">거래시, 수수료(gas)가 발생합니다.</p>
				<button type="button" class="btn btn-success" onclick="transfer();">송금</button>
			</div>
		</div>
	</div>
	<%@ include file="../../Template/footer.jsp"%>
</body>
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
				$('#balance').html("지갑파일을 선택해주세요.");
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
		$('#state').html("송금을 요청중입니다.");

		$.ajax({
			url : "${pageContext.request.contextPath}/transferPro",
			type : "GET",
			data : alldata,
			dataType : "JSON",
			success : function(data) {
				if (data.chkNum == 1) {
					$('#state').html(value + "이더를 전송하였습니다.");
					$('#tx').html(data.Tx_hash);
				} else {
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
</html>