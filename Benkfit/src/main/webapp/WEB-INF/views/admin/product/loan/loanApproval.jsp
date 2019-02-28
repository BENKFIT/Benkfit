<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출신청리스트</title>
<style>
.modal-body td {
	padding: 10px;
}
</style>
</head>
<body>
	<%@ include file="../../../Template/top.jsp"%>

	<div class="wrapper">
	<form action="loanApprovalPro" method="post">
		<h1>대출신청리스트</h1>
		<hr>
		<table class="table_kay">
			<tr>
				<th align="center">ㅁ</th>
				<th align="center">지갑주소</th>
				<th align="center">대출금액</th>
				<!-- <th align="center">만기날짜</th> -->
				<th align="center">승인여부</th>
				<th align="center">상품번호</th>
				<th align="center">고객아이디</th>
				<th align="center">증빙번호</th>
			</tr>
			<c:forEach var="dto" items="${dtos}">
				<tr>
					<td align="center"><input type="checkbox"
						name="myLoan_account" id="myLoan_account"
						value="${dto.myloan_account}"></td>
					<td align="center">${dto.myloan_account}</td>
					<td align="center">${dto.myloan_amount}원</td>
					<%-- <td align="center">${dto.myloan_late}</td> --%>
					<td><c:if test="${dto.myloan_type == 0}">
								승인대기
							</c:if> <c:if test="${dto.myloan_type == 1}">
								승인완료
							</c:if> <c:if test="${dto.myloan_type == 2}">
								승인거절
							</c:if></td>
					<td align="center">${dto.loan_num}</td>
					<td align="center">${dto.c_id}</td>
					<%-- <td><fmt:formatDate type="both" pattern="yyyy-MM-dd"
									value="${dto.o_reg_date}" /></td> --%>
					<td align="center">${dto.doc_num}</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<button type="submit" class="btn btn-primary">승인</button>
		<button type="button" class="btn btn-primary" value="거절" onclick="rejection();">거절</button>
		</form>
	</div>
	
	<!-- FOOTER  -->
	<%@ include file="../../../Template/footer.jsp"%>
</body>
<script type="text/javascript">
	function rejection(){
		var loan_num = $('#loan_num').val();
		var alldata = {
			"loan_num" : loan_num
		};

		$.ajax({
			url : "${pageContext.request.contextPath}/rejection",
			type : "GET",
			data : alldata,
			success : function(data) {
				alert("성공");
			},
			error : function() {
				alert("오류");
			}
		});
	}
</script>
</html>