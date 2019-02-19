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
	<div id="Line_Controls_Chart">
		<!-- 라인 차트 생성할 영역 -->
		<div id="lineChartArea" style="padding: 0px 20px 0px 0px;"></div>
		<!-- 컨트롤바를 생성할 영역 -->
		<div id="controlsArea" style="padding: 0px 20px 0px 0px;"></div>
	</div>
	<%@ include file="../../Template/footer.jsp"%>
</body>

<script type="text/javascript">
	var queryObject = "";
	var queryObjectLen = "";

		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/chartYear_sws',
			success : function(data) {
				queryObject = JSON.parse(data);
				queryObjectLen = queryObject.barlist.length;
				
				var chartDrowFun1 = {
						chartDrow : function() {
							var chartData = '';
					        //날짜형식 변경하고 싶으시면 이 부분 수정하세요.
					        var chartDateformat = '      ';
							//라인차트의 라인 수
							var chartLineCount = 10;
							//컨트롤러 바 차트의 라인 수
							var controlLineCount = 10;

							function drawDashboard() {
								var data = new google.visualization.DataTable();
								//그래프에 표시할 컬럼 추가
								data.addColumn('number', '날짜');
								data.addColumn('number', '예금 가입자 수');
								data.addColumn('number', '적금 가입자 수');
								data.addColumn('number', '대출 가입자 수');

								//그래프에 표시할 데이터
								for (var i = 0; i < queryObjectLen; i++) {
									var day = queryObject.barlist[i].day;
									var value1 = queryObject.barlist[i].value1;
									var value2 = queryObject.barlist[i].value2;
									var value3 = queryObject.barlist[i].value3;

									data.addRow([ day, value1, value2, value3 ]);
								}

								var chart = new google.visualization.ChartWrapper(
										{
											chartType : 'LineChart',
											containerId : 'lineChartArea', //라인 차트 생성할 영역
											options : {
												isStacked : 'percent',
												focusTarget : 'category',
												height : 500,
												width : '100%',
												legend : {
													position : "top",
													textStyle : {
														fontSize : 13
													}
												},
												pointSize : 5,
												tooltip : {
													textStyle : {
														fontSize : 12
													},
													showColorCode : true,
													trigger : 'both'
												},
												hAxis : {
													gridlines : {
														count : chartLineCount,
													},
													textStyle : {
														fontSize : 12
													},
													format: chartDateformat, gridlines:{
														count:chartLineCount,units: {
			                                            	years : {format: ['yyyy년']},
			                                            	months: {format: ['MM월']},
			                                            	days  : {format: ['dd일']},
			                                            	hours : {format: ['HH시']}}
			                                          },textStyle: {fontSize:12}}
												},
												vAxis : {
													minValue : 10,
													viewWindow : {
														min : 0
													},
													gridlines : {
														count : -1
													},
													textStyle : {
														fontSize : 12
													}
												},
												animation : {
													startup : true,
													duration : 1000,
													easing : 'in'
												},
												annotations : {
													textStyle : {
														fontSize : 15,
														bold : true,
														italic : true,
														color : '#871b47',
														auraColor : '#d799ae',
														opacity : 0.8,
													}
												}
											});

								var control = new google.visualization.ControlWrapper(
										{
											controlType : 'ChartRangeFilter',
											containerId : 'controlsArea', //control bar를 생성할 영역
											options : {
												ui : {
													chartType : 'LineChart',
													chartOptions : {
														chartArea : {
															'width' : '60%',
															'height' : 80
														},
														hAxis : {
															'baselineColor' : 'none',
															textStyle : {
																fontSize : 12
															},
															gridlines : {
																count : controlLineCount,
															},
														}
													}
												},
												filterColumnIndex : 0
											}
										});

								var date_formatter = new google.visualization.DateFormat(
										{
										});
								date_formatter.format(data, 0);

								var dashboard = new google.visualization.Dashboard(
										document.getElementById('Line_Controls_Chart'));
								window.addEventListener('resize',
										function() {
											dashboard.draw(data);
										}, false); //화면 크기에 따라 그래프 크기 변경
								dashboard.bind([ control ], [ chart ]);
								dashboard.draw(data);

							}
					          google.charts.setOnLoadCallback(drawDashboard);
					          
					      }
					    }
					 
					    google.charts.load('current', {
					    	'packages':['line','controls']
					    });
					    chartDrowFun1.chartDrow(); //chartDrow() 실행
			},
			error : function(xhr, type) {
				alert('server error occured');
			}
		});

	$('#btn1').click(function() {
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/chartMonth_sws',
			success : function(data) {
				queryObject = JSON.parse(data);
				queryObjectLen = queryObject.barlist.length;
				
				var chartDrowFun2 = {

						chartDrow2 : function() {
							var chartData = '';
					        //날짜형식 변경하고 싶으시면 이 부분 수정하세요.
					        var chartDateformat = '      ';
							//라인차트의 라인 수
							var chartLineCount = 10;
							//컨트롤러 바 차트의 라인 수
							var controlLineCount = 10;

							function drawDashboard() {

								var data = new google.visualization.DataTable();
								//그래프에 표시할 컬럼 추가
								data.addColumn('number', '날짜');
								data.addColumn('number', '예금 가입자 수');
								data.addColumn('number', '적금 가입자 수');
								data.addColumn('number', '대출 가입자 수');

								//그래프에 표시할 데이터
								for (var i = 0; i < queryObjectLen; i++) {
									var day = queryObject.barlist[i].day;
									var value1 = queryObject.barlist[i].value1;
									var value2 = queryObject.barlist[i].value2;
									var value3 = queryObject.barlist[i].value3;

									data.addRow([ day, value1, value2,
											value3 ]);
								}

								var chart = new google.visualization.ChartWrapper(
										{
											chartType : 'LineChart',
											containerId : 'lineChartArea', //라인 차트 생성할 영역
											options : {
												isStacked : 'percent',
												focusTarget : 'category',
												height : 500,
												width : '100%',
												legend : {
													position : "top",
													textStyle : {
														fontSize : 13
													}
												},
												pointSize : 5,
												tooltip : {
													textStyle : {
														fontSize : 12
													},
													showColorCode : true,
													trigger : 'both'
												},
												hAxis : {
													gridlines : {
														count : chartLineCount,
													},
													textStyle : {
														fontSize : 12
													},
													format: chartDateformat, gridlines:{
														count:chartLineCount,units: {
			                                            	years : {format: ['yyyy년']},
			                                            	months: {format: ['MM월']},
			                                            	days  : {format: ['dd일']},
			                                            	hours : {format: ['HH시']}}
			                                          },textStyle: {fontSize:12}}
												},
												vAxis : {
													minValue : 10,
													viewWindow : {
														min : 0
													},
													gridlines : {
														count : -1
													},
													textStyle : {
														fontSize : 12
													}
												},
												animation : {
													startup : true,
													duration : 1000,
													easing : 'in'
												},
												annotations : {
													textStyle : {
														fontSize : 15,
														bold : true,
														italic : true,
														color : '#871b47',
														auraColor : '#d799ae',
														opacity : 0.8,
													}
												}
											});

								var control = new google.visualization.ControlWrapper(
										{
											controlType : 'ChartRangeFilter',
											containerId : 'controlsArea', //control bar를 생성할 영역
											options : {
												ui : {
													chartType : 'LineChart',
													chartOptions : {
														chartArea : {
															'width' : '60%',
															'height' : 80
														},
														hAxis : {
															'baselineColor' : 'none',
															textStyle : {
																fontSize : 12
															},
															gridlines : {
																count : controlLineCount,
															}
														}
													}
												},
												filterColumnIndex : 0
											}
										});

								var date_formatter = new google.visualization.DateFormat(
										{
										});
								date_formatter.format(data, 0);

								var dashboard = new google.visualization.Dashboard(
										document
												.getElementById('Line_Controls_Chart'));
								window.addEventListener('resize',
										function() {
											dashboard.draw(data);
										}, false); //화면 크기에 따라 그래프 크기 변경
								dashboard.bind([ control ], [ chart ]);
								dashboard.draw(data);

							}
							google.charts.setOnLoadCallback(drawDashboard);

						}
					}

						google.charts.load('current', {
							'packages' : [ 'line', 'controls' ]
						});
						chartDrowFun2.chartDrow2(); //chartDrow() 실행
			},
			error : function(xhr, type) {
				alert('server error occured');
			}
		});
	});
	
	$('#btn2').click(function() {
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/chartDay_sws',
			success : function(data) {
				queryObject = JSON.parse(data);
				queryObjectLen = queryObject.barlist.length;
				
				var chartDrowFun3 = {

						chartDrow : function() {
							var chartData = '';
					        //날짜형식 변경하고 싶으시면 이 부분 수정하세요.
					        var chartDateformat = '      ';
							//라인차트의 라인 수
							var chartLineCount = 10;
							//컨트롤러 바 차트의 라인 수
							var controlLineCount = 10;

							function drawDashboard() {

								var data = new google.visualization.DataTable();
								//그래프에 표시할 컬럼 추가
								data.addColumn('number', '날짜');
								data.addColumn('number', '예금 가입자 수');
								data.addColumn('number', '적금 가입자 수');
								data.addColumn('number', '대출 가입자 수');

								//그래프에 표시할 데이터
								for (var i = 0; i < queryObjectLen; i++) {
									var day = queryObject.barlist[i].day;
									var value1 = queryObject.barlist[i].value1;
									var value2 = queryObject.barlist[i].value2;
									var value3 = queryObject.barlist[i].value3;

									data.addRow([ day, value1, value2,
											value3 ]);
								}

								var chart = new google.visualization.ChartWrapper(
										{
											chartType : 'LineChart',
											containerId : 'lineChartArea', //라인 차트 생성할 영역
											options : {
												isStacked : 'percent',
												focusTarget : 'category',
												height : 500,
												width : '100%',
												legend : {
													position : "top",
													textStyle : {
														fontSize : 13
													}
												},
												pointSize : 5,
												tooltip : {
													textStyle : {
														fontSize : 12
													},
													showColorCode : true,
													trigger : 'both'
												},
												hAxis : {
													gridlines : {
														count : chartLineCount,
													},
													textStyle : {
														fontSize : 12
													},
													format: chartDateformat, gridlines:{
														count:chartLineCount,units: {
			                                            	years : {format: ['yyyy년']},
			                                            	months: {format: ['MM월']},
			                                            	days  : {format: ['dd일']},
			                                            	hours : {format: ['HH시']}}
			                                          },textStyle: {fontSize:12}}
												},
												vAxis : {
													minValue : 10,
													viewWindow : {
														min : 0
													},
													gridlines : {
														count : -1
													},
													textStyle : {
														fontSize : 12
													}
												},
												animation : {
													startup : true,
													duration : 1000,
													easing : 'in'
												},
												annotations : {
													textStyle : {
														fontSize : 15,
														bold : true,
														italic : true,
														color : '#871b47',
														auraColor : '#d799ae',
														opacity : 0.8,
													}
												}
											});

								var control = new google.visualization.ControlWrapper(
										{
											controlType : 'ChartRangeFilter',
											containerId : 'controlsArea', //control bar를 생성할 영역
											options : {
												ui : {
													chartType : 'LineChart',
													chartOptions : {
														chartArea : {
															'width' : '60%',
															'height' : 80
														},
														hAxis : {
															'baselineColor' : 'none',
															textStyle : {
																fontSize : 12
															},
															gridlines : {
																count : controlLineCount,
															}
														}
													}
												},
												filterColumnIndex : 0
											}
										});

								var date_formatter = new google.visualization.DateFormat(
										{
										});
								date_formatter.format(data, 0);

								var dashboard = new google.visualization.Dashboard(
										document
												.getElementById('Line_Controls_Chart'));
								window.addEventListener('resize',
										function() {
											dashboard.draw(data);
										}, false); //화면 크기에 따라 그래프 크기 변경
								dashboard.bind([ control ], [ chart ]);
								dashboard.draw(data);

							}
							google.charts.setOnLoadCallback(drawDashboard);

						}
					}
						google.charts.load('current', {
							'packages' : [ 'line', 'controls' ]
						});
						chartDrowFun3.chartDrow(); //chartDrow() 실행
			},
			error : function(xhr, type) {
				alert('server error occured');
			}
		});
	});
</script>
</html>