<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계좌조회</title>
<script>
	function load(){
		sendRequest(load_callback, "sav_info" , "post");
	} 
	function load_callback(){
		var result = document.getElementById("result");
		if(httpRequest.readyState == 4){
			if(httpRequest.status == 200){
				result.innerHTML = httpRequest.responseText;
			}else{
				result.innerHTML = "에러발생";
			}
		} else {
			result.innerHTML = "상태 : " + httpRequest.readyState;
		}
	}
</script>
</head>
<body>
	<%@ include file="../Template/top.jsp"%>
	<div class="wrapper">
		<h2>적금계좌조회</h2>
		<hr>
		<table class="table_kay">
			<tr>
				<th>적금 계좌번호</th>
				<td>
					<select name="myLoan_account">
							<option value="계좌선택">계좌를 선택하세요.</option>
						<c:forEach var="sav" items="${sav}">
							<option value="myLoan_account">${sav.mySav_account}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr class='srch_area'>
				<th>조회기간</th>
				<td><input type="text" title="달력" id="search_start_date"	style="width: 90px;">
				 	~ 
					<input type="text" title="달력"
					id="search_end_date" style="width: 90px;"></td>
				<td>
					<span> <input type="button" id="r_today" name="date" value="당일"></span>
					<span> <input type="button" id="r_week" name="date" value="1주일"></span>
					<span> <input type="button" id="r_week1" name="date" value="2주일"></span>
					<span> <input type="button" id="r_month1" name="date" value="1개월"></span>
					<span> <input type="button" id="r_month3" name="date" value="3개월"></span>
					<span> <input type="button" id="r_month6" name="date" value="6개월"></span>
				</td>
			</tr>
			<tr>
				<th>조회결과 순거</th>
				<td><input type="radio" name="조회결과">최근거래순 <input
					type="radio" name="조회결과">과거거래순</td>
			</tr>
			<tr>
				<th colspan="2" class="trBtn">
					<button class="btn2 btn2-success" onclick="load();">다음</button>
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
</html>