<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출상품조회</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1./js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<!-- TOP&SIDE -->
	<%@ include file="../../../Template/top.jsp"%>

	<!-- Table -->
	<div style="margin: 200px 0px;">
		<div class="container-fluid bg-gradient p-5">
			<div class="row mx-auto text-center w-75" style="text-align: center;">

				<c:forEach var="list" items="${loan}">
					<div class="center-block col-4 princing-item red">
						<div class="pricing-divider ">
							<%-- <h3 class="text-light">${list.loan_type}</h3> --%>
							<h4 class="my-0 display-2 text-light font-weight-normal mb-3">
								<span class="h3">Won</span> ${list.loan_rate}% <span
									class="h5">/year</span>
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
								<li><b>가입대상(등급)</b> ${list.loan_target}</li>
								<li><b>대출종류</b> ${list.loan_reMethod}</li>
								<li><b>대출금액 </b> ~${list.loan_amount}</li>
								<li><b>예금자보호대상</b></li>
							</ul>
							<button type="button" class="btn btn-lg btn-block  btn-custom"
								onclick="window.location='loanInfo?num=${list.loan_num}'">가입하기</button>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
		<hr>

	<!-- FOOTER  -->
	<%@ include file="../../../Template/footer.jsp"%>
</body>
</html>