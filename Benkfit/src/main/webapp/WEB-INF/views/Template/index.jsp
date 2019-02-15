<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./setting.jsp"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>BenkFit</title>
<style>
.div1 {
	margin-top: 200px;
	width: 100%;
	background: rgba(0, 0, 0, 0.1);
	height: 500px;
	text-align: center;
}

.div2 {
	width: 100%;
	height: 500px;
	text-align: center;
}

.div3 {
	width: 100%;
	background: rgba(0, 0, 0, 0.1);
	height: 500px;
	text-align: center;
}

img {
	display: inline;
}

tr>td {
	font-size: 20px;
	text-align: center;
}
</style>
<script type="text/javascript">
    window.onload = function() {
      setInterval(function() {
        $.ajax({
              type: "POST",
              url : "${pageContext.request.contextPath}/marketprice",
              success: function(data) {
                $("#wrapper").html(data);
              },
              error: function() {
                alert("error");
              }
            });
        }, 1000)
    }
</script>
</head>
<body>

	<!-- TOP&SIDE -->
	<%@ include file="./top.jsp"%>
<%-- 	<%@ include file="./NewFile.jsp"%> --%>
	
  <%@ include file="../common/chatbot.jsp"%>
  
	<!-- CONTENT -->
	<div>
	<div id="wrapper" style="height:4000px;">
	</div>
  </div>
  
	<!-- TOP, SIDE, FOOTER  -->
	<%@ include file="./top.jsp"%>
	<%@ include file="./footer.jsp"%>

</body>
</html>