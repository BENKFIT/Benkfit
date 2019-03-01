<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="msapplication-tap-highlight" content="no">
<meta name="description"
	content="Implements Google's Material Design in Bootstrap.">
<title>대출계좌</title>
<!-- CSS-->
<link
	href="/benkfit/resources/assets/css/exentriq-bootstrap-material-ui.min.css?v=0.4.5"
	rel="stylesheet">
<link href="/benkfit/resources/assets/css/doc.css?v=0.4.5"
	rel="stylesheet">
<script>
	function ajaxTest() {
		var account = $("#myLoan_account option:selected").val();
		var start_date = $('input[name="start_date"]').val();
		var end_date = $('input[name="end_date"]').val();
		var type = $('input[name="option"]:checked').val();
		var order = $('input[name="order"]:checked').val();
		var end = $('input[name="num"]:checked').val();

		var sel_loan = "account=" + account + "&type=" + type + "&order="
				+ order + "&start_date=" + start_date + "&end_date=" + end_date
				+ "&end=" + end;

		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/loan_info",
			data : sel_loan,
			success : function(data) {
				$('#result').html(data);
			},
			error : function() {
				alert('통신실패!!');
			}
		});
	}
	function loanBalance() {
		var from = $('#from').val();
		var password = $('#password').val();
		var alldata = {
			'from' : from,
			'password' : password
		};
		$('#messages').html("대출한도를 출력중입니다.");
		$.ajax({
			url : "${pageContext.request.contextPath}/loanBalance",
			type : "GET",
			data : alldata,
			success : function(data) {
				$('#messages').html(data);
			},
			error : function() {
				alert("오류")
			}
		});
	}
	function loanRepayment() {
		var from = $('#from').val();
		var amount = $("#amount").val();
		var alldata = {
			'from' : from,
			'amount' : amount
		};
		$('#messages2').html("입력하신 금액만큼 대출을 상환중입니다.");

		$.ajax({
			url : "${pageContext.request.contextPath}/loanRepayment",
			type : "GET",
			data : alldata,
			success : function(data) {
				$('#messages2').html(data);
			},
			error : function() {
				alert("오류")
			}
		});
	}
	function loanleft() {
		var from = $('#from').val();
		if (from == null) {
			alert("지갑을 등록하세요.");
		}
		var alldata = {
			'from' : from
		};
		$('#messages1').html("남은 대출금을 조회중입니다.");

		$.ajax({
			url : "${pageContext.request.contextPath}/loanleft",
			type : "GET",
			data : alldata,
			success : function(data) {
				$('#messages1').html(data);
			},
			error : function() {
				alert("오류")
			}
		});
	}
</script>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>
	<div class="wrapper">
		<h2>대출계좌</h2>
		<hr>
		<table class="table eq-ui-data-table z-depth-1">
			<tr>
				<th>대출 계좌번호</th>
				<td>
					<div class="eq-ui-form-group eq-ui-input-file"
						style="text-align: left;">
						<a class="btn btn-primary eq-ui-waves-light"> Upload <input
							type="file" id="from">
						</a>
					</div>
				</td>
				<td colspan="3">
					<div class="eq-ui-input-file-path">
						<input type="text" class="eq-ui-input" readonly>
					</div>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td colspan="1"><input class="eq-ui-input" type="password"
					id="password" placeholder="비밀번호를 입력하세요" required></td>
			</tr>
			<tr class='srch_area'>
				<th>조회기간</th>
				<td colspan="1"><input type="date" class="date_kay"
					name="start_date" id="start_date"> ~ <input type="date"
					class="date_kay" name="end_date" id="end_date"></td>
				<td colspan="2"><span> <input type="button"
						class="btn btn-info " id="r_today" name="date" value="당일"></span>
					<span> <input type="button" class="btn btn-info "
						id="r_week" name="date" value="1주일"></span> <span> <input
						type="button" class="btn btn-info " id="r_week1" name="date"
						value="2주일"></span> <span> <input type="button"
						class="btn btn-info " id="r_month1" name="date" value="1개월"></span>
					<span> <input type="button" class="btn btn-info "
						id="r_month3" name="date" value="3개월"></span> <span> <input
						type="button" class="btn btn-info " id="r_month6" name="date"
						value="6개월"></span></td>
			</tr>
			<tr>
				<th>상환할 금액</th>
				<td style="text-align: left; padding-bottom: 12px;"><span>
						<input type="button" class="btn btn-success" value="대출상환"
						onclick="loanRepayment();">
				</span></td>
				<td colspan="2"><span> <input type="text" id="amount"
						class="eq-ui-input" placeholder="지갑파일을 등록하세요."></span></td>
			</tr>
			<tr>
				<th>대출한도</th>
				<td colspan="2" style="text-align: left; padding-bottom: 12px;">
					<span> <input type="button" value="대출한도"
						class="btn btn-success" onclick="loanBalance();"></span>
				</td>
				<td><div id="messages">사용 가능 대출금액</div></td>
			</tr>
			<tr>
				<th>대출잔액</th>
				<td colspan="2" style="text-align: left; padding-bottom: 12px;">
					<span> <input type="button" value="대출잔액"
						class="btn btn-success" onclick="loanleft();"></span>
				</td>
				<td><div id="messages1">남은 대출잔액</div></td>
			</tr>
			<tr>
				<th>조회조건</th>
				<td
					class="eq-ui-data-table-cell-non-numeric eq-ui-data-table-cell-truncate">
					<input name="option" type="radio" id="test1" value="1"
					class="eq-ui-input with-gap" /> <label for="test1">전체</label> <input
					name="option" type="radio" id="test2" value="2"
					class="eq-ui-input with-gap" /> <label for="test2">입금</label> <input
					name="option" type="radio" id="test3" value="3"
					class="eq-ui-input with-gap" /> <label for="test3">출금</label>
					</div>
				</td>

				<td><div id="messages2"></div></td>
			</tr>
			<tr>
				<th>조회결과 순서</th>
				<td colspan="3"
					class="eq-ui-data-table-cell-non-numeric eq-ui-data-table-cell-truncate">
					<div class="eq-ui-form-group">
						<input name="order" type="radio" id="test4" value="4"
							class="eq-ui-input with-gap" /> <label for="test4">최근거래순</label>
						<input name="order" type="radio" id="test5" value="5"
							class="eq-ui-input with-gap" /> <label for="test5">과거거래순</label>
					</div>
				</td>
			</tr>
			<tr>
				<th>조회내역건수</th>
				<td colspan="3"
					class="eq-ui-data-table-cell-non-numeric eq-ui-data-table-cell-truncate">
					<div class="eq-ui-form-group">
						<input name="num" type="radio" id="test6" value="10"
							class="eq-ui-input with-gap" /> <label for="test6">10건</label> <input
							name="num" type="radio" id="test7" value="20"
							class="eq-ui-input with-gap" /> <label for="test7">20건</label> <input
							name="num" type="radio" id="test8" value="30"
							class="eq-ui-input with-gap" /> <label for="test8">30건</label>
					</div>
				</td>
			</tr>
			<tr>
				<th colspan="4" class="trBtn">
					<button class="btn btn-primary eq-ui-waves-light"
						onclick="ajaxTest();">조회</button>
				</th>
			</tr>
		</table>
		<br>
		<div id="result">
			<!-- 결과 출력 위치 -->
		</div>
		<div id="messages"></div>
	</div>

	<%@ include file="../../Template/footer.jsp"%>
</body>
<script
	src="/benkfit/resources/assets/js/exentriq-bootstrap-material-ui.min.js?v=0.4.5"></script>
<script
	src="/benkfit/resources/assets/js/vendor/jquery/dist/jquery.min.js?v=2.1.4"></script>
<script
	src="/benkfit/resources/assets/js/vendor/moment/min/moment.min.js?v=2.13.0"></script>
<script
	src="/benkfit/resources/assets/js/vendor/jquery-timeago/jquery.timeago.js?v=1.4.3"></script>

<script src="/benkfit/resources/assets/js/tp/tp-color.html"
	type="riot/tag"></script>
<script
	src="/benkfit/resources/assets/js/vendor/riot/riot+compiler.min.js?v=2.3.0"></script>

<script src="https://unpkg.com/lodash@4.16.0"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://unpkg.com/vue@2.5.21/dist/vue.js"></script>

<script src="/benkfit/resources/assets/js/doc.js?v=0.4.5"></script>
<script src="/benkfit/resources/assets/js/ctrl/ctrl-color.js"></script>
<script src="/benkfit/resources/assets/js/vue/collapsible.js"></script>
<script src="/benkfit/resources/assets/js/vue/dropdown.js"></script>
<script src="/benkfit/resources/assets/js/vue/tabs.js"></script>

</html>