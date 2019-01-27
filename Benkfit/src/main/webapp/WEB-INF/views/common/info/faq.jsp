<!-- 송운선 2019-01-21 17:43 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<head>
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
<html>
<body>
	<%@ include file="../../Template/top.jsp"%>

	<div style="margin: 250px 0px; text-align: center;">
	<div style="display: inline-block;">
		<h2><img src="/benkfit/resources/img/48.png">자주묻는질문</h2>
		<br>
		<details>
			<summary style="font-size: 22px;">예금 / 적금</summary>
			<br>
			<details>
				<summary style="font-size: 17px;">
					<img src="/benkfit/resources/img/24.png">모임주에게 압류 등의 법적인 문제가
					발생하게 되면 모임통장은 어떻게 되나요?
				</summary>
				<pre>
모임통장은 모임주 개인 명의의 계좌이므로 모임 회비는 원칙적으로 모임주의 소유로 봅니다. 
따라서 모임주에게 압류 등의 법적인 문제가 발생하게 되면 모임통장 역시 압류가 설정되어 출금이 제한되게 되며, 강제집행의 대상이 될 수도 있습니다. 
이 경우 모임통장 서비스 이용도 중지되며, 법적인 문제가 모두 해결된 이후 모임주가 모바일앱을 통해 이용정지 해제를 요청하는 경우에 한하여 다시 모임통장 서비스 이용이 가능해집니다.</pre>
			</details>
			<br>
			<details>
				<summary style="font-size: 17px;">
					<img src="/benkfit/resources/img/24.png">모임통장 안심계좌번호가 뭔가요?
				</summary>
				<pre>
안심계좌번호(7979-**-*****)는 모임마다 부여되는 입금전용 계좌번호로, 멤버들이 보는 모임통장에는실제 계좌번호가 아닌 안심계좌번호로 보입니다. 
실제 계좌번호와 안심계좌번호 어디에 입금해도 같은 통장으로 입금됩니다.</pre>
			</details>
			<br>
			<details>
				<summary style="font-size: 17px;">
					<img src="/benkfit/resources/img/24.png">거래중지가 되었어요. 어떻게
					해제하나요?
				</summary>
				<pre>
고객님들의 금융사기 피해를 예방하기 위해 장기미사용 계좌의 거래를 정지하는 ‘거래중지계좌제도’를 시행하고 있습니다. 

■ 거래중지계좌 조건 
예금잔액이 1만원 미만이며, 1년 이상의 입출금 거래가 없는 계좌 
예금잔액이 1만원 이상~5만원 미만이며, 2년 이상의 입출금 거래가 없는 계좌 
예금잔액이 5만원 이상~10만원 미만이며, 3년 이상의 입출금 거래가 없는 계좌 

■ 제한대상거래 
입출금, 카드결제, 대출약정 등의 거래

■ 거래중지 해제 방법 [MY > 거래중지계좌 > 관리 > 거래중지 해제하기]에서 금융거래목적 확인을 위한 증빙서류 제출을 통해 거래중지 해제 신청이 가능합니다.</pre>
			</details>
			<br>
			<details>
				<summary style="font-size: 17px;">
					<img src="/benkfit/resources/img/24.png">모임 멤버가 입금한 회비 내역이 '회비 입금현황' 화면에보이지 않습니다.
				</summary>
				<pre>
[모임통장 관리 > 회비입금현황]은 모임이 시작된 이후, 모임에 참여중인 멤버가 '실명'으로 입금된 내역을 검색한 결과입니다. 
회비를 입금한 친구가 모임통장의 멤버인지, 실명으로입금하였는지 확인해주세요.</pre>
			</details>
			<br>
			<details>
				<summary style="font-size: 17px;">
					<img src="/benkfit/resources/img/24.png">모임 멤버가 회비를 예약이체로 걸어두고 이체가 발생하기 전에 모임통장에서 나가도 이체가 실행되나요?
				</summary>
				<pre>
네. 모임통장에서 나가더라도 예약 걸어두신 이체 건은 정상적으로 거래됩니다. 
만약 이체를 취소하시려면 [전체메뉴 > 이체내역조회]에서 취소하려는 이체 건을 선택한 뒤, '이체취소' 버튼을 눌러주세요.</pre>
			</details>
			<br>
			<details>
				<summary style="font-size: 17px;">
					<img src="/benkfit/resources/img/24.png">모임통장 해지하면, 모임통장으로 사용하던 입출금 계좌도 함께 해지되나요?
				</summary>
				<pre>
모임통장 서비스 사용 종료하여도 모임통장으로 사용하던 입출금통장은 해지되지 않습니다. 
모임통장을 더이상 사용하지 않을 경우, [MY> 모임통장 > 관리] 에서 모임통장 사용 종료할 수 있습니다.</pre>
			</details>
			<br>
			<details>
				<summary style="font-size: 17px;">
					<img src="/benkfit/resources/img/24.png">모임통장 거래내역이 안 보여요.
				</summary>
				<pre>
모임통장 서비스 이용정지 시 참여중인 모임통장의 거래내역이 보이지 않을 수 있습니다. 
모임통장 서비스는 모임주(계좌명의인)의 요청 또는 모임통장으로 사용하는 입출금통장의 상태 변화로 이용정지될 수 있으며, 모임주가 해제 시 정상적으로 이용 가능합니다.</pre>
			</details>
			<br>
			<details>
				<summary style="font-size: 17px;">
					<img src="/benkfit/resources/img/24.png">모임주로써 모임통장을 관리하다가, 모임주(총무)를 바꿀 수 있나요?
				</summary>
				<pre>
모임통장은 모임주 개인 소유의 통장입니다. 따라서 사용 중인 모임통장을 다른 사람에게 양도할 수 없습니다.
총무(모임주)가 변경되었다면, 모임통장을 새롭게 개설한 뒤 회비를 이체받는 형태로 진행 하실 수 있으며, 이전 거래내역은 [MY > 계좌 > 관리 > 거래내역 다운로드]에서 받으실 수 있습니다.</pre>
			</details>
			<br>
			<details>
				<summary style="font-size: 17px;">
					<img src="/benkfit/resources/img/24.png">모임통장의 주인은 누구이며, 어떤 권한을 가지게 되나요?
				</summary>
				<pre>
모임통장은 모임주 개인 소유의 통장입니다. 따라서 이자 소득에 대한 세금은 모임주에게 부과됩니다.
모임주는 모임통장 지급 및 해지가 가능하며, 멤버 관리 권한도 전적으로 모임주만 가지게 됩니다.</pre>
			</details>
			<br>
			<details>
				<summary style="font-size: 17px;">
					<img src="/benkfit/resources/img/24.png">모임통장에서 발생한 이자는 누구의 소득으로 신고가 되나요?
				</summary>
				<pre>
모임통장은 모임주 개인 명의 계좌이므로, 모임통장에서 발생한 이자소득은 개인의 소득으로 신고됩니다. </pre>
			</details>
		</details>
		<br>
		<details>
			<summary style="font-size: 22px;">대출</summary>
			<br>
			<details>
				<summary style="font-size: 17px;">
					<img src="/benkfit/resources/img/24.png">[사잇돌대출] 사잇돌대출이 뭔가요?
				</summary>
				<pre>
금융위원회가 중금리 시장을 활성화하는 방안으로 출시한 정책 중금리 대출 상품으로, 
4~7등급의 카카오뱅크 중,저신용자 고객 중에서 상환 능력이 있는 근로자(재직 6개월 이상, 연 소득 2천만원 이상)에게 1인당 최대 2천만 원까지 대출해 주는 상품입니다. </pre>
			</details>
			<br>
			<details>
				<summary style="font-size: 17px;">
					<img src="/benkfit/resources/img/24.png">[사잇돌대출] 사잇돌대출은 만기일시상환 방식으로 신청이 불가한가요?
				</summary>
				<pre>
사잇돌대출은 거치기간 없이 최대 60개월 내에 원(리)금을 균등 상환해야 합니다.</pre>
			</details>
			<br>
			<details>
				<summary style="font-size: 17px;">
					<img src="/benkfit/resources/img/24.png">[사잇돌대출] 사잇돌대출의 금리인하 요구가 가능한가요?
				</summary>
				<pre>
대출을 이용중인 고객님이 최초 대출 실행 시와 비교하여 직장 변동, 부채 감소, 신용등급 상승, 연 소득 증가 등 신용상태에 현저한 변동이 있다고 판단되는 경우, 
그에 따른 증빙자료를 제출하고 금리 변경을 요청할 수 있습니다. 
사잇돌대출의 금리인하요구는 대출관리 화면에서 신청하실 수 있으며, 당행 내부 정책 또는 신용평가 결과에 따라 불가능할 수도 있습니다.</pre>
			</details>
			<br>
			<details>
				<summary style="font-size: 17px;">
					<img src="/benkfit/resources/img/24.png">[사잇돌대출] 사잇돌대출도 철회가 가능한가요?
				</summary>
				<pre>
서울보증보험의 보증서를 담보로 한 사잇돌 대출은 철회권의 행사가 불가합니다.</pre>
			</details>
			<br>
			<details>
				<summary style="font-size: 17px;">
					<img src="/benkfit/resources/img/24.png">[내 신용정보] 신용평점 및 신용 등급은 어떻게 제공되나요?
				</summary>
				<pre>
카카오뱅크 내신용정보를 통해 확인 가능한 신용 평점은 0~1000점이며, 신용 등급은 1등급 ~ 10등급 입니다.

신용 평점은 점수가 1000점에 가까울 수록, 신용 등급은 1등급에 가까울 수록 신용 상태가 우량함을 나타냅니다.	</pre>
			</details>
			<br>
			<details>
				<summary style="font-size: 17px;">
					<img src="/benkfit/resources/img/24.png">[내 신용정보] 평점 산출이 불가능하다고 하는데 사유가 무엇인지요?
				</summary>
				<pre>
신용 평점을 산출할 만한 충분한 신용관련 데이터가 없기 때문입니다.

많은 경우 신용 평점은 산출일자 기준으로 미성년자이거나 최초 신용거래 개설일자가 6개월 미만인 분들이 이에 해당됩니다.

빈번하지는 않지만 금융질서 문란정보 또는 민원 분쟁중인 계약을 보유하신 분들도 신용 평점을 산출을 할 수 없는 경우에 속합니다.	</pre>
			</details>
			<br>
			<details>
				<summary style="font-size: 17px;">
					<img src="/benkfit/resources/img/24.png">[내 신용정보] 대출잔액이 최근값이 아닌것 같은데 왜 그런가요?
				</summary>
				<pre>
대출잔액정보는 금융기관에 따라 최근 정보가 반영되는 일자가 다를 수 있습니다.

이용 중인 금융기관에 따라 최근 정보가 반영되는 일자가 최대 15일 정도 지연될 수 있습니다.</pre>
			</details>
			<br>
			<details>
				<summary style="font-size: 17px;">
					<img src="/benkfit/resources/img/24.png">[내 신용정보] 대출정보내역에서 제공되는 대출정보는 어떤 기관의 대출 정보들까지를 포함하고 있는건가요?
				</summary>
				<pre>
대출정보내역은 한국신용정보원(CIS)에 등록된 대출정보로 은행, 카드사, 보험사, 저축은행, 할부금융사 등 전체 금융권의 대출 정보가 모두 포함됩니다.

신규로 대출을 받으시거나 대출금의 일부를 상환하여 대출 금액에 변동이 생기는 경우 등록됩니다.	</pre>
			</details>
			<br>
			<details>
				<summary style="font-size: 17px;">
					<img src="/benkfit/resources/img/24.png">대출 기간 연장 시 분할상환대출로 바꿀 수 있나요?
				</summary>
				<pre>
기간 연장은 기존 계약의 대출기간을 연장하기 위한 거래로, 상환방식을 변경할 수는 없습니다. 상환자금이 있다면, 
언제든 모바일앱의 "중도상환하기" 메뉴를 통해 중도상환해약금(중도상환수수료) 없이 상환거래가 가능합니다.</pre>
			</details>
			<br>
			<details>
				<summary style="font-size: 17px;">
					<img src="/benkfit/resources/img/24.png">마이너스 통장을 만들고 사용하지 않으면 기간연장에 불이익이 있나요?
				</summary>
				<pre>
마이너스 통장대출 신규 후 사용을 안한 것만으로는 기간연장에 불이익이 있는 것은 아니며, 
기간연장 시점의 신용상태, 재직, 연소득, 리스크 관리정책 변동 등에 따른 신용평가결과에 따라 한도와 금리가 달라질 수 있습니다.</pre>
			</details>
		</details>
		<br>
		<details>
			<summary style="font-size: 22px;">카드</summary>
			<br>
			<details>
				<summary style="font-size: 17px;">
					<img src="/benkfit/resources/img/24.png">체크카드 신청할 때 '부재 시 대리수령'에 동의했어요. 수령인 기준은 어떻게 되나요?
				</summary>
				<pre>
체크카드 신청 시 선택한 배송지에 따라 대리수령인 기준이 상이합니다.

- 자택 : 가족(미성년자 제외)이 대리수령

- 직장 : 직장동료가 대리수령

- 기타 : 가족(미성년자 제외) 또는 직장동료가 대리수령


※ 배송기사님께서 정확한 배송을 위해 카드신청인과 대리수령인의 관계를 확인하며, 미성년자 및 일반 지인에게는 배송이 거부될 수 있으니 유의해주시기 바랍니다.</pre>
			</details>
			<br>
			<details>
				<summary style="font-size: 17px;">
					<img src="/benkfit/resources/img/24.png">카드를 무선충전기와 함께 보관하면 손상될 수 있나요?
				</summary>
				<pre>
휴대폰 무선충전기와 카드가 접촉되는 경우, 무선충전기가 내뿜는 자기장이 카드에 열을 가할 수 있습니다. 
이 경우 카드의 IC칩, 마그네틱, 교통카드칩 등이 손상되어 이용이 어려울 수 있으니, 카드를 별도 보관해주시기 바랍니다. 
자세한 사항은 무선충전기 사용 매뉴얼을 참고해주시기 바랍니다.</pre>
			</details>
		</details>
		</div>
	</div>
	
	
	<%@ include file="../../Template/footer.jsp"%>
</body>
</html>