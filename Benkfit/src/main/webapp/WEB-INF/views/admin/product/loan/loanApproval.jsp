<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../Template/setting.jsp"%>
<html>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
p, a {
	color: rgb(119, 119, 119);
	font-weight: 12px;
}

.title {
	font-size: 50px;
	text-align: center;
}

#machine {
	text-align: center;
}

#from {
	padding: 6px 10px;
	margin: 4px 0;
	display: inline-block;
	border: 1px solid #FFD662;
	border-radius: 4px;
	box-sizing: border-box;
}
</style>
<title>상품관리 > 대출신청리스트</title>
<body>
	<!-- TOP&SIDE -->
	<%@ include file="../../../Template/top.jsp"%>

	<div style="margin-top: -30px; width: 100%; text-align: center;">
		<form action="loanApprovalPro" method="post">
			<div
				style="display: inline-block; width: 60%; margin: 200px 0px 0px 0px;">
				<h3 style="padding-left: 22px; text-align: center;">대출신청리스트</h3>
				<hr style="width: 1100px;">
				<span style="float: right;">상품관리 > 대출신청리스트</span> <br>
				<hr>
				<table class="table eq-ui-data-table eq-ui-with-checkbox z-depth-1">
					<thead>
						<tr>
							<th></th>
							<th>지갑주소</th>
							<th>대출금액</th>
							<!-- <th >만기날짜</th> -->
							<th>승인여부</th>
							<th>상품번호</th>
							<th>고객아이디</th>
							<!-- <th>증빙번호</th> -->
						</tr>
						</thead>
						<tbody>
						<c:forEach var="dto" items="${dtos}">
							<tr>
								<td><input type="checkbox"
									name="myLoan_account" id="myLoan_account"
									value="${dto.myloan_account}">
									<label for="checkbox-1"></label></td>
								<td>${dto.myloan_account}</td>
								<td>${dto.myloan_amount}원</td>
								<%-- <td align="center">${dto.myloan_late}</td> --%>
								<td><c:if test="${dto.myloan_type == 0}">
								승인대기
							</c:if> <c:if test="${dto.myloan_type == 1}">
								승인완료
							</c:if> <c:if test="${dto.myloan_type == 2}">
								승인거절
							</c:if></td>
								<td>${dto.loan_num}</td>
								<td>${dto.c_id}</td>
								<%-- <td><fmt:formatDate type="both" pattern="yyyy-MM-dd"
									value="${dto.o_reg_date}" /></td> --%>
								<%-- <td>${dto.doc_num}</td> --%>
							</tr>
						</c:forEach>
						</tbody>	
				</table>
				<br>
				<button type="submit" class="btn btn-primary">승인</button>
				<button type="button" class="btn btn-primary" value="거절"
					onclick="rejection();">거절</button>
			</div>
		</form>
	</div>


	<!-- FOOTER  -->
	<%@ include file="../../../Template/footer.jsp"%>
</body>
<script type="text/javascript">
	function rejection() {
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