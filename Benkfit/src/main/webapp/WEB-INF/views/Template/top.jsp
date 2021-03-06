<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
   $(document)
         .ready(
               function() {
                  var trigger = $('.hamburger'), overlay = $('.overlay'), isClosed = false;

                  trigger.click(function() {
                     hamburger_cross();
                  });

                  function hamburger_cross() {

                     if (isClosed == true) {
                        overlay.hide();
                        trigger.removeClass('is-open');
                        trigger.addClass('is-closed');
                        isClosed = false;

                     } else {
                        overlay.show();
                        trigger.removeClass('is-closed');
                        trigger.addClass('is-open');
                        isClosed = true;
                     }
                  }
                  $('[data-toggle="offcanvas"]').click(function() {
                     $('#wrapper').toggleClass('toggled');
                  });
               });

   $(document).ready(function() {
      $('#loading').hide();
   }).ajaxStart(function() {
      $('#loading').show();
   }).ajaxStop(function() {
      $('#loading').hide();
   })
</script>
<style>
#progress_Loading {
	position: absolute;
	left: 50%;
	top: 50%;
	background: rgba(255, 255, 255, 1.0);
}

#loading {
	text-align: center;
	width: 100%;
	height: 100%;
	background-color: rgba(255, 255, 255, 0.5);
}
</style>
</head>
<body>

	<div id="wrapper">
		<button type="button" class="hamburger is-closed"
			data-toggle="offcanvas">
			<span class="hamb-top"></span> <span class="hamb-middle"></span> <span
				class="hamb-bottom"></span>
		</button>
		<!-- Sidebar -->
		<nav class="navbar navbar-inverse navbar-fixed-top"
			id="sidebar-wrapper" role="navigation" >
			<!-- side-menu -->
			<button class="action action--open" aria-label="Open Menu">
				<span class="icon icon--menu"></span>
			</button>
			<nav id="ml-menu" class="menu">
				<button class="action action--close" aria-label="Close Menu">
					<span class="icon icon--cross"></span>
				</button>
				<div class="menu__wrap">
					<ul data-menu="main" class="menu__level">
						<!-- 시큐리티 권한 따라 메뉴 달라짐  -->
						<sec:authorize access="isAuthenticated()">
							<sec:authorize access="!hasRole('ROLE_ADMIN')">
								<li class="menu__item"><a class="menu__link"
									data-submenu="submenu-0" href="#">마이페이지</a></li>
							</sec:authorize>
						</sec:authorize>
						<sec:authorize access="hasAuthority('ROLE_ADMIN')">
							<li class="menu__item"><a class="menu__link"
								data-submenu="submenu-0" href="#">관리자메뉴</a></li>
						</sec:authorize>
						<li class="menu__item"><a class="menu__link"
							data-submenu="submenu-1" href="#">금융상품</a></li>
						<li class="menu__item"><a class="menu__link"
							data-submenu="submenu-3" href="#">안내</a></li>
						<li class="menu__item"><a class="menu__link"
							data-submenu="submenu-5" href="#">위치</a></li>		
					</ul>
					<!-- Submenu 0 마이페이지 -->
					<sec:authorize access="isAuthenticated()">
						<sec:authorize access="!hasRole('ROLE_ADMIN')">
							<ul data-menu="submenu-0" class="menu__level">
								<li class="menu__item"><a class="menu__link" href="mypage">마이페이지</a></li>
								<li class="menu__item"><a class="menu__link"
									data-submenu="submenu-0-1" href="#">조회</a></li>
								<li class="menu__item"><a class="menu__link"
									data-submenu="submenu-0-2" href="#">이체</a></li>
								<li class="menu__item"><a class="menu__link"
									data-submenu="submenu-0-3" href="#">설정</a></li>
								<li class="menu__item"><a class="menu__link"
									data-submenu="submenu-0-4" href="#">정보수정</a></li>
							</ul>
							<!-- Submenu 0-1 조회 -->
							<ul data-menu="submenu-0-1" class="menu__level">
								<li class="menu__item"><a class="menu__link"
									href="cheq_account">예금관리</a></li>
								<li class="menu__item"><a class="menu__link"
									href="sav_account">적금관리</a></li>
								<li class="menu__item"><a class="menu__link"
									data-submenu="submenu-0-1-1" href="#">대출관리</a></li>
							</ul>
							<!-- Submenu 0-1-1 대출관리 -->
							<ul data-menu="submenu-0-1-1" class="menu__level">
								<li class="menu__item"><a class="menu__link"
									href="loan_account">대출계좌</a></li>
								<li class="menu__item"><a class="menu__link" data-submenu="submenu-0-1-1-1"
									href="#">내서류</a></li>
							</ul>
							<!-- Submenu 0-1-1-1 대출관리 -->
							<ul data-menu="submenu-0-1-1-1" class="menu__level">
								<li class="menu__item"><a class="menu__link"
									href="document">서류조회</a></li>
								<li class="menu__item"><a class="menu__link"
									href="upload">서류등록</a></li>
							</ul>
							
							<!-- Submenu 0-2 이체 -->
							<ul data-menu="submenu-0-2" class="menu__level">
								<li class="menu__item"><a class="menu__link" href="deposit">입금</a></li>
								<li class="menu__item"><a class="menu__link" href="trans">계좌이체</a></li>
								<li class="menu__item"><a class="menu__link"
									href="auto_trans">자동이체</a></li>
							</ul>
							<!-- Submenu 0-3 설정 -->
							<ul data-menu="submenu-0-3" class="menu__level">
								<li class="menu__item"><a class="menu__link"
									href="limit_sel">이체한도</a></li>
								<li class="menu__item"><a class="menu__link" href="qrcode">QRcode발급</a></li>
							</ul>
							<!-- Submenu 0-4 내서류 -->
							<ul data-menu="submenu-0-4" class="menu__level">
								<li class="menu__item"><a class="menu__link"
									href="myinfoPw">정보수정</a></li>
								<li class="menu__item"><a class="menu__link"
									href="deluserPw">탈퇴</a></li>
							</ul>
						</sec:authorize>
					</sec:authorize>

					<!-- Submenu 0 관리자메뉴 -->
					<sec:authorize access="hasAuthority('ROLE_ADMIN')">
						<ul data-menu="submenu-0" class="menu__level">
							<li class="menu__item"><a class="menu__link"
								href="selectUsers">회원관리</a></li>
							<li class="menu__item"><a class="menu__link"
								data-submenu="submenu-0-2" href="#">상품관리</a></li>
							<li class="menu__item"><a class="menu__link"
								data-submenu="submenu-0-3" href="#">이벤트관리</a></li>
							<li class="menu__item"><a class="menu__link" href="manage">은행관리</a></li>
						</ul>

						<!-- Submenu 0-2 예금-->
						<ul data-menu="submenu-0-2" class="menu__level">
							<li class="menu__item"><a class="menu__link" href="cheqSavRegi">예/적금 상품</a></li>
							<li class="menu__item"><a class="menu__link" href="loanRegi">대출상품</a></li>
							<li class="menu__item"><a class="menu__link"
								href="loanApproval">대출신청관리</a></li>
						</ul>

						<!-- Submenu 0-3 이벤트관리 -->
						<ul data-menu="submenu-0-3" class="menu__level">
							<li class="menu__item"><a class="menu__link"
								href="event_list_sws">이벤트관리</a></li>
							<li class="menu__item"><a class="menu__link"
								href="slotControl">슬롯관리</a></li>
						</ul>
					</sec:authorize>

					<!-- Submenu 1 금융상품 -->
					<ul data-menu="submenu-1" class="menu__level">
						<li class="menu__item"><a class="menu__link" href="cheqSavList">예금</a></li>
						<li class="menu__item"><a class="menu__link"
							data-submenu="submenu-1-2" href="#">대출</a></li>
					</ul>
					<!-- Submenu 1-2 대출-->
					<ul data-menu="submenu-1-2" class="menu__level">
						<li class="menu__item"><a class="menu__link"
							data-submenu="submenu-1-2-1" href="loanList">대출상품</a></li>
					</ul>
					
					<!-- Submenu 3  안내 -->
					<ul data-menu="submenu-3" class="menu__level">
						<li class="menu__item"><a class="menu__link"
							href="firstVisit_sws">고객 안내</a></li>
						<li class="menu__item"><a class="menu__link" href="faq_sws">FAQ</a></li>
						<li class="menu__item"><a class="menu__link"
							href="hoursOfUse_sws">이용시간</a></li>
						<li class="menu__item"><a class="menu__link"
							href="useFee_sws">수수료 안내</a></li>
					</ul>

					<!-- Submenu 5 안내 -->
					<ul data-menu="submenu-5" class="menu__level">
						<li class="menu__item"><a class="menu__link" href="map_sws">은행</a></li>
						<li class="menu__item"><a class="menu__link" href="atm_sws">ATM</a></li>
					</ul>
				</div>
			</nav>
		</nav>
		<!--top-menu -->
		<div id="page-content-wrapper">
			<div class="container">
				<!-- top-menu -->
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<header id="header">
							<div class="container">
								<div id="logo" class="pull-left">
									<h1>
										<a href="index" class="scrollto"><img
											src="/benkfit/resources/img/logo/logo.png"></a>
									</h1>
								</div>
								<nav id="nav-menu-container">
									<ul class="nav-menu">
										<li><a href="#">체험관</a>
											<ul>
												<li><a href="wallet">지갑만들기</a></li>
												<li><a href="transfer">간편송금</a></li>
												<li><a href="bank">간편은행</a></li>
												<li><a href="verify">거래검증소</a></li>
											</ul></li>
										<li class="menu-has-children"><a href="#">금융상품</a>
											<ul>
												<li><a href="cheqSavList">예/적금</a></li>
												<li><a href="loanList">대출</a></li>
											</ul></li>
										<li><a href="firstVisit_sws">안내</a></li>
										<li><a href="eventList_sws">이벤트</a></li>
										<!-- 시큐리티 권한 따라 메뉴 달라짐  -->
										<sec:authorize access="isAnonymous()">
											<li><a href="login">로그인</a><br></li>
										</sec:authorize>
										<sec:authorize access="isAuthenticated()">
											<li><a href="logout">로그아웃</a></li>
										</sec:authorize>
										<li>
											<div id="myOver" class="over" style="display: none;">
												<span class="closebtn" onclick="closeSearch()"
													title="Close over">×</span>
												<div class="over-content">
													<form action="search_pro" method="post" name="searchForm">
														<input type="text" id="searchinput" name="search"
															placeholder="Search.." autofocus style="padding: 11">
														<!-- search.css -> .over input[type=text] height: 10%; -->
														<button type="submit">
															<i class="fa fa-search"></i>
														</button>
													</form>
												</div>
											</div>
											<button class="openBtn" onclick="openSearch()">
												<p>
													<span class="glyphicon glyphicon-search"></span>
												</p>
											</button>
										</li>
									</ul>
								</nav>
							</div>
						</header>
						<!-- #header -->
					</div>
				</div>
			</div>
		</div>
		<!-- /#page-content-wrapper -->
	</div>
	<!-- /#wrapper -->

	<!-- LoadingBar -->
	<div id="loading">
		<div id="progress_Loading">
			<img src="/benkfit/resources/img/loading/478 (7).gif">
		</div>
	</div>

	<!-- LoadingBar -->

	<!-- /view -->
	<script>
      (function() {

      // mobile menu toggle
      var openMenuCtrl = document.querySelector('.action--open'), 
        closeMenuCtrl = document.querySelector('.action--close');
         $('a').click(function() {
            var location = $(this).prop("href");
            if (location != "#") {
               window.location.href = location;
            }
         })

         var menuEl = document.getElementById('ml-menu'), mlmenu = new MLMenu(
               menuEl, {
                  backCtrl : false, // show back button
                  onItemClick : loadDummyData
               });

         // mobile menu toggle
         var openMenuCtrl = document.querySelector('.action--open'), closeMenuCtrl = document
               .querySelector('.action--close');

         openMenuCtrl.addEventListener('click', openMenu);
         closeMenuCtrl.addEventListener('click', closeMenu);

         function openMenu() {
            classie.add(menuEl, 'menu--open');
         }

         function closeMenu() {
            classie.remove(menuEl, 'menu--open');
         }
         // simulate grid content loading
         var gridWrapper = document.querySelector('.content');

         function loadDummyData(ev, itemName) {

            ev.preventDefault();

            closeMenu();

            if (gridWrapper != null) {
               gridWrapper.innerHTML = '';
               classie.add(gridWrapper, 'content--loading');
               setTimeout(function() {
                  classie.remove(gridWrapper, 'content--loading');
                  gridWrapper.innerHTML = '<ul class="products">'
                        + dummyData[itemName] + '<ul>';
               }, 700);
            } else {
               if (location != "#") {
                  window.location = location;
                  return false;
               }
            }
         }
      })();
   </script>

	<script>
      function openSearch() {
         document.getElementById("myOver").style.display = "block";
      }
      function closeSearch() {
         document.getElementById("myOver").style.display = "none";
      }
   </script>
</body>
</html>