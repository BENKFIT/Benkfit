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
<title>contract 배포</title>
<link
	href="/benkfit/resources/assets/css/exentriq-bootstrap-material-ui.min.css?v=0.4.5"
	rel="stylesheet">
<link href="/benkfit/resources/assets/css/doc.css?v=0.4.5"
	rel="stylesheet">
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>

	<div style="text-align: center; margin: 200px 0px;">
		<div style="display: inline-block; width: 50%;">
			<h5 style="float: right;">관리자 > 배포</h5>
			<table class="table eq-ui-data-table z-depth-1">
				<tr>
					<th style="width: 20%;">contract명</th>
					<th style="width: 50%;">contract 주소</th>
					<th style="width: 20%">배포일</th>
					<th style="width: 10%;">배포</th>
				</tr>
				<c:if test="${contract == null}">
					<td colspan="4" style="text-align: center;">배포된 contract가
						없습니다.</td>
				</c:if>
				<c:if test="${contract != null}">
					<c:forEach items="${contract}" var="con">
						<td>${con.con_name}</td>
						<td>${con.con_address}</td>
						<td>${con.con_deployDate}</td>
						<td><a class="btn btn-info eq-ui-waves-light"
							onclick="reDeploy'${con.con_name}')">재배포</a></td>
					</c:forEach>
				</c:if>
			</table>
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#deploy" style="margin: 30px 0px 10px 0px;">배포</button>
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
													<option value="" disabled selected>Contract를 선택하세요.</option>
													<option value="Benkfit">Benkfit</option>
													<option value="Bank">Bank</option>
													<option value="Slot">Slot</option>
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
	function reDeploy(contract){
		window.location.href="reDeploy?name=" + contract;		
	}
</script>

	<!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
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

	<!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
	<script>
		(function(b, o, i, l, e, r) {
			b.GoogleAnalyticsObject = l;
			b[l] || (b[l] = function() {
				(b[l].q = b[l].q || []).push(arguments)
			});
			b[l].l = +new Date;
			e = o.createElement(i);
			r = o.getElementsByTagName(i)[0];
			e.src = '//www.google-analytics.com/analytics.js';
			r.parentNode.insertBefore(e, r)
		}(window, document, 'script', 'ga'));
		ga('create', 'UA-XXXXX-X', 'auto');
		ga('send', 'pageview');
	</script>
</body>
</html>