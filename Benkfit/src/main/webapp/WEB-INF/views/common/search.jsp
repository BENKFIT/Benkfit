<!-- 2019/02/07 손리아 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 메인 > 검색 </title>
<style>

  #div1 {
    margin-top: 200px; 
    margin-bottom:200px;
    width: 100%; 
    text-align: center;
  }
  
  #table1 {
    margin-bottom:50px;
  }

  td > a {
    color : black;
  }
  
  h4 {
    text-align:left;
    font-weight:bold;
    margin-left:10px;
    margin-top:50px;
  }



</style>
</head>
<body>
<%@ include file ="../Template/top.jsp" %>

<div id="div1">
    <div style="display: inline-block; width: 60%;">
      <div id="table1">
      <h4>예금 검색 결과</h4><br>

      <table class="table table-hover" style="width: 100%;">
        <thead>
          <tr style="background: #2980B9">
            <th style="width: 10%; text-align: center">No</th>
            <th style="width: 70%;">상품명</th>
            <th style="width: 20%; text-align: center">등록일</th>
          </tr>
        </thead>

        <tbody>
          <c:if test="${cheqCnt > 0}">
            <c:forEach var="dto" items="${cheq}">
              <tr class="booklist">
                <td align="center">${dto.cheq_num}</td>
                <td><a href="#">${dto.cheq_name}</a></td>
                <td align="center"><fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${dto.cheq_regDate}" /></td>
              </tr>
            </c:forEach>

          </c:if>
          <c:if test="${cheqCnt == 0}">
            <tr>
              <td colspan="3" align="center">검색 결과가 없습니다.</td>
            </tr>
          </c:if>
        </tbody>
      </table>
      </div>
      
      <div id="table1">
      <h4>대출 검색 결과</h4><br>

      <table class="table table-hover" style="width: 100%;">
        <thead>
          <tr style="background: #2980B9">
            <th style="width: 10%; text-align: center">No</th>
            <th style="width: 70%;">상품명</th>
            <th style="width: 20%; text-align: center">등록일</th>
          </tr>
        </thead>

        <tbody>
          <c:if test="${loanCnt >= 1}">
            <c:forEach var="dto" items="${loan}">
              <tr class="booklist">
                <td align="center">${dto.loan_num}</td>
                <td><a href="#">${dto.loan_name}</a></td>
                <td align="center"><fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${dto.loan_regDate}" /></td>
              </tr>
            </c:forEach>

          </c:if>
          <c:if test="${loanCnt == 0}">
            <tr>
              <td colspan="3" align="center">검색 결과가 없습니다.</td>
            </tr>
          </c:if>
        </tbody>
      </table>
      </div>
      
      <div id="table1">
      <h4>적금 검색 결과</h4><br>

      <table class="table table-hover" style="width: 100%;">
        <thead>
          <tr style="background: #2980B9">
            <th style="width: 10%; text-align: center">No</th>
            <th style="width: 70%;">상품명</th>
            <th style="width: 20%; text-align: center">등록일</th>
          </tr>
        </thead>

        <tbody>
          <c:if test="${savCnt >= 1}">
            <c:forEach var="dto" items="${sav}">
              <tr class="booklist">
                <td align="center">${dto.sav_num}</td>
                <td><a href="#">${dto.sav_name}</a></td>
                <td align="center"><fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${dto.sav_regDate}" /></td>
              </tr>
            </c:forEach>

          </c:if>
          <c:if test="${savCnt == 0}">
            <tr>
              <td colspan="3" align="center">검색 결과가 없습니다.</td>
            </tr>
          </c:if>
        </tbody>
      </table>
      </div>
    </div>
</div>

<%@ include file ="../Template/footer.jsp" %>
</body>
</html>