<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
</head>
<body>
	<div class="wrapper">
   		<div id = "total"></div>
   		<input type="text" id="budget">
		<input type="button" class="btn btn-primary" id ="budget"
			style="color: white; border: 1px solid white; background-color: #C64545; border-radius: 5px; width: 200px; font-size: 20px;"
			data-toggle="modal" data-target="#" value="설정하기">
   	</div>
  	<!-- <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['day', '예산', '지출'],
          ['5',   ,      400],
          ['10',  1000,      460],
          ['15',  1000,      540],
          ['20',  1000,      540],
          ['25',  1000,      540],
          ['30',  1000,     1120]
        ]);
        var options = {
          title: '예산 대비 지출액',
          hAxis: {title: 'day',  titleTextStyle: {color: '#333'}},
          vAxis: {minValue: 0 , maxValue:2000}
        };
        var chart = new google.visualization.AreaChart(document.getElementById('total'));
        chart.draw(data, options);
      }
    </script> -->
</body>
</html>