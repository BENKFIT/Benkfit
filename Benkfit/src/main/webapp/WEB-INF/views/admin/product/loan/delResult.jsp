<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../Template/setting.jsp"%>
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
			<div class="modal-body" style="text-align: center;">
				<div style="display: inline-block;">
				<c:if test="${result == 1}">
					<p>${num} 상품이 삭제되었습니다.</p>
				</c:if>
				<c:if test="${result != 1}">
					<p>${num} 상품 삭제에 실패하였습니다.</p>
				</c:if>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>

</body>
</html>