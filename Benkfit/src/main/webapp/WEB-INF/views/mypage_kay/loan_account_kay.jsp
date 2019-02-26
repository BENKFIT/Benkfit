<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출계좌조회</title>
<script>
	function load(){
		sendRequest(load_callback, 'loan_info' , "post");
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
	function loanBalance(){
		var from = $('#from').val();
		var password = $('#password').val();
		var alldata = {'from':from,'password':password};
		$('#messages').html("대출한도를 출력중입니다.");
		
		$.ajax({
			url:"${pageContext.request.contextPath}/loanBalance",
			type : "GET",
			data : alldata,
			success : function(data){
				$('#messages').html(data);
			},
			error : function(){
				alert("오류.");
			}
		});
	}
	function loanRepayment(){
		var from = $('#from').val();
		var amount = $("#amount").val();
		var alldata = {'from':from,'amount':amount};
		$('#messages2').html("입력하신 금액만큼 대출을 상환중입니다.");
		
		$.ajax({
			url:"${pageContext.request.contextPath}/loanRepayment",
			type : "GET",
			data : alldata,
			success : function(data){
				$('#messages2').html(data);
			},
			error : function(){
				alert("오류")
			}
		});
	}
	function loanleft(){
		var from = $('#from').val();
		if(from == null){
			alert("지갑을 등록하세요.");
		}
		var alldata = {'from':from};
$		('#messages1').html("남은 대출금을 조회중입니다.");
		
		$.ajax({
			url:"${pageContext.request.contextPath}/loanleft",
			type : "GET",
			data : alldata,
			success : function(data){
				$('#messages1').html(data);
			},
			error : function(){
				alert("해당 지갑에 승인된 대출이 없습니다.")
				$('#messages1').html("대출이 없습니다.");
			}
		});
	}
</script>
</head>
<body>
	<%@ include file="../Template/top.jsp"%>
	<div class="wrapper">
		<h2>대출계좌</h2>
		<hr>
		<table class="table_kay">
			<tr>
				<th>대출 계좌번호</th>
				<td><select name="myLoan_account">
					<option value="계좌선택">계좌를 선택하세요.</option>
						<c:forEach var="lo" items="${loan}">
							<option value="myLoan_account">${lo.myLoan_account}</option>
						</c:forEach>
				</select></td>
				<td><input type="file" id="from"></td>
				<td>비밀번호:<input style="width: 90px;" type="password" id="password" placeholder="지갑파일을 등록하세요."></td>
			</tr>
			<tr class='srch_area'>
				<th>조회기간</th>
				<td><input type="text" id="search_start_date"
					style="width: 90px;"> ~ <input type="text" 
					id="search_end_date" style="width: 90px;"></td>
				<td>
					<span> <input type="button" value="대출한도" onclick="loanBalance();"></span>
					<span> <input type="button" value="대출잔액" onclick="loanleft();"></span><br>
					<span> <input type="button" id="r_today" name="date" value="당일"></span>
					<span> <input type="button" id="r_week" name="date" value="1주일"></span>
					<span> <input type="button" id="r_week1" name="date" value="2주일"></span>
					<span> <input type="button" id="r_month1" name="date" value="1개월"></span>
					<span> <input type="button" id="r_month3" name="date" value="3개월"></span>
					<span> <input type="button" id="r_month6" name="date" value="6개월"></span><br>
					<span> 상환할 금액:<input type="text" id="amount" placeholder="지갑파일을 등록하세요."></span>
					<span> <input type="button" value="대출상환" onclick="loanRepayment();"></span>
				</td>
			</tr>
			<tr>
				<th>조회조건</th>
				<td><input type="radio" name="sel_opt">전체 <input
					type="radio" name="sel_opt">입금 <input type="radio"
					name="sel_opt">출금</td>
				<td><div id="messages">사용 가능 대출금액</div></td>
				<td><div id="messages1">남은 대출잔액</div></td>
				<td><div id="messages2"></div></td>
			</tr>
			<tr>
				<th>조회결과 순서</th>
				<td><input type="radio" name="sel_order">최근거래순 <input
					type="radio" name="sel_order">과거거래순</td>
			</tr>
			<tr>
				<th colspan="2" class="trBtn">
					<button class="btn2 btn2-success" onclick="load();">조회</button>
				</th>
			</tr>
		</table>
		<br>
		<div id="result">
			<!-- 결과 출력 위치 -->
		</div>
		<div id="messages"></div>
	</div>

	<%@ include file="../Template/footer.jsp"%>
</body>
</html>