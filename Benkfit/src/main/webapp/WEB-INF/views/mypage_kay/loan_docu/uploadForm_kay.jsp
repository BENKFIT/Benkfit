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
<meta name="description"
	content="Implements Google's Material Design in Bootstrap.">
<title>서류등록</title>
<!-- CSS-->
<link
	href="/benkfit/resources/assets/css/exentriq-bootstrap-material-ui.min.css?v=0.4.5"
	rel="stylesheet">
<link href="/benkfit/resources/assets/css/doc.css?v=0.4.5"
	rel="stylesheet">
<style>
/* #file {
		opacity:50;
		overflow: hidden;
		background-color:#fff;
		border:0;
		width: 1px; height: 1px;
		padding: 0; 
		margin: -1px;
		clip:rect(0,0,0,0); 
		border: 0;
		box-shadow:0;
	} */
</style>
<script>
	//파일업로드 버튼 기능
	function selectFile() {
		document.getElementById("file").click();
	}
	//업로드할 파일명 보이기, 업로드 직후 텍스트 인식 > 이름 & 주민번호 자동입력
	$(function() {
		$('#file').change(function() {
			var path = $('#file').val();
			var path2 = path.split("\\");
			var path3 = path2.length;
			var path4 = path2[path3 - 1];
			$('#file_text').val(path4);

			$.ajax({
				type : "POST",
				data : "file=" + path4,
				url : "${pageContext.request.contextPath}/value",
				success : function(data) {
					$("#doc_title").val(data.split("/")[0]);
					$("#doc_name").val(data.split("/")[1]);
					$("#doc_perAddress").val(data.split("/")[2]);
					$("#doc_jumin1").val(data.split("/")[3]);
					$("#doc_jumin2").val(data.split("/")[4]);
					$("#doc_comName").val(data.split("/")[5]);
					$("#doc_department").val(data.split("/")[6]);
					$("#doc_position").val(data.split("/")[7]);
					$("#doc_comAddress").val(data.split("/")[8]);
					$("#doc_period_from").val(data.split("/")[9]);
					$("#doc_period_to").val(data.split("/")[10]);
					swal("파일 업로드", "OK", "success");
				},
				error : function() {
					swal("오류", "다시 시도하세요.", "error");
				}
			});
		})
	});
</script>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>
	<div class="wrapper">
		<p><h1>서류등록</h1>
			<h5 style="float: right;">마이페이지>조회>대출관리>내서류>서류등록</h5></p> <br>
		<hr>
		<label>서류양식<span class="text-danger">*</span></label> &nbsp; &nbsp;
		<button class="btn btn-success eq-ui-waves-light"
			onclick="window.location='down'">서류양식다운로드</button>
		&nbsp;
		<hr>
		<div class="document">
			<form action="upresult" method="post" name="fileup"
				enctype="multipart/form-data">
				<table class="table_kay">
				<!-- <div class="form-group"> -->
					<tr>
						<th>서류업로드 *</th>
						<td>
						<div class="row">
				<div class="col-md-8">
					<div class="row">
						<div class="col-md-12">
							<div class="eq-ui-form-group eq-ui-input-file">
								<button type="button" class="btn btn-primary eq-ui-waves-light"
									id="signInBtn" name="idCardFile" onclick="selectFile();">
									Upload</button>
								<input type="text" class="eq-ui-input" id="file_text"
									name="document_text">
									
								<div class="eq-ui-input-file-path">
									<input type="file" class="eq-ui-input" id="file" name="doc_img"
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
						<th>서류명</th>
						<td>
							<div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
											<input type="text" class="eq-ui-input" name="doc_title"
												id="doc_title">
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
											<input type="text" class="eq-ui-input" id="doc_name"
												name="doc_name">
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
											<input type="text" class="eq-ui-input" id="doc_jumin1"
												name="doc_jumin1" placeholder="주민번호 앞자리">
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
											<input type="text" class="eq-ui-input" id="doc_jumin2"
												name="doc_jumin2" placeholder="주민번호 뒷자리">
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>개인주소</th>
						<td colspan="3">
							<div class="col-md-9">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
											<input type="text" class="eq-ui-input" id="doc_perAddress"
												name="doc_perAddress" size="100">
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
											<input type="text" class="eq-ui-input" id="doc_comName"
												name="doc_comName">
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
											<input type="text" class="eq-ui-input" id="doc_department"
												name="doc_department">
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
											<input type="text" class="eq-ui-input" id="doc_position"
										name="doc_position">
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>회사주소</th>
						<td colspan="3">
						<div class="col-md-9">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
										<input type="text" class="eq-ui-input"
											id="doc_comAddress" name="doc_comAddress" size="100">
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>기간</th>
						<td>
						<div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
										<input type="text" class="eq-ui-input"
							id="doc_period_from" name="doc_period_from" placeholder="부터(시작일)">
										</div>
									</div>
								</div>
							</div>
						<div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<div class="eq-ui-form-group eq-ui-input-field">
										  <input
									type="text" class="eq-ui-input" id="doc_period_to"
									name="doc_period_to" placeholder="까지(종료일)">
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="5" style="text-align: center;"><input
							type="submit" class="btn btn-primary " id="doc_img" value="업로드"
							onchange="javascript:document.getElementById('fileName').value = this.value">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<%@ include file="../../Template/footer.jsp"%>
</body>
<script
	src="/benkfit/resources/assets/js/vendor/jquery/dist/jquery.min.js?v=2.1.4"></script>
<script
	src="/benkfit/resources/assets/js/vendor/moment/min/moment.min.js?v=2.13.0"></script>
<script
	src="/benkfit/resources/assets/js/vendor/jquery-timeago/jquery.timeago.js?v=1.4.3"></script>
<script
	src="/benkfit/resources/assets/js/exentriq-bootstrap-material-ui.min.js?v=0.4.5"></script>

<script src="/benkfit/resources/assets/js/tp/tp-color.html"
	type="riot/tag"></script>
<script
	src="/benkfit/resources/assets/js/vendor/riot/riot+compiler.min.js?v=2.3.0"></script>

<script src="https://unpkg.com/lodash@4.16.0"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://unpkg.com/vue@2.5.21/dist/vue.js"></script>

<script src="/benkfit/resources/assets/js/doc.js?v=0.4.5"></script>
<script src="/benkfit/resources/assets/js/ctrl/ctrl-color.js"></script>
<script src="/benkfit/resources/assets/js/vue/collapsible.js"></script>
<script src="/benkfit/resources/assets/js/vue/dropdown.js"></script>
<script src="/benkfit/resources/assets/js/vue/tabs.js"></script>


</html>