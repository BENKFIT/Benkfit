<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="node_modules/image-to-base64/image-to-base64.min.js"></script>
<style>
.modal-body td {
	padding: 10px;
}
</style>
<body>
	<input type="file" id="myFile" />
	<input type="button" value="send" onclick="send();">
	<div id="state"></div>
</body>
<script type="text/javascript">
image2base64("https://whatever-image/")
.then(
    (response) => {
        console.log(response); //iVBORw0KGgoAAAANSwCAIA...
    }
)
.catch(
    (error) => {
        console.log(error); //Exepection error....
    }
)
</script>
</html>