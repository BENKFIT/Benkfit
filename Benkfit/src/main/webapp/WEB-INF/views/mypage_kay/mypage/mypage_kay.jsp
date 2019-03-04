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
<link
	href="/benkfit/resources/assets/css/exentriq-bootstrap-material-ui.min.css?v=0.4.5"
	rel="stylesheet">
<link href="/benkfit/resources/assets/css/doc.css?v=0.4.5"
	rel="stylesheet">
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
			var num	 = Number(data.split("/")[0]); 
    	    var budget = Number(data.split("/")[1]); 
    	    var budget1 = Number(data.split("/")[2]); 
    	    var budget2 = Number(data.split("/")[3]); 
    	    var budget3 = Number(data.split("/")[4]);
    	    if(num < budget3){
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
			    height:380,
			    width:500,
			    hAxis: {title: 'DAY',  titleTextStyle: {color: '#ccc'}},
			    vAxis: {minValue: 0, maxValue:${budget+budget1+budget2+budget3+1000000}},
			    series: {
			      0: { color: '#489CFF' },
			      1: { color: '#FF3636' },       
			       }
			   };
			  var chart = new google.visualization.AreaChart(document.getElementById('chart'));
			  chart.draw(data, options);
			  window.addEventListener('resize', function() { chart.draw(data, options); }, false);
			  } 
			 google.charts.setOnLoadCallback(drawChart);
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
		<div class="mypage"
			style="height: 700px; width: 1120px; border: 1px solid #ccc;">
			<h1 style="padding-left:22px; text-align:center;">My Page</h1>
			<hr style="width: 1100px;">
			<div
				style="width: 530px; height: 600px; display: inline-block; padding:20px;">
				<div class="panel-body">
					<div class="User_Profile">
						<p><h1>${usVO.c_name}&nbsp;&nbsp;<span style="font-size:18px;">회원님</span></h1></p>
					</div>
					<ul class="User_Profile details" style="padding: 0px;">
						<hr>
						<li>
							<p style="font-size:20px;">	
								<span class="glyphicon glyphicon-phone one" style="width:350px; font-size:20px;">
								 연락처 : ${usVO.c_hp}</span>
							</p>
						</li>
						<li>
						<p>
							<span class="glyphicon glyphicon-envelope one"
									style="width:350px; font-size:20px;">
									이메일 :  ${usVO.c_email}</span>
									
							</p></li>
						<li><p>
								<span class="glyphicon glyphicon-ok-circle" style="width:350px; font-size:20px;">
								 가입일 :  ${usVO.c_regDate}</span>
								
							</p></li>
						<li>
							<hr>
							<br>
							<button class="btn btn-success eq-ui-waves-light"
								onclick="window.location='qrcode'">qrcode</button>&nbsp;
							<button class="btn btn-success eq-ui-waves-light"
								onclick="window.location='myinfoPw'">정보수정</button>&nbsp;
							<button class="btn btn-success eq-ui-waves-light"
								onclick="window.location='document'">내서류목록</button> &nbsp;
							<button class="btn btn-success eq-ui-waves-light"
								onclick="window.location='limit_sel'">이체한도조회/수정</button>&nbsp;
						</li>
					</ul>
				</div>
			</div>
			
			<div
				style="width: 550px; padding: 10px; display: inline-block; position: absolute;">
					<div class="panel-body">
				<h3>자산관리</h3>
				<br> <label for="num">예산</label> <input type="text" name="num"
					id="num" style="text-align: right;" placeholder="숫자만입력"
					class="eq-ui-input"
					onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
				<button class="btn btn-primary eq-ui-waves-light"
					onclick="setting();">설정</button>
				<div id="chart"></div>
			</div>
			</div>
		</div>
		<br>
			<div id="tab1" class="acc_content">
				<!--Content-->
				<h3>예금관리</h3>
				<hr>
				<table class="table table-hover">
					<thead style="background-color: #2980b9; color: white;">
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
								<td>￦<fmt:formatNumber value="${cheq.myCheq_amount}"
										pattern="#,###.##" /></td>
								<td><button class="btn btn-success eq-ui-waves-light"
									onclick="window.location='cheq_account?account=${cheq.myCheq_account}'">조회</button>&nbsp;
									<button class="btn btn-danger eq-ui-waves-light"
									onclick="window.location='delcheq?account=${cheq.myCheq_account}'">해지</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br>
				<h3>적금관리</h3>
				<hr>
				<table class="table table-hover">
					<thead style="background-color: #2980b9; color: white;">
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
								<td>${sav.mySav_name}</td>
								<td>${sav.mySav_account}</td>
								<td>￦<fmt:formatNumber value="${sav.mySav_amount}"
										pattern="#,###.##" /></td>
								<td><button class="btn btn-success eq-ui-waves-light"
									onclick="window.location='sav_account?account=${sav.mySav_account}'">조회</button> &nbsp; <button
									class="btn btn-danger eq-ui-waves-light" onclick="window.location='delsav?account=${sav.mySav_account}'">해지</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br>
				<h3>대출관리</h3>
				<hr>
				<table class="table table-hover">
					<thead style="background-color:#2980b9;color:white;">
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
								<td>${loan.loan_num}</td>
								<td>${loan.myloan_account}</td>
								<td>￦<fmt:formatNumber value="${loan.myloan_amount}"
										pattern="#,###.##" /></td>
								<td>${loan.myloan_date}</td>
								<td>${loan.myloan_late}</td>
								<td><button class="btn btn-success eq-ui-waves-light"
									onclick="window.location='loan_account?account=${loan.myloan_account}'">조회</button> &nbsp; <button
									class="btn btn-danger eq-ui-waves-light" onclick="window.location='delsav?account=${loan.myloan_account}'">상환</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
	</div>
	<%@ include file="../../Template/footer.jsp"%>
</body>


</html>