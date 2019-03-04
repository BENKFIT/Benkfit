<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지 > 이체</title>
</head>
<style>
	tr{
		margin: 30px 0px;
	}
</style>
<body>
	<%@ include file="../../Template/top.jsp"%>



	<div style="margin: 200px 0px; text-align: center;">
		<div style="display: inline-block; width: 40%;">
			<span style="float: right;">마이페이지>입금</span>
			<div class="col-md-12">
				<form class="doc-form" action="depositPro" method="post">
					<table>
						<tr>
							<td colspan="3">
								<div class="col-md-12" id="accounts">
									<div class="eq-ui-form-group eq-ui-input-field">
										<input id="from" type="text" class="eq-ui-input" name="from"> <label for="from">입금계좌</label>
									</div>
								</div>
							</td>
							<td id="btn">
								<a class="btn btn-warning eq-ui-waves-light" onclick="myAccounts();" >내계좌</a>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-file">
										<a class="btn btn-primary eq-ui-waves-light" data-toggle="tooltip" data-placement="bottom" title="private key파일을 올려주세요."> Upload 
										<input id="file" type="file" name="file" multiple>
										</a>
										<div class="eq-ui-input-file-path">
											<input type="text" class="eq-ui-input"
												placeholder="Upload private key file" readonly>
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
										<input id="getBalance" type="text" class="eq-ui-input" disabled>
									</div>
								</div>
							</td>
							<td><a class="btn btn-warning eq-ui-waves-light" onclick="getBalance();">잔액확인</a></td>
						</tr>
						<tr>
							<td colspan="4">
								<div class="col-md-12">
									<div class="eq-ui-form-group eq-ui-input-field">
										<input id="amount" type="text" class="eq-ui-input" name="amount"> <label
											for="amount">입금액</label>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="4" style="text-align: center;">
								<input type="submit" value="확인" class="btn btn-primary" 
								data-toggle="tooltip" data-placement="bottom" title="입금시, 수수료가 발생합니다.">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	

	<script type="text/javascript">
		$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		})
	
		function getBalance(){
			var select = $('#from').val();
			var file = $('#file').val();
			var password = $('#password').val();
			var account = "account=" + select + "&file=" + file + '&password=' + password;
			$("#getBalance").val("잔액을 확인중입니다.");
			$.ajax({
				type : 'post',
				data : account,
				url : '${pageContext.request.contextPath}/getBalance',
				success : function(data) {
					$("#getBalance").val(data);
				},
				error : function() {
					alert("getBalance error");
				}
			});
		}
		
		function myAccounts(){
			$.ajax({
				type : 'post',
				url : '${pageContext.request.contextPath}/getMyAccounts',
				success : function(data){
					$('#accounts').html(data);
					$('#btn').html("<a class='btn btn-warning eq-ui-waves-light' onclick='changeText();'>입력하기</a>");
				},
				error : function(){
					alert("myAccounts error");
				}
			
			});
		}
		
		function changeText(){
			var data = "<div class='eq-ui-form-group eq-ui-input-field'><input id='from' type='text' class='eq-ui-input' name='from'> <label for='from'>입금계좌</label></div>";
			$('#accounts').html(data);
			$('#btn').html("<a class='btn btn-warning eq-ui-waves-light' onclick='myAccounts();' >내계좌</a>");
		}
	</script>
	
	<%@ include file="../../Template/footer.jsp"%>
</body>
</html>