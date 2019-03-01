<!-- 2019/01/25 손리아 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Benkfit Terms & Conditions</title>
<style>
  #pre {
    margin-top:50px;
    text-align:left;
    white-space: pre-wrap;
  }
  
  #termsRadio {
    text-align:center;
    margin-top:50px;
  }
  
  #termsRadio2 {
    text-align:center;
    margin-bottom:20px;
   }
   
  #termsRadio2 .btn {
    margin-top:30px;
    background:#FFD662;
    border:0;
    text-align:center;
    color:#000; 
    font-size:20px;
    width:70px;
    height:35px; 
  }
</style>
  
<script type="text/javascript">
  function agreeChk() {
    if(document.termsAndConditions.termsAgreement.value=="Agree") {
      opener.document.signIn.hiddenAgree.value="1";
      opener.document.signIn.tnc.disabled = false;
      opener.document.signIn.tnc.checked = true;
      self.close();
    }
    
    if(document.termsAndConditions.termsAgreement.value=="Disagree") {
    	opener.document.signIn.tnc.checked = false;
    	opener.document.signIn.tnc.disabled = true;
    	self.close();
    }
  }
  
</script>

</head>
<body style="background-color:#fffdf2">
<h3 align="center">전자금융거래 기본 약관</h3>
<pre id="pre">
제 1 조 목적

이 약관은 한국벵크핏 주식회사(이하 "벵크핏"라 합니다)와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함으로써, 거래의 신속하고 효
율적인 처리를 도모하고 거래당사자 상호간의 이해관계를 합리적으로 조정하는 것을 목적으로 합니다.

제 2 조 용어의 정의

① 이 약관에서 사용하는 용어의 의미는 다음 각 호와 같습니다.
1. “전자금융거래“ 라 함은 벵크핏가 전자적 장치를 통하여 제공하는 금융상품 및 서비스를 이용자가 전자적 장치를 통하여 비대면·자동화된 방식
으로 직접 이용하는 거래를 말합니다.
2. “이용자”라 함은 전자금융거래를 위하여 벵크핏와 체결한 계약(이하 "전자금융거래계약"이라 합니다)에 따라 전자금융거래를 이용하는 고객을
말합니다.
3. “지급인”이라 함은 전자금융거래에 의하여 자금이 출금되는 계좌(이하 “출금계좌”라 합니다)의 명의인을 말합니다.
4. “수취인”이라 함은 전자금융거래에 의하여 자금이 입금되는 계좌(이하 “입금계좌”라 합니다)의 명의인을 말합니다.
5. “전자적 장치” 라 함은 현금자동지급기(CD), 자동입출금기(ATM), 지급용단말기, 컴퓨터, 전화기 그 밖에 전자적 방법으로 전자금융거래정보를 전송하
거나 처리하는데 이용되는 장치를 말합니다.
6. “접근매체”라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진정성을 확보하기 위하여 사용되는 다음 각목의 어느 하나에
해당하는 수단 또는 정보를 말합니다.
가. 벵크핏가 제공한 전자식 카드 및 이에 준하는 전자적 정보
나. 「전자서명법」에 따른 전자서명생성정보(벵크핏 인증키 포함)
다. 등록되어 있는 이용자의 생체정보
라. 가목 또는 나목의 수단이나 정보를 사용하는 데 필요한 비밀번호
7. “모바일앱”이라 함은 이용자의 스마트폰에 설치하여 벵크핏가 제공하는 금융상품 및 서비스를 전자적 방식으로 이용할 수 있는 벵크핏 모바
일 애플리케이션을 말합니다.
8. “전자문서”라 함은 「전자문서 및 전자거래 기본법」 제 2 조제 1 호의 규정에 따라 작성, 송신·수신 또는 저장된 정보를 말합니다.
9. “거래지시”라 함은 이용자가 전자금융거래계약에 의하여 벵크핏에 개별적인 전자금융거래의 처리를 지시하는 것을 말합니다.
10.“오류”라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 약관(개별약관을 포함합니다), 전자금융거래계약 또는 이용자가 거래 지시한 대로 이행
되지 아니한 경우를 말합니다.

제 3 조 적용되는 거래

이 약관은 벵크핏와 이용자 사이에 다음 각 호의 전자적 장치를 이용하여 이루어지는 계좌이체(예약에 의한 계좌이체 및 지연이체를 포함합니다. 이하
같습니다), 추심이체(예약에 의한 추심이체를 포함합니다. 이하 같습니다), 계좌송금과 관련한 조회, 입금, 출금, 대출과 관련한 신청 및 조회, 해지, 체크카드
(이하 '카드'라 합니다)와 관련한 발급 및 해지, 카드 사용내역 조회, 카드 결제 등의 전자금융거래에 적용됩니다.
1. 모바일앱에 의한 거래.
2. 제 1 호 외의 전화기에 의한 거래
3. 현금자동지급기(CD), 자동입출금기(ATM), 지급용단말기에 의한 거래
4. 컴퓨터에 의한 거래
5. 체크카드단말기에 의한 거래
6. 기타 전자적 수단에 의한 거래
</pre>
  <form action="" method="post" name="termsAndConditions">
    <div id="termsRadio">
      <input type="radio" id="termsAgreement" name="termsAgreement" value="Agree">동의
      <input type="radio" id="termsAgreement" name="termsAgreement" value="Disagree">동의안함
    </div>
    
    <div id="termsRadio2">
      <input type="submit" id="close" class="btn btn-primary" value="확인" onclick="agreeChk();">
    </div>
  </form>
</body>
</html>