<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
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
<title>체험관 > 지갑만들기</title>
<body>

	<!-- TOP&SIDE -->
	<%@ include file="../../Template/top.jsp"%>

	<div style="margin-top: -30px; width: 100%; text-align: center;">
		<div style="display: inline-block; width: 60%; margin: 200px 0px 0px 0px;">
			<h3 style="padding-left: 22px; text-align: center;">Wallet Create</h3>
			<span class="style">체험관 > 지갑만들기</span> <br>
			<hr style="width: 1100px;">
			<table style="width: 300px; display: inline">
				<tr>
					<td colspan="8"><p>블록체인의 시작은 지갑만들기부터.</p></td>
				</tr>
								<tr>
					<td colspan="8"><p>비밀번호만 입력하고 생성을 누르면 끝!</p></td>
				</tr>
				<tr>
					<td>
						<div class="eq-ui-form-group eq-ui-input-field">
							<input id="password" type="password" class="eq-ui-input validate">
							<label for="textarea_field">Password</label>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center" id="state">state</td>
				</tr>
			</table>
			<hr style="width: 1100px;">
			<div class="trBtn">
				<p id="">생성시, 수수료(gas)가 발생하지 않습니다.</p>
				<p id="">계정이 생성되면 자동으로 10ETH를 드립니다.</p>
				<button type="button" class="btn btn-success" onclick="create();">생성</button>
			</div>
		</div>
	</div>
	<%@ include file="../../Template/footer.jsp"%>
</body>
<script type="text/javascript">
	function create() {
		var password = $('#password').val();
		var alldata = {
			'password' : password
		};
		$('#state').html("계정을 생성중입니다.");

		$.ajax({
			url : "${pageContext.request.contextPath}/createAccount",
			type : "GET",
			data : alldata,
			success : function(data) {
				if (data) {
					$('#state').html("생성된 계정 : " + data);
				} else {
					$('#state').html("다시 시도해주세요.");
				}
			},
			beforeSend:function(xhr){
	              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	              $('.wrap-loading').removeClass('display-none');
	        },
			error : function() {
				alert("계정이 생성되지 않았습니다.");
				$('#state').html("다시 시도해주세요.");
			}
		});
	}
</script>
</html>