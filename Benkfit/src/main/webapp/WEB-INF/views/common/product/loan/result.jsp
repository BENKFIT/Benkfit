<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<body>
	<c:choose>
		<c:when test="${result == 1}">
			<script type="text/javascript">
				alert("대출이 신청되었습니다.");
				window.location="loanList";
			</script>
		</c:when>
		<c:when test="${result == -1}">
			<script type="text/javascript">
				alert("비밀번호가 일치하지 않습니다.");
				window.location="loanList";
			</script>
		</c:when>
		<c:when test="${result == -2}">
			<script type="text/javascript">
				alert("잔액이 없으면 대출이 불가합니다.");
				window.location="loanList";
			</script>
		</c:when>
		<c:when test="${result == -3}">
			<script type="text/javascript">
				alert("한도를 초과하는 대출신청은 불가합니다.");
				window.location="loanList";
			</script>
		</c:when>
		<c:when test="${result == 0 }">
			<script type="text/javascript">
				alert("신청에 실패하였습니다. 고객센터에 문의하세요.");
				window.location="loanList";
			</script>
		</c:when>
		<c:when test="${loanRepayment_result == 1}">
			<script type="text/javascript">
				alert("상환이 완료되었습니다.");
				window.location="loan_account";
			</script>
		</c:when>
		<c:when test="${loanRepayment_result == 0 }">
			<script type="text/javascript">
				alert("상환실패");
				window.location="loan_account";
			</script>
		</c:when>
	</c:choose>
</body>
</html>