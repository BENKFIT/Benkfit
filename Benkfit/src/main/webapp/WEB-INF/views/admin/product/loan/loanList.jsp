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
<title>대출상품등록</title>
<style>
.listBox {
	border: 5px dotted rgb(189, 189, 189);
	width: 300px;
	height: 400px;
	border-radius: 20px;
}

input, select {
	border-radius: 5px;
	width: 150px;
}

.contentBox {
	border: 3px solid
}

.productBtn, input[type=submit] {
	background: #FFD662;
	margin: 10px 20px;
	border: 1px solid #FFD662;
	font-size: 20px;
	padding: 10px;
	border-radius: 5px;
}

.regTbl {
	display: inline-block;
}

.regTbl td {
	padding: 10px;
}
</style>
</head>
<body>
	<!-- top&side -->
	<%@ include file="../../../Template/top.jsp"%>

	<!-- content -->
	<div
		style="text-align: center; width: 100%; margin: 200px 0px 150px 0px;">
		<div style="display: inline-block;">
			<!-- 등록 -->
			<div class="listBox" style="position: relative;">
				<button class="btn btn-primary"
					style="position: relative; font-size: 30px; position: absolute; top: 160px; left: 130px; color: rgb(189, 189, 189); background: rgba(255, 255, 255, 1.0); border: none;"
					data-toggle="modal" data-target="#exampleModalCenter">&#43;</button>
			</div>
		</div>
	</div>
	<hr>
	<div style="margin: 100px 0px;">
		<div class="container-fluid bg-gradient p-5">
			<div class="row mx-auto text-center w-75" style="text-align: center;">
				
				<!-- 가운데 정렬 시 아래의 margin을 삭제 -->
				<c:forEach var="list" items="${loan}">
					<div class="center-block col-4 princing-item red" style="margin: 30px 0px;">
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
								<%-- <li><b>예금종류</b> ${list.loan_type}</li> --%>
								<li><b>대출금액 </b> ${list.loan_amount}원</li>
								<li><b>예금자보호대상</b></li>
							</ul>
							<button type="button" class="btn btn-lg btn-block  btn-custom" class="btn btn-primary"
								data-toggle="modal" data-target="#editloan"
								onclick="loanEdit('${list.loan_num}');">수정/삭제</button>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<hr>

	<!-- Modal1 대출 -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center;">
					<div style="display: inline-block;">등록할 상품 유형을 선택하세요.</div>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="text-align: center;">
					<div style="display: inline-block;">
						<button data-toggle="modal" data-target="#loan" class="productBtn">대출상품</button>
						<!-- <button data-toggle="modal" data-target="#Sav" class="productBtn">적금상품</button> -->
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" 
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal2 - 대출등록 -->
	<div class="modal fade" id="loan" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">등록할 대출
						상품의 정보를 입력하세요.</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="text-align: center;">
					<form action="loanRegiPro" method="post">
						<table class="regTbl">
							<tr>
								<td>상품이름</td>
								<td><input type="text" name="name"></td>
							</tr>
							<tr>
								<td>대출금액</td>
								<td><select name="amount">
										<option value="50000000">~5000만원</option>
										<option value="100000000">~1억원</option>
								</select></td>
							</tr>
							<tr>
								<td>대출만기</td>
								<td><select name="period">
										<option value="12">12개월</option>
										<option value="24">24개월</option>
										<option value="36">36개월</option>
										<option value="60">60개월</option>
								</select></td>
							</tr>
							<tr>
								<td>상품이율</td>
								<td><select name="rate">
										<option value="0.05">5%</option>
										<option value="0.08">8%</option>
										<option value="0.1">10%</option>
								</select></td>
							</tr>
							<tr>
								<td>상환방식</td>
								<td><select name="remethod">
										<option value="원리금균등상환">원리금균등상환</option>
										<option value="만기일시상환">만기일시상환</option>
								</select></td>
							</tr>
							<tr>
								<td>가입대상</td>
								<td><select name="target">
										<option value="제한없음">제한없음</option>
								</select></td>
							</tr>
							<tr>
								<td>중도상환시 수수료 발생 여부</td>
								<td><select name="moderate">
										<option value="1">없음</option>
										<option value="2">있음</option>
								</select></td>
							</tr>
<!-- 							<tr>
								<td>대출상환방식</td>
								<td><select name="paymethod">
										<option value="1">없음</option>
										<option value="2">있음</option>
								</select></td>
							</tr> -->
							<tr>
								<td colspan="2" style="text-align: center;"><input
									type="submit" value="등록"></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 예금수정삭제 -->
	<div class="modal fade" id="editloan" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true"></div>

	<!-- 수정삭제 -->
	<script type="text/javascript">
		function loanEdit(loan_num) {
			var num = "loan_num=" + loan_num;
			$.ajax({
				type : 'post',
				data : num,
				url : '${pageContext.request.contextPath}/loanEdit',
				success : function(data) {
					$("#editloan").html(data);
				},
				error : function() {
					alert("Ajax error");
				}
			});
		}
	</script>

	<!-- footer -->
	<%@ include file="../../../Template/footer.jsp"%>
</body>
</html>