<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출계좌조회</title>
<style>
	.wrap-loading{ 
    position: fixed;
    left:0;
    right:0;
    top:0;
    bottom:0;
    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000',endColorstr='#20000000');    /* ie */
	}
   .wrap-loading div{ /*로딩 이미지*/
       position: fixed;
       top:50%;
       left:50%;
       margin-left: -21px;
       margin-top: -21px;
   }
</style>

</head>
<body>
	<h2>대출정보</h2>
	<hr>
	<table class="table eq-ui-data-table z-depth-1" style="background-color:white;">
		<tr>
			<th>계좌상품번호</th>
			<td>${loaninfo.loan_num}</td>
			<th>계좌번호</th>
			<td>${loaninfo.myloan_account}</td>
		</tr>
		<tr>
			<th>금리</th>
			<td>${loaninfo.myloan_rate}</td>
		</tr>
		<tr>
			<th>대출일</th>
			<td>${loaninfo.myloan_date}</td>
			<th>만기일</th>
			<td>${loaninfo.myloan_late}</td>
		</tr>
		<tr>
			<th>대출금</th>
			<td>￦<fmt:formatNumber value="${loaninfo.myloan_amount}"
					pattern="#,###.##" /></td>
			<th>잔액</th>
			<td>￦<fmt:formatNumber value="${loaninfo.myloan_left}"
					pattern="#,###.##" /></td>
		</tr>
	</table>
	<h2>거래내역</h2>
	<hr>
	<br>
	<table class="table table-hover">
		<thead style="background-color:#2980b9; color:white;">
			<tr>
				<th>거래번호</th>
				<th>거래일자</th>
				<th>계좌번호</th>
				<th>금액</th>
				<th>보내는이</th>
				<th>받는이</th>
				<th>타입</th>
			</tr>
		</thead>
		<tbody style="background-color:white;">
			<c:if test="${empty loan}">
				<tr>
					<td colspan="7" style="text-align: center;">거래내역이 존재하지 않습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="list" items="${loan}">
				<tr>
					<td>${list.tran_num}</td>
					<td>${list.tran_date}</td>
					<td>${list.tran_account}</td>
					<td>￦<fmt:formatNumber value="${list.tran_amount}"
							pattern="#,###.##" /></td>
					<td>${list.tran_out}</td>
					<td>${list.tran_in}</td>
					<td>${list.tran_type}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>