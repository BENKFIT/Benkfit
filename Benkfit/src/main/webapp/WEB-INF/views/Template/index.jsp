<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="./setting.jsp"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>BenkFit</title>
<script type="text/javascript">
     /* 
    window.onload = function() {
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
    }  
    }  */
</script>
</head>
<body>
  <!-- TOP&SIDE -->
  <%@ include file="./top.jsp"%>
<%--  <%@ include file="./NewFile.jsp"%> --%>
  
  <!-- CONTENT -->
  <div>
  <div id="priceTbl" style="height:4000px;">
  </div>
  </div>
  
  <!-- FOOTER  -->
  <%@ include file="./footer.jsp"%>

</body>
</html>