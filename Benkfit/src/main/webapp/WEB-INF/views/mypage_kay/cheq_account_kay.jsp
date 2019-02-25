<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계좌조회</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {
		 $(".datepicker").datepicker();
	 });
function ajaxTest(){
	var account = $("#cheq_account option:selected").val();
 	var start_date = $('input[name="start_date"]').val();
 	var end_date = $('input[name="end_date"]').val(); 
 	var type =  $('input[name="option"]:checked').val();
	var order =$('input[name="order"]:checked').val();
	var end = $('input[name="num"]:checked').val();
	
	var sel_cheq = "account=" + account+ "&type=" + type + "&order=" +order 
	 + "&start_date=" +start_date  + "&end_date=" + end_date +"&end=" + end ;
	$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/cheq_info",
			data : sel_cheq,
			success : function(data) {
				$('#result').html(data);
			},	
			error : function() {
				alert('통신실패!!');
			}
		});
	}
</script>
</head>
<body>
	<%@ include file="../Template/top.jsp"%>
	<div class="wrapper">
		<h2>예금계좌조회</h2>
		<hr>
		<table class="table_kay">
			<tr>
				<th>예금 계좌번호</th>
				<td><select id="cheq_account" name="cheq_account">
						<c:choose>
							<c:when test="${account != null}">
								<option value="${account}">${account}</option>
							</c:when>
							<c:otherwise>
								<option value="계좌를 선택하세요.">계좌를 선택하세요.</option>
								<c:forEach var="ch" items="${cheq}">
									<option value="${ch.myCheq_account}">${ch.myCheq_account}</option>
								</c:forEach>
							</c:otherwise>
						</c:choose>
				</select></td>
			</tr>
			<tr class="srch_area">
				<th>조회기간</th>
				<td>
					<input type="date" class="datepicker" name="start_date" id="start_date" > ~ <br/>
 					<input type="date" class="datepicker" name="end_date" id="end_date">
					
				</td>
				<td>
					<span><input type="button" class="date" id="r_today" name="date" value="당일"></span>
					<span><input type="button" class="date" id="r_week" name="date" value="1주일"></span>
					<span><input type="button" class="date" id="r_week1" name="date" value="2주일"></span>
					<span><input type="button" class="date" id="r_month1" name="date" value="1개월"></span>
					<span><input type="button" class="date" id="r_month3" name="date" value="3개월"></span>
					<span><input type="button" class="date" id="r_month6" name="date" value="6개월"></span>
				</td>
			</tr>
			<tr>
				<th>조회조건</th>
				<td>
					<input type="radio" name="option" id="1" value="1" required>전체 
					<input type="radio" name="option" id="2" value="2" required>입금 
					<input type="radio" name="option" id="3" value="3" required>출금
				</td>
			</tr>
			<tr>
				<th>조회결과 순거</th>
				<td>
					<input type="radio"  name="order" id="4" value="4">최근거래순 
					<input type="radio" name="order"  id="5" value="5">과거거래순
				</td>
			</tr>
			<tr>
				<th>조회내역건수</th>
				<td>
					<input type="radio" name="num" value="10">10건
					<input type="radio" name="num" value="20">20건
					<input type="radio" name="num" value="30">30건
				</td>
			</tr>
			<tr>
				<th colspan="2" class="trBtn">
					<button class="btn2 btn2-success" onclick="ajaxTest();">조회</button>
				</th>
			</tr>
		</table>
		<br>
		<div id="result">
			<!-- 결과 출력 위치 -->
		</div>
	</div>
	<%@ include file="../Template/footer.jsp"%>

</body>
