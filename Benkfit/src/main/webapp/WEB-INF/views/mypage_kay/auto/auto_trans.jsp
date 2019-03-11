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
<title> 마이페이지 > 자동이체 </title>
<link
	href="/benkfit/resources/assets/css/exentriq-bootstrap-material-ui.min.css?v=0.4.5"	rel="stylesheet">
<link href="/benkfit/resources/assets/css/doc.css?v=0.4.5"	rel="stylesheet">
</head>
<body class="body">
	<%@ include file="../../Template/top.jsp"%>
	<div style="margin: 200px 0px; text-align: center;">
		<div style="display: inline-block; width: 70%;">
			<span class="style"> 마이페이지 > 자동이체</span>
			<br>
			<div class="row">
				<div class="col-md-24">
					<table
						class="table eq-ui-data-table eq-ui-data-table-js eq-ui-with-checkbox eq-ui-hoverable z-depth-1">
						<thead>
							<tr>
								<th>보내는 계좌</th>
								<th>받는 계좌</th>
								<th>이체 금액</th>
								<th>이체 날짜</th>
								<th>비고</th>
						</thead>
						<tbody>
							<c:if test="${auto == null}">
								<tr>
									<td colspan="4">자동이체가 등록되지 않았습니다.</td>
								</tr>
							</c:if>
							<c:forEach items="${auto}" var="auto">
								<tr id="${auto.auto_num}">
									<td>${auto.auto_from}</td>
									<td>${auto.auto_to}</td>
									<td>${auto.auto_value}</td>
									<td>${auto.auto_date}</td>
									<td><a class="btn btn-danger eq-ui-waves-light"
										onclick="autoDel('${auto.auto_num}')">삭제</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#autoRegi" style="margin: 30px 0px 10px 0px;"
						>등록</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 등록 modal -->
	<div class="modal fade" id="autoRegi" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<form action="autoAdd?${_csrf.parameterName}=${_csrf.token}" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalCenterTitle">자동이체에
							등록할 정보를 입력하세요.</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body" style="text-align: center;">
						<div style="display: inline-block;">
							<table>
								<tr>
									<td colspan="2">
										<div class="col-md-12">
											<div class="eq-ui-form-group eq-ui-input-field">
												<input id="from" name="from" type="text" class="eq-ui-input">
												<label for="from"> Withdrawal account</label>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="col-md-12">
											<div class="eq-ui-form-group eq-ui-input-file">
												<a class="btn btn-primary eq-ui-waves-light"> Upload <input
													id="file" name="file" type="file" multiple>
												</a>
												<div class="eq-ui-input-file-path">
													<input type="text" class="eq-ui-input"
														placeholder="Upload one or more files" readonly>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="col-md-12">
											<div class="eq-ui-form-group eq-ui-input-field">
												<input id="to" type="text" class="eq-ui-input" name="to">
												<label for="to"> Deposit account</label>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="col-md-12">
											<div class="eq-ui-form-group eq-ui-input-field">
												<input id="amount" type="number" name="value"
													class="eq-ui-input"> <label for="amount">
													amount </label>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="col-md-12">
											<div class="eq-ui-form-group eq-ui-input-field">
												<input id="password" type="password" name="password"
													class="eq-ui-input"> <label for="password">password
												</label>
											</div>
										</div>
									</td>
									<td>
										<div class="col-md-12">
											<div class="eq-ui-form-group eq-ui-input-field">
												<input id="date" type="number" name="date"
													class="eq-ui-input"> <label for="number">date</label>
											</div>
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-secondary" value="등록" data-toggle="tooltip" data-placement="bottom"
						title="자동이체는 14시에 실행됩니다.">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(function() {
			$('[data-toggle="tooltip"]').tooltip()
		})

		function autoDel(num) {
			var item = "auto_num=" + num;
			var id = "#" + num
			$.ajax({
				type : 'post',
				data : item,
				url : '${pageContext.request.contextPath}/autoDel',
				success : function(data) {
					$(id).remove();
				},
				beforeSend:function(xhr){
		              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		              $('.wrap-loading').removeClass('display-none');
		        },
				error : function() {
					alert("Ajax error");
				}
			});
		}
	</script>
	<%@ include file="../../Template/footer.jsp"%>
</body>
</html>