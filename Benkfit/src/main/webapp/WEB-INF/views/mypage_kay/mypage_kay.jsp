<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp"%>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta charset="UTF-8">
<title>Document</title>
</head>
<body >
	<%@ include file="../Template/top.jsp"%>
	<div class="wrapper">
		<form method="post" name="mypage">
			<h1>My Page</h1>
			<hr>
			<div id="tab-menu">
				<!--탭 메뉴 영역 -->
				<ul class="tabs">
					<li><a href="#tab0">*</a></li>
					<li><a href="#tab1">조회</a></li>
					<li><a href="#tab2">설정</a></li>
					<li><a href="#tab3">정보수정</a></li>
					<li><a href="#tab4">내서류</a></li>
					<li><a href="#tab5">자산관리</a></li>
				</ul>
				<!--탭 콘텐츠 영역 -->
				<div class="tab_container">
					<div id="tab0" class="tab_content">
						<!--Content-->
						<p>[&nbsp;&nbsp;님 로그인 되었습니다.</p>
					</div>
					<div id="tab1" class="tab_content">
						<!--Content-->
						<h3>예금관리</h3>
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
								<c:set var="num" value="1" />
								<c:forEach var="ch" items="${cheq}">
									<tr>
										<td>${num}</td>
										<c:set var="num" value="${num+1}" />
										<td>${ch.cheq_num}</td>
										<td>${ch.myCheq_account}</td>
										<td><fmt:formatNumber value="${ch.myCheq_amount}" pattern="#,###.##"/></td>
										<td>
											<button class="btn2 btn2-success"  onclick="move(1)">조회
											</button>&nbsp;
											<button class="btn2 btn2-danger"  onclick="move(2)">해지
											</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<hr>
						<%-- <h3>대출관리</h3>
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
								<c:forEach var="lo" items="${loan}">
									<tr>
										<td>${lo.loan_num}</td>
										<td>${lo.myLoan_account}</td>
										<td><fmt:formatNumber value="${lo.myLoan_amount}" pattern="#,###.##"/></td>
										<td>${lo.myLoan_date}</td>
										<td>${lo.myLoan_late}</td>
										<td>
											<button class="btn2 btn2-success"  onclick="move(3)">조회
											</button>&nbsp;
											<button class="btn2 btn2-danger"  onclick="move(4)">상환
											</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div id="tab2" class="tab_content">
						<!--Content-->
						<h3>설정</h3>						 
						<table class="updateInfo" style="width:300px;">
							<tbody class="mypage_info">
								<tr>
									<th>이체한도</th>
									<td>
										<button class="btn2 btn2-success" onclick="move(5)">조회</button>
									</td>
								</tr>
								<tr>
									<th>알림</th>
									<td>
										<button class="btn2 btn2-success" onclick="move(6)">설정</button>
									</td>
								</tr>
								<tr>
									<th>카드신청</th>
									<td>
										<button class="btn2 btn2-success" onclick="move(7)">발급</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="tab3" class="tab_content">
						<!--Content-->
						<h3>정보수정 &nbsp;&nbsp;
							<button class="btn2 btn2-danger" onclick="move(8)">변경</button>
							<button class="btn2 btn2-success" onclick="move(12)">회원탈퇴</button>
						</h3>
						<table class="updateInfo" style="width:300px;">
							<tbody class="mypage_info">
								<tr>
									<th>이메일</th>
									<td>${user.c_email}</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>${user.c_address}</td>
								</tr>
								<tr>
									<th>연락처</th>
									<td>${user.c_hp}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="tab4" class="tab_content">
						<!--Content-->
						<h3>서류관리
							<button class="btn2 btn2-success" onclick="move(9)">등록</button>
							<button class="btn2 btn2-danger" onclick="move(10)">삭제</button>
						</h3>
						<table class="table table-hover">
							<thead id="mypage_thead">
								<tr>
									<th><input type="checkbox">선택</th>
									<th>서류번호</th>
									<th>서류명</th>
									<th>내용</th>
									<th>서류 날짜</th>
									<td>조회</td>
								</tr>
							</thead>
							<tbody class="mypage_setting">
								<c:set var="num" value="1" />
								<c:forEach var="doc" items="${docu}">
									<tr>
										<td><input type="checkbox"></td>
										<td>${doc.doc_num}</td>
										<td>${doc.doc_name}</td>
										<td>${doc.doc_content}</td>
										<td>${doc.doc_date}</td>
										<td><button class="btn2 btn2-success" onclick="move(11)">조회</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div id="tab5" class="tab_content">
						<!--Content-->
						<table>
							<tr>
								자산관리
							</tr>
						</table>
					</div> --%>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="../Template/footer.jsp"%>
</body>
</html>