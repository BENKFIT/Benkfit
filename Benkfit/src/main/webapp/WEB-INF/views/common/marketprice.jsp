<!-- 2019/02/15 손리아 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .wrapper1 {
    width:100%;
    margin-top:150px;
    text-align:center;
  }
  
  .wrapper2 {
    width:100%;
    display: inline-block;
    text-align:center;
  }
  
  .ctbl {
    width:80%;
  }
  
  .ctr_head {
    line-height:2;
    border-bottom:1px solid #000;
    font-weight:bold;
  }
  
  .ctr_head .cell {
    padding-bottom:10px;
  }
  
  .ctr {
    line-height:2;
    border-bottom:1px solid #ddd;
    
  }
  
  .cell {
    text-align:right;
  }
  
  #rateUp {
    color:#4386f9;
  }
  
  #rateDown {
    color:#f75467;
  }
  
</style>

</head>
<body>
<%-- <%@ include file ="../Template/top.jsp" %> --%>
  <div class="wrapper1" id="wrapper1">
    <div class="wrapper2">
      <table class="ctbl" align="center">
       <thead>
        <tr class="ctr_head">
          <td class="cell" style="text-align:left">코인</td>
          <td class="cell">시세</td>
          <td class="cell">변동(%)</td>
          <td class="cell">거래금액</td>
          <td class="cell">시가총액</td>
        </tr>
       </thead>
       
       <tbody>
        <c:forEach var="vo" items="${price}">
          <tr class="ctr">
            <td class="cell" style="text-align:left">
              <c:choose>
                <c:when test="${vo.name=='Bitcoin'}">
                         비트코인
                </c:when>
                <c:when test="${vo.name=='Ethereum'}">
                        이더리움
                </c:when>
                <c:when test="${vo.name=='Bitcoin Cash'}">
                         비트코인 캐시
                </c:when>
                <c:when test="${vo.name=='Dash'}">
                                대시
                </c:when>
                <c:when test="${vo.name=='BITCOINSV'}">
                                비트코인에스브이
                </c:when>
                <c:when test="${vo.name=='Zcash'}">
                                제트캐시
                </c:when>
                <c:when test="${vo.name=='Monero'}">
                                모네로
                </c:when>
                <c:when test="${vo.name=='Litecoin'}">
                                라이트코인
                </c:when>
                <c:when test="${vo.name=='Augur'}">
                                어거
                </c:when>
                <c:when test="${vo.name=='Bitcoin Gold'}">
                                비트코인 골드
                </c:when>
                <c:when test="${vo.name=='Ethereum Classic'}">
                                이더리움 클래식           
                </c:when>
                <c:when test="${vo.name=='EOS'}">
                                이오스
                </c:when>
                <c:when test="${vo.name=='Waves'}">
                                웨이브
                </c:when>
                <c:when test="${vo.name=='Crypto.com'}">
                                크립토닷컴
                </c:when>
                <c:when test="${vo.name=='Qtum'}">
                                퀀텀
                </c:when>
                <c:when test="${vo.name=='Populous'}">
                                파퓰러스
                </c:when>
                <c:when test="${vo.name=='Omisego'}">
                                오미세고
                </c:when>
                <c:when test="${vo.name=='HyperCash'}">
                                하이퍼캐시
                </c:when>
                <c:when test="${vo.name=='WaltonChain'}">
                                월튼체인
                </c:when>
                <c:when test="${vo.name=='Stratis'}">
                                스트라티스
                </c:when>
                <c:when test="${vo.name=='Bitcoin Diamond'}">
                                비트코인 다이아몬드
                </c:when>
                <c:when test="${vo.name=='PIVX'}">
                                피벡스
                </c:when>
                <c:when test="${vo.name=='ChainLink'}">
                                체인링크
                </c:when>
                <c:when test="${vo.name=='Aeternity'}">
                                애터니티
                </c:when>
                <c:when test="${vo.name=='Steem'}">
                                스팀
                </c:when>
                <c:when test="${vo.name=='Ripple'}">
                                리플
                </c:when>
                <c:when test="${vo.name=='Metal'}">
                                메탈
                </c:when>
                <c:when test="${vo.name=='Aeron'}">
                                에어론
                </c:when>
                <c:when test="${vo.name=='Insolar'}">
                                아이앤에스
                </c:when>
                <c:when test="${vo.name=='TenX'}">
                                텐엑스
                </c:when>
                <c:when test="${vo.name=='TrueChain'}">
                                트루체인
                </c:when>
                <c:when test="${vo.name=='0x'}">
                                제로엑스
                </c:when>
                <c:when test="${vo.name=='ICON'}">
                                아이콘
                </c:when>
                <c:when test="${vo.name=='Raiden Network Token'}">
                                레이든네트워크토큰
                </c:when>
                <c:when test="${vo.name=='SALT'}">
                                솔트
                </c:when>
                <c:when test="${vo.name=='Ethos'}">
                                에토스
                </c:when>
                <c:when test="${vo.name=='Kyber Network'}">
                                카이버네트워크
                </c:when>
                <c:when test="${vo.name=='Basic Attention Token'}">
                                베이직어텐션토큰
                </c:when>
                <c:when test="${vo.name=='Cortex'}">
                                코르텍스
                </c:when>
                <c:when test="${vo.name=='aelf'}">
                                엘프
                </c:when>
                <c:when test="${vo.name=='IoT Chain'}">
                                아이오티체인
                </c:when>
                <c:when test="${vo.name=='Ether Zero'}">
                                이더제로
                </c:when>
                <c:when test="${vo.name=='Theta Token'}">
                                쎄타토큰
                </c:when>
                <c:when test="${vo.name=='PolyMath'}">
                                폴리매스
                </c:when>
                <c:when test="${vo.name=='Primas'}">
                                프리마스
                </c:when>
                <c:when test="${vo.name=='Power Ledger'}">
                                파워렛저
                </c:when>
                <c:when test="${vo.name=='Stellar Lumens'}">
                                스텔라루멘           
                </c:when>
                <c:when test="${vo.name=='Arcblock'}">
                                아크블록
                </c:when>
                <c:when test="${vo.name=='OneRoot Network'}">
                                원루트 네트워크
                </c:when>
                <c:when test="${vo.name=='Golem'}">
                                골렘
                </c:when>
                <c:when test="${vo.name=='Loopring'}">  
                                루프링
                </c:when>
                <c:when test="${vo.name=='NEM'}">
                                 넴
                </c:when>
                <c:when test="${vo.name=='Cardano'}">
                                에이다
                </c:when>
                <c:when test="${vo.name=='Loom Network'}">
                                룸네트워크
                </c:when>
                <c:when test="${vo.name=='Mithril'}">
                                미스릴
                </c:when>
                <c:when test="${vo.name=='WAX'}">
                                왁스
                </c:when>
                <c:when test="${vo.name=='Enjin Coin'}">
                                엔진코인
                </c:when>
                <c:when test="${vo.name=='PlayCoin'}">
                                플레이코인
                </c:when>
                <c:when test="${vo.name=='Gifto'}">
                                기프토
                </c:when>
                <c:when test="${vo.name=='Bezant'}">
                                베잔트
                </c:when>
                <c:when test="${vo.name=='CyberMiles'}">
                                사이버마일즈
                </c:when>
                <c:when test="${vo.name=='TRON'}">
                                트론
                </c:when>
                <c:when test="${vo.name=='Status Network'}">
                                스테이터스네트워크토큰
                </c:when>
                <c:when test="${vo.name=='Zilliqa'}">
                                질리카
                </c:when>
                <c:when test="${vo.name=='WeShow Token'}">
                                위쇼토큰
                </c:when>
                <c:when test="${vo.name=='IOST'}">
                                이오스트
                </c:when>
                <c:when test="${vo.name=='Verge'}">
                                버지
                </c:when>
                <c:when test="${vo.name=='The Midas Touch Gold'}">
                                더마이다스터치골드
                </c:when>
                <c:when test="${vo.name=='VeChainThor'}">
                                비체인
                </c:when>
                <c:when test="${vo.name=='Odyssey'}">
                                오디세이
                </c:when>
                <c:when test="${vo.name=='APIS'}">
                                아피스
                </c:when>
                <c:when test="${vo.name=='AMO Coin'}">
                                아모코인
                </c:when>
                <c:when test="${vo.name=='ROM'}">
                                 롬
                </c:when>
                <c:otherwise>
                ${vo.name}
                </c:otherwise>
              </c:choose>
            </td>
            <td class="cell"><fmt:formatNumber value="${vo.marketprice}" pattern="#,###.##" />원</td>
            
            <c:choose>
              <c:when test = "${fn:startsWith(vo.changeNum, '+')}">
                <td class="cell" id="rateUp">
                +<fmt:formatNumber value="${vo.changeNum}" pattern="#,###.##" />  ${vo.changePer}
                  <i class="rate_icon">▲</i>
                </td>
              </c:when>
              
              <c:when test = "${fn:startsWith(vo.changeNum, '-')}">
                <td class="cell" id="rateDown">
                <fmt:formatNumber value="${vo.changeNum}" pattern="#,###.##" />  ${vo.changePer}
                  <i class="rate_icon">▼</i>
                </td>
              </c:when>
              
              <c:otherwise>
                <td class="cell">
                <fmt:formatNumber value="${vo.changeNum}" pattern="#,###.##" />  ${vo.changePer} －
                </td>
              </c:otherwise>
            </c:choose>
            <td class="cell"><fmt:formatNumber value="${vo.sort_amount}" pattern="#,###" />원</td>
            <td class="cell">${vo.total}</td>
          </tr>
        </c:forEach>
       </tbody>
      </table>
    </div>
  </div>
<%-- <%@ include file ="../Template/footer.jsp" %> --%>
</body>
</html>