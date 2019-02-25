<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보수정</title>
<style>
	#file {
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
	}
	</style>
<script>
//파일업로드 버튼 기능
function selectFile() {
	document.getElementById("file").click();
} 
//업로드할 파일명 보이기, 업로드 직후 텍스트 인식 > 이름 & 주민번호 자동입력
$(function(){ 
	$('#file').change(function(){
		var path = $('#file').val();
		var path2 = path.split("\\");
		var path3 = path2.length;
		var path4 = path2[path3-1];
		$('#file_text').val(path4);
		
		$.ajax({
		type: "POST",
      data: "file=" + path4,
      url: "${pageContext.request.contextPath}/value", 
      success: function(data) {
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
    	    swal("파일 업로드","OK","success");
      },
      error: function() {
    	    swal("오류","다시 시도하세요.","error");
      }
		});
	})
});
</script>
</head>
<body>
	<%@ include file="../Template/top.jsp"%>
	<div class="wrapper">
	<h1>파일 업로드</h1>
		<hr>
		<div class="document">
			<form action="upresult" method="post" name="fileup"
				enctype="multipart/form-data">
				 <div class="form-group">
				<label>서류업로드<span class="text-danger">*</span></label>
					<div style="display:flex">
						<button type="button" class="btn btn-success btn-block" id="signInBtn" name="idCardFile" onclick="selectFile();">파일 선택</button>
						<input type="text" class="form-control" id="file_text" name="idCard_text">
					</div>
					<input type="file" class="form-control" id="file" name="doc_img" required>
					<div id="fileAjax"></div>
			  </div>
				<table class="table_kay">
					<tr>
						<th>서류명</th>
						<td><input type="text" class="inputStyle" name="doc_title" id="doc_title"></td>
					</tr>
					<tr>
						<th colspan="4">개인정보</th>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" class="inputStyle" id="doc_name" name="doc_name"></td>
						<th>주민번호</th>
						<td><input type="text" class="inputStyle" id="doc_jumin1" name="doc_jumin1">
						-	<input type="text" class="inputStyle" id="doc_jumin2" name="doc_jumin2">	
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3"><input type="text" class="inputStyle"  id="doc_perAddress"  name="doc_perAddress" size="65"></td>
					</tr>
					<tr>
						<th colspan="4">회사정보</th>
					</tr>
					<tr>
						<th>회사명</th>
						<td><input type="text" class="inputStyle" id="doc_comName" name="doc_comName" ></td>
					</tr>
					<tr>
						<th>소속</th>
						<td><input type="text" class="inputStyle" id="doc_department" name="doc_department"></td>
						<th>직위</th>
						<td><input type="text" class="inputStyle" id="doc_position" name="doc_position"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3"><input type="text" class="inputStyle" id="doc_comAddress" name="doc_comAddress" size="65"></td>
					</tr>
					<tr>
						<th>기간</th>
						<td>
						  <input type="text" class="inputStyle" id="doc_period_from" name="doc_period_from">
						~ <input type="text" class="inputStyle" id="doc_period_to" name="doc_period_to">
						</td>
					</tr>
					<tr>
						<td><input type="submit" class="btn2 btn2-success" id="doc_img" value="업로드"
							onchange="javascript:document.getElementById('fileName').value = this.value">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<%@ include file="../Template/footer.jsp"%>
</body>
</html>