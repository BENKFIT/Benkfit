<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./setting.jsp"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>BenkFit</title>
<style>
.div1 {
	margin-top: 200px;
	width: 100%;
	background: rgba(0, 0, 0, 0.1);
	height: 500px;
	text-align: center;
}

.div2 {
	width: 100%;
	height: 500px;
	text-align: center;
}

.div3 {
	width: 100%;
	background: rgba(0, 0, 0, 0.1);
	height: 500px;
	text-align: center;
}

img {
	display: inline;
}

tr>td {
	font-size: 20px;
	text-align: center;
}
</style>
</head>
<body>

	<!-- TOP&SIDE -->
	<%@ include file="./top.jsp"%>
<%-- 	<%@ include file="./NewFile.jsp"%> --%>
	
  <%@ include file="../common/chatbot.jsp"%>
  
	<!-- CONTENT -->
	<div class="div1">
		<div style="display: inline-block;">
			<img src="/benkfit/resources/img/logo/web3j.png" height="300px"
				style="margin: 100px 50px; display: inline;">
			<table style="display: inline">
				<tr>
					<td>web3j는 Smart Contracts로 작업하고 Ethereum 네트워크에서 클라이언트 (노드)와
						통합하기위한</td>
				</tr>
				<tr>
					<td>가볍고 모듈 식의 반응 형 타입 안전 Java 및 Android 라이브러리입니다.</td>
				</tr>
			</table>
		</div>
	</div>
	
	<div class="div2">
		<div style="display: inline-block;">
			<table style="display: inline">
				<tr>
					<td>
						이미지에서 문자를 추출하는 기술은 광학문자인식(OCR)이라는 이름으로 불린다.
					</td>
				</tr>
				<tr>
					<td>tesseract는 구글에서 지원하는 프로젝트이고 인식률이 OCR기술 중 굉장히 높은 편에 속한다고 한다.</td>
				</tr>
			</table>
			<img src="/benkfit/resources/img/logo/tesseract.png" height="300px"
				style="margin: 100px; display: inline;">
		</div>
	</div>

	<div class="div3">
		<div style="display: inline-block;">
			<img src="/benkfit/resources/img/logo/python.png" height="300px"
				style="margin: 100px 0px; display: inline;">
			<table style="display: inline">
				<tr>
					<td>학습용으로 좋은 언어인 동시에 실사용률과 생산성도 높은 강력한 언어</td>
				</tr>
			</table>
		</div>
	</div>

	<!-- FOOTER  -->
	<%@ include file="./footer.jsp"%>

</body>
</html>