<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
</head>
<body class="body">
	<%@ include file="../Template/top.jsp"%>
	<div class="wrapper">
	<form name="mypage" method="post">
		<div class="mypage">
			<h1>My Page</h1>
			<hr>
			<div id="tab0" class="tab_content">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>User Profile</h4>
					</div>
					<div class="panel-body">
						<div class="col-md-14 col-xs-14 col-sm-18 col-lg-14">
							<div class="User_Profile">
								<h2>${usVO.c_name} [${usVO.c_id}]</h2>
							</div>
							<hr>
							<ul class="User_Profile details">
								<li><p>
										<span class="glyphicon glyphicon-phone one"
											style="width: 50px;"></span> ${usVO.c_hp}
									</p></li>
								<li><p>
										<span class="glyphicon glyphicon-envelope one"
											style="width: 50px;"></span> ${usVO.c_email}
									</p></li>
								<li><p>
										<span class="glyphicon glyphicon-ok-circle"
											style="width: 50px;"></span> ${usVO.c_regDate}
									</p></li>
							</ul>
							<hr>
							<div class="col-sm-12 col-xs-8 tital ">
									<button class="btn2 btn2-success"  onclick="move(7)">qrcode</button>&nbsp;
									<button class="btn2 btn2-success" onclick="move(8)">정보수정</button>&nbsp; 
									<button class="btn2 btn2-success"  onclick="move(9)">내서류</button>&nbsp;
									<button class="btn2 btn2-success"  onclick="move(5)">이체한도</button>&nbsp;
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div id="tab1" class="acc_content">
				<!--Content-->
				<h3 >예금관리</h3>			
				<hr>
				<table class="table table-hover">
					<thead id="mypage_thead">
						<tr>
							<th>번호</th>
							<th>계좌명</th>
							<th>계좌번호</th>
							<th>잔액</th>
							<th>조회/이체</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="cheq" items="${cheq}">
						<tr>
							<td>1</td>
							<td>${cheq.cheq_num}</td>
							<td>${cheq.myCheq_account}</td>
							<td>￦<fmt:formatNumber value="${cheq.myCheq_amount}" pattern="#,###.##"/></td>
							<td>	
							<input class="btn2 btn2-success" type="button" value="조회"
					 			onclick="window.location='cheq_account?account=${cheq.myCheq_account}'">&nbsp;
							<input class="btn2 btn2-success" type="button" value="해지"
					 			onclick="window.location='delcheq?account=${cheq.myCheq_account}'">&nbsp;
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<br>
				<h3>적금관리</h3>
				<hr>
				<table class="table table-hover">
					<thead id="mypage_thead">
						<tr>
							<th>번호</th>
							<th>계좌명</th>
							<th>계좌번호</th>
							<th>잔액</th>
							<th>조회/이체</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="sav" items="${sav}">
						<tr>
							<td>${num}</td>
							<td>${sav.mySav_name} </td>
							<td>${sav.mySav_account} </td>
							<td>￦<fmt:formatNumber value="${sav.mySav_amount}" pattern="#,###.##"/></td>
							<td>
								<button class="btn2 btn2-success" onclick="move(13)">조회
								</button>&nbsp;
								<button class="btn2 btn2-danger" onclick="move(14)">해지</button>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<br>
				<h3>대출관리</h3>
				<hr>
				<table class="table table-hover">
					<thead id="mypage_thead">
						<tr>
							<th>대출상품번호</th>
							<th>계좌번호</th>
							<th>잔액</th>
							<th>대출일</th>
							<th>만기일</th>
							<th>조회/상환</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="loan" items="${loan}">
						<tr>
							<td>${loan.loan_num} </td>
							<td>${loan.myloan_account} </td>
							<td>￦<fmt:formatNumber value="${loan.myloan_amount}" pattern="#,###.##"/></td>
							<td>${loan.myloan_date}</td>
							<td>${loan.myloan_late}</td>
							<td>
								<button class="btn2 btn2-success" onclick="move(3)">조회
								</button>&nbsp;
								<button class="btn2 btn2-danger" onclick="move(4)">상환</button>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		</form>
	</div>
	<%@ include file="../Template/footer.jsp"%>
</body>
</html>