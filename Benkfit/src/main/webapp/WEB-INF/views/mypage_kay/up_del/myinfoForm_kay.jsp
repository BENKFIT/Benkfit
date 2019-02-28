<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta charset="UTF-8">
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
<title>회원정보수정</title>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>
	<c:if test="${selCnt != 1}">
		<script>
			alert("비밀번호오류");
			window.location = "myinfoPw";
		</script>
	</c:if>
	<div class="wrapper">
		<form action="myinfoPro" method="post">
			<h2>정보수정</h2>
			<hr>
			<table class="table_kay">
				<tr>
					<th>id</th>
					<td>
						<div class="col-md-8">
							<div class="row">
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-field">
										<input type="text" name="id" class="eq-ui-input"
											style="color: #000;" value="${vo.c_id}" readonly disabled>
									</div>
								</div>
							</div>
						</div>
					</td>
					<th>고객등급</th>
					<td>
						<div class="col-md-8">
							<div class="row">
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-field">
										<input type="text" class="eq-ui-input" value="${vo.c_level}"
											style="color: #000;" disabled>
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<div class="col-md-8">
							<div class="row">
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-field">
										<input type="password" class="eq-ui-input" id="pwd"
											style="color: #000;" name="pwd" required autofocus>
									</div>
								</div>
							</div>
						</div>
					</td>
					<th>비밀번호 확인</th>
					<td>
					<div class="col-md-8">
							<div class="row">
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-field">
										<input type="password" class="eq-ui-input" id="repwd"
										name="pwd" style="color: #000;"  required>
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
					<div class="col-md-8">
							<div class="row">
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-field">
										<input type="text" class="eq-ui-input" name="name"
										value="${vo.c_name}" style="color: #000;" required>
									</div>
								</div>
							</div>
						</div>
					</td>
					<th>연락처</th>
					<td>
					<div class="col-md-8">
							<div class="row">
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-field">
										<input type="text" class="eq-ui-input" style="color: #000;" name="hp"
										value="${vo.c_hp}" required>
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td>
					<div class="col-md-8">
							<div class="row">
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-field">
											<input type="text" class="eq-ui-input" name="post"
											value="${vo.c_post}" required>
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="4">
					<div class="col-md-10">
							<div class="row">
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-field">
											<input type="text" class="eq-ui-input" name="address"
										value="${vo.c_address}" required>
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>주민등록번호</th>
					<td>
					<div class="col-md-8">
							<div class="row">
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-field">
										<input type="text" class="eq-ui-input"
									value="${vo.c_jumin1} - ${vo.c_jumin2}" disabled not-allowed>
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
					<div class="col-md-8">
							<div class="row">
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-field">
										<input type="text" class="eq-ui-input" name="email"
											value="${vo.c_email}" required>
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>가입날짜</th>
					<td>
					<div class="col-md-8">
							<div class="row">
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-field">
										<input type="text" class="eq-ui-input"
										value="${vo.c_regDate}" disabled>
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: center;"><input
						type="submit" class="btn btn-primary" value="저장"></td>
				</tr>
			</table>
		</form>
	</div>
	<%@ include file="../../Template/footer.jsp"%>
</body>
<script
	src="/benkfit/resources/assets/js/exentriq-bootstrap-material-ui.min.js?v=0.4.5"></script>
<script
	src="/benkfit/resources/assets/js/vendor/jquery/dist/jquery.min.js?v=2.1.4"></script>
<script
	src="/benkfit/resources/assets/js/vendor/moment/min/moment.min.js?v=2.13.0"></script>
<script
	src="/benkfit/resources/assets/js/vendor/jquery-timeago/jquery.timeago.js?v=1.4.3"></script>

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