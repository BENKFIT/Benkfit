<!-- 송운선 2019-01-22 17:43 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<html>
<head>
<title> 이벤트 > 상세 </title>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>

	<form action="eventList_sws?${_csrf.parameterName}=${_csrf.token}" method="post">
		<input type="hidden" name="eve_num" value="${dto.eve_num}"> 
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		
		<div style="margin-top: -30px; width: 100%; text-align: center;">
			<div style="margin-top: -30px; width: 100%; text-align: center;">
				<div style="display: inline-block; width: 60%; margin: 200px 0px;">
					<span class="style">이벤트 상세</span> <br>
					<table class="table eq-ui-data-table z-depth-1" style="width: 100%;">
						<thead>
							<tr style="background: #2980B9;">
								<th class="eq-ui-data-table-cell-non-numeric"
									style="width: 80%; color: #ffffff;">제목</th>
								<th class="eq-ui-data-table-cell-non-numeric" style="width: 20%; color: #ffffff;">등록일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td
									class="eq-ui-data-table-cell-non-numeric eq-ui-data-table-cell-truncate">${dto.eve_title}</td>
								<td
									class="eq-ui-data-table-cell-non-numeric eq-ui-data-table-cell-truncate">
									<fmt:formatDate type="both" pattern="yyyy-MM-dd"
										value="${dto.eve_regDate}" />
								</td>
							</tr>

							<tr>
								<td
									class="eq-ui-data-table-cell-non-numeric eq-ui-data-table-cell-truncate"
									colspan="2"><img
									src="/benkfit/resources/img/event/${dto.eve_img}"
									style="width: 100%"></td>
							</tr>

							<tr>
								<td
									class="eq-ui-data-table-cell-non-numeric eq-ui-data-table-cell-truncate"
									colspan="2"><pre>${dto.eve_content}</pre></td>
							</tr>

							<tr>
								<td
									class="eq-ui-data-table-cell-non-numeric eq-ui-data-table-cell-truncate"
									colspan="2">시작일 : <fmt:formatDate type="both"
										pattern="yyyy-MM-dd" value="${dto.eve_start}" /></td>
							</tr>
							<tr>
								<td class="eq-ui-data-table-cell-non-numeric eq-ui-data-table-cell-truncate"
									colspan="2">종료일 : <fmt:formatDate type="both"
										pattern="yyyy-MM-dd" value="${dto.eve_end}" /></td>
							</tr>

							<tr>
								<td colspan="2" align="right"><input
									class="btn btn-primary" type="submit" value="목록"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</form>
	
	<%@ include file="../../Template/footer.jsp"%>
</body>
</html>