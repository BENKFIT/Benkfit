<!-- 손리아 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .wrapper4{
    margin: 0 20px 20px 20px;
    padding:0 20px 20px 20px;
  }
  
  .wrapper5 {
      margin:0 5 5 5;
      text-align:center;
      width:100%;
  }
  
  .wrapper6 {
    margin:0 5 5 5;
    display:inline-block; 
  }
  
  .title {
    padding-top:20px;
  }
  
  .btnarea2 {
    text-align:left;
    margin-top:40px;
  }
  
  .tb_header2 {
    width:900px;
  }
  
  .tb_header2 tr th {
    color:#fff;
    padding: 10px;
    text-align:center;
  }
  
  .tb_header2 tr td {
    text-align:center;
  }
  
  #closeModal {
    margin-top:40px;
  }
  
  .viewTrans {
    color:#53a0d1;
    cursor:pointer;
  }
  
  .viewTrans:hover {
    color:#822929;
  }
  
</style>

</head>
<body>

<div class="title">
<h3>${id}님의 계좌</h3>
</div>

<div class=wrapper4>
  <div class="wrapper5">
     
      <div class="wrapper6">
       <div class="btnarea2">
        <h3>예금</h3>
       </div>
       <table class="tb_header2">
         <tr class="rows header">
             <th>계좌번호</th>
             <th>예금</th>
             <th>연이율</th>
             <th>예금한도</th>
             <th>세율</th>
             <th>QR카드</th>
             <th>가입일</th>
         </tr>
         
         <!-- 예금 가입 상품 없으면 -->
         <c:if test="${cnt == 0}">
         <tr class="rows">
           <th colspan="7" style="color:#626263">가입 상품이 없습니다.</th>
         </tr>
         </c:if>
         
         <!-- 예금 가입 상품 있으면 -->
         <c:if test="${cnt != 0}">
         <!-- 예금 -->
         <c:forEach var="vo" items="${cheq}">
         <tr class="rows">
           <td class="cell"><span class="viewTrans" id="viewCheq" data-toggle="modal" data-target="#myModalT"
              onclick="getTrans('${vo.myCheq_account}','${vo.code}')">${vo.myCheq_account}</span></td>
           <td class="cell">${vo.myCheq_amount}</td>
           <td class="cell">${vo.cheq_rate}</td>
           <td class="cell">${vo.myCheq_limit}</td>
           <td class="cell">${vo.myCheq_taxRate}</td>
           <c:choose>
            <c:when test="${vo.myCheq_card == 0}">
             <td class="cell">미발급</td>
            </c:when>
            <c:otherwise>
             <td class="cell">발급</td>
            </c:otherwise>
           </c:choose>
           <td class="cell">${vo.myCheq_regDate}</td>
         </tr>
         <!-- Modal -->
          <div class="modal fade bd-example-modal-lg" id="myModalT" tabindex="-1" role="dialog" 
                 aria-labelledby="myLargeModalLabel" aria-hidden="true" style="padding:0; width:200%; height:100%;">
            <div class="modal-dialog modal-lg" id="myModalT2">
              <div class="modal-content" id="modal-contentT" style="height:80%">
              
              </div>
            </div>
          </div>
         </c:forEach>
         </c:if>
         </table>
         </div>
         
         <div class="wrapper6">
         <div class="btnarea2">
          <h3>적금</h3>
         </div>
         <table class="tb_header2">
         <tr class="rows header green">
             <th>계좌번호</th>
             <th>적금액</th>
             <th>연이율</th>
             <th>세율</th>
             <th>정기납부금</th>
             <th>이체방식</th>
             <th>가입일</th>
         </tr>
         
         <!-- 적금 가입 상품 없으면 -->
         <c:if test="${scnt == 0}">
         <tr class="rows">
           <th colspan="7" style="color:#626263">가입 상품이 없습니다.</th>
         </tr>
         </c:if>
         
         <!-- 적금 가입 상품 있으면 -->
         <c:if test="${scnt != 0}">
         <!-- 적금 -->
         <c:forEach var="svo" items="${sav}">
         <tr class="rows">
           <td class="cell"><span class="viewTrans" id="viewCheq" data-toggle="modal" data-target="#myModalT"
              onclick="getTrans('${svo.mySav_account}','${svo.code}');">${svo.mySav_account}</span></td>
           <td class="cell">${svo.mySav_amount}</td>
           <td class="cell">${svo.mySav_rate}</td>
           <td class="cell">${svo.mySav_taxRate}</td>
           <td class="cell">${svo.mySav_monSaving}</td>
           <td class="cell">${svo.mySav_method}</td>
           <td class="cell">${svo.mySav_date}</td>
         </tr>
         <!-- Modal -->
          <div class="modal fade bd-example-modal-lg" id="myModalT" tabindex="-1" role="dialog" 
                 aria-labelledby="myLargeModalLabel" aria-hidden="true" style="padding:0; width:200%; height:100%;">
            <div class="modal-dialog modal-lg" id="myModalT2">
              <div class="modal-content" id="modal-contentT" style="height:80%">
              
              </div>
            </div>
          </div>
         </c:forEach>
         </c:if>
         </table>
         </div>
         
         <div class="wrapper6">
         <div class="btnarea2">
          <h3>대출</h3>
         </div>
         <table class="tb_header2">
         <tr class="rows header blue">
             <th>계좌번호</th>
             <th>대출금</th>
             <th>연이율</th>
             <th>만기일</th>
             <th>연체기간</th>
             <th>가입일</th>
         </tr>
         
         <c:if test="${lcnt == 0}">
         <tr class="rows">
           <th colspan="6" style="color:#626263">가입 상품이 없습니다.</th>
         </tr>
         </c:if>
         
         <c:if test="${lcnt != 0}">
         <c:forEach var="lvo" items="${loan}">
         <tr class="rows">
           <td class="cell"><span class="viewTrans" id="viewCheq" data-toggle="modal" data-target="#myModalT"
              onclick="getTrans('${lvo.myloan_account}','${lvo.code}')">${lvo.myloan_account}</span></td>
           <td class="cell">${lvo.myloan_amount}</td>
           <td class="cell">${lvo.myloan_rate}</td>
           <td class="cell">${lvo.myloan_late}</td>
           <td class="cell">${lvo.myloan_over}</td>
           <td class="cell">${lvo.myloan_date}</td>
         </tr>
         <!-- Modal -->
          <div class="modal fade bd-example-modal-lg" id="myModalT" tabindex="-1" role="dialog" 
                 aria-labelledby="myLargeModalLabel" aria-hidden="true" style="padding:0; width:200%; height:100%;">
            <div class="modal-dialog modal-lg" id="myModalT2">
              <div class="modal-content" id="modal-contentT" style="height:80%">
              
              </div>
            </div>
          </div>
         </c:forEach>
         </c:if>
       </table>
       </div>
       
        <div class="wrapper6">
          <input type="button" id="closeModal" class="btn btn-primary" value="닫기" data-dismiss="modal">
        </div>
  </div>
</div>
</body>
</html>