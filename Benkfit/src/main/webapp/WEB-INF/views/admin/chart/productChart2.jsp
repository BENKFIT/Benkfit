<!-- 송운선 2019-01-22 17:43 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<html>
<head>
<!-- google charts -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<style>
input[type=button] {
	background: #FFD662;
	margin: 0px 5px;
	border: none;
	border-radius: 10px;
	width: 100px;
}

#curve_chart {
	width: 1000px;
	height: 600px
}
</style>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>
	<div style="text-align: center;">
		<table style="margin-top: 200px; display: inline-block;">
			<tr>
				<td><input id="btn" class="inputButton" type="button"
					value="연(年)별"></td>
				<td><input id="btn1" class="inputButton" type="button"
					value="월별"></td>
				<td><input id="btn2" class="inputButton" type="button"
					value="일별"></td>
			</tr>
		</table>
	</div>
	<div id="curve_chart"></div>

	<%@ include file="../../Template/footer.jsp"%>
</body>
<script type="text/javascript">
	var queryObject = "";
	var queryObjectLen = "";

	$('#btn').click(
			function() {
				$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/chartYear_sws',
					success : function(data) {
						queryObject = JSON.parse(data);
						queryObjectLen = queryObject.barlist.length;

						google.charts.load('current', {
							'packages' : [ 'corechart' ]
						});
						google.charts.setOnLoadCallback(drawChart);

						function drawChart() {
							var data = google.visualization.arrayToDataTable([
									[ 'Month', 'Skole1', 'Skole2', 'Skole3' ],
									[ 'Januar', 1000, 400, 500 ],
									[ 'Februar', 1720, 460, 700 ],
									[ 'Marts', 660, 1120, 800 ],
									[ 'April', 600, 540, 500 ],
									[ 'Maj', 200, 540, 600 ],
									[ 'Juni', 1150, 600, 800 ],
									[ 'Juli', 125, 500, 950 ],
									[ 'August', 800, 1000, 500 ],
									[ 'September', 1200, 1200, 800 ],
									[ 'Oktober', 1200, 800, 600 ],
									[ 'November', 1100, 950, 750 ],
									[ 'December', 1030, 1000, 600 ] ]);

							var options = {
								title : 'Antal svar',
								curveType : 'function',
								legend : {
									position : 'bottom'
								},
								explorer : {
									maxZoomOut : 2,
									keepInBounds : true
								}
							};

							var chart = new google.visualization.LineChart(
									document.getElementById('curve_chart'));

							chart.draw(data, options);
						}
					},
					error : function() {
						alert('server error occured');
					}
				});
			});
</script>
</html>