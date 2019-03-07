<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<html>
<head>
<title>관리자 > 이벤트</title>
<style>
.modal-body th {
	text-align: center;
}
</style>
<script type="text/javascript">
	/*****************이미지 미리보기*****************/
	$(function() {
		$("#img").on('change', function() {
			readURL(this);
		});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#imgView').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	$(function() {
		$("#img2").on('change', function() {
			readURL2(this);
		});
	});

	function readURL2(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#imgView2').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>

	<div
		style="margin-top: 200px; height: 60%; width: 100%; text-align: center;">
		<div style="display: inline-block; width: 60%;">
			<span class="style">관리자 > 이벤트관리</span>
			<table class="table table-hover" style="width: 100%;">
				<thead>
					<tr style="background: #2980B9;">
						<th class="eq-ui-data-table-cell-non-numeric"
							style="width: 10%; color: #ffffff;">No</th>
						<th class="eq-ui-data-table-cell-non-numeric"
							style="width: 60%; color: #ffffff;">제목</th>
						<th class="eq-ui-data-table-cell-non-numeric"
							style="width: 15%; color: #ffffff;">등록일</th>
						<th class="eq-ui-data-table-cell-non-numeric"
							style="width: 15%; color: #ffffff;">수정 / 삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${cnt >= 1}">
						<c:forEach var="dto" items="${dtos}" varStatus="status">
							<tr>
								<td
									class="eq-ui-data-table-cell-non-numeric eq-ui-data-table-cell-truncate">${number}<c:set
										var="number" value="${number-1}" /></td>
								<td
									class="eq-ui-data-table-cell-non-numeric eq-ui-data-table-cell-truncate"><a
									href="event_contentForm_sws?eve_num=${dto.eve_num}&pageNum=${pageNum}">${dto.eve_title}</a></td>
								<td
									class="eq-ui-data-table-cell-non-numeric eq-ui-data-table-cell-truncate"><fmt:formatDate
										type="both" pattern="yyyy-MM-dd" value="${dto.eve_regDate}" /></td>
								<td><input class="btn btn-primary" type="button" value="수정"
									data-toggle="modal" data-target="#exampleModalUpdate${dto.eve_num}${status.index}"> 
									<input class="btn btn-danger" type="button" value="삭제"
									onclick="window.location='event_deletePro_sws?eve_num=${dto.eve_num}&pageNum=${pageNum}'">
								</td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${cnt == 0}">
						<tr style="background: #2980B9;">
							<td
								class="eq-ui-data-table-cell-non-numeric eq-ui-data-table-cell-truncate"
								colspan="3" align="center">이벤트가 존재하지 않습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>

		<table style="width: 1148px;" align="center">
			<tr>
				<th style="text-align: center; width: 100%"><c:if
						test="${cnt > 0}">
						<c:if test="${startPage > pageBlock}">
							<a href="event_list_sws">[◀◀ ]</a>
							<a href="event_list_sws?pageNum=${startPage - pageBlock}">[◀
								]</a>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span>[${i}]</span>
							</c:if>

							<c:if test="${i != currentPage}">
								<a href="event_list_sws?pageNum=${i}">[${i}]</a>
							</c:if>
						</c:forEach>

						<c:if test="${pageCount > endPage}">
							<a href="event_list_sws?pageNum=${startPage + pageBlock}">[▶
								]</a>
							<a href="event_list_sws?pageNum=${pageCount}">[▶▶ ]</a>
						</c:if>
					</c:if></th>

			</tr>
			<tr>
				<td align="center" style="padding-top: 10px; border: none;"><input
					class="btn btn-primary" type="button" value="추가"
					data-toggle="modal" data-target="#exampleModalAdd"></td>
			</tr>
		</table>
	</div>
	<%@ include file="../../Template/footer.jsp"%>

	<!-- Modal1 추가 -->
	<div class="modal fade bd-example-modal-lg" id="exampleModalAdd"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModallabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content" style="text-align: center;">
				<div class="modal-header" style="display: inline-block;">
					<div style="display: inline-block; margin: 0px 318px;">추가할
						내용을 입력하세요.</div>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" style="float: right;">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="event_addPro_sws" method="post"
					enctype="multipart/form-data">
					<div class="modal-body" style="text-align: center;">
						<div style="display: inline-block;">
							<input type="hidden" name="pageNum" value="${pageNum}">
							<div>
								<div>
									<table class="table table-hover">
										<thead>
											<tr style="background: #2980B9;">
												<th colspan="4" style="color: #ffffff; text-align: center;">이벤트
													추가</th>
											</tr>
										</thead>
										<tr>
											<td colspan="4">
												<div class="eq-ui-form-group eq-ui-input-file">
													<a class="btn btn-primary eq-ui-waves-light"
														style="color: white;"> Upload <input
														class="btn btn-primary" id="img" type="file" multiple
														name="eve_img" autofocus required>
													</a>
													<div class="eq-ui-input-file-path">
														<input type="text" class="eq-ui-input"
															placeholder="Upload image files" readonly
															style="width: 700px;">
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="4">
												<div style="text-align: center;">
													<img
														style="max-width: 400px; max-height: 380px; display: inline-block;"
														id="imgView" />
												</div>
											</td>
										</tr>

										<tr>
											<th style="padding-top: 37px;">제목</th>
											<td colspan="3">
												<div class="eq-ui-form-group eq-ui-input-field">
													<input id="first_name" type="text" class="eq-ui-input"
														name="eve_title" maxlength="37" style="width: 100%;">
													<label for="first_name">제목을 입력하세요.</label>
												</div>
											</td>
										</tr>

										<tr>
											<th style="padding-top: 52px;">내용</th>
											<td colspan="3">
												<div class="eq-ui-form-group eq-ui-input-field">
													<textarea id="textarea_field" class="eq-ui-textarea"
														name="eve_content"></textarea>
													<label for="textarea_field">내용을 입력하세요.</label>
												</div>
											</td>
										</tr>
										<tr>
											<th style="padding-top: 16px;">시작일</th>
											<td style="width: 20%;"><input type="date"
												class="date_kay" name="eve_start" placeholder="시작일을 입력하세요."
												autofocus required></td>
											<th style="padding-top: 16px;">종료일</th>
											<td style="width: 20%;"><input type="date"
												class="date_kay" name="eve_end" placeholder="종료일을 입력하세요."></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<input class="btn btn-primary" type="submit" value="추가"> <input
							class="btn btn-primary" type="button" value="취소"
							data-dismiss="modal">
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Modal2 수정 -->
	<c:forEach var="dto" items="${dtos}" varStatus="status">
	<div class="modal fade bd-example-modal-lg${dto.eve_num}${status.index}" id="exampleModalUpdate${dto.eve_num}${status.index}"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModallabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content" style="text-align: center;">
				<div class="modal-header" style="display: inline-block;">
					<div style="display: inline-block; margin: 0px 318px;">수정할
						내용을 입력하세요.</div>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="event_modifyPro_sws" method="post" enctype="multipart/form-data">

					<input type="hidden" name="eve_num" value="${dto.eve_num}">
					<input type="hidden" name="pageNum" value="${pageNum}">

					<div class="modal-body" style="text-align: center;">
						<div style="display: inline-block;">
							<div>
								<div>
									<table class="table table-hover">
										<thead>
											<tr style="background: #2980B9;">
												<th colspan="4" style="color: #ffffff; text-align: center;">이벤트 수정</th>
											</tr>
										</thead>
										<tr>
											<td colspan="4">
												<div class="eq-ui-form-group eq-ui-input-file">
													<a class="btn btn-primary eq-ui-waves-light" style="color: white;"> Upload 
														<input class="btn btn-primary" id="img2" type="file" name="eve_img" multiple autofocus required>
													</a>
													<div class="eq-ui-input-file-path">
														<input type="text" class="eq-ui-input" placeholder="Upload image files" readonly style="width: 700px;">
													</div>
												</div>
											</td>
										</tr>

										<tr>
											<td colspan="4">
												<div style="text-align: center;">
													<img style="max-width: 400px; max-height: 380px; display: inline-block;"
														id="imgView2" src="/benkfit/resources/img/event/${dto.eve_img}" />
												</div>
											</td>
										</tr>

										<tr>
											<th style="padding-top: 37px;">제목</th>
											<td colspan="3">
												<div class="eq-ui-form-group eq-ui-input-field">
													<input id="first_name" type="text" class="eq-ui-input"
														value="${dto.eve_title}" name="eve_title" maxlength="37"
														style="width: 100%;">
												</div>
											</td>
										</tr>

										<tr>
											<th style="padding-top: 52px;">내용</th>
											<td colspan="3">
												<div class="eq-ui-form-group eq-ui-input-field">
													<textarea id="textarea_field" class="eq-ui-textarea"
														name="eve_content">${dto.eve_content}</textarea>
												</div>
											</td>
										</tr>
										<tr>
											<th style="padding-top: 16px;">시작일</th>
											<td style="width: 20%;"><input type="date"
												class="date_kay" name="eve_start"
												value="<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${dto.eve_start}" />">
											<th style="padding-top: 16px;">종료일</th>
											<td style="width: 20%;"><input type="date"
												class="date_kay" name="eve_end"
												value="<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${dto.eve_end}" />"></td>
										</tr>
									</table>
								</div>
							</div>

						</div>
					</div>
					<div class="modal-footer">
						<input class="btn btn-primary" type="submit" value="수정"> <input
							class="btn btn-primary" type="button" value="취소"
							data-dismiss="modal">
					</div>
				</form>
			</div>
		</div>
	</div>
	</c:forEach>
</body>
</html>