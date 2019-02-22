</html><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ include file="../Template/setting.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자산관리</title>
<!-- <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
    	 var result = '${chartvo}';
    	 alert(result);
        var data = google.visualization.arrayToDataTable();
        data.addColumn('계좌' , '이체 수');
        var dataRow = [];
        for(var i = 0; i <= result.length(); i++){ 
          account  = result[i][0];
          count = result[i][1];
          alert("카운트 : "+account);
          dataRow = [new Date (count, account)];
          data.addRow(dataRow);
        }
        var options = {
          title: '자주이체하는 계좌'
        };
        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        chart.draw(data, options);
      }
    </script> -->
</head>
<body>
	<%@ include file ="../Template/top.jsp" %>
	<div class="wrapper">
		<h3>자산관리</h3>
		<hr>
   		<div id="piechart" style="width: 900px; height: 500px;"></div>
	</div>
	<%@ include file ="../Template/footer.jsp" %>
</body>
</html>