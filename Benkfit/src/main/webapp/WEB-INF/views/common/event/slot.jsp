<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<html>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
body {
	text-align: center;
}

input, select {
	padding: 6px 10px;
	margin: 4px 0;
	display: inline-block;
	border: 1px solid #FFD662;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=button] {
	border: none;
	border-radius: 4px;
	cursor: pointer;
	background-color: #FFD662;
	color: white;
}

input[type=button]:hover {
	color: black;
}

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

.inputButton {
	background: #FFD662;
}
#from{
	padding: 6px 10px;
	margin: 4px 0;
	display: inline-block;
	border: 1px solid #FFD662;
	border-radius: 4px;
	box-sizing: border-box;
}
</style>
<body>

	<!-- TOP&SIDE -->
	<%@ include file="../../Template/top.jsp"%>

	<input type="hidden" name="eve_num" value="${dto.eve_num}">
	<input type="hidden" name="pageNum" value="${pageNum}">

	<div
		style="margin-top: -30px; width: 100%; text-align: center;">
		<div style="display: inline-block; width: 60%; margin: 200px 0px 0px 0px;">
			<p class="title">ETH Slots</p>
			<br>
			<table class="table table-hover" style="width: 100%;">
				<thead>
					<tr style="background: #FFD662">
						<th style="width: 80%;">제목</th>
						<th style="width: 20%; text-align: center">등록일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td align="left">${dto.eve_title}</td>
						<td align="center"><fmt:formatDate type="both"
								pattern="yyyy-MM-dd" value="${dto.eve_regDate}" /></td>
					</tr>
				</tbody>
			</table>

			<div class="wrapper">
				<p class="login">
					ID: <input type="file" id="from"><!-- <input type="text" id="address"> --> 
					Password: <input type="password" id="password" value="password"> 
					<input type="button" value="잔고확인" onClick="Balance();">
					
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
							fill="#FFD662" id="first">
	                7
	            </text>
	
	            <text x="700" y="415" font-family="courier" font-size="500"
							fill="#FFD662" id="second">
	                7
	            </text>
	
	            <text x="1260" y="415" font-family="courier"
							font-size="500" fill="#FFD662" id="third">
	                7
	            </text>
	        </svg>
				</div>

				<p>
					<select id="bet_amount">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
					</select> <input type="button" value="Spin" onClick="spin()">
				</p>

				<p id="balance"></p>

				<p id="messages"></p>
			</div>

			<table class="table table-hover" style="width: 100%;">
				<tbody>
					<tr>
						<td>시작일 : <fmt:formatDate type="both" pattern="yyyy-MM-dd"
								value="${dto.eve_start}" /></td>
					</tr>
					<tr>
						<td>종료일 : <fmt:formatDate type="both" pattern="yyyy-MM-dd"
								value="${dto.eve_end}" /></td>
					</tr>

					<tr>
						<td colspan="2" align="right"><input class="inputButton"
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
	function Balance(){
		/* var address = $('#address').val(); */
		var from = $('#from').val();
		var alldata = {"from":from};
		$('#balance').html("잔액을 조회중입니다.");
		
		$.ajax({
			url:"${pageContext.request.contextPath}/Balance",
			type : "GET",
			data : alldata,
			success : function(data){
				$('#balance').html(data);
			},
			error : function(){
				alert("오류")
			}
		});
	}
	
	function spin(){
		/* var address = $('#address').val(); */
		var from = $('#from').val();
		var password = $('#password').val();
		var value = $('#bet_amount').val();
		var alldata = {'from':from,'password':password,'value':value};
		$('#messages').html("결과를 출력중입니다.");
		
		$.ajax({
			url:"${pageContext.request.contextPath}/slotResult",
			type : "GET",
			data : alldata,
			dataType : "JSON",
			success : function(data){
				$('#first').html(data.n1);
				$('#second').html(data.n2);
				$('#third').html(data.n3);
				if (data.result == "true") {
					$('#messages').html("축하합니다. "+data.reword+"ETH를 얻으셨습니다.");
				} else {
					$('#messages').html("다음기회를 이용해주세요.");
				}
			},
			error : function(){
				alert("오류")
			}
		});
	}
</script>
</html>