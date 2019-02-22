<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
<%--  <c:set var ="item" value="${chart}"/> --%>
  <script>
  function test(){
		var chart = '${vo}';
		alert(chart);
	/*   $.each(data[0], function(i, item) {
			console.log(key, value);
			alert("data[0]: " );
	   });  */
	 }
	</script>
	<%-- <c:set var="id" value='${chart}' /> --%>
<!-- <script>
	function test(){
		  var data = '${chart}';

	$.each(data, function (idx, row) {
		if (data[idx].NAME == "day") {
			alert("1 : "+ data[idx])
		return data[idx];
		}
		}
	</script> -->
</head>
<body>
	<div class="wrapper">
		<button onclick="test()">test</button>
	</div>
	<div id="result"></div>
</body>
</html>