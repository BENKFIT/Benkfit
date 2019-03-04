<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="msapplication-tap-highlight" content="no">
    <meta name="description" content="Implements Google's Material Design in Bootstrap.">
    <title>Forms</title>
    <!-- CSS-->
    <link href="/benkfit/resources/assets/css/exentriq-bootstrap-material-ui.min.css?v=0.4.5" rel="stylesheet">
    <link href="/benkfit/resources/assets/css/doc.css?v=0.4.5" rel="stylesheet">
<script>
function ajaxTest(){
	var account = $("#cheq_account option:selected").val();
 	var start_date = $('input[name="start_date"]').val();
 	var end_date = $('input[name="end_date"]').val(); 
 	var type =  $('input[name="option"]:checked').val();
	var order =$('input[name="order"]:checked').val();
	var end = $('input[name="num"]:checked').val();
	
	var sel_cheq = "account=" + account+ "&type=" + type + "&order=" +order 
	 + "&start_date=" +start_date  + "&end_date=" + end_date +"&end=" + end ;
	$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/cheq_info",
			data : sel_cheq,
			success : function(data) {
				$('#result').html(data);
			},	
			error : function() {
				alert('통신실패!!');
			}
		});
	}
</script>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>
	<div class="wrapper">
		<h5 style="float:right;">마이페이지>조회>예금계좌조회</h5>
		<br>
		<hr>
			<table class="table eq-ui-data-table z-depth-1">
			<tr>
				<th>예금 계좌번호</th>
				<td colspan="1">
						<select id="cheq_account" class="eq-ui-select">
						<c:choose>
							<c:when test="${account != null}">
								<option value="${account}">${account}</option>
							</c:when>
							<c:otherwise>
								<option value="계좌를 선택하세요." disabled selected>계좌를 선택하세요.</option>
								<c:forEach var="ch" items="${cheq}">
									<option value="${ch.myCheq_account}">${ch.myCheq_account}</option>
								</c:forEach>
							</c:otherwise>
						</c:choose>
				</select>
				</td>
			</tr>
			<tr class="srch_area">
				<th>조회기간</th>
				<td style="text-align:left;">
					<input type="date" class="date_kay"  name="start_date" id="start_date" > ~ 
 					<input type="date" class="date_kay" name="end_date" id="end_date">
				</td>
				<td>
					<span> <input type="button" class="btn btn-info " id="r_today" name="date" value="당일"></span>
					<span> <input type="button" class="btn btn-info " id="r_week" name="date" value="1주일"></span>
					<span> <input type="button" class="btn btn-info " id="r_week1" name="date" value="2주일"></span>
					<span> <input type="button" class="btn btn-info " id="r_month1" name="date" value="1개월"></span>
					<span> <input type="button" class="btn btn-info " id="r_month3" name="date" value="3개월"></span>
					<span> <input type="button" class="btn btn-info " id="r_month6" name="date" value="6개월"></span>
				</td>
			</tr>
			<tr>
				<th>조회조건</th>
				<td colspan="2" class="eq-ui-data-table-cell-non-numeric eq-ui-data-table-cell-truncate">
					<div class="eq-ui-form-group">
             		   <input name="option" type="radio" id="test1" value="1" class="eq-ui-input with-gap" />
               		 	<label for="test1">전체</label>
               		 	<input name="option" type="radio" id="test2" value="2" class="eq-ui-input with-gap" />
               		 	<label for="test2">입금</label>
               		 	<input name="option" type="radio" id="test3" value="3" class="eq-ui-input with-gap" />
               		 	<label for="test3">출금</label>
           	 </div>
				</td>
			</tr>
			<tr>
				<th>조회결과 순서</th>
				<td colspan="2" class="eq-ui-data-table-cell-non-numeric eq-ui-data-table-cell-truncate"> 
					<div class="eq-ui-form-group">
             		   <input name="order" type="radio" id="test4" value="4" class="eq-ui-input with-gap" />
               		 	<label for="test4">최근거래순</label>
               		 	<input name="order" type="radio" id="test5" value="5" class="eq-ui-input with-gap" />
               		 	<label for="test5">과거거래순</label>
           	 </div>
				</td>
			</tr>
			<tr>
				<th>조회내역건수</th>
				<td colspan="2" class="eq-ui-data-table-cell-non-numeric eq-ui-data-table-cell-truncate">
				<div class="eq-ui-form-group">
             		   <input name="num" type="radio" id="test6" value="10" class="eq-ui-input with-gap" />
               		 	<label for="test6">10건</label>
               		 	<input name="num" type="radio" id="test7" value="20" class="eq-ui-input with-gap" />
               		 	<label for="test7">20건</label>
               		 	<input name="num" type="radio" id="test8" value="30" class="eq-ui-input with-gap" />
               		 	<label for="test8">30건</label>
           	 </div>
				</td>
			</tr>
			<tr>
				<th colspan="3" style="text-align:center;margin-bottom:10px;">
					<a class="btn btn-primary eq-ui-waves-light" onclick="ajaxTest();">조회</a>
				</th>
			</tr>
		</table>
		<br>
		<div id="result">
			<!-- 결과 출력 위치 -->
		</div>
	</div>
	<%@ include file="../../Template/footer.jsp"%>
         
</body>
</html>
