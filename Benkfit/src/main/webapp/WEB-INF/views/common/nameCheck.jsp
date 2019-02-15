<!-- 2019/01/25 손리아 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실명확인</title>
<style>
	.nameCheckDiv {
		padding: 35px;
		text-align:center;
	}
	.nameCheckDiv span {
		font-size:25px;
		text-align:center;
	}
	
	.btn {
		margin:15px;
		background:#FFD662;
		text-align:center;
		color:#FFF; 
		font-size:20px;
		width:100px;
		height:50px; 
	}
	
</style>

<script type="text/javascript">
	function comfirm() {
		opener.document.signIn.hiddenJumin.value="1";
		self.close();
		
	}
	
	function fail() {
		opener.document.signIn.hiddenJumin.value="2";
		self.close();
	}
</script>
</head>
<body>
	
	<c:if test="${selectCnt == 1}">
		<div class="nameCheckDiv">
			<span>실명인증 완료</span>
			<input type="button" class="btn" value="확인" onclick="comfirm();">
		</div>
	</c:if>
	
	<c:if test="${selectCnt != 1}">
		<div class="nameCheckDiv">
			<h3>실명인증 실패</h3>
			<input type="button" class="btn" value="확인" onclick="fail();">
		</div>
	</c:if>

</body>
</html>