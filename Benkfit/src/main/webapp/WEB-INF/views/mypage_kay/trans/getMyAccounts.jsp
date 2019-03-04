<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<body>
	<div class="eq-ui-form-group eq-ui-input-field">
		<select id="from" class="eq-ui-select" name="from">
			<option value="" disabled selected>계좌를 선택하세요.</option>
			<c:forEach var="cheq" items="${cheq}">
				<option value="${cheq}">${cheq}</option>
			</c:forEach>
		</select> <label>출금계좌</label>
	</div>
</body>
</html>