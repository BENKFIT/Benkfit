<!-- 송운선 2019-01-22 17:43 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<html>
<head>
<style>
	input[type=button] {
		border: none;
		border-radius: 4px;
		cursor: pointer;
		background-color: #FFD662;
		color: white;
	}
	
	input[type=submit] {
		border: none;
		border-radius: 4px;
		cursor: pointer;
		background-color: #FFD662;
		color: white;
	}
	
	input[type=button]:hover {
		color: black;
	}
	
	input[type=submit]:hover {
		color: black;
	}
</style>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>

	<form action="event_modifyForm_sws?pageNum=${pageNum}&eve_num=${dto.eve_num}" method="post">

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
							<th style="width: 20%; text-align: center" colspan="2">등록일</th>
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
							<td style="border: none;">시작일 : <fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${dto.eve_start}" /></td>
							<td style="text-align: right; border: none;">종료일 : <fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${dto.eve_end}" /></td>
						</tr>

						<tr>
							<td align="right" colspan="2">
								<input class="inputButton" type="submit" value="수정"> 
								<input class="inputButton" type="button" value="삭제" onclick="window.location='event_deletePro_sws?eve_num=${dto.eve_num}&pageNum=${pageNum}'">
								<input class="inputButton" type="button" value="목록" onclick="window.location='event_list_sws'">
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</form>
	<%@ include file="../../Template/footer.jsp"%>
</body>
</html>