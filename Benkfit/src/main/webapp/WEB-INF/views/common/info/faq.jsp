<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<<<<<<< HEAD
=======
<head>
<title> 안내 > 자주묻는질문</title>
<style>
summary::-webkit-details-marker { 
 
    margin-right: 5px;
 
}

img {
	margin-top: -4px;
	margin-right: 6px;
	
}
summary{
	text-align: left;
}
pre{
	text-align: left;
}
</style>
</head>
>>>>>>> branch 'master' of https://github.com/BENKFIT/benkfit.git
<html>
<title>안내 > FAQ</title>
<body>
	<%@ include file="../../Template/top.jsp"%>

	<div style="margin-top: 200px; text-align: center;">
		<div class="row" style="display: inline-block; width: 60%;">
				<span style="float: right; margin-right: 16px;">안내 > 자주묻는질문</span>
			<div class="col-md-12">
				<ul class="eq-ui-collapsible" data-collapsible="accordion">
					<li>
						<div class="eq-ui-collapsible-header">
							<a>작업 증명이 무엇인가요?</a>
						</div>
						<div class="eq-ui-collapsible-body">
							<div class="eq-ui-collapsible-body-inner">작업 증명은 번호 열쇠의 비밀번호(블록의 ID역할)를 맞추는 것과 같음<br><br>보상 = 신규코인 + 수수료</div>
						</div>
					</li>
					<li>
						<div class="eq-ui-collapsible-header">
							<a>블록체인 기술의 장단점이 무엇인가요?</a>
						</div>
						<div class="eq-ui-collapsible-body">
							<div class="eq-ui-collapsible-body-inner">
								- 좋은점<br>
								탈중앙화 되어 있음<br>
								위변조가 어려움<br><br>
								- 문제점<br>
								문제가 발생할 때 수정 및 변경이 매우 어려움
							</div>
						</div>
					</li>
					<li>
						<div class="eq-ui-collapsible-header">
							<a>이더리움 채굴 순서는 어떻게 되나요?</a>
						</div>
						<div class="eq-ui-collapsible-body">
							<div class="eq-ui-collapsible-body-inner">
							1. 이더리움 송금자는 개인키를 이용해 지갑에 로그인
							<br><br><img src="/benkfit/resources/img/info/1.PNG">
							<br>
							<br> 2. 발생된 거래 내역은 이더리움 네트워크에 전파
							<br><br><img src="/benkfit/resources/img/info/2.PNG">
							<br>
							<br> 3. 거래 풀에서 거래 내역을 골라 블록생성 준비
							<br><br><img src="/benkfit/resources/img/info/3.PNG">
							<br>
							<br> 4. 마이너들은 거래 증명
							<br><br><img src="/benkfit/resources/img/info/4.PNG">
							</div>
						</div>
					</li>
					<li>
						<div class="eq-ui-collapsible-header">
							<a>작업 증명 방식이 무엇인가요?</a>
						</div>
						<div class="eq-ui-collapsible-body">
							<div class="eq-ui-collapsible-body-inner">
								1. 간단하면서도 상당히 효과적인 합의 알고리즘 제공
								<br><br>
								2. 누구나 합의 프로세스에 참여할 수 있도록 허용
							</div>
						</div>
					</li>
					<li>
						<div class="eq-ui-collapsible-header">
							<a>이더리움 계정에는 어떤 종류의 계정이 있나요?</a>
						</div>
						<div class="eq-ui-collapsible-body">
							<div class="eq-ui-collapsible-body-inner">
								- 외부 소유 계정
								<br>개인키로 통제되며, 거래를 발생시키면 개인키로 암호화되어 서명함
								<br><br> - 계약 계정
								<br> 이더리움 네트워크상의 일종의 자율 에이전트(Autonomous Agent) 역할
								<br> ▶ 거래를 통해 메시지가 도착하면 해당 코드를 실행함
								<br> ▶ 자신의 Ether 잔고와 변수를 저장하는 Key-Value방식의 저장소를 통제하는 역할을 함 
							</div>
						</div>
					</li>
					<li>
					<div class="eq-ui-collapsible-header">
							<a>거래(Transaction) 란?</a>
						</div>
						<div class="eq-ui-collapsible-body">
							<div class="eq-ui-collapsible-body-inner">
								외부 소유 계정이 보낼 메시지를 가지고 있는 서명된 데이터 단위를 의미
								<br><br><img src="/benkfit/resources/img/info/5.PNG">
							</div>
						</div>
					</li>
					<li>
					<div class="eq-ui-collapsible-header">
							<a>메시지의 구성은 어떻게 되나요?</a>
						</div>
						<div class="eq-ui-collapsible-body">
							<div class="eq-ui-collapsible-body-inner">
								1. (암묵적으로) 메시지 발신처
								<br> 2. 메시지 수신처
								<br> 3. 메시지와 함께 전달되는 Ether
								<br> 4. 선택적 데이터 필드
								<br> 5. Start Gas 값(Gas limit)
							</div>
						</div>
					</li>
					<li>
					<div class="eq-ui-collapsible-header">
							<a>EVM (Ethereum Virtual Machine)의 특징은 어떻게 되나요?</a>
						</div>
						<div class="eq-ui-collapsible-body">
							<div class="eq-ui-collapsible-body-inner">
								▶ 악의적 사용자가 계산을 무한 순환에 빠뜨리는 방법으로 채굴자와 풀 노드를 마비시켜 버릴수 있음
								<br> ▶ 일반적으로 어떤 주어진 문제가 궁극적으로 멈추는지 아닌지를 미리 판별할 방법은 없음
								<br> ▶ 한 거래에 최대로 계산할 수 있는 단계 수를 설정함으로써 문제 해결 가능
								<br> ▶ 계산 단계가 그 최대 수 보다 더 많으면 계산은 원점으로 돌아가지만, 수수료는 그대로 지불됨
							</div>
						</div>
					</li>
					<li>
					<div class="eq-ui-collapsible-header">
							<a>이더리움 채굴 방식은 어떻게 되나요?</a>
						</div>
						<div class="eq-ui-collapsible-body">
							<div class="eq-ui-collapsible-body-inner">
								각 채굴자가 상태정보(the state)에서 무작위의 정보를 가져와, 무작위로 선택된 최근 몇 개의 블록내역을 해싱 작업하고 결과값을 내놓는 것
							</div>
						</div>
					</li>
					<li>
					<div class="eq-ui-collapsible-header">
							<a>이더리움 블록체인의 특징은?</a>
						</div>
						<div class="eq-ui-collapsible-body">
							<div class="eq-ui-collapsible-body-inner">
								▶ 네트워크에 참여하는 누구나 데이터를 읽을 수 있음
								<br>▶ 데이터의 수정은 불가
								<br>▶ 추가적인 Transaction만 생성 가능
								<br>▶ Transaction을 통해서 상태의 변경
								<br>▶ Transaction은 Sender의 암호키로 인증되어 전송됨
								<br>▶ 생성된 거래는 이더리움 네트워크에 배포되어 합의 알고리즘을 거쳐 신뢰가 부여됨
								<br>▶ 처리 성능을 위하여 Transaction을 묶어서 처리함
								<br>▶ Block 단위로 Proof-of-Work를 실행하여 네트워크 참여자들 간의 합의를 이룸
								<br>▶ 신규 Block에 대한 보상으로 신규 Coin을 지급하여 Mining이라고 함
							</div>
						</div>
					</li>
					<li>
					<div class="eq-ui-collapsible-header">
							<a>Solidity 계정 종류는 어떤것들이 있나요?</a>
						</div>
						<div class="eq-ui-collapsible-body">
							<div class="eq-ui-collapsible-body-inner">
								- 외부 계정(External Accounts)
								<br>▶ Controlled by Public-Private Key Pairs
								<br>▶Controlled by Human
								<br>▶ 통상 지갑이라고 불림
								<br>▶ Public Key에 의해서 Address가 생성됨
								
								<br><br> - 계약 계정(Contract Accounts)
								<br>▶ Controlled by the code
								<br>▶ Address는 Contract 생성 시간에 의해서 생성됨
								
								<br><br> - 이더리움 가상머신과 계정
								<br>▶ 외부 계정과 계약 계정은 동일하게 취급
								<br>▶ Ether Balance를 가짐
							</div>
						</div>
					</li>
					<li>
					<div class="eq-ui-collapsible-header">
							<a>GAS는 무엇인가요?</a>
						</div>
						<div class="eq-ui-collapsible-body">
							<div class="eq-ui-collapsible-body-inner">
								이더리움 경제 생태계를 유지하고 무한 루프와 같은 과도한 스마트 계약의 실행을 방지하는 역할
								<br><br> 잘못 작성된 하나의 스마트 계약으로 이더리움 네트워크가 교란될 수 있음
								<br><br>▶ Gas Price = Gas 단가(Sender에 의해서 결정됨)
								<br>▶ Gas Fee = Gas Price X Gas(= Gas Limit)
								<br>▶ 소모되는 Gas는 Gas Limit을 넘지 않음
								<br>▶ Gas Limit를 초과하여 가스가 소모되면 오류가 발생하고 거래는 취소됨
								<br>▶ 소모된 Gas는 환불처리 되지 않고 채굴자에게 지불됨
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<%@ include file="../../Template/footer.jsp"%>
</body>
</html>