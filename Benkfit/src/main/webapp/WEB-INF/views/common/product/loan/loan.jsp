<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../Template/setting.jsp"%>
<html>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	function Balance(){
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
	function loanPro(){
		var from = $('#from').val();
		var value = $('#value').val();
		var to = $('#to').val();
		var password = $('#password').val();
		var alldata = {'from':from, 'value':value, 'to':to, 'password':password}
		$('#state').html("대출을 신청중입니다.");
		
		$ajax({
			url:"${pageContext.request.contextPath}/loanPro",
			type : "GET",
			data : alldata,
			success : function(data){
				$('#state').html("대출 신청이 완료되었습니다.");
			},
			error : function(){
				alert("오류")
			}
		});
	}
</script>
<body>
	<div>
		<h3>대출 신청</h3>
		<p class="login">
			이더확인 : <input type="file" id="from"><br>
		   	     	<input type="button" value="잔고확인" onClick="Balance();"> <br>
		</p>
		<p id="balance"></p> <br>
		<input type="hidden" id="to" value="0xba444a48a264e7fcadd9a60951623e607fee385a">
		담보이더 :<input type="text" id="value" value="value"><br>
		비밀번호 :<input type="password" id="password" value="password"><br>
		<input type="button" value="대출신청" onclick="loanPro();">
		<div id="state">
		</div>
	</div>
	<!-- FOOTER  -->
	<%@ include file="../../../Template/footer.jsp"%>
</body>
</html>