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
<title>이체한도 조회</title>
<!-- CSS-->
<link
	href="/benkfit/resources/assets/css/exentriq-bootstrap-material-ui.min.css?v=0.4.5"
	rel="stylesheet">
<link href="/benkfit/resources/assets/css/doc.css?v=0.4.5"
	rel="stylesheet">
<script>
	function getSelectValue(frm) {
		frm.optionValue.value = frm.account_limit.options[frm.account_limit.selectedIndex].value;
	}
</script>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>
	<div class="wrapper">
		<form action="lim_pro" method="post">
			<h5 style="float:right;">마이페이지>설정>이체한도조회/수정</h5>
			<br>
			<hr>
			<div style="margin-left:23%;">
				<div class="col-md-8">
					<div class="eq-ui-form-group eq-ui-input-field">
						<select name="account_limit" class="eq-ui-select"
							onChange="getSelectValue(this.form);">
							<option value="계좌선택" disabled selected>계좌를 선택하세요.</option>
							<c:forEach var="li" items="${cheq}">
								<option value="${li.myCheq_limit}/${li.myCheq_account}">${li.myCheq_account}</option>
							</c:forEach>
						</select> <label>계좌번호</label>
					</div>
				</div>
				<div class="col-md-8">
					<div class="row">
						<div class="col-md-12">
							<div class="eq-ui-form-group eq-ui-input-field">
								<input id="disabled" name="optionValue" type="text"
									placeholder="I am not editable" class="eq-ui-input" disabled
									style="color: #000;"> <label for="disabled">현재이체한도
									/계좌번호</label>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-8">
					<div class="row">
						<div class="col-md-12">
							<div class="eq-ui-form-group eq-ui-input-field">
								<input id="lim" name="acount_lim" type="text"
									placeholder="1일 이체한도" class="eq-ui-input" autofocus> <label
									for="lim">1일 이체한도</label>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-8">
					<div class="row">
						<div class="col-md-12">
							<div style="text-align: center">
								<input type="submit" class="btn btn-info  " value="변경신청">
								<input type="button" class="btn btn-success  " value="마이페이지"
									onclick="location='mypage'">
							</div>
						</div>
					</div>
				</div>
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
</html>