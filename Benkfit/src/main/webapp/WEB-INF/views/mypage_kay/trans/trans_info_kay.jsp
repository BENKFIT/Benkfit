<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>이체</title>
<title>마이페이지 > 이체</title>
<style>
.modal-body td {
	padding: 10px;
}
</style>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>

	<div style="margin: 200px 0px; text-align: center;">
		<div style="display: inline-block; width: 50%;">
		<span style="float: right;">마이페이지>이체</span>
			<div class="col-md-12">
				<form class="doc-form" action="transPro" method="post">
					<table>
						<tr>
							<td colspan="4" style="text-align: center;">출금계좌정보</td>
						</tr>
						<tr>
							<td colspan="4">
								<div class="col-md-12">
									<!-- <div class="eq-ui-form-group eq-ui-input-field">
										<input id="from" type="text" class="eq-ui-input"> <label
											for="from">출금계좌</label>
									</div> -->
									<div class="eq-ui-form-group eq-ui-input-field">
                                    <select id="from" class="eq-ui-select" name="from">
                                        <option value="" disabled selected>계좌를 선택하세요.</option>
                                        <c:forEach var="cheq" items="${cheq}">
                                        	 <option value="${cheq}">${cheq}</option>
                                        </c:forEach>
                                    </select>
                                    <label>출금계좌</label>
                                </div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-file">
										<a class="btn btn-primary eq-ui-waves-light" data-toggle="tooltip" data-placement="bottom" title="private key파일을 올려주세요."> Upload <input
											id="file" type="file" multiple name="file">
										</a>
										<div class="eq-ui-input-file-path">
											<input type="text" class="eq-ui-input"
												placeholder="Upload one or more files" readonly>
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-field">
										<input id="password" type="password" class="eq-ui-input" name="password">
										<label for="password">비밀번호</label>
									</div>
								</div>
							</td>
							<td>
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-field">
										<input id="value" type="text" class="eq-ui-input" disabled>
									</div>
								</div>
							</td>
							<td><a class="btn btn-primary eq-ui-waves-light"
								onclick="getBalance();">잔액확인</a></td>
						</tr>
						<tr>
							<td colspan="4" style="text-align: center;">입금계좌정보</td>
						</tr>
						<tr>
							<td colspan="4">
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-field">
										<input id="to" type="text" class="eq-ui-input" name="to"> <label
											for="to">입금계좌</label>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-field">
										<input id="amount" type="number" class="eq-ui-input" name="amount">
										<label for="amount">금액</label>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="4" style="text-align: center;">
								<input type="submit" class="btn btn-primary" value="확인"
								data-toggle="tooltip" data-placement="bottom" title="거래시, 수수료가 발생합니다.">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>

	<!-- <div class="wrapper">
		<h1>계좌이체</h1>
		<hr>
		<table class="table_kay">
			<tr>
				<td><h3>출금정보</h3></td>
			</tr>
			<tr>
				<th>출금계좌</th>
				<td>
					<select id="out">
						<c:forEach var="account" items="${accounts}">
							<option value="${account}">${account}</option>
						</c:forEach>
					</select> <input type="text" id="out" size="40">
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
	</div> -->
	

	<script type="text/javascript">
	$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
			})
	
	function getBalance() {
		//var select = $('#out option:selected').val();
		var select = $('#from').val();
		var file = $('#file').val();
		var password = $('#password').val();
		var account = "account=" + select + "&file=" + file + '&password='
				+ password;

		$("#getBalance").html("잔액을 확인중입니다.");
		$.ajax({
			type : 'post',
			data : account,
			url : '${pageContext.request.contextPath}/getBalance',
			success : function(data) {
				$("#getBalance").html(data);
			},
			error : function() {
				alert("getBalance error");
			}
		});
	}
	
	</script>
<%@ include file="../../Template/footer.jsp"%>
</body>

</html>