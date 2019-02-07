<!-- 송운선 2019-01-22 17:43 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<html>
<head>
<style>
	.inputButton {
		background: #FFD662;
	}
</style>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>

	<form action="eventList_sws" method="post">

		<input type="hidden" name="eve_num" value="${dto.eve_num}"> <input
			type="hidden" name="pageNum" value="${pageNum}">
		<div
			style="margin-top: -30px; height: 40%; width: 100%; text-align: center;">
			<div style="display: inline-block; width: 60%; margin: 200px 0px;">
				<h2>이벤트</h2>
				<br>
				<table class="table table-hover" style="width: 100%;">
					<thead>
						<tr style="background: #FFD662">
							<th style="width: 80%;">제목</th>
							<th style="width: 20%; text-align: center">등록일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td align="left">${dto.eve_title}</td>
							<td align="center"><fmt:formatDate type="both"
									pattern="yyyy-MM-dd" value="${dto.eve_regDate}" /></td>
						</tr>

						<tr>
							<td colspan="2"><img
								src="/benkfit/resources/img/event/${dto.eve_img}" style="width: 100%"></td>
						</tr>

						<tr>
							<td colspan="2"><pre>${dto.eve_content}</pre></td>
						</tr>

						<tr>
							<td>시작일 : <fmt:formatDate type="both" pattern="yyyy-MM-dd"
									value="${dto.eve_start}" /></td>
						</tr>
						<tr>
							<td>종료일 : <fmt:formatDate type="both" pattern="yyyy-MM-dd"
									value="${dto.eve_end}" /></td>
						</tr>

						<tr>
							<td colspan="2" align="right"><input class="inputButton"
								type="submit" value="목록"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</form>
	<%@ include file="../../Template/footer.jsp"%>
</body>
</html>