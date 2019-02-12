<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
<html>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	function loan(){
		var value = $('#value').val();
		var alldata = {'value':value}
		
		$ajax({
			
		});
	}
</script>
<body>
<h3>대출 신청</h3>
	<!-- <input type="hidden" id="id" value="id"> -->
	<input type="text" id="value" value="value">
	<input type="button" onclick="loan();">
	<!-- FOOTER  -->
	<%@ include file="../Template/footer.jsp"%>
</body>
</html>