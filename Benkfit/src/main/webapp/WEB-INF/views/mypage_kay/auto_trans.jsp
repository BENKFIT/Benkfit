<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="../Template/setting.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
<script>
	function load(){
		sendRequest(load_callback, "auto_Chk", "post");
	} 
	function load_callback(){
		var result = document.getElementById("result");
		if(httpRequest.readyState == 4){//4:completed: 전체 데이터가 취득 완료된 상태
			if(httpRequest.status == 200){ //200: 정상종료일때
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
<body class="body">
	<%@ include file ="../Template/top.jsp" %>
	<div class="wrapper">
		<h1>자동이체</h1>
		<hr>
		<table class="table_kay">
		<h3>출금정보</h3>
			<tr>
				<th>출금계좌</th>
				<td><select>
						<option>계좌선택</option>
						<option>111-111-11</option>
				</select></td>
				<td>
					<button class="btn2 btn2-success">계좌선택</button>
				</td>
			</tr>
			<tr>
				<th>계좌비밀번호</th>
				<td><input type="password" class="inputStyle"
					placeholder="숫자 4자리" maxlength="4" autofocus required></td>
			</tr>
		</table>
		<br><br>
		<hr>
		<table class="table_kay">
		<h3>입금정보</h3>
				<tr>
				<th>입금계좌번호</th>
				<td><input type="text" class="inputStyle" placeholder="숫자만입력 "
					required></td>
			</tr>
			<tr>
				<th>입금금액</th>
				<td><input type="text" class="inputStyle" placeholder="숫자만입력 "
					required></td>
			</tr>
			<tr>
				<th>이체주기</th>
				<td>
					<select>	
						<option>1개월</option>
						<option>2개월</option>
						<option>3개월</option>
						<option>6개월</option>
						<option>월요일</option>
						<option>화요일</option>
						<option>수요일</option>
						<option>목요일</option>
						<option>금요일</option>
						<option>매일</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>이체시작일</th>
				<td>
					<input type="date" class="date_kay">
					&nbsp;~ &nbsp;&nbsp;
					<input type="date" class="date_kay">
				</td>
			</tr>
		</table>
		<hr>
		<div class="trBtn">
			<button class="btn2 btn2-success">추가이체</button>
			<button class="btn2 btn2-success" id="trans" onclick="load();">다음</button>
		</div>
		<br><br><br>
		<div id="result">
			<!-- 결과 출력 위치 -->
		</div>
	</div>
	<%@ include file ="../Template/footer.jsp" %>
</body>
</html>