<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
input, select {
	padding: 6px 10px;
	margin: 4px 0;
	display: inline-block;
	border: 1px solid #FFD662;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=button] {
	border: none;
	border-radius: 4px;
	cursor: pointer;
	background-color: #FFD662;
	color: white;
}

input[type=button]:hover {
	color: black;
}

p, a {
	color: rgb(119, 119, 119);
	font-weight: 12px;
}

.title {
	font-size: 50px;
	text-align: center;
}

#machine {
	text-align: center;
}

.inputButton {
	background: #FFD662;
}

#from {
	padding: 6px 10px;
	margin: 4px 0;
	display: inline-block;
	border: 1px solid #FFD662;
	border-radius: 4px;
	box-sizing: border-box;
}

#from {
	padding: 6px 10px;
	margin: 4px 0;
	display: inline-block;
	border: 1px solid #FFD662;
	border-radius: 4px;
	box-sizing: border-box;
}
</style>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../Template/top.jsp"%>

	<div
		style="margin-top: -30px; height: 40%; width: 100%; text-align: center;">
		<div style="display: inline-block; width: 60%; margin: 200px 0px;">
			<p class="title">거래 검증소</p>
			<input type="text" id="value" placeholder="컨트랙트주소를 입력해주세요.">
			<input type="button" value="검증하기" onclick="verify();"><br>
			<br>
			<p>
				해당 콘텐츠는 거래시 발생하는 컨트랙트 주소를 조회하여<br> 각기 다른 노드과 비교, 정상거래인지 확인하는
				컨텐츠입니다.<br> 정상거래로 확인될 경우 해당 거래의 영수증을 불러와 아래에 출력해드릴 것입니다.
			</p>
			<div id="success"><p><< 성공여부와 오류를 호출합니다. >></p></div>
			<br>
			<div id="state"><p><< [보낸 계정]과 [받은 계정]이 표시됩니다. >></p></div>
			<br>
			<div id="state1"><p><< 해당거래의 블럭번호가 표시됩니다. >></p></div>
			<br>

		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<%@ include file="../../Template/footer.jsp"%>
</body>
<script type="text/javascript">
	function verify() {
		var value = $('#value').val();
		var alldata = {
			'value' : value
		};
		$('#success').html("검증중입니다. 잠시만 기다려주세요.");

		$.ajax({
			url : "${pageContext.request.contextPath}/verifyPro",
			type : "GET",
			data : alldata,
			dataType : "JSON",
			success : function(data) {
				if (data.chkNum != 0) {
					$('#success').html("검증이 완료되었습니다.");
					$('#state').html(
							"[" + data.from + "] 님의 [" + data.to
									+ "]님께 대한 거래가 정상거래입니다.");
					$('#state1').html("해당거래 블럭번호 : " + data.bn);

				} else {
					$('#success').html("정상거래가 아닙니다. 고객센터에 문의해주세요.");
				}
			},
			error : function() {
				alert("컨트랙트 주소를 입력해주세요.");
				$('#success').html("다시 시도해주세요.");
			}
		});
	}
</script>
</html>