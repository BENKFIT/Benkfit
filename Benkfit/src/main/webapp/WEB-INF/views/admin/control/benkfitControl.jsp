<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 > 은행관리</title>
<style>
.modal-body td {
	padding: 10px;
}
</style>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>
	<div class="wrapper">
		<h1>은행관리</h1>
		<hr>
		<table class="table_kay">
			<tr>
				<td colspan="4"><h4>Beckfit 상태보고</h4></td>
			</tr>
			<tr>
				<th>대출토큰할당량</th>
				<td colspan="3"><input type="text" name="value" id="value"
					class="inputStyle" placeholder="loan token" required></td>
				<td>
					<div class="trBtn">
						<button type="button" class="btn btn-primary"
							onclick="benkfitLoanStock();">대출토큰할당</button>
					</div>
				</td>
			</tr>
			<tr>
				<th>State</th>
				<td id="state"></td>
			</tr>
			<tr>
				<th>관리계정</th>
				<td id="loan_balance">${loan_balance}Won</td>
			</tr>
			<tr>
				<th>토큰이름</th>
				<td id="name">${name}</td>
			</tr>
			<tr>
				<th>남은 배포량</th>
				<td id="remaning">${remaning}Won</td>
			</tr>
			<tr>
				<th>총 토큰량</th>
				<td id="totalSupply">${totalSupply}Won</td>
			</tr>
		</table>
		<hr>
		<div class="trBtn">
			<p id="">안녕하세요. 관리자님.</p>
			<!-- 			<button type="button" class="btn btn-primary" onclick="minerStart();">은행시작</button>
			<button type="button" class="btn btn-primary" onclick="minerStop();">은행중지</button> -->
			<button type="button" class="btn btn-success eq-ui-waves-light"
				onclick="minerStart();">은행시작</button>
			<button type="button" class="btn btn-danger eq-ui-waves-light"
				onclick="minerStop();">은행중지</button>
		</div>
	</div>
	<%@ include file="../../Template/footer.jsp"%>
</body>
<script type="text/javascript">
	function benkfitLoanStock() {
		var value = $('#value').val();
		var alldata = {
			'value' : value
		};
		$('#state').html("자금 이동중입니다. 잠시만 기다려주세요.");

		$.ajax({
			url : "${pageContext.request.contextPath}/benkfitLoanStock",
			type : "GET",
			data : alldata,
			dataType : "JSON",
			success : function(data) {
				if (data.chkNum != 0) {
					$('#totalSupply').html(data.totalSupply);
					$('#name').html(data.name);
					$('#remaning').html(data.remaning);
					$('#loan_balance').html(data.loan_balance);
					$('#state').html("자금 이동 성공.");
				} else {
					$('#state').html("다시 시도하세요.");
				}
			},
			beforeSend:function(xhr){
	              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	              $('.wrap-loading').removeClass('display-none');
	        },
			error : function() {
				alert("다시 시도하세요.");
				$('#state').html("다시 시도하세요.");
			}
		});
	}

	function minerStart() {
		var value = $('#value').val();
		var alldata = {
			'value' : value
		};
		$('#state').html("은행업무를 시작하겠습니다.");

		$.ajax({
			url : "${pageContext.request.contextPath}/minerStart",
			type : "GET",
			data : alldata,
			dataType : "JSON",
			success : function(data) {
				$('#state').html("은행업무가 시작되었습니다.");
			},
			beforeSend:function(xhr){
	              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	              $('.wrap-loading').removeClass('display-none');
	        },
			error : function() {
				alert("다시 시도하세요.");
				$('#state').html("은행업무를 시작되지 않았습니다.");
			}
		});
	}

	function minerStop() {
		var value = $('#value').val();
		var alldata = {
			'value' : value
		};
		$('#state').html("은행업무를 중지하겠습니다.");

		$.ajax({
			url : "${pageContext.request.contextPath}/minerStop",
			type : "GET",
			data : alldata,
			dataType : "JSON",
			success : function(data) {
				$('#state').html("은행업무가 중지되었습니다..");
			},
			beforeSend:function(xhr){
	              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	              $('.wrap-loading').removeClass('display-none');
	        },
			error : function() {
				alert("다시 시도하세요.");
				$('#state').html("은행업무 중지를 실패했습니다.");
			}
		});
	}
</script>
</html>