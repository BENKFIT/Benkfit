<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .wrapper7{
    margin: 0 20px 20px 20px;
    padding:0 20px 20px 20px;
  }
  
  .wrapper8 {
      margin:0 5 5 5;
      text-align:center;
      width:100%;
  }
  
  .wrapper9 {
    margin:0 5 5 5;
    display:inline-block; 
  }
  
  .title {
    padding:20px;
  }
  
  .tb_header3 {
    width:700px;
  }
  
  .tb_header3 tr th {
    color:#fff;
    padding: 10px;
    text-align:center;
  }
  
  .tb_header3 tr td {
    text-align:center;
  }
  
  #closeModal2 {
    margin-top:20px;
  }
  
</style>

</head>
<body>
<div class="title">
<h4>${account} 거래내역</h4>
</div>

<div class="wrapper7">
  <div class="wrapper8">
      <div class="wrapper9">
       <table class="tb_header3">
         <tr class="rows header blue">
            <c:choose>
              <c:when test="${code == 'A'}">
	             <th>거래번호</th>
	             <th>입출금</th>
	             <th>거래대상</th>
	             <th>거래금액</th>
	             <th>거래은행</th>
	             <th>거래일</th>
             </c:when>
             
             <c:when test="${code == 'B'}">
               <th>거래번호</th>
               <th>입출금</th>
               <th>거래대상</th>
               <th>거래금액</th>
               <th>거래일</th>
               <th>만기일</th>
             </c:when>
             
             <c:when test="${code == 'C'}">
               <th>거래번호</th>
               <th>대출원금</th>
               <th>만기일</th>
               <th>납입금</th>
               <th>잔여대출금</th>
               <th>거래일</th>
             </c:when>
            </c:choose>
         </tr>
         
         <c:if test="${tcnt == 0}">
           <tr class="rows">
             <th colspan="6" style="color:#626263">거래내역이 없습니다.</th>
           </tr>
         </c:if>
         
         <c:if test="${tcnt != 0}">
         <c:forEach var="vo" items="${transaction}">
		         <c:if test="${code == 'A'}">
		         <tr class="rows">
		           <td class="cell">${vo.tran_num}</td>
		           <td class="cell">${vo.tran_type}</td>
		           <c:if test="${vo.tran_type == '출금'}">
		           <td class="cell">${vo.tran_in}</td>
		           </c:if>
		           <c:if test="${vo.tran_type == '입금'}">
		           <td class="cell">${vo.tran_out}</td>
		           </c:if>
		           <td class="cell">${vo.tran_amount}</td>
		           <td class="cell">${vo.tran_bank}</td>
		           <td class="cell">${vo.tran_date}</td>
		         </tr>
		         </c:if>
		         
		         <c:if test="${code == 'B'}">
             <tr class="rows">
               <td class="cell">${vo.tran_num}</td>
               <td class="cell">${vo.tran_type}</td>
               <c:if test="${vo.tran_type == '출금'}">
               <td class="cell">${vo.tran_in}</td>
               </c:if>
               <c:if test="${vo.tran_type == '입금'}">
               <td class="cell">${vo.tran_out}</td>
               </c:if>
               <td class="cell">${vo.tran_amount}</td>
               <td class="cell">${vo.tran_date}</td>
               <td class="cell">${vo.tran_due}</td>
             </tr>
             </c:if>
             
             <c:if test="${code == 'C'}">
             <tr class="rows">
               <td class="cell">${vo.tran_num}</td>
               <td class="cell">${vo.tran_loanAmount}</td>
               <td class="cell">${vo.tran_due}</td>
               <td class="cell">${vo.tran_amount}</td>
               <td class="cell">${vo.tran_afterAmount}</td>
               <td class="cell">${vo.tran_date}</td>
             </tr>
             </c:if>
          </c:forEach>
         </c:if>
         </table>
         
         <!-- 페이지 컨트롤 -->
				  <table class="paging" align="center">
				    <tr>
				      <th align="center">
				        <!-- 거래내역 있으면 -->
				        <c:if test="${tcnt > 0}">
				          <c:if test="${startPage > pageBlock}">
				            <span class="pageno" id="viewCheq" data-toggle="modal" data-target="#myModalT"
                      onclick="getTrans('${account}','${code}')">◁◁</span>
				            <span class="pageno" id="viewCheq" data-toggle="modal" data-target="#myModalT"
                      onclick="getTrans('${account}','${code}','${startPage - pageBlock}')">◀</span>
				          </c:if>
				          
				          <!-- 블록내의 페이지 번호 -->
				          <c:forEach var="i" begin="${startPage}" end="${endPage}">
				            <c:if test="${i == currentPage}">
				              <span id="currentPage"><b>[${i}]</b></span>
				            </c:if>
				            
				            <c:if test="${i != currentPage}">
				              <span class="pageno" id="viewCheq" data-toggle="modal" data-target="#myModalT"
                        onclick="getTrans('${account}','${code}','${i}')">${i}</span>
				            </c:if>
				          </c:forEach>
				          
				          <!-- 다음블록[▶] / 끝[▶▶] -->
				          <c:if test="${pageCount > endPage}">
				           <span class="pageno" id="viewCheq" data-toggle="modal" data-target="#myModalT"
                      onclick="getTrans('${account}','${code}','${startPage + pageBlock}')">▶</span>
                   <span class="pageno" id="viewCheq" data-toggle="modal" data-target="#myModalT"
                      onclick="getTrans('${account}','${code}','${pageCount}')">▷▷</span>
				          </c:if>
				        </c:if>
				        
				        <!-- 내역 없으면 -->
				        <c:if test="${tcnt == 0}">
				        
				        </c:if>
				        
				      </th>
				    </tr>
				  </table>
				  <!-- 페이징 -->
         </div>
         <!-- 모달 닫기 버튼 -->
         <div class="wrapper6">
          <input type="button" id="closeModal2" class="btn btn-primary" value="닫기" onclick="closeModal2()">
        </div>
        </div>
       </div>
</body>
</html>