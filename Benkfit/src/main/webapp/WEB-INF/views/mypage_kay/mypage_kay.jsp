<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
</head>
<body>
	<%@ include file="../Template/top.jsp"%>
	<div class="wrapper">
		<div class="mypage">
			<h1>My Page</h1>
			<hr>
			<div id="tab0" class="tab_content">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>User Profile</h4>
					</div>
					<div class="panel-body">
						<div class="col-md-4 col-xs-12 col-sm-6 col-lg-4">
							<img alt="User Pic"
								src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg"
								id="profile-image1" class="img-circle img-responsive">
						</div>
						<div class="col-md-8 col-xs-12 col-sm-6 col-lg-8">
							<div class="User_Profile">
								<h2>송운선</h2>
							</div>
							<hr>
							<ul class="User_Profile details">
								<li><p>
										<span class="glyphicon glyphicon-user one"
											style="width: 50px;"></span> i.rudberg
									</p></li>
								<li><p>
										<span class="glyphicon glyphicon-envelope one"
											style="width: 50px;"></span> thddnstjs7@email.com
									</p></li>
								<li><p>
										<span class="glyphicon glyphicon-ok-circle"
											style="width: 50px;"></span> Date Of Joining: 15 Jun 201s6
									</p></li>
							</ul>
							<hr>
							<div class="col-sm-8 col-xs-8 tital ">
								<input type="button" class="btn2 btn2-success" value="정보수정"
									onclick="">&nbsp; <input type="button"
									class="btn2 btn2-success" value="내서류" onclick="">&nbsp;
								<input type="button" class="btn2 btn2-success" value="알림"
									onclick="">&nbsp; <input type="button"
									class="btn2 btn2-success" value="qrcode" onclick="">&nbsp;
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="tab1" class="tab_content">
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
						<tr>
							<td>1</td>
							<td>12</td>
							<td>123</td>
							<td>123</td>
							<td>
								<button class="btn2 btn2-success" onclick="move(1)">조회
								</button>&nbsp;
								<button class="btn2 btn2-danger" onclick="move(2)">해지</button>
							</td>
						</tr>
					</tbody>
				</table>
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
						<tr>
							<td>1</td>
							<td>12</td>
							<td>123</td>
							<td>123</td>
							<td>
								<button class="btn2 btn2-success" onclick="move(1)">조회
								</button>&nbsp;
								<button class="btn2 btn2-danger" onclick="move(2)">해지</button>
							</td>
						</tr>
					</tbody>
				</table>
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
						<tr>
							<td>1</td>
							<td>123</td>
							<td>1244</td>
							<td>124134</td>
							<td>124123</td>
							<td>
								<button class="btn2 btn2-success" onclick="move(3)">조회
								</button>&nbsp;
								<input type="submit" class="btn2 btn2-success" value="확인">	
								<button class="btn2 btn2-danger" onclick="move(4)">상환</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="tab2" class="tab_content">
			<h3>자산관리</h3> 
			<hr> 
			</div>
		</div>
	</div>
	<%@ include file="../Template/footer.jsp"%>
</body>
</html>