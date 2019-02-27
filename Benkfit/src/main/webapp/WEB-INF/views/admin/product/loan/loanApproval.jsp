<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<title>대출신청리스트</title>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>대출 신청 리스트</title>
</head>
<body>
	<!-- TOP&SIDE -->
	<%@ include file="../../../Template/top.jsp"%>
	<div
		style="margin-top: -30px; height: 40%; width: 100%; text-align: center;">
		<div style="display: inline-block; width: 60%; margin: 200px 0px;">
			<form class="formclass" action="loanApprovalPro">
				<h2 id="inputH2" align="center">대출 신청 리스트</h2>
				<table width="900px" align="center" text-align="center" border="1">
					<tr>
						<th style="width: 30px" align="center">ㅁ</th>
						<th style="width: 150px" align="center">지갑주소</th>
						<th style="width: 100px" align="center">대출금액</th>
						<th style="width: 100px" align="center">만기날짜</th>
						<th style="width: 100px" align="center">승인여부</th>
						<th style="width: 100px" align="center">상품번호</th>
						<th style="width: 100px" align="center">고객아이디</th>
						<th style="width: 70px" align="center">증빙번호</th>
					</tr>
					<c:forEach var="dto" items="${dtos}">
						<tr>
							<td align="center"><input type="checkbox" name="myLoan_account"
								id="myLoan_account" value="${dto.myLoan_account}"></td>
							<td align="center">${dto.myLoan_account}</td>
							<td align="center">${dto.myLoan_amount}원</td>
							<td align="center">${dto.myLoan_late}</td>
							<td><c:if test="${dto.myLoan_type == 0}">
								승인대기
							</c:if> <c:if test="${dto.myLoan_type == 1}">
								승인완료
							</c:if> <c:if test="${dto.myLoan_type == 2}">
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
				<button type="submit">승인</button>
				<button type="button" value="거절" onclick="rejection();">거절</button>
			</form>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
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