<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.modal-body td {
	padding: 10px;
}
</style>
</head>
<body>
<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header" style="text-align: center;">
				<div style="display: inline-block;">수정할 정보를 입력하세요.</div>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" style="text-align: center;">
				<div style="display: inline-block;">
					<form action="savEditPro" method="post">
						<table>
							<tr>
								<td>상품번호</td>
								<td><input type="text" value="${vo.sav_num}" name="num"
									disabled></td>
							</tr>
							<tr>
								<td>상품이름</td>
								<td><input type="text" value="${vo.sav_name}" name="name"></td>
							</tr>
							<tr>
								<td>상품타입</td>
								<td><input type="text" value="${vo.sav_type}" name="type"></td>
							</tr>
							<tr>
								<td>상품이율</td>
								<td><input type="number" value="${vo.sav_rate}"
									name="rate"></td>
							</tr>
							<tr>
								<td>가입대상</td>
								<td><input type="text" value="${vo.sav_target}"
									name="target"></td>
							</tr>
							<tr>
								<td>등록일자</td>
								<td><input type="text" value="${vo.sav_regDate}"
									name="regDate" disabled></td>
							</tr>
							<tr>
								<td>제한금액</td>
								<td><input type="number" value="${vo.sav_limit}"
									name="number"></td>
							</tr>
							<tr>
								<td>가입기간</td>
								<td><input type="text" value="${vo.sav_period}"
									name="period"></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center;">
									<input type="submit" value="수정">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" data-dismiss="modal"
										data-target="#confirm" onclick="savDel('${vo.sav_num}');">삭제</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
	
	<!-- modal 삭제완료 -->
	<div class="modal fade" id="confirm" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true"></div>
	
	<script type="text/javascript">
		function savDel(sav_num){
			var num = "sav_num=" + sav_num;
			$.ajax({
				type : 'post',
				data : num,
				url : '${pageContext.request.contextPath}/savDel',
				success : function(data){
					window.location.href = '${pageContext.request.contextPath}/cheqSavRegi';
				},
				error : function(){
					alert("Ajax error");
				}				
			});
		}
	</script>
</body>
</html>