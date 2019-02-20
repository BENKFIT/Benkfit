<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
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
	<%@ include file="../Template/top.jsp"%>
	<div style="margin-top: -30px; height: 40%; width: 100%; text-align: center;">
		<div style="display: inline-block; width: 60%; margin: 200px 0px;">
			<p class="title">Create Wallet</p>
			<p>생성할 계정의 패스워드를 입력하세요.</p><br>
			<input type="password" id="password" value="password">
			<input type="button" value="확인" onclick="create();">
			<br><br><br>
			<p>
			당신의 지갑은 키스토어로 만들어집니다.<br>
			당신의 지갑 계정은 서버에 안전하게 귀속됩니다.<br>
			당신의 지갑으로 이더 거래, 토큰까지 받을 수 있습니다.<br>
			계정 생성이 완료되면 당신의 지갑주소를 알려드리겠습니다.<br>
			절대로 잊어버리지 마세요.<br>
			우리는 보안에 최선을 다 할 것입니다.<br><br>
			현재 풀노드의 수..... 5<br>
		</p>
		</div>
	</div>
	<br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br>
	<div id="accountInfo">
	</div><br><br><br><br><br><br>
	<!-- FOOTER  -->
	<%@ include file="../Template/footer.jsp"%>
</body>
<script type="text/javascript">
	function create(){
		var password = $('#password').val();
		var alldata = {'password':password};
		$('#accountInfo').html("계정을 생성중입니다.");
		
		$.ajax({
			url:"${pageContext.request.contextPath}/createAccount",
			type : "GET",
			data : alldata,
			success : function(data){
				if(data){
					$('#accountInfo').html(data);
				}else{
					$('#accountInfo').html("다시 시도해주세요.");
				}
			},
			error : function(){
				alert("오류")
			}
		});
	}
</script>
</html>