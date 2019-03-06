<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="./setting.jsp"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>BenkFit</title>
<script type="text/javascript">
     window.onload = function() {
      /* setInterval(function() { */
        $.ajax({
              type: "POST",
              url : "${pageContext.request.contextPath}/marketprice",
              success: function(data) {
                $("#priceTbl").html(data);
              },
              error: function() {
                alert("error");
              }
            });
       /*  }, 1000) */
    }
</script>
</head>
<body>
  <!-- TOP&SIDE -->
  <%@ include file="./top.jsp"%>
  
  <div style="margin: 100px 0px; text-align: center;">
  	<div style="display: inline-block; width: 100%;">
  		<%@ include file="./NewFile.jsp"%>
  	</div>
  </div>
  
  <!-- CONTENT -->
  <div>
  <div id="priceTbl" style="height:4000px;">
  </div>
  </div>
  <%@ include file="./footer.jsp"%>

  
<%@ include file="./footer.jsp"%>
</body>
</html>