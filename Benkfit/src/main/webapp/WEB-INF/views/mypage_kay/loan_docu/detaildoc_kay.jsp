<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>정보등록</title>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>
	<div class="wrapper">
	<span class="style">대출관리>내서류>서류목록>서류상세페이지</span>
	<br>
		<hr>
		<div class="document">
			<form action="upresult" method="post" name="fileup"
				enctype="multipart/form-data">
				<table class="table_kay">
					<tr>
						<th>서류명</th>
						<td>
							<div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
											<input type="text" class="eq-ui-input" value="${vo.doc_title}" id="doc_title" readonly>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
						<div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
											<input type="text" class="eq-ui-input" value="${vo.doc_name}" id="doc_name" readonly>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>주민번호</th>
						<td>
						<div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
											<input type="text" class="eq-ui-input" value="${vo.doc_jumin1}"id="doc_jumin1"readonly>
										</div>
									</div>
								</div>
							</div>
						<div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
											 <input type="text" class="eq-ui-input" value="${vo.doc_jumin2}" id="doc_jumin2" readonly>	
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>개인주소</th>
						<td colspan="3">
						<div class="col-md-8">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
											 <input type="text" class="eq-ui-input" value="${vo.doc_perAddress}" id="doc_perAddress"  size="100" readonly>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>회사명</th>
						<td>
						<div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
											 <input type="text" class="eq-ui-input" value="${vo.doc_comName}" id="doc_comName" readonly>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>소속</th>
						<td>
						<div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
											 <input type="text" class="eq-ui-input" value="${vo.doc_department}" id="doc_department" readonly>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>직위</th>
						<td>
						<div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
											<input type="text" class="eq-ui-input" value="${vo.doc_position}" id="doc_position" readonly>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3">
						<div class="col-md-8">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
											<input type="text" class="eq-ui-input" value="${vo.doc_comAddress}" id="doc_comAddress" size="100" readonly>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>기간</th>
						<td><div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
											 <input type="text" class="eq-ui-input" value="${vo.doc_period_from}" id="doc_period_from" readonly>
										</div>
									</div>
								</div>
							</div>
						 <div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
											 <input type="text" class="eq-ui-input" value="${vo.doc_period_to}" id="doc_period_to" readonly>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3" style="text-align:center;">
							<input type="button" class="btn btn-danger " value="삭제" onclick="location.href='deletedocu?doc_num=${vo.doc_num}';">
							<input type="button" class="btn btn-primary " value="목록"
								onclick="window.location='document'">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<%@ include file="../../Template/footer.jsp"%>
</body>
</html>