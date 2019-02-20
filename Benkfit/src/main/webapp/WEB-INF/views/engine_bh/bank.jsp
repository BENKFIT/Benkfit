<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1./js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
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

<%@ include file ="../Template/top.jsp" %>

	<div style="margin-top: -30px; height: 40%; width: 100%; text-align: center;">
		<div style="display: inline-block; width: 60%; margin: 200px 0px;">
			<p class="title">간편 은행</p>
			<p>당신의 지갑으로 예금을 간편히 즐기세요.
				이더를 간직하고 보관하세요!
			</p>
			<div class="wrapper">
				<p class="login">
					<input type="file" id="from">
		   	     	<input type="button" value="잔고확인" onClick="Balance();"> <br>
				</p>
				<p id="balance"></p> <br>
				금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액 : <input type="text" id="value"><br>
				비밀번호 : <input type="password" id="password" value="password"><br><br>
				<input type="button" value="입금" onclick="deposit();">
				<input type="button" value="출금" onclick="bankWithdraw();">
				<input type="button" value="예금조회" onclick="bankBalance();">
				
				<div id="state">
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<%@ include file="../Template/footer.jsp"%>
</body>
<script type="text/javascript">
	function Balance(){
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
	
	function deposit(){
		var from = $('#from').val();
		var value = $('#value').val();
		var password = $('#password').val();
		var alldata = {'from':from, 'value':value,'password':password};
		$('#state').html("입금중입니다.");
		
		$.ajax({
			url:"${pageContext.request.contextPath}/depositPro",
			type : "GET",
			data : alldata,
			success : function(data){
				$('#state').html("입금완료되었습니다. 잔액을 확인해보세요.");
			},
			error : function(){
				alert("오류")
			}
		});
	}
	
	function bankBalance(){
		var from = $('#from').val();
		var password = $('#password').val();
		var alldata = {'from':from, 'password':password};
		$('#state').html("통장 잔액을 조회중입니다.");
		
		$.ajax({
			url:"${pageContext.request.contextPath}/bankBalance",
			type : "GET",
			data : alldata,
			success : function(data){
				$('#state').html("통장의 잔액은 "+data+"ETH 입니다.");
			},
			error : function(){
				alert("오류")
			}
		});
	}
	
	function bankWithdraw(){
		var from = $('#from').val();
		var value = $('#value').val();
		var password = $('#password').val();
		var alldata = {'from':from, 'value':value,'password':password};
		$('#state').html("출금중입니다.");
		
		$.ajax({
			url:"${pageContext.request.contextPath}/bankWithdraw",
			type : "GET",
			data : alldata,
			success : function(data){
				$('#state').html("출금완료되었습니다. 잔액을 확인해보세요.");
			},
			error : function(){
				alert("오류")
			}
		});
	}
</script>
</html>