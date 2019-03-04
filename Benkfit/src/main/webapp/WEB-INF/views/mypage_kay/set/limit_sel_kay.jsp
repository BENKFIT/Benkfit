<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>이체한도 조회</title>
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
			<p style="float:right; font-size:12px;">마이페이지>설정>이체한도조회/수정</p>
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
								<input type="submit" class="btn btn-primary " value="변경신청">
								<input type="button" class="btn btn-success " value="마이페이지"
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
</html>