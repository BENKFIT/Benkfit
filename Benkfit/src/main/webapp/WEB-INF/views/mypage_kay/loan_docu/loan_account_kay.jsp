<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>대출계좌</title>
<script>
function selectFile() {
	document.getElementById("file").click();
}
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
			beforeSend:function(){
	              $('.wrap-loading').removeClass('display-none');
          	},
            complete:function(){
              $('.wrap-loading').addClass('display-none');
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
			beforeSend:function(){
	              $('.wrap-loading').removeClass('display-none');
	          },
	          complete:function(){
	              $('.wrap-loading').addClass('display-none');
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
			 beforeSend:function(){
	              $('.wrap-loading').removeClass('display-none');
	          },
	          complete:function(){
	              $('.wrap-loading').addClass('display-none');
	          },
			error : function() {
				alert("오류");
			}
		});
	}
</script>
<style>
	.wrap-loading{ 
    position: fixed;
    left:0;
    right:0;
    top:0;
    bottom:0;
    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000',endColorstr='#20000000');    /* ie */
	}
   .wrap-loading div{ /*로딩 이미지*/
       position: fixed;
       top:50%;
       left:50%;
       margin-left: -21px;
       margin-top: -21px;
   }
    .display-none{ /*감추기*/
       display:none;
   }
</style>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>
	<div class="wrap-loading display-none">
	    <div><img src="/benkfit/resources/img/loading/loading.gif"></div>
	</div> 
	<div class="wrapper">
		<p style="float:right;font-size:12px;">마이페이지>조회>대출관리</p>
		<br>
		<hr>
		<br>
		<table class="table eq-ui-data-table z-depth-1">
			<tr>
				<th>대출 계좌번호</th>
				<td colspan="3">
					<div class="row">
					<div class="col-md-8">
					<div class="row">
						<div class="col-md-12">
							<div class="eq-ui-form-group eq-ui-input-file">
								<a type="button" class="btn btn-primary eq-ui-waves-light"
									id="file" onclick="selectFile();">
									Upload
								<input type="file" class="eq-ui-input" id="file_text"
									name="document_text" >
								</a>
								<div class="eq-ui-input-file-path">
									<input type="text" class="eq-ui-input" id="file" name="doc_img"
										required readonly>
								</div>
							</div>
						</div>
					</div>
					</div>
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
				<td colspan="1" style="text-align:left;"><input type="date" class="date_kay"
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
				<td style="text-align:left; padding-bottom: 12px;">
					   <div class="eq-ui-form-group eq-ui-input-file">
		                	<input type="button" class="btn btn-success" value="대출상환"
						onclick="loanRepayment();">
		                <div class="eq-ui-input-file-path">
		                   <input type="text"  class="eq-ui-input" id="amount" placeholder="지갑파일을 등록하세요.">
		                </div>
          			  </div>
				</td>
				<td colspan="2" style="text-align:right;"><div id="messages2"></div></td>
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
				</td>
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
	<script>
/* 날짜 객체 받아서 문자열로 리턴하는 함수 */
function getDateStr(myDate){
	var yyyy = myDate.getFullYear();
	var mm = ("00"+(myDate.getMonth() + 1)).slice(-2);
	var dd = ("00" +myDate.getDate()).slice(-2);
	return yyyy + '-' + mm + '-' + dd;
}
/* 오늘 날짜를 문자열로 반환 */
function today() {
  var d = new Date();
  return getDateStr(d);
}
/* 오늘로부터 1주일전 날짜 반환 */
function lastWeek() {
  var d = new Date();
  var dayOfMonth = d.getDate();
  d.setDate(dayOfMonth - 7);
  return getDateStr(d);
}
/* 오늘로부터 1주일전 날짜 반환 */
function lastWeek1() {
	  var d = new Date();
	  var dayOfMonth = d.getDate();
	  d.setDate(dayOfMonth - 14);
	  return getDateStr(d);
	}
/* 오늘로부터 1개월전 날짜 반환 */
function lastMonth1() {
  var d = new Date();
  var monthOfYear = d.getMonth();
  d.setMonth(monthOfYear - 1);
  return getDateStr(d);
}
/* 오늘로부터 3개월전 날짜 반환 */
function lastMonth3() {
	  var d = new Date()
	  var monthOfYear = d.getMonth();
	  d.setMonth(monthOfYear - 3);
	  return getDateStr(d);
	}
/* 오늘로부터 6개월전 날짜 반환 */
function lastMonth6() {
	  var d = new Date();
	  var monthOfYear = d.getMonth();
	  d.setMonth(monthOfYear - 6);
	  return getDateStr(d);
}
$(".srch_area :button").click(function(){
  var rname = $(this).attr("id")
  $("#end_date").val(today());
	if(rname == "r_today"){
    $("#start_date").val(today());
  }else if(rname == "r_week") {
  	$("#start_date").val(lastWeek());
  }else if(rname == "r_week1") {
  	$("#start_date").val(lastWeek1());
  }else if(rname == "r_month1") {
  	$("#start_date").val(lastMonth1());
  }else if(rname == "r_month3") {
  	$("#start_date").val(lastMonth3());
  }else{
  	$("#start_date").val(lastMonth6());
  }
})
</script>

</body>
</html>