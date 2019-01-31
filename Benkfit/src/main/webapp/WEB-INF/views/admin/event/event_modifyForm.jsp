<!-- 송운선 2019-01-22 17:43 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<html>
<head>
<style>
	td>a {
		color: black;
	}
	.inputButton {
		background: #FFD662;
	}
	tr>th {
		text-align: center;
		padding: 10px 10px;
		width: 10%;
	}
	input, textarea{
		border: none;
		border-bottom:1px solid black; 
	}
	input[type="button"], input[type="submit"]{
		margin-top: 20px;
		border:none;
	}
</style>
<script type="text/javascript">

/*****************이미지 미리보기*****************/
$(function() {
    $("#img").on('change', function(){
        readURL(this);
    });
});

function readURL(input) {
    if (input.files && input.files[0]) {
	    var reader = new FileReader();

    	reader.onload = function (e) {
        	$('#imgView').attr('src', e.target.result);
        }
      reader.readAsDataURL(input.files[0]);
    }
}
</script>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>

	<form action="event_modifyPro_sws?eve_num=${dto.eve_num}&pageNum=${pageNum}" method="post"
		enctype="multipart/form-data">

		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="eve_num" value="${dto.eve_num}">
		
		<div style="margin-top: 200px; height: 18%; width: 100%; text-align: center;">
			<div style="display: inline-block;">
				<table class="board">
					<tr style="background: #FFD662">
						<th colspan="5" style="width: 100%; text-align: center">이벤트 수정 페이지</th>
					</tr>
					<tr>
						<td><input type="file" name="eve_img" id="img" autofocus required></td>
						<th>제목</th>
						<td colspan="3"><input type="text" name="eve_title" maxlength="50"
							value="${dto.eve_title}" autofocus required style="width: 770px;"></td>
					</tr>

					<tr>
						<td rowspan="2">
							<div style="text-align: center;">
								<img style="max-width: 400px; max-height: 380px; display: inline-block;" id="imgView" src="/benkfit/resources/img/event/${dto.eve_img}" />
							</div>
						</td>
						<th>내용</th>
						<td colspan="3"><textarea rows="20" cols="40" name="eve_content" style="width:770px; resize: none;"
						 word-break:break-all placeholder="내용을 입력하세요.">${dto.eve_content}</textarea></td>
					</tr>
 					<tr>
						<th>시작일</th>
						<td style="width: 20%;"><input type="date" name="eve_start" style="width: 100%;" value="${dto.eve_start}"
							placeholder="시작일을 입력하세요." autofocus required></td>
						<th style="padding : 0px 0px;">종료일</th>
						<td style="width: 20%;"><input type="date" name="eve_end" style="width: 100%;" value="${dto.eve_end}"
							placeholder="종료일을 입력하세요."></td>
					</tr>

					<tr>
						<th colspan="5" style="text-align: center">
						<input	class="inputButton" type="submit" value="수정"> 
						<input	class="inputButton" type="button" value="취소"
							onclick="window.location='event_list_sws';">
					</tr>
				</table>
			</div>
		</div>
	</form>

	<%@ include file="../../Template/footer.jsp"%>
</body>
</html>