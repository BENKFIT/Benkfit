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
<meta charset="UTF-8">
<title>관리자 > 예/적금상품등록</title>
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
	background: #2980b9;
	margin: 10px 20px;
	border: 1px solid #2980b9;
	font-size: 20px;
	border-radius: 5px;
	color: white;
}

.regTbl {
	display: inline-block;
}

.regTbl td {
	padding: 10px;
}
.modal-body td {
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
				<button
					style="position: relative; font-size: 30px; position: absolute; top: 160px; left: 130px; color: rgb(189, 189, 189); border: none; background: none;"
					data-toggle="modal" data-target="#exampleModalCenter">&#43;</button>
			</div>
		</div>
	</div>
	<hr>
	<div style="margin: 50px 0px;">
		<div class="container-fluid bg-gradient p-5">
			<span class="style">금융상품 > 예금</span>
			<div class="row mx-auto text-center w-75" style="text-align: center;">

				<!-- 가운데 정렬 시 아래의 margin을 삭제 -->
				<c:forEach var="list" items="${cheq}" varStatus="status">
					<div class="center-block col-4 princing-item green"
						style="margin: 30px 0px;">
						<div class="pricing-divider ">
							<h4 class="my-0 display-2 text-light font-weight-normal mb-3">
								<span class="h3">Ether</span> ${list.cheq_rate}% <span
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
								<li><b>가입대상(등급)</b> ${list.cheq_target}</li>
								<li><b>예금종류</b> ${list.cheq_type}</li>
								<li><b>저축금액 </b> ${list.cheq_limit}</li>
								<li><b>예금자보호대상</b></li>
							</ul>
							<button type="button" class="btn btn-lg btn-block  btn-custom3"
								class="btn btn-primary" data-toggle="modal"
								data-target="#editCheq${list.cheq_num}${status.index}">수정/삭제</button>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<hr>
	<div style="margin: 50px 0px;">
		<div class="container-fluid bg-gradient p-5">
			<span class="style">금융상품 > 적금</span>
			<div class="row mx-auto text-center w-75" style="text-align: center;">

				<!-- 가운데 정렬 시 아래의 margin을 삭제 -->
				<c:forEach var="list" items="${sav}" varStatus="status2">
					<div class="center-block col-4 princing-item blue"
						style="margin: 30px 0px;">
						<div class="pricing-divider ">
							<h4 class="my-0 display-2 text-light font-weight-normal mb-3">
								<span class="h3">Ether</span> ${list.sav_rate}% <span class="h5">/year</span>
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
								<li><b>가입대상(등급)</b> ${list.sav_target}</li>
								<li><b>예금종류</b> ${list.sav_type}</li>
								<li><b>저축금액 </b> ${list.sav_limit}</li>
								<li><b>예금자보호대상</b></li>
							</ul>
							<button type="button" class="btn btn-lg btn-block  btn-custom2"
								data-toggle="modal"
								data-target="#editSav${list.sav_num}${status2.index+1000}">수정/삭제</button>
						</div>
					</div>
				</c:forEach>

				<%-- <c:if test="${list.cheq_num%3 == 3}">
					<div class="col-4 princing-item green">
						<div class="pricing-divider ">
							<h3 class="text-light">${list.cheq_type}</h3>
							<h4 class="my-0 display-2 text-light font-weight-normal mb-3">
								<span class="h3">Ether</span> ${list.cheq_rate}% <span
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
								<li><b>가입대상(등급)</b> ${list.cheq_target}</li>
								<li><b>예금종류</b> ${list.cheq_type}</li>
								<li><b>저축금액 </b> ${list.cheq_limit}</li>
								<li><b>예금자보호대상</b></li>
							</ul>
							<button type="button" class="btn btn-lg btn-block  btn-custom3"
								onclick="window.location='#'">수정/삭제</button>
						</div>
					</div>
				</c:if> --%>
			</div>
		</div>
	</div>

	<!-- modal -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<div style="text-align: center;">
				<div style="display: inline-block;">
					<form action="cheq/savRegi" method="post">
						<table style="margin: 100px 0px;">
							<tr>
								<td>상품종류</td>
								<td><select name="product_kind">
										<option value="입출금통장">입출금통장</option>
										<option value="적금">적금</option>
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
										<option value="제한없음">제한없음</option>
										<option value="제한있음">제한있음</option>
								</select></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>계약기간</td>
								<td><select name="product_period">
										<option value="제한없음">제한없음</option>
										<option value="12개월">~12개월</option>
										<option value="24개월">~24개월</option>
										<option value="36개월">~36개월</option>
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

	<!-- Modal1 예금/적금 -->
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
						<button data-toggle="modal" data-target="#Cheq" class="productBtn">예금상품</button>
						<button data-toggle="modal" data-target="#Sav" class="productBtn">적금상품</button>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal2 - 예금등록 -->
	<div class="modal fade" id="Cheq" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">등록할 예금
						상품의 정보를 입력하세요.</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="text-align: center;">
					<form action="cheqRegiPro" method="post">
						<table class="regTbl">
							<tr>
								<td>상품이름</td>
								<td><input type="text" name="name"></td>
							</tr>
							<tr>
								<td>상품이율</td>
								<td><select name="rate">
										<option value="0.02">2%</option>
										<option value="0.03">3%</option>
										<option value="0.04">4%</option>
								</select></td>
							</tr>
							<tr>
								<td>상품종류</td>
								<td><select name="type">
										<option value="입출금식">입출금식</option>
										<option value="거치식">거치식</option>
								</select></td>
							</tr>
							<tr>
								<td>가입대상</td>
								<td><select name="target">
										<option value="2">17세이상</option>
										<option value="1">17세미만</option>
								</select></td>
							</tr>
							<tr>
								<td>금액제한</td>
								<td><select name="limit">
										<option value="5000">~5000Eth</option>
										<option value="0">제한없음</option>
								</select></td>
							</tr>
							<tr>
								<td>가입기간</td>
								<td><select name="period">
										<option value="12">12개월</option>
										<option value="24">24개월</option>
										<option value="36">36개월</option>
										<option value="제한없음">제한없음</option>
								</select></td>
							</tr>
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

	<!-- Modal3 - 적금등록 -->
	<div class="modal fade" id="Sav" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">등록할 적금
						상품의 정보를 입력하세요.</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="text-align: center;">
					<form action="savRegiPro" method="post">
						<table class="regTbl">
							<tr>
								<td>상품이름</td>
								<td><input type="text" name="name"></td>
							</tr>
							<tr>
								<td>상품이율</td>
								<td><select name="rate">
										<option value="0.02">2%</option>
										<option value="0.03">3%</option>
										<option value="0.04">4%</option>
								</select></td>
							</tr>
							<tr>
								<td>상품종류</td>
								<td><select name="type">
										<option value="정기적금">정기적금</option>
										<option value="자유적금">자유적금</option>
								</select></td>
							</tr>
							<tr>
								<td>가입대상</td>
								<td><select name="target">
										<option value="2">17세이상</option>
										<option value="1">17세미만</option>
								</select></td>
							</tr>
							<tr>
								<td>금액제한</td>
								<td><select name="limit">
										<option value="5000">~5000Eth</option>
										<option value="0">제한없음</option>
								</select></td>
							</tr>
							<tr>
								<td>자동이체가능여부</td>
								<td><select name="auto">
										<option value="가능">가능</option>
										<option value="불가능">불가능</option>
								</select></td>
							</tr>
							<tr>
								<td>가입기간</td>
								<td><select name="period">
										<option value="12">12개월</option>
										<option value="24">24개월</option>
										<option value="36">36개월</option>
										<option value="0">제한없음</option>
								</select></td>
							</tr>
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
	<c:forEach var="list" items="${cheq}" varStatus="status">
		<div class="modal fade${list.cheq_num}${status.index}"
			id="editCheq${list.cheq_num}${status.index}" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header" style="text-align: center;">
						<div style="display: inline-block;">수정할 정보를 입력하세요.</div>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body" style="text-align: center;">
						<div style="display: inline-block;">
							<form action="cheqEditPro" method="post">
								<table>
									<tr>
										<td>상품번호</td>
										<td><input type="text" value="${list.cheq_num}"
											name="num" disabled></td>
									</tr>
									<tr>
										<td>상품이름</td>
										<td><input type="text" value="${list.cheq_name}"
											name="name"></td>
									</tr>
									<tr>
										<td>상품타입</td>
										<td><input type="text" value="${list.cheq_type}"
											name="type"></td>
									</tr>
									<tr>
										<td>상품이율</td>
										<td><input type="number" value="${list.cheq_rate}"
											name="rate"></td>
									</tr>
									<tr>
										<td>가입대상</td>
										<td><input type="text" value="${list.cheq_target}"
											name="target"></td>
									</tr>
									<tr>
										<td>등록일자</td>
										<td><input type="text" value="${list.cheq_regDate}"
											name="regDate" disabled></td>
									</tr>
									<tr>
										<td>제한금액</td>
										<td><input type="number" value="${list.cheq_limit}"
											name="number"></td>
									</tr>
									<tr>
										<td>가입기간</td>
										<td><input type="text" value="${list.cheq_period}"
											name="period"></td>
									</tr>
									<tr>
										<td colspan="2" style="text-align: center;"><input
											type="submit" value="수정"></td>
									</tr>
								</table>
							</form>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" onclick="window.location='cheqDel?cheq_num=${list.cheq_num}'">삭제</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>

	<!-- 적금수정삭제 -->
	<c:forEach var="list" items="${sav}" varStatus="status2">
		<div class="modal fade"
			id="editSav${list.sav_num}${status2.index+1000}" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header" style="text-align: center;">
						<div style="display: inline-block;">수정할 정보를 입력하세요.</div>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body" style="text-align: center;">
						<div style="display: inline-block;">
							<form action="savEditPro" method="post">
								<table>
									<tr>
										<td>상품번호</td>
										<td><input type="text" value="${list.sav_num}" name="num"
											disabled></td>
									</tr>
									<tr>
										<td>상품이름</td>
										<td><input type="text" value="${list.sav_name}"
											name="name"></td>
									</tr>
									<tr>
										<td>상품타입</td>
										<td><input type="text" value="${list.sav_type}"
											name="type"></td>
									</tr>
									<tr>
										<td>상품이율</td>
										<td><input type="number" value="${list.sav_rate}"
											name="rate"></td>
									</tr>
									<tr>
										<td>가입대상</td>
										<td><input type="text" value="${list.sav_target}"
											name="target"></td>
									</tr>
									<tr>
										<td>등록일자</td>
										<td><input type="text" value="${list.sav_regDate}"
											name="regDate" disabled></td>
									</tr>
									<tr>
										<td>제한금액</td>
										<td><input type="number" value="${list.sav_limit}"
											name="number"></td>
									</tr>
									<tr>
										<td>가입기간</td>
										<td><input type="text" value="${list.sav_period}"
											name="period"></td>
									</tr>
									<tr>
										<td colspan="2" style="text-align: center;"><input
											type="submit" value="수정"></td>
									</tr>
								</table>
							</form>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" onclick="window.location='savDel?sav_num=${list.sav_num}'">삭제</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>

	<!-- footer -->
	<%@ include file="../../../Template/footer.jsp"%>
</body>
</html>