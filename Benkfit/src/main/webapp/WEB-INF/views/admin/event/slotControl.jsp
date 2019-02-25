<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<html>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">

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

#from {
	padding: 6px 10px;
	margin: 4px 0;
	display: inline-block;
	border: 1px solid #FFD662;
	border-radius: 4px;
	box-sizing: border-box;
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

<body>

	<%@ include file="../../Template/top.jsp"%>

	<div
		style="margin-top: -30px; height: 40%; width: 100%; text-align: center;">
		<div style="display: inline-block; width: 60%; margin: 200px 0px;">
			<p class="title">슬롯 관리</p>
			<p>슬롯에 잔고가 남아있지 않으면 슬롯이 정상적으로 작동하지 않습니다.</p>
			<div class="wrapper">
				<p class="login">
					관리자계정 :<input type="file" id="from"><br> 
					비밀번호 : <input type="password" id="password" value="password"><br>
					<br> <input type="button" value="슬롯잔액조회"
						onClick="slotStockBalance();"> <br>
				</p>
				<p id="balance"></p>
				<br> 금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액 : <input
					type="text" id="value" placeholder="계정과 비밀번호도 입력해주세요."><br>
				<br> <input type="button" value="슬롯잔액채우기"
					onclick="slotStock();">

				<div id="state"></div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
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
				alert("오류")
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
				alert("오류")
			}
		});
	}
</script>
</html>