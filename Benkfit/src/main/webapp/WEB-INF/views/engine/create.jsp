<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
<html>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
					$('#accountInfo').html("계정이 생성되었습니다.");
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
<body>
	<!-- TOP&SIDE -->
	<%-- <%@ include file="../Template/top.jsp"%> --%>
	<div>
		<h1>계정생성하기</h1>
		<p>생성할 계정의 패스워드를 입력하세요.</p>
		<input type="password" id="password" value="password">
		<input type="button" value="확인" onclick="create();">
		<p>
		보안은 모두 당신 책임입니다.
		개인 키와 암호를 안전하게 유지하려면 부지런해야 합니다.<br> 
		개인 키는 키스토어 파일을 의미합니다.<br>
		개인 키 또는 비밀번호를 분실한 경우 복구할 수 없습니다.<br>
		피싱 웹 사이트에서 개인 키를 입력할 경우, 모든 자금을 잃게 될 것입니다.<br>
		</p>
	</div>
	
	<div id="accountInfo">
	
	</div>
	<!-- FOOTER  -->
	<%@ include file="../Template/footer.jsp"%>
</body>
</html>