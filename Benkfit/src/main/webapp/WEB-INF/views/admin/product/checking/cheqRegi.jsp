<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1./js/bootstrap.min.js"></script>
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

input, select {
	border-radius: 5px;
	width: 150px;
}

.modal td {
	padding: 0px 30px;
}

.contentBox {
	border: 3px solid
}
</style>
</head>
<body>
	<!-- top&side -->
	<%@ include file="../../../Template/top.jsp"%>

	<!-- content -->
	<div style="text-align: center; width: 100%; margin-top: 200px;">
		<div style="display: inline-block;">
			<!-- 등록 -->
			<div class="listBox" style="position: relative;">
				<button class="plus" id="myBtn">&#43;</button>
			</div>
		</div>
	</div>

	<div style="margin: 100px 0px 300px 0px;">
		<div class="container-fluid bg-gradient p-5">
			<div class="row mx-auto text-center w-75" style="text-align: center;">
				<c:forEach var="list" items="${list}">
					<c:if test="${list.cheq_num%3 == 1}">
						<div class="center-block col-4 princing-item red">
							<div class="pricing-divider ">
								<h3 class="text-light">${list.cheq_type}</h3>
								<h4 class="my-0 display-2 text-light font-weight-normal mb-3">
									<span class="h3">Ether</span> ${list.cheq_rate}% <span class="h5">/year</span>
								</h4>
								<svg class='pricing-divider-img'
									enable-background='new 0 0 300 100' height='100px' id='Layer_1'
									preserveAspectRatio='none' version='1.1' viewBox='0 0 300 100'
									width='300px' x='0px' xml:space='preserve'
									xmlns:xlink='http://www.w3.org/1999/xlink'
									xmlns='http://www.w3.org/2000/svg' y='0px'>
          <path class='deco-layer deco-layer--1'
										d='M30.913,43.944c0,0,42.911-34.464,87.51-14.191c77.31,35.14,113.304-1.952,146.638-4.729
	c48.654-4.056,69.94,16.218,69.94,16.218v54.396H30.913V43.944z'
										fill='#FFFFFF' opacity='0.6'></path>
          <path class='deco-layer deco-layer--2'
										d='M-35.667,44.628c0,0,42.91-34.463,87.51-14.191c77.31,35.141,113.304-1.952,146.639-4.729
	c48.653-4.055,69.939,16.218,69.939,16.218v54.396H-35.667V44.628z'
										fill='#FFFFFF' opacity='0.6'></path>
          <path class='deco-layer deco-layer--3'
										d='M43.415,98.342c0,0,48.283-68.927,109.133-68.927c65.886,0,97.983,67.914,97.983,67.914v3.716
	H42.401L43.415,98.342z'
										fill='#FFFFFF' opacity='0.7'></path>
          <path class='deco-layer deco-layer--4'
										d='M-34.667,62.998c0,0,56-45.667,120.316-27.839C167.484,57.842,197,41.332,232.286,30.428
	c53.07-16.399,104.047,36.903,104.047,36.903l1.333,36.667l-372-2.954L-34.667,62.998z'
										fill='#FFFFFF'></path>
        </svg>
							</div>
							<div class="card-body bg-white mt-0 shadow">
								<ul class="list-unstyled mb-5 position-relative">
									<li><b>가입대상</b> ${list.cheq_target}</li>
									<li><b>예금종류</b> ${list.cheq_type}</li>
									<li><b>저축금액 </b> ${list.cheq_limit}</li>
									<li><b>예금자보호대상</b></li>
								</ul>
								<button type="button" class="btn btn-lg btn-block  btn-custom"
							onclick="window.location='#'">수정/삭제</button>
							</div>
						</div>
					</c:if>

					<c:if test="${list.cheq_num%3 == 2}">
						<div class="center-block col-4 princing-item blue">
							<div class="pricing-divider ">
								<h3 class="text-light">${list.cheq_type}</h3>
								<h4 class="my-0 display-2 text-light font-weight-normal mb-3">
									<span class="h3">Ether</span> ${list.cheq_rate}% <span class="h5">/year</span>
								</h4>
								<svg class='pricing-divider-img'
									enable-background='new 0 0 300 100' height='100px' id='Layer_1'
									preserveAspectRatio='none' version='1.1' viewBox='0 0 300 100'
									width='300px' x='0px' xml:space='preserve'
									xmlns:xlink='http://www.w3.org/1999/xlink'
									xmlns='http://www.w3.org/2000/svg' y='0px'>
				          <path class='deco-layer deco-layer--1'
										d='M30.913,43.944c0,0,42.911-34.464,87.51-14.191c77.31,35.14,113.304-1.952,146.638-4.729
					c48.654-4.056,69.94,16.218,69.94,16.218v54.396H30.913V43.944z'
										fill='#FFFFFF' opacity='0.6'></path>
				          <path class='deco-layer deco-layer--2'
										d='M-35.667,44.628c0,0,42.91-34.463,87.51-14.191c77.31,35.141,113.304-1.952,146.639-4.729
					c48.653-4.055,69.939,16.218,69.939,16.218v54.396H-35.667V44.628z'
										fill='#FFFFFF' opacity='0.6'></path>
				          <path class='deco-layer deco-layer--3'
										d='M43.415,98.342c0,0,48.283-68.927,109.133-68.927c65.886,0,97.983,67.914,97.983,67.914v3.716
					H42.401L43.415,98.342z'
										fill='#FFFFFF' opacity='0.7'></path>
				          <path class='deco-layer deco-layer--4'
										d='M-34.667,62.998c0,0,56-45.667,120.316-27.839C167.484,57.842,197,41.332,232.286,30.428
					c53.07-16.399,104.047,36.903,104.047,36.903l1.333,36.667l-372-2.954L-34.667,62.998z'
										fill='#FFFFFF'></path>
				        </svg>
							</div>

							<div class="card-body bg-white mt-0 shadow">
								<ul class="list-unstyled mb-5 position-relative">
									<li><b>가입대상</b> ${list.cheq_target}</li>
									<li><b>예금종류</b> ${list.cheq_type}</li>
									<li><b>저축금액 </b> ${list.cheq_limit}</li>
									<li><b>예금자보호대상</b></li>
								</ul>
								<button type="button" class="btn btn-lg btn-block  btn-custom2"
							onclick="window.location='#'">수정/삭제</button>
							</div>
						</div>
					</c:if>

					<c:if test="${list.cheq_num%3 == 0}">
						<div class="col-4 princing-item green">
							<div class="pricing-divider ">
								<h3 class="text-light">${list.cheq_type}</h3>
								<h4 class="my-0 display-2 text-light font-weight-normal mb-3">
									<span class="h3">Ether</span> ${list.cheq_rate}% <span class="h5">/year</span>
								</h4>
								<svg class='pricing-divider-img'
									enable-background='new 0 0 300 100' height='100px' id='Layer_1'
									preserveAspectRatio='none' version='1.1' viewBox='0 0 300 100'
									width='300px' x='0px' xml:space='preserve'
									xmlns:xlink='http://www.w3.org/1999/xlink'
									xmlns='http://www.w3.org/2000/svg' y='0px'>
          <path class='deco-layer deco-layer--1'
										d='M30.913,43.944c0,0,42.911-34.464,87.51-14.191c77.31,35.14,113.304-1.952,146.638-4.729
	c48.654-4.056,69.94,16.218,69.94,16.218v54.396H30.913V43.944z'
										fill='#FFFFFF' opacity='0.6'></path>
          <path class='deco-layer deco-layer--2'
										d='M-35.667,44.628c0,0,42.91-34.463,87.51-14.191c77.31,35.141,113.304-1.952,146.639-4.729
	c48.653-4.055,69.939,16.218,69.939,16.218v54.396H-35.667V44.628z'
										fill='#FFFFFF' opacity='0.6'></path>
          <path class='deco-layer deco-layer--3'
										d='M43.415,98.342c0,0,48.283-68.927,109.133-68.927c65.886,0,97.983,67.914,97.983,67.914v3.716
	H42.401L43.415,98.342z'
										fill='#FFFFFF' opacity='0.7'></path>
          <path class='deco-layer deco-layer--4'
										d='M-34.667,62.998c0,0,56-45.667,120.316-27.839C167.484,57.842,197,41.332,232.286,30.428
	c53.07-16.399,104.047,36.903,104.047,36.903l1.333,36.667l-372-2.954L-34.667,62.998z'
										fill='#FFFFFF'></path>
        </svg>
							</div>

							<div class="card-body bg-white mt-0 shadow">
								<ul class="list-unstyled mb-5 position-relative">
									<li><b>가입대상</b> ${list.cheq_target}</li>
									<li><b>예금종류</b> ${list.cheq_type}</li>
									<li><b>저축금액 </b> ${list.cheq_limit}</li>
									<li><b>예금자보호대상</b></li>
								</ul>
								<button type="button" class="btn btn-lg btn-block  btn-custom3"
							onclick="window.location='#'">수정/삭제</button>
							</div>
						</div>
					</c:if>
				</c:forEach>
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
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>상품명</td>
								<td><input type="text" name="product_name"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>가입대상</td>
								<td><select name="product_target">
										<option value="1">17세이하</option>
										<option value="2">17세이상</option>
								</select></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>저축금액</td>
								<td><select name="product_limit">
										<option value="no">제한없음</option>
										<option value="yes">제한있음</option>
								</select></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>계약기간</td>
								<td><select name="product_period">
										<option value="no">제한없음</option>
										<option value="12">~12개월</option>
										<option value="24">~24개월</option>
										<option value="36">~36개월</option>
								</select></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>기본금리</td>
								<td><select name="product_rate">
										<option value="0.1">0.1%</option>
										<option value="0.2">0.2%</option>
										<option value="0.3">0.3%</option>
								</select></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center; padding-top: 30px;">
									<input type="submit" value="등록">
								</td>
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