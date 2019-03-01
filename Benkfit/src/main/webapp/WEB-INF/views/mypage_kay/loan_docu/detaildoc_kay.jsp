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
<title>정보등록</title>
<!-- CSS-->
<link
	href="/benkfit/resources/assets/css/exentriq-bootstrap-material-ui.min.css?v=0.4.5"
	rel="stylesheet">
<link href="/benkfit/resources/assets/css/doc.css?v=0.4.5"
	rel="stylesheet">
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>
	<div class="wrapper">
	<h1>서류상세페이지</h1>
		<hr>
		<div class="document">
			<form action="upresult" method="post" name="fileup"
				enctype="multipart/form-data">
				<table class="table_kay">
					<tr>
						<th>서류명</th>
						<td>
							<div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
											<input type="text" class="eq-ui-input" value="${vo.doc_title}" id="doc_title" readonly>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
						<div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
											<input type="text" class="eq-ui-input" value="${vo.doc_name}" id="doc_name" readonly>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>주민번호</th>
						<td>
						<div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
											<input type="text" class="eq-ui-input" value="${vo.doc_jumin1}"id="doc_jumin1"readonly>
										</div>
									</div>
								</div>
							</div>
						<div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
											 <input type="text" class="eq-ui-input" value="${vo.doc_jumin2}" id="doc_jumin2" readonly>	
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>개인주소</th>
						<td colspan="3">
						<div class="col-md-8">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
											 <input type="text" class="eq-ui-input" value="${vo.doc_perAddress}" id="doc_perAddress"  size="100" readonly>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>회사명</th>
						<td>
						<div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
											 <input type="text" class="eq-ui-input" value="${vo.doc_comName}" id="doc_comName" readonly>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>소속</th>
						<td>
						<div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
											 <input type="text" class="eq-ui-input" value="${vo.doc_department}" id="doc_department" readonly>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>직위</th>
						<td>
						<div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
											<input type="text" class="eq-ui-input" value="${vo.doc_position}" id="doc_position" readonly>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3">
						<div class="col-md-8">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
											<input type="text" class="eq-ui-input" value="${vo.doc_comAddress}" id="doc_comAddress" size="100" readonly>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>기간</th>
						<td><div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
											 <input type="text" class="eq-ui-input" value="${vo.doc_period_from}" id="doc_period_from" readonly>
										</div>
									</div>
								</div>
							</div>
						 <div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
											 <input type="text" class="eq-ui-input" value="${vo.doc_period_to}" id="doc_period_to" readonly>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3" style="text-align:center;">
							<input type="button" class="btn btn-danger " value="삭제" onclick="location.href='deletedocu?doc_num=${vo.doc_num}';">
							<input type="button" class="btn btn-primary " value="목록"
								onclick="window.location='document'">
						</td>
					</tr>
				</table>
			</form>
		</div>
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