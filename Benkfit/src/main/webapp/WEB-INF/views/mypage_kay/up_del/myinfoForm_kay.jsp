<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<title> 마이페이지 > 회원정보수정</title>
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
		<form action="myinfoPro?${_csrf.parameterName}=${_csrf.token}" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<span class="style">마이페이지>회원정보수정</span>
			<br>
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
</html>