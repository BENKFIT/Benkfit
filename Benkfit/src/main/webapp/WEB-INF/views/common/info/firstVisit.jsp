<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<html>
<<<<<<< HEAD
<style>
td, tr>th, p {
	text-align: center;
}

.table eq-ui-data-table z-depth-1 {
	margin-bottom: 100px;
}

thead>tr {
	background: #2980B9;
}

.eq-ui-collapsible-header > a {
}
</style>
<title>안내 > 첫방문 고객 안내</title>
=======
<title> 안내 > 첫방문 고객안내</title>
>>>>>>> branch 'master' of https://github.com/BENKFIT/benkfit.git
<body>
	<%@ include file="../../Template/top.jsp"%>
	<div style="margin-top: 200px; text-align: center;">
		<div class="row" style="display: inline-block; width: 60%;">
			<span style="float: right; margin-right: 16px;">안내 > 첫방문 안내</span>
			<div class="col-md-12">
				<ul class="eq-ui-collapsible" data-collapsible="accordion">
					<li>
						<div class="eq-ui-collapsible-header">
							<a>Ethereum 이란?</a>
						</div>
						<div class="eq-ui-collapsible-body">
							<div class="eq-ui-collapsible-body-inner">비탈릭 부테린에 의해서 만들어진
								블록체인 네트워크</div>
						</div>
					</li>
					<li>
						<div class="eq-ui-collapsible-header">
							<a>스마트 계약 이란?</a>
						</div>
						<div class="eq-ui-collapsible-body">
							<div class="eq-ui-collapsible-body-inner">계약 조건을 블록체인에 기록하고
								조건이 충족됐을 경우 자동으로 계약이 실행되는 프로그램</div>
						</div>
					</li>
					<li>
						<div class="eq-ui-collapsible-header">
							<a>GAS 란?</a>
						</div>
						<div class="eq-ui-collapsible-body">
							<div class="eq-ui-collapsible-body-inner">
								이더리움 네트워크에서 채굴자에 대한 보상을 위하여 존재하는 개념 <br> 거래마다 GAS가 발생하고,
								소모된 가스와 가스비용으로 수수료가 책정됨
							</div>
						</div>
					</li>
					<li>
						<div class="eq-ui-collapsible-header">
							<a>EVM (Ethereum Virtual Machine) 이란?</a>
						</div>
						<div class="eq-ui-collapsible-body">
							<div class="eq-ui-collapsible-body-inner">스마트 계약이 실행되는 환경</div>
						</div>
					</li>
					<li>
						<div class="eq-ui-collapsible-header">
							<a>Storage 란?</a>
						</div>
						<div class="eq-ui-collapsible-body">
							<div class="eq-ui-collapsible-body-inner">
								스마트 계약의 데이터 저장소<br>저장된 데이터는 이더리움 네트워크에 기록됨
							</div>
						</div>
					</li>
					<li>
						<div class="eq-ui-collapsible-header">
							<a>State Variable 이란?</a>
						</div>
						<div class="eq-ui-collapsible-body">
							<div class="eq-ui-collapsible-body-inner">이더리움 네트워크에 기록되는
								변수</div>
						</div>
					</li>
					<li>
						<div class="eq-ui-collapsible-header">
							<a>Contract 란?</a>
						</div>
						<div class="eq-ui-collapsible-body">
							<div class="eq-ui-collapsible-body-inner">Solidity 언어로 작성된
								Contract 객체로서 가장 기본적인 형태</div>
						</div>
					</li>
					<li>
						<div class="eq-ui-collapsible-header">
							<a>Solidity 란?</a>
						</div>
						<div class="eq-ui-collapsible-body">
							<div class="eq-ui-collapsible-body-inner">Solidity 언어는 객체지향
								프로그래밍 언어와 유사한 형태로 Contract-Oriented 프로그래밍 언어라 불림</div>
						</div>
					</li>
					<li>
						<div class="eq-ui-collapsible-header">
							<a>ERC20 이란?</a>
						</div>
						<div class="eq-ui-collapsible-body">
							<div class="eq-ui-collapsible-body-inner">
								Ethereum Request for Comments의 약자<br>이더리움 네트워크에서 신규 암호화폐를
								발행하기 위한 스마트 계약<br>이더리움의 대표 스마트 계약
							</div>
						</div>
					</li>
					<li>
						<div class="eq-ui-collapsible-header">
							<a>Token 이란?</a>
						</div>
						<div class="eq-ui-collapsible-body">
							<div class="eq-ui-collapsible-body-inner">ERC20으로 생성된 암호화폐를
								통칭함</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<%@ include file="../../Template/footer.jsp"%>
</body>
</html>