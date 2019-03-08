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
<title>체험관 > 간편은행</title>
<body>

	<!-- TOP&SIDE -->
	<%@ include file="../../Template/top.jsp"%>

	<div style="margin-top: -30px; width: 100%; text-align: center;">
		<div style="display: inline-block; width: 60%; margin: 200px 0px 0px 0px;">
			<h3 style="padding-left: 22px; text-align: center;">Easy Bank</h3>
			<span class="style">체험관 > 간편은행</span> <br>
			<hr style="width: 1100px;">
			<table style="width: 300px; display: inline">
				<tr>
					<td colspan="8"><p>당신의 지갑으로 예금을 간편히 즐기세요.</p></td>
				</tr>
				<tr>
					<td colspan="8"><p>이더를 간직하고 보관하세요!</p></td>
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

			<table style="width: 375px; display: inline">
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
					<td colspan="3" align="center" id="state">state</td>
				</tr>
				<tr>
					<td colspan="3" align="center" id="tx">TX_hash</td>
				</tr>
			</table>
			<hr>
			<div class="trBtn">
				<p id="">거래시, 수수료(gas)가 발생합니다.</p>
				<button type="button" class="btn btn-success" onclick="deposit();">입금</button>
				<button type="button" class="btn btn-warning" onclick="bankWithdraw();">출금</button>
				<button type="button" class="btn btn-info" onclick="bankBalance();">예금조회</button>
			</div>
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
			beforeSend:function(xhr){
	              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	              $('.wrap-loading').removeClass('display-none');
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
				if (data.chkNum == 1) {
					$('#state').html("입금완료되었습니다. 잔액을 확인해보세요.");
					$('#tx').html(data.Tx_hash);
				} else {
					$('#success').html("해당 거래가 성사되지 않았습니다.");
				}
			},
			beforeSend:function(xhr){
	              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	              $('.wrap-loading').removeClass('display-none');
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
			beforeSend:function(xhr){
	              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	              $('.wrap-loading').removeClass('display-none');
	        },
			error : function() {
				alert("지갑파일과 비밀번호를 확인해주세요.");
				$('#state').html("지갑파일과 비밀번호를 확인해주세요.");
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
				if (data.chkNum == 1) {
					$('#state').html("출금완료되었습니다. 잔액을 확인해보세요.");
					$('#tx').html(data.Tx_hash);
				} else {
					$('#state').html("해당 거래가 성사되지 않았습니다.");
				}
			},
			beforeSend:function(xhr){
	              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	              $('.wrap-loading').removeClass('display-none');
	        },
			error : function() {
				alert("지갑파일과 비밀번호를 확인해주세요.");
				$('#state').html("지갑파일과 비밀번호를 확인해주세요.");
			}
		});
	}
</script>
</html>