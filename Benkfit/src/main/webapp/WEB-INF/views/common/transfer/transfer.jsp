<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<html>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	function Balance(){
		/* 계정주소 직접입력으로 잔액 조회하기
		var address = $('#address').val(); 
		var alldata = {"address":address};*/
		var from = $('#from').val(); 
		var alldata = {"from":from};
		
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
		
		$.ajax({
			url:"${pageContext.request.contextPath}/transferPro",
			type : "GET",
			data : alldata,
			dataType : "JSON",
			success : function(data){
				$('#success').html(ether+"이더를 전송하였습니다.");
			},
			error : function(){
				alert("오류")
			}
		});
	}
</script>
<body>
<h3>간편송금하기</h3>
	<p class="login">
		_from : <input type="file" id="from"><br>
	   	     	<input type="button" value="잔고확인" onClick="Balance();"> <br>
	</p>
	<p id="balance"></p> <br>
	<p>
		transfer : <input type="text" id="value" value="value"> ETHER<br>
		_to : <input type="text" id="to" value="to"> <br>
		PWD : <input type="password" id="password" value="password"> 
			  <input type="button" value="보내기" onclick="transfer();">
	</p>
	<div id="success">
	
	</div>
</body>
</html>