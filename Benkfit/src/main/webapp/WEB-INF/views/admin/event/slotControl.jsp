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
<title>관리자메뉴 > 이벤트관리 > 슬롯관리</title>
<body>

	<!-- TOP&SIDE -->
	<%@ include file="../../Template/top.jsp"%>

	<div style="margin-top: -30px; width: 100%; text-align: center;">
		<div
			style="display: inline-block; width: 60%; margin: 200px 0px 0px 0px;">
			<h3 style="padding-left: 22px; text-align: center;">Slot Manage</h3>
			<hr style="width: 1100px;">
			<span style="float: right;">관리자메뉴 > 이벤트관리 > 슬롯관리</span> <br>
			<table style="width: 300px; display: inline">
				<tr>
					<td colspan="8"><p>슬롯에 잔고가 남아있지 않으면 슬롯이 정상적으로 작동하지 않습니다.</p></td>
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
						<input class="btn btn-info" type="button" value="관리자잔액확인"
							onClick="Balance();">
					</div>
					<td colspan="3" align="center" id="balance"></td>
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
				<tr>
					<td colspan="3" align="center" id="state">state</td>
				</tr>
			</table>
						<hr>
			<div class="trBtn">
				<br> <button type="button" class="btn btn-success"
					onclick="slotStock();">슬롯잔액채우기</button>
					<button type="button" class="btn btn-info" title="관리자 지갑을 등록 후 비밀번호를입력하세요."
					onclick="slotStockBalance();">슬롯잔고확인</button>
			</div>
		</div>
	</div>

	<%@ include file="../../Template/footer.jsp"%>
</body>
<script type="text/javascript">
	function slotStock() {
		var from = $('#from').val();
		var value = $('#value').val();
		var password = $('#password').val();
		var alldata = {
			'from' : from,
			'value' : value,
			'password' : password
		};
		$('#state').html("이더를 채우는 중입니다.");

		$.ajax({
			url : "${pageContext.request.contextPath}/slotStock",
			type : "GET",
			data : alldata,
			success : function(data) {
				$('#state').html("이더가 채워졌습니다. 확인해보세요.");
			},
			error : function() {
				alert("다시 시도해주세요.");
				$('#state').html("지갑파일과 비밀번호를 확인해주세요.");
			}
		});
	}
	function slotStockBalance() {
		var from = $('#from').val();
		var password = $('#password').val();
		var alldata = {
			'from' : from,
			'password' : password
		};
		$('#balance').html("슬롯 잔액을 조회중입니다.");

		$.ajax({
			url : "${pageContext.request.contextPath}/slotStockBalance",
			type : "GET",
			data : alldata,
			success : function(data) {
				$('#balance').html("슬롯의 잔액은 " + data + "ETH 입니다.");
			},
			error : function() {
				alert("다시 시도해주세요.");
				$('#state').html("지갑파일과 비밀번호를 확인해주세요.");	
			}
		});
	}
	function Balance() {
		/* var address = $('#address').val(); */
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
				alert("다시 시도해주세요.");
				$('#balance').html("지갑파일과 비밀번호를 확인해주세요.");	
			}
		});
	}
</script>
</html>