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
<title> 이벤트 > 슬롯머신</title>
<body>

	<!-- TOP&SIDE -->
	<%@ include file="../../Template/top.jsp"%>

	<input type="hidden" name="eve_num" value="${dto.eve_num}">
	<input type="hidden" name="pageNum" value="${pageNum}">

	<div style="margin-top: -30px; width: 100%; text-align: center;">
		<div style="display: inline-block; width: 60%; margin: 200px 0px 0px 0px;">
			<span class="style">ETH Slots</span> <br>
			<table class="table eq-ui-data-table z-depth-1" style="width: 100%;">
				<thead>
					<tr style="background: #2980B9;">
						<th class="eq-ui-data-table-cell-non-numeric"
							style="width: 80%; color: #ffffff;">제목</th>
						<th class="eq-ui-data-table-cell-non-numeric"
							style="width: 20%; color: #ffffff;">등록일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td
							class="eq-ui-data-table-cell-non-numeric eq-ui-data-table-cell-truncate">${dto.eve_title}</td>
						<td
							class="eq-ui-data-table-cell-non-numeric eq-ui-data-table-cell-truncate"><fmt:formatDate
								type="both" pattern="yyyy-MM-dd" value="${dto.eve_regDate}" /></td>
					</tr>
				</tbody>
			</table>

			<div>
				<p class="login" style="text-align: center;">
				<table style="width: 500px; display: inline">
					<tr>
						<td>
							<!-- <input class="btn btn-primary" type="file" id="from"> -->
							<div class="eq-ui-form-group eq-ui-input-file">
								<a class="btn btn-primary eq-ui-waves-light"
									style="color: white;"> Upload <input
									class="btn btn-primary" id="from" type="file" multiple>
								</a>
								<div class="eq-ui-input-file-path">
									<input type="text" class="eq-ui-input"
										placeholder="Upload private key files" readonly
										style="width: 700px;">
								</div>
							</div>
						</td>
					</tr>
				</table>

				<table style="width: 300px; display: inline">
					<tr>
						<td>
							<div class="eq-ui-form-group eq-ui-input-field">
								<input id="password" type="password"
									class="eq-ui-input validate"> <label
									for="textarea_field">Password</label>
							</div>
						</td>
						<td>
							<div class="eq-ui-form-group eq-ui-input-field">
								<input class="btn btn-primary" type="button" value="잔고확인"
									onClick="Balance();">
							</div>
						</td>
					</tr>
				</table>
				</p>

				<div id="machine">
					<svg width="650" height="250" viewBox="0 0 1700 500">
	
	            <circle cx="300" cy="260" r="240" fill="white"
							stroke="#777" stroke-width="30" />
	            <circle cx="850" cy="260" r="240" fill="white"
							stroke="#777" stroke-width="30" />
	            <circle cx="1400" cy="260" r="240" fill="white"
							stroke="#777" stroke-width="30" />
	            <text x="150" y="415" font-family="courier" font-size="500"
							fill="#2980B9" id="first">
	                7
	            </text>
	
	            <text x="700" y="415" font-family="courier" font-size="500"
							fill="#2980B9" id="second">
	                7
	            </text>
	
	            <text x="1260" y="415" font-family="courier"
							font-size="500" fill="#2980B9" id="third">
	                7
	            </text>
	        </svg>
				</div>

				<div style="text-align: center;"></div>
				<div class="eq-ui-form-group eq-ui-input-field" style="width:66px; display: inline-block;">
					<select id="bet_amount" class="eq-ui-select">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
					</select> <label>Ether</label> <input class="btn btn-primary" type="button"
						value="Spin" onClick="spin()">
				</div>

				<p id="balance"></p>

				<p id="messages">
					슬롯 한판당 약 1분의 시간이 소요됩니다.<br> 이더는 Benkfit에서 이용하는 모든 거래에 수수료로
					사용됩니다.<br> 무분별한 슬롯으로 수수료가 없어지지 않게 하세요.<br> 이더가 부족하면 거래가
					성사되지 않을 수 있습니다.<br> 부족한 이더는 유경이한테 문의하세요.<br> 본 슬롯 게임은 단순히
					기분으로 하는 게임입니다.<br>
				</p>
			</div>

			<table class="table eq-ui-data-table z-depth-1" style="width: 100%;">
				<tbody>
					<tr>
						<td
							class="eq-ui-data-table-cell-non-numeric eq-ui-data-table-cell-truncate">시작일
							: <fmt:formatDate type="both" pattern="yyyy-MM-dd"
								value="${dto.eve_start}" />
						</td>
					</tr>
					<tr>
						<td
							class="eq-ui-data-table-cell-non-numeric eq-ui-data-table-cell-truncate">종료일
							: <fmt:formatDate type="both" pattern="yyyy-MM-dd"
								value="${dto.eve_end}" />
						</td>
					</tr>

					<tr>
						<td colspan="2" align="right"><input class="btn btn-primary"
							type="button" onclick="window.history.back();" value="목록">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<!-- FOOTER  -->
	<%@ include file="../../Template/footer.jsp"%>
</body>

<script type="text/javascript">
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
				alert("지갑 파일을 선택해주세요.")
			}
		});
	}

	function spin() {
		/* var address = $('#address').val(); */
		var from = $('#from').val();
		var password = $('#password').val();
		var value = $('#bet_amount').val();
		var alldata = {
			'from' : from,
			'password' : password,
			'value' : value
		};
		$('#messages').html("결과를 출력중입니다.");

		$.ajax({
			url : "${pageContext.request.contextPath}/slotResult",
			type : "GET",
			data : alldata,
			dataType : "JSON",
			success : function(data) {
				$('#first').html(data.n1);
				$('#second').html(data.n2);
				$('#third').html(data.n3);
				if (data.result == "true") {
					$('#messages').html(
							"축하합니다. " + data.reword + "ETH를 얻으셨습니다.");
				} else {
					$('#messages').html("다음기회를 이용해주세요.");
				}
			},
			error : function() {
				alert("지갑 파일을 선택해주세요.")
			}
		});
	}
</script>
</html>