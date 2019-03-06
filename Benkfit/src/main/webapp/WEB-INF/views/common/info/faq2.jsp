<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<html>
<title> 안내 > 자주묻는질문</title>
<body>
	<%@ include file="../../Template/top.jsp"%>
	<div class="widget pad50-65">
		<div class="widget-title2" style="margin-top: 110px;">
			<h2 align="center">자주묻는질문</h2>
			<h3 align="center" style="margin-top: 50px;">예금 / 적금</h3>
		</div>
		<div id="acordn" class="acordn-styl1">
			<div class="acordn-itm brd-rd5">
				<h4>
					<span>Q1.</span> 모임주에게 압류 등의 법적인 문제가 발생하게 되면 모임통장은 어떻게 되나요?
				</h4>
				<div class="acrdn-cnt">
					<p>모임통장은 모임주 개인 명의의 계좌이므로 모임 회비는 원칙적으로 모임주의 소유로 봅니다. 따라서 모임주에게
						압류 등의 법적인 문제가 발생하게 되면 모임통장 역시 압류가 설정되어 출금이 제한되게 되며, 강제집행의 대상이 될 수도
						있습니다. 이 경우 모임통장 서비스 이용도 중지되며, 법적인 문제가 모두 해결된 이후 모임주가 모바일앱을 통해 이용정지
						해제를 요청하는 경우에 한하여 다시 모임통장 서비스 이용이 가능해집니다.</p>
				</div>
			</div>
			<div class="acordn-itm brd-rd5">
				<h4>
					<span>Q2.</span> 모임통장 안심계좌번호가 뭔가요?
				</h4>
				<div class="acrdn-cnt">
					<p>안심계좌번호(7979-**-*****)는 모임마다 부여되는 입금전용 계좌번호로, 멤버들이 보는
						모임통장에는실제 계좌번호가 아닌 안심계좌번호로 보입니다. 실제 계좌번호와 안심계좌번호 어디에 입금해도 같은 통장으로
						입금됩니다.</p>
				</div>
			</div>
			<div class="acordn-itm brd-rd5">
				<h4>
					<span>Q3.</span> 거래중지가 되었어요. 어떻게 해제하나요?
				</h4>
				<div class="acrdn-cnt">
					<p>고객님들의 금융사기 피해를 예방하기 위해 장기미사용 계좌의 거래를 정지하는 ‘거래중지계좌제도’를 시행하고
						있습니다.</p>
					<p>■ 거래중지계좌 조건</p>
					<p>예금잔액이 1만원 미만이며, 1년 이상의 입출금 거래가 없는 계좌</p>
					<p>예금잔액이 1만원 이상~5만원 미만이며, 2년 이상의 입출금 거래가 없는 계좌</p>
					<p>예금잔액이 5만원 이상~10만원 미만이며, 3년 이상의 입출금 거래가 없는 계좌</p>

					<p>■ 제한대상거래</p>
					<p>입출금, 카드결제, 대출약정 등의 거래</p>

					<p>■ 거래중지 해제 방법 [MY > 거래중지계좌 > 관리 > 거래중지 해제하기]에서 금융거래목적 확인을 위한
						증빙서류 제출을 통해 거래중지 해제 신청이 가능합니다.</div>
		
				</div>
				<div class="acordn-itm brd-rd5">
				<h4>
					<span>Q4.</span> 모임 멤버가 입금한 회비 내역이 '회비 입금현황' 화면에보이지 않습니다.
				</h4>
				<div class="acrdn-cnt">
					<p>[모임통장 관리 > 회비입금현황]은 모임이 시작된 이후, 모임에 참여중인 멤버가 '실명'으로 입금된 내역을 검색한 결과입니다. 
회비를 입금한 친구가 모임통장의 멤버인지, 실명으로입금하였는지 확인해주세요.</p>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(
				function() {
					'use strict';

					//===== Accordion =====//
					$('#acordn .acrdn-cnt').hide();
					$('#acordn h4:first').addClass('active').next().slideDown(
							500).parent().addClass("activate");
					$('#acordn h4').on(
							"click",
							function() {
								if ($(this).next().is(':hidden')) {
									$('#acordn h4').removeClass('active')
											.next().slideUp(500).parent()
											.removeClass("activate");
									$(this).toggleClass('active').next()
											.slideDown(500).parent()
											.toggleClass("activate");
								}
							});

					$('#acordn2 .acrdn-cnt').hide();
					$('#acordn2 h4:first').addClass('active').next().slideDown(
							500).parent().addClass("activate");
					$('#acordn2 h4').on(
							"click",
							function() {
								if ($(this).next().is(':hidden')) {
									$('#acordn2 h4').removeClass('active')
											.next().slideUp(500).parent()
											.removeClass("activate");
									$(this).toggleClass('active').next()
											.slideDown(500).parent()
											.toggleClass("activate");
								}
							});
				});
	</script>

	<%@ include file="../../Template/footer.jsp"%>
</body>
</html>