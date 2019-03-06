<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 > 은행관리</title>
<script type="text/javascript"	src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>

	<div class="col-md-12" style="margin: 100px 0px;">
		<div
			class="eq-ui-card doc-margin-bottom doc-tabs doc-tabs-not-padding">
			<div class="eq-ui-card-supporting-text">
				<div class="eq-ui-scrollbar-wrap eq-ui-scrollbar-wrap-x eq-ui-scrollbar-wrap-hide">
					<ul
						class="eq-ui-tabs eq-ui-tabs-color-inverted eq-ui-tabs-justified">
						<li class="eq-ui-tab"><a href="#eq-ui-tab-s2-t1">Start/End</a></li>
						<li class="eq-ui-tab"><a href="#eq-ui-tab-s2-t2">배포</a></li>
						<li class="eq-ui-tab"><a href="#eq-ui-tab-s2-t3">자금현황</a></li>
						<li class="eq-ui-tab" id="btn0"><a href="#eq-ui-tab-s2-t4">결산</a></li>
					</ul>
				</div>

			</div>
		</div>

	</div>

	<!-- 관리자 > 자금현황 -->
	<div id="eq-ui-tab-s2-t1" style="text-align: center;">
		<div style="display: inline-block; width: 50%; margin: 100px 0px;">
			<p id="">안녕하세요. 관리자님.</p>
			<a class="btn btn-info eq-ui-waves-light" onclick="minerStart();">은행시작</a>
			<a class="btn btn-warning eq-ui-waves-light" onclick="minerStop();">은행중지</a>
			<div id="state" style="margin: 30px 0px; font-size: 15px;"></div>
		</div>
	</div>

	<!-- 관리자 > 배포 -->
	<div id="eq-ui-tab-s2-t2" style="text-align: center;">
		<div style="display: inline-block; width: 50%;">
			<span style="float: right;">관리자 > 배포</span>
			<table class="table eq-ui-data-table z-depth-1">
				<thead>
					<tr>
						<th class="eq-ui-data-table-cell-non-numeric">contract명</th>
						<th>contract 주소</th>
						<th>배포일</th>
						<th>배포</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${contract == null}">
						<td colspan="4" style="text-align: center;">배포된 contract가
							없습니다.</td>
					</c:if>
					<c:if test="${contract != null}">
						<c:set var="num" value="0" />
						<c:forEach items="${contract}" var="con">
							<tr>
								<td
									class="eq-ui-data-table-cell-non-numeric eq-ui-data-table-cell-truncate">${con.con_name}</td>
								<td id="${con.con_name}">${con.con_address}</td>
								<td>${con.con_deployDate}</td>
								<td><a class="btn btn-info eq-ui-waves-light"
									onclick="reDeploy('${con.con_name}')">재배포</a></td>
								<c:if test="${con.con_name == 'Benkfit'}">
									<c:set var="Benkfit" value="${con.con_name}" />
								</c:if>
								<c:if test="${con.con_name == 'Bank'}">
									<c:set var="Bank" value="${con.con_name}" />
								</c:if>
								<c:if test="${con.con_name == 'Slot'}">
									<c:set var="Slot" value="${con.con_name}" />
								</c:if>
								<c:set var="num" value="${num+1}" />
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<c:if test="${num <= 3}">
				<a class="btn btn-primary eq-ui-waves-light" data-toggle="modal"
					data-target="#deploy" style="margin: 30px 0px 10px 0px;">배포</a>
			</c:if>

		</div>
	</div>

	<!-- 관리자 > 자금현황 -->
	<div id="eq-ui-tab-s2-t3" style="text-align: center;">
		<div style="display: inline-block; width: 50%;">
			<span style="float: right;">관리자 > 자금현황</span>
			<table class="table eq-ui-data-table z-depth-1">
				<tr>
					<td class="eq-ui-data-table-cell-non-numeric">대출토큰할당량</td>
					<td>
						<div class="eq-ui-form-group eq-ui-input-field">
							<input name="value" id="value" type="text" class="eq-ui-input"
								required> <label for="first_name">Loantoken</label>
						</div>
					</td>
				</tr>
				<tr>
					<td class="eq-ui-data-table-cell-non-numeric">Loan balance</td>
					<td id="loan_balance">${loan_balance}</td>
				</tr>
				<tr>
					<td class="eq-ui-data-table-cell-non-numeric">State</td>
					<td id="state1"></td>
				</tr>
				<tr>
					<td class="eq-ui-data-table-cell-non-numeric">name</td>
					<td id="name">${name}</td>
				</tr>
				<tr>
					<td class="eq-ui-data-table-cell-non-numeric">remaning</td>
					<td id="remaning">${remaning}</td>
				</tr>
				<tr>
					<td class="eq-ui-data-table-cell-non-numeric">totalSupply</td>
					<td id="totalSupply">${totalSupply}</td>
				</tr>
			</table>
			<a class="btn btn-primary eq-ui-waves-light"
				onclick="benkfitLoanStock();" style="margin: 20px 0px 100px 0px;">대출토큰할당</a>
		</div>
	</div>

	<!-- 차트 -->
	<div id="eq-ui-tab-s2-t4" style="text-align: center;">
		<div style="display: inline-block; width: 50%;">
			<div style="display: inline-block;">
				<a class="btn btn-success eq-ui-waves-light" id="btn" style="margin-right: 50px;">연별</a>
				<a class="btn btn-info eq-ui-waves-light" id="btn1" style="margin-right: 50px;">월별</a>
				<a class="btn btn-warning eq-ui-waves-light" id="btn2">일별</a>
			</div>
			
			<div id="Line_Controls_Chart">
				<!-- 라인 차트 생성할 영역 -->
				<div id="lineChartArea" style="padding: 30px 20px 0px 0px;"></div>
				<!-- 컨트롤바를 생성할 영역 -->
				<div id="controlsArea" style="padding: 0px 20px 0px 0px;"></div>
			</div>
		</div>
	</div>

	<!-- 등록 modal -->
	<div class="modal fade" id="deploy" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<form action="deployPro" method="post">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalCenterTitle">배포할
							contract를 입력하세요.</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body" style="text-align: center;">
						<div style="display: inline-block;">
							<table class="table eq-ui-data-table z-depth-1">
								<tr>
									<td>
										<div class="col-md-12">
											<div class="eq-ui-form-group eq-ui-input-field">
												<select name="name" class="eq-ui-select">
													<option value="" disabled selected>Contract를
														선택하세요.</option>
													<c:if test="${Benkfit == null}">
														<option value="Benkfit">Benkfit</option>
													</c:if>
													<c:if test="${Bank == null}">
														<option value="Bank">Bank</option>
													</c:if>
													<c:if test="${Slot == null}">
														<option value="Slot">Slot</option>
													</c:if>
												</select>
											</div>
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-secondary" value="배포"
							data-toggle="tooltip" data-placement="bottom"
							title="Geth를 실행해주세요.">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function reDeploy(contract) {
			var item = "contract=" + contract;
			var id = "#" + contract

			$.ajax({
				type : 'post',
				data : item,
				url : '${pageContext.request.contextPath}/reDeploy',
				success : function(data) {
					$(id).html(data);
				},
				error : function() {
					alert("다시 시도해주세요.");
				}
			});
		}

		function benkfitLoanStock() {
			var value = $('#value').val();
			var alldata = {
				'value' : value 
			};
			$('#state1').html("자금 이동중입니다. 잠시만 기다려주세요.");

			$.ajax({
				url : "${pageContext.request.contextPath}/benkfitLoanStock",
				type : "GET",
				data : alldata,
				dataType : "JSON",
				success : function(data) {
					if (data.chkNum != 0) {
						$('#totalSupply').html(data.totalSupply);
						$('#name').html(data.name);
						$('#remaning').html(data.remaning);
						$('#loan_balance').html(data.loan_balance);
						$('#state1').html("자금 이동 성공.");
					} else {
						$('#state1').html("다시 시도하세요.");
					}
				},
				error : function() {
					alert("다시 시도하세요.");
					$('#state1').html("다시 시도하세요.");
				}
			});
		}

		function minerStart() {
			var value = $('#value').val();
			var alldata = {
				'value' : value
			};
			$('#state').html("은행업무를 시작하겠습니다.");

			$.ajax({
				url : "${pageContext.request.contextPath}/minerStart",
				type : "GET",
				data : alldata,
				dataType : "JSON",
				success : function(data) {
					$('#state').html("은행업무가 시작되었습니다.");
				},
				error : function() {
					alert("다시 시도하세요.");
					$('#state').html("은행업무를 시작되지 않았습니다.");
				}
			});
		}

		function minerStop() {
			var value = $('#value').val();
			var alldata = {
				'value' : value
			};
			$('#state').html("은행업무를 중지하겠습니다.");

			$.ajax({
				url : "${pageContext.request.contextPath}/minerStop",
				type : "GET",
				data : alldata,
				dataType : "JSON",
				success : function(data) {
					$('#state').html("은행업무가 중지되었습니다..");
				},
				error : function() {
					alert("다시 시도하세요.");
					$('#state').html("은행업무 중지를 실패했습니다.");
				}
			});
		}
	</script>

	<!-- Chart -->
	<script type="text/javascript">
		
	var queryObject = "";
	var queryObjectLen = "";

	$('#btn0').click(function(){
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/chartYear_sws',
			success : function(data) {
				queryObject = JSON.parse(data);
				queryObjectLen = queryObject.barlist.length;
				
				var chartDrowFun1 = {
						chartDrow1 : function() {
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
								/* data = [
									["날짜", queryObject.barlist[0].day],
									["예금 가입자 수", queryObject.barlist[0].value1],
									["적금 가입자 수", queryObject.barlist[0].value2],
									["대출 가입자 수", queryObject.barlist[0].value1]
								]; */
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
												backgroundColor: 'none',
												legend : {
													position : "top",
													textStyle : {
														fontSize : 13
													},
												},
												series: {
										            0: { color: '#D63B37' },
										            1: { color: '#006D3C' },
										            2: { color: '#2980b9' },
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
														series: {
												            0: { color: '#D63B37' },
												            1: { color: '#006D3C' },
												            2: { color: '#2980b9' },
												        },
														'backgroundColor' : {
													        'fill': 'none',
													        'opacity': 100
													     },
														chartArea : {
															'width' : '60%',
															'height' : 80,
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
					    chartDrowFun1.chartDrow1(); //chartDrow() 실행
			},
			error : function(xhr, type) {
				alert('server error occured');
			}
		});
	})
	
	$('#btn').click(function(){
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/chartYear_sws',
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
												backgroundColor: 'none',
												legend : {
													position : "top",
													textStyle : {
														fontSize : 13
													}
												},
												series: {
										            0: { color: '#D63B37' },
										            1: { color: '#006D3C' },
										            2: { color: '#2980b9' },
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
														series: {
												            0: { color: '#D63B37' },
												            1: { color: '#006D3C' },
												            2: { color: '#2980b9' },
												        },
														'backgroundColor' : {
													        'fill': 'none',
													        'opacity': 100
													     },
														chartArea : {
															'width' : '60%',
															'height' : 80,
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
					    chartDrowFun2.chartDrow2(); //chartDrow() 실행
			},
			error : function(xhr, type) {
				alert('server error occured');
			}
		});
	})

	$('#btn1').click(function() {
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/chartMonth_sws',
			success : function(data) {
				queryObject = JSON.parse(data);
				queryObjectLen = queryObject.barlist.length;
				
				var chartDrowFun3 = {

						chartDrow3 : function() {
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
												backgroundColor: 'none',
												legend : {
													position : "top",
													textStyle : {
														fontSize : 13
													}
												},
												series: {
										            0: { color: '#D63B37' },
										            1: { color: '#006D3C' },
										            2: { color: '#2980b9' },
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
														series: {
												            0: { color: '#D63B37' },
												            1: { color: '#006D3C' },
												            2: { color: '#2980b9' },
												        },
														'backgroundColor' : {
													        'fill': 'none',
													        'opacity': 100
													     },
														chartArea : {
															'width' : '60%',
															'height' : 80,
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
							'packages' : [ 'line', 'controls' ]
						});
						chartDrowFun3.chartDrow3(); //chartDrow() 실행
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
				
				var chartDrowFun4 = {

						chartDrow4 : function() {
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
												backgroundColor: 'none',
												legend : {
													position : "top",
													textStyle : {
														fontSize : 13
													}
												},
												series: {
										            0: { color: '#D63B37' },
										            1: { color: '#006D3C' },
										            2: { color: '#2980b9' },
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
												backgroundColor : 'none',
												ui : {
													chartType : 'LineChart',
													chartOptions : {
														series: {
												            0: { color: '#D63B37' },
												            1: { color: '#006D3C' },
												            2: { color: '#2980b9' },
												        },
														'backgroundColor' : {
													        'fill': 'none',
													        'opacity': 100
													     },
														chartArea : {
															'width' : '60%',
															'height' : 80,
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
							'packages' : [ 'line', 'controls' ]
						});
						chartDrowFun4.chartDrow4(); //chartDrow() 실행
			},
			error : function(xhr, type) {
				alert('server error occured');
			}
		});
	});
</script>
<%@ include file="../../Template/footer.jsp"%>
</body>
</html>
