<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이체</title>
<style>
.material__form-group {
	margin: 10px;
}
</style>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>
	<table class="table_kay">
		<tr>
			<td><h3>출금정보</h3></td>
		</tr>
		<tr>
			<th>출금계좌</th>
			<td>
				<%-- <select id="out">
						<c:forEach var="account" items="${accounts}">
							<option value="${account}">${account}</option>
						</c:forEach>
					</select> --%> <input type="text" id="out" size="40">
			</td>
		</tr>
		<tr>
			<th>출금계좌 private key</th>
			<td><input type="file" name="file" id="keyfile"></td>
		</tr>
		<tr>
			<th>비밀번호 입력</th>
			<td><input type="password" name="password" id="password"
				class="inputStyle" required></td>
		</tr>
		<tr>
			<td><input type="button" onclick="getBalance();" value="잔액확인"
				class="btn btn-primary" required></td>
			<td colspan="3" id="getBalance"></td>
		</tr>

	</table>
	<hr>
	<table class="table_kay" style="margin: 100px 0px;">
		<tr>
			<td><h3>입금정보</h3></td>
		</tr>
		<tr>
			<th>입금계좌번호</th>
			<td><input type="text" class="inputStyle" placeholder="계정주소입력"
				required id="in"></td>
		</tr>
		<tr>
			<th>입금금액</th>
			<td><input type="text" class="inputStyle" placeholder="ether"
				required id="amount"></td>
		</tr>
	</table>
	<hr>
	<div class="trBtn">
		<p>이체시, 수수료(gas)가 발생합니다.</p>
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#trans" onclick="confirm();">확인</button>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="trans" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<form action="transPro?${_csrf.parameterName}=${_csrf.token}" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalCenterTitle">이체 정보를
							확인하세요.</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body" style="text-align: center;">
						<div style="display: inline-block;">
							<input type="hidden" id="m_pwd" name="pwd">
							<table>
								<tr>
									<td>출금계좌정보</td>
									<td><input type="text" name="from" id="m_out"></td>
								</tr>
								<tr>
									<td>private key 파일</td>
									<td><input type="file" name="file"></td>
								</tr>
								<tr>
									<td>출금금액</td>
									<td><input type="number" name="amount" id="m_amount"></td>
								</tr>
								<tr>
									<td>입금계좌번호</td>
									<td><input type="text" name="to" id="m_in"></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-primary" value="이체" />
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@ include file="../../common/chatbot.jsp"%>
	<script type="text/javascript">
		function getBalance(){
			//var select = $('#out option:selected').val();
			var select = $('#out').val();
			var file = $('#keyfile').val();
			var password = $('#password').val();
			var account = "account=" + select + "&file=" + file + '&password=' + password;
			
			$("#getBalance").html("잔액을 확인중입니다.");
			$.ajax({
				type : 'post',
				data : account,
				url : '${pageContext.request.contextPath}/getBalance',
				success : function(data) {
					$("#getBalance").html(data);
				},
				beforeSend:function(xhr){
		              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		              $('.wrap-loading').removeClass('display-none');
		        },
				error : function() {
					alert("getBalance error");
				}
			});
		}
	
		function confirm() {
			//var select = $('#out option:selected').val();
			var select = $('#out').val();
			var pwd = $('#password').val();
			var out = $('#in').val();
			var amount = $('#amount').val();

			$('#m_out').val(select);
			$('#m_amount').val(amount);
			$('#m_in').val(out);
			$('#m_pwd').val(pwd);
		}
	</script>
	<%@ include file="../../Template/footer.jsp"%>
</body>

</html>