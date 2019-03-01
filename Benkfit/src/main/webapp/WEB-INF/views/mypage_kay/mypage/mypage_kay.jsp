<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="msapplication-tap-highlight" content="no">
<meta name="description"
	content="Implements Google's Material Design in Bootstrap.">
<!-- CSS-->
<link href="/benkfit/resources/assets/css/exentriq-bootstrap-material-ui.min.css?v=0.4.5" rel="stylesheet">
<link href="/benkfit/resources/assets/css/doc.css?v=0.4.5" rel="stylesheet">
<title>마이페이지</title>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script>
function setting(){
	var num = $('input[name=num]').val(); 
	var number = "num=" + num;
	$.ajax({
		type : "POST",
		url : "${pageContext.request.contextPath}/budget",
		data : number,
		success : function(data) {
			
			var num = Number(data.split("/")[0]); 
    	    var budget = Number(data.split("/")[1]); 
    	    var budget1 = Number(data.split("/")[2]); 
    	    var budget2 = Number(data.split("/")[3]); 
    	    var budgetas = Number(data.split("/")[4]);
    	    
    	    if(num < budgetas){
    	    	swal("경고","예산보다 지출이 더 많습니다.","warning");
    	    }
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
			    width : 500,
				height : 380,
			    hAxis: {title: 'DAY',  titleTextStyle: {color: '#333'}},
			    vAxis: {minValue: 0, maxValue:${budget3+1000000}},
			    series: {
			      0: { color: '#ccc' },
			      1: { color: '#FFD662' },       
			       }
			   };
			  var chart = new google.visualization.AreaChart(document.getElementById('chart'));
			  chart.draw(data, options);
			  } 
		},	
		error : function() {
			alert('통신실패!!');
		}
	});
};
</script>
</head>
<body class="body">
	<%@ include file="../../Template/top.jsp"%>
	<div class="wrapper">
			<div class="mypage" style="height:700px; width: 1000px; border:1px solid #ccc;">
				<h1 style="padding-left:22px;">My Page</h1>
				<hr style="width:950px;">
				<div style="width: 430px;height:600px; display:inline-block; padding:15px; " >
					<div class="panel-body">
						<div class="User_Profile">
							<h2>${usVO.c_name}&nbsp;&nbsp;[${usVO.c_id}]</h2>
						</div>
						<ul class="User_Profile details" style="padding: 0px;">
						
							<li>
								<hr><p>
									<span class="glyphicon glyphicon-phone one"
										style="width: 50px;"></span> ${usVO.c_hp}
								</p></li>
							<li><p>
									<span class="glyphicon glyphicon-envelope one"
										style="width: 50px;"></span> ${usVO.c_email}
								</p></li>
							<li><p>
									<span class="glyphicon glyphicon-ok-circle"
										style="width: 50px;"></span> ${usVO.c_regDate}
								</p></li>
							<li>
								<hr>
								<button class="btn btn-success eq-ui-waves-light"
									onclick="move(7)">qrcode</button>&nbsp;
								<button class="btn btn-success eq-ui-waves-light"
									onclick="move(8)">정보수정</button>&nbsp;
								<button class="btn btn-success eq-ui-waves-light"
									onclick="move(9)">내서류</button>
								<br>
							<br>
								<button class="btn btn-success eq-ui-waves-light"
									onclick="move(5)">이체한도</button>&nbsp;
								<button class="btn btn-success eq-ui-waves-light"
									onclick="move(6)">서류양식</button>&nbsp;
							</li>
						</ul>
					</div>
			</div>
			<div style="width: 500px; padding:10px; 
			display:inline-block; position:absolute;" >
				<h3>자산관리</h3>
				<br>
				<label for="num">예산</label>
					<input type="text" name="num" id="num" style="text-align: right;"
						placeholder="숫자만입력" class="eq-ui-input"
						onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" /> 
					<button class="btn btn-primary eq-ui-waves-light"
						onclick="setting();">설정</button>
					<div id="chart"></div>
				</div>
			</div>
			<br>
			<form method="post" name="mypage">
			<div id="tab1" class="acc_content">
				<!--Content-->
				<h3 >예금관리</h3>			
				<hr>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>계좌명</th>
							<th>계좌번호</th>
							<th>잔액</th>
							<th>조회/이체</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="cheq" items="${cheq}">
						<tr>
							<td>1</td>
							<td>${cheq.cheq_num}</td>
							<td>${cheq.myCheq_account}</td>
							<td>￦<fmt:formatNumber value="${cheq.myCheq_amount}" pattern="#,###.##"/></td>
							<td>	
							<a class="btn btn-primary eq-ui-waves-light"
								onclick="window.location='cheq_account?account=${cheq.myCheq_account}'">조회</a>&nbsp;
							<a class="btn btn-danger eq-ui-waves-light"
								onclick="window.location='delcheq?account=${cheq.myCheq_account}'">해지</a>
							
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<br>
				<h3>적금관리</h3>
				<hr>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>계좌명</th>
							<th>계좌번호</th>
							<th>잔액</th>
							<th>조회/이체</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="sav" items="${sav}">
						<tr>
							<td>${num}</td>
							<td>${sav.mySav_name} </td>
							<td>${sav.mySav_account} </td>
							<td>￦<fmt:formatNumber value="${sav.mySav_amount}" pattern="#,###.##"/></td>
							<td>
								<a class="btn btn-primary eq-ui-waves-light" onclick="move(13)">조회</a>
								&nbsp;
								<a class="btn btn-danger eq-ui-waves-light" onclick="move(14)">해지</a>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<br>
				<h3>대출관리</h3>
				<hr>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>대출상품번호</th>
							<th>계좌번호</th>
							<th>잔액</th>
							<th>대출일</th>
							<th>만기일</th>
							<th>조회/상환</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="loan" items="${loan}">
						<tr>
							<td>${loan.loan_num} </td>
							<td>${loan.myloan_account} </td>
							<td>￦<fmt:formatNumber value="${loan.myloan_amount}" pattern="#,###.##"/></td>
							<td>${loan.myloan_date}</td>
							<td>${loan.myloan_late}</td>
							<td>
								<a class="btn btn-primary eq-ui-waves-light" onclick="move(3)">조회</a>
								&nbsp;
								<a class="btn btn-danger eq-ui-waves-light" onclick="move(4)">상환</a>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			</form>
		</div>
	<%@ include file="../../Template/footer.jsp"%>
</body>
<script
	src="/benkfit/resources/assets/js/vendor/jquery/dist/jquery.min.js?v=2.1.4"></script>
<script
	src="/benkfit/resources/assets/js/vendor/moment/min/moment.min.js?v=2.13.0"></script>
<script
	src="/benkfit/resources/assets/js/vendor/jquery-timeago/jquery.timeago.js?v=1.4.3"></script>
<script
	src="/benkfit/resources/assets/js/exentriq-bootstrap-material-ui.min.js?v=0.4.5"></script>

<script src="/benkfit/resources/assets/js/tp/tp-color.html"
	type="riot/tag"></script>
<script
	src="/benkfit/resources/assets/js/vendor/riot/riot+compiler.min.js?v=2.3.0"></script>

<script src="https://unpkg.com/lodash@4.16.0"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://unpkg.com/vue@2.5.21/dist/vue.js"></script>

<script src="/benkfit/resources/assets/js/doc.js?v=0.4.5"></script>
<script src="/benkfit/resources/assets/js/ctrl/ctrl-color.js"></script>
<script src="/benkfit/resources/assets/js/vue/collapsible.js"></script>
<script src="/benkfit/resources/assets/js/vue/dropdown.js"></script>
<script src="/benkfit/resources/assets/js/vue/tabs.js"></script>

</html>