<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="./setting.jsp"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>BenkFit</title>
<script type="text/javascript">
	function marketprice(){
		 $.ajax({
             type: "POST",
             url : "${pageContext.request.contextPath}/marketprice",
             success: function(data) {
               $("#priceTbl").html(data);
             },
             beforeSend:function(xhr){
                 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
             },
             error: function() {
               alert("error");
             }
           });
	}
</script>
</head>
<body onload="marketprice();">
  <!-- TOP&SIDE -->
  <%@ include file="./top.jsp"%>
  
  <div style="margin: 100px 0px; text-align: center;">
  	<div style="display: inline-block; width: 100%;">
  		<%-- <%@ include file="./NewFile.jsp"%> --%>
  	</div>
  </div>
  
  <!-- CONTENT -->
  <div>
  <div id="priceTbl" style="height: 4000px;">
  </div>
  </div>
  <%@ include file="./footer.jsp"%>
</body>
</html>