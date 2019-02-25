<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
function setting(){
	var num = $('input[name=num]').val(); 
	var number = "num=" + num;
	alert(num);
	$.ajax({
		type : "POST",
		url : "${pageContext.request.contextPath}/budget",
		data : number,
		success : function(data) {
			
			var num = Number(data.split("/")[0]); 
    	    var budget = Number(data.split("/")[1]); 
    	    var budget1 = Number(data.split("/")[2]); 
    	    var budget2 = Number(data.split("/")[3]); 
    	    var budget3 = Number(data.split("/")[4]);
    	    
    	    google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(drawChart);
			
			function drawChart(data) {
				var data = google.visualization.arrayToDataTable([
				   	['DAY', '예산', '지출액'],
				    ['1', 	num,     budget],
				    ['10',  num,    budget1],
				    ['20',  num,   budget2],
				    ['30', num,   budget3] 
				 ]);
			  var options = {
			  	legend: 'none',
			    title: '자산관리',
			    hAxis: {title: 'DAY',  titleTextStyle: {color: '#333'}},
			    vAxis: {minValue: 0, maxValue:${budget+budget1+budget2+budget3+500000}},
			    series: {
			      0: { color: '#ccc' },
			      1: { color: '#FFD662' },       
			       }
			   };
			  var chart = new google.visualization.AreaChart(document.getElementById('chart'));
			  chart.draw(data, options);
			  } 
			alert("성공");
		},	
		error : function() {
			alert('통신실패!!');
		}
	});
}
</script>
</head>
<body>
	<%@ include file="../Template/top.jsp"%>
	<div class="wrapper">
		<h2>결산</h2>
			<div style="display: -webkit-box;">
				예산 : <input name="num" type="text" onchange="getNumber(this);"
					placeholder="숫자만 입력" onkeyup="getNumber(this);" id="num"
					style="text-align: right;"> <br>
					<button class="btn2 btn2-success" id="bu" onclick="setting();">설정</button>&nbsp;
			</div>
			<script type="text/javascript">
			
			</script>
			<div id="chart"></div>
	</div>
	<%@ include file="../Template/footer.jsp"%>
</body>
</html>