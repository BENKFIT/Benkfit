<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>예/적금상품등록</title>
<style>
.listBox {
	border: 5px dotted rgb(189, 189, 189);
	width: 300px;
	height: 400px;
	border-radius: 20px;
}

.plus {
	font-size: 30px;
	position: absolute;
	top: 160px;
	left: 140px;
	color: rgb(189, 189, 189);
	background: rgba(255, 255, 255, 1.0);
	border: none;
}

.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
input, select{
	border-radius: 5px;
	width: 150px;
}
.modal td{
	padding: 0px 30px;
}
</style>
</head>
<body>
	<!-- top&side -->
	<%@ include file="../../../Template/top.jsp"%>

	<!-- content -->
	<div style="text-align: center; width: 100%; margin-top: 200px;">
		<div style="display: inline-block; width: 80%">
			<div class="listBox" style="position: relative;">
				<button class="plus" id="myBtn">&#43;</button>
			</div>
		</div>
	</div>

	<!-- modal -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<div style="text-align: center;">
				<div style="display: inline-block;">
					<form action="cheqRegiPro" method="post">
						<table style="margin: 100px 0px;">
							<tr>
								<td>상품종류</td>
								<td><select name="product_kind">
										<option value="입출금통장">입출금통장</option>
										<option value="자유적금">자유적금</option>
								</select></td>
							</tr>
							<tr><td>&nbsp;</td></tr>
							<tr>
								<td>상품명</td>
								<td><input type="text" name="product_name"></td>
							</tr>
							<tr><td>&nbsp;</td></tr>
							<tr>
								<td>가입대상</td>
								<td><select name="product_target">
										<option value="1">17세이하</option>
										<option value="2">17세이상</option>
								</select></td>
							</tr>
							<tr><td>&nbsp;</td></tr>
							<tr>
								<td>저축금액</td>
								<td><select name="product_limit">
										<option value="no">제한없음</option>
										<option value="yes">제한있음</option>
								</select></td>
							</tr>
							<tr><td>&nbsp;</td></tr>
							<tr>
								<td>계약기간</td>
								<td><select name="product_period">
										<option value="no">제한없음</option>
										<option value="12">~12개월</option>
										<option value="24">~24개월</option>
										<option value="36">~36개월</option>
								</select></td>
							</tr>
							<tr><td>&nbsp;</td></tr>
							<tr>
								<td>기본금리</td>
								<td><select name="product_rate">
										<option value="0.1%">0.1%</option>
										<option value="0.2%">0.2%</option>
										<option value="0.3%">0.3%</option>
								</select></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- footer -->
	<%@ include file="../../../Template/footer.jsp"%>

	<script type="text/javascript">
	var modal = document.getElementById('myModal');
	
	var btn = document.getElementById("myBtn");
	
	var span = document.getElementsByClassName("close")[0];                                          
	
	btn.onclick = function() {
	    modal.style.display = "block";
	}
	
	span.onclick = function() {
	    modal.style.display = "none";
	}
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
</script>
</body>
</html>