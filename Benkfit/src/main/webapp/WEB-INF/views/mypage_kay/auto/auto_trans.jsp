<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동이체</title>
<style type="text/css">
.listTbl th {
	padding: 5px 10px;
	border: 1px solid gray;
}

.listTbl td{
	padding: 5px 10px;
}

.listTbl td[colspan="4"] {
	text-align: center;
}

.modal-body td{
	padding: 5px 10px;
}
</style>
</head>
<body class="body">
	<%@ include file="../../Template/top.jsp"%>
	<div style="text-align: center; margin: 200px;">
		<div style="display: inline-block;">
			<table class="listTbl">
				<tr>
					<th>보내는 계좌</th>
					<th>받는 계좌</th>
					<th>이체 금액</th>
					<th>이체 날짜</th>
					<th>비고</th>
				</tr>
				<c:if test="${auto == null}">
					<tr>
						<td colspan="4">자동이체가 등록되지 않았습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${auto}" var="auto">
					<tr id="${auto.auto_num}">
						<td>${auto.auto_from}</td>
						<td>${auto.auto_to}</td>
						<td>${auto.auto_value}</td>
						<td>${auto.auto_date}</td>
						<td><input type="button" class="btn btn-danger" onclick="autoDel('${auto.auto_num}')" value="삭제"></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4">
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#autoRegi" style="margin: 30px 0px 10px 0px;">등록</button>
					</td>
				</tr>
			</table>
		</div>
	</div>

	<!-- 등록 modal -->
	<div class="modal fade" id="autoRegi" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<form action="autoAdd" method="post">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalCenterTitle">자동이체에
							등록할 정보를 입력하세요.</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body" style="text-align: center;">
						<div style="display: inline-block;">
							<table>
								<tr>
									<td>보내는 계정</td>
									<td><select name="from">
											<c:forEach var="list" items="${accounts}">
												<option>${list}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td>privateKey 파일</td>
									<td><input type="file" name="file"></td>
								</tr>
								<tr>
									<td>받는 계정</td>
									<td><input type="text" name="to" size="40"></td>
								</tr>
								<tr>
									<td>보낼 금액</td>
									<td><input type="number" name="value"></td>
								</tr>
								<tr>
									<td>자동이체 날짜</td>
									<td><input type="number" name="date" min="1" max="31"
										placeholder="일을 입력하세요" size="20"></td>
								</tr>
								<tr>
									<td>계정 비밀번호</td>
									<td>
										<input type="password" name="password">
									</td>
								</tr>
							</table>
						</div>


					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-secondary" value="등록">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
					</div>
				</form>
			</div>
		</div>
	</div>

<script type="text/javascript">
	function autoDel(num){
		var item = "auto_num=" + num;
		var id = "#"+num
		$.ajax({
			type : 'post',
			data : item,
			url :'${pageContext.request.contextPath}/autoDel',
			success : function(data){
				$(id).remove();
			},
			error : function(){
				alert("Ajax error");
			}				
		});
	}
	
</script>

	<%@ include file="../../Template/footer.jsp"%>
</body>
</html>