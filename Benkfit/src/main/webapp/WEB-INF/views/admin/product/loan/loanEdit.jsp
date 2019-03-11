<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>대출상품수정하기</title>
<style>
.modal-body td {
	padding: 10px;
}
</style>
</head>
<body>
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header" style="text-align: center;">
				<div style="display: inline-block;">수정할 정보를 입력하세요.</div>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" style="text-align: center;">
				<div style="display: inline-block;">
					<form action="loanEditPro?${_csrf.parameterName}=${_csrf.token}" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<input type="hidden" value="${vo.loan_num}" name="loan_num">
						<table>
							<tr>
								<td>상품번호</td>
								<td><input type="text" value="${vo.loan_num}" name="num"
									disabled></td>
							</tr>
							<tr>
								<td>상품이름</td>
								<td><input type="text" value="${vo.loan_name}" name="name"></td>
							</tr>
							<tr>
								<td>대출금액</td>
								<td><input type="number" value="${vo.loan_amount}"
									name="amount"></td>
							</tr>
							<tr>
								<td>상품이율</td>
								<td><input type="number" value="${vo.loan_rate}"
									name="rate"></td>
							</tr>
							<tr>
								<td>가입기간</td>
								<td><input type="text" value="${vo.loan_period}"
									name="period"></td>
							</tr>
							<tr>
								<td>가입대상</td>
								<td><input type="text" value="${vo.loan_target}"
									name="target"></td>
							</tr>
							<tr>
								<td>등록일자</td>
								<td><input type="text" value="${vo.loan_regDate}"
									name="regDate" disabled></td>
							</tr>
							<tr>
								<td>상환방법</td>
								<td><input type="text" value="${vo.loan_reMethod}"
									name="remethod"></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center;"><input
									type="submit" value="수정"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" data-toggle="modal"
					data-target="#Cheq" onclick="loanDel('${vo.loan_num}');">삭제</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function loanDel(loan_num) {
			var num = "loan_num=" + loan_num;

			$.ajax({
					type : 'post',
					data : num,
					url : '${pageContext.request.contextPath}/loanDel',
					success : function(data) {
						window.location.href = '${pageContext.request.contextPath}/loanRegi';
					},
					error : function() {
						alert("Ajax error");
					}
				});
		}
	</script>

</body>
</html>