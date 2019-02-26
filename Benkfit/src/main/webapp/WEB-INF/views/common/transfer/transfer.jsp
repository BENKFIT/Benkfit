<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<html>
<title>간편 송금하기</title>
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
			<p class="title">간편 송금하기</p>
			<p>당신의 키스토어와 상대방의 계정 주소로 간단히 이더를 보내세요.</p>
			<div class="wrapper">
				<p class="login">
					<input type="file" id="from"> <input type="button"
						value="잔고확인" onClick="Balance();"> <br>
				</p>
				<p id="balance"></p>
				<br>
				<p>
					보낼 이더 : <input type="text" id="value"> ETHER<br>
					<br> 받을 계정 : <input type="text" id="to">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
					<br> password : <input type="password" id="password"
						value="password"> <input type="button" value="보내기"
						onclick="transfer();">
				</p>
			</div>
		</div>
	</div>
	<div id="success"></div>
	<div id="tx"></div>
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
					$('#success').html(value + "이더를 전송하였습니다.");
					$('#tx').html("해당거래주소 : "+data.Tx_hash);
				}else{
					$('#success').html("해당 거래가 성사되지 않았습니다.");
				}
			},
			error : function() {
				alert("지갑파일을 선택해주세요.")
				$('#success').html("다시 시도해주세요.");
			}
		});
	}
</script>

=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<html>
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
#from{
	padding: 6px 10px;
	margin: 4px 0;
	display: inline-block;
	border: 1px solid #FFD662;
	border-radius: 4px;
	box-sizing: border-box;
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
	<%@ include file ="../../Template/top.jsp" %>

	<div style="margin-top: -30px; height: 40%; width: 100%; text-align: center;">
		<div style="display: inline-block; width: 60%; margin: 200px 0px;">
			<p class="title">간편 송금하기</p>
			<p>당신의 키스토어와 상대방의 계정 주소로 간단히 이더를 보내세요.</p>
			<div class="wrapper">
				<p class="login">
					<input type="file" id="from">
	   	     		<input type="button" value="잔고확인" onClick="Balance();"> <br>
				</p>
				<p id="balance"></p> <br>
				<p>
					보낼 이더 : <input type="text" id="value"> ETHER<br><br>
					받을 계정 : <input type="text" id="to"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
					password : <input type="password" id="password" value="password"> 
						  <input type="button" value="보내기" onclick="transfer();">
				</p>
			</div>
		</div>
	</div>
	<div id="success">
	
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<%@ include file="../../Template/footer.jsp"%>
</body>	

	<script type="text/javascript">
	function Balance(){
		/* 계정주소 직접입력으로 잔액 조회하기
		var address = $('#address').val(); 
		var alldata = {"address":address};*/
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
	
	function transfer(){
		var password = $('#password').val();
		var from = $('#from').val();
		var value = $('#value').val();
		var to = $('#to').val();
		var alldata = {'password':password,'from':from, 'value':value, 'to':to}
		$('#success').html("송금을 요청중입니다.");
		
		$.ajax({
			url:"${pageContext.request.contextPath}/transferPro",
			type : "GET",
			data : alldata,
			dataType : "JSON",
			success : function(data){
				$('#success').html(value+"이더를 전송하였습니다.");
			},
			error : function(){
				alert("오류")
			}
		});
	}
</script>

>>>>>>> branch 'master' of https://github.com/BENKFIT/benkfit.git
</html>