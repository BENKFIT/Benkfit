<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .wrapper3{
    width:100%;
    height:100%;
    vertical-align:middel;
    text-align:center;
  }
  
  .wrapper2 {
      display:inline-block;
      margin-top:150px;
      width:80%;
      align:center;
  }
  
  .btnarea {
    text-align:left;
  }
  
  .btnarea .btn {
    margin-bottom:10px;
    background-color:#2D5772;
    border-color:#2D5772;
    color:#fff;
  }
  
  .btnarea .btn:hover {
    background-color:#FFD662;
    border-color:#FFD662;
    color:#fff
  }
  
  .tb_header tr th {
    color:#fff;
    padding: 10px;
    text-align:center;
  }
</style>
<script type="text/javascript">
    $(function() {
    	$("#box1").click(function() {
    		if($("#box1").prop("checked")) {
    			$("input[name=box2]").prop("checked", true);
    		} else {
    			$("input[name=box2]").prop("checked", false);
    		}
    	})
    });
    
    function openImg(img) {
    	imgwin = window.open("", "new", "width=600, height=400, left=200, top=100");
    	imgwin.document.write("<img src=/benkfit/resources/img/idcard/"+img+" onclick='self.close()' style='height:350; cursor:pointer;'>");
    }
</script>
</head>
<body>
<%@ include file ="../../Template/top.jsp" %>

<div class=wrapper3>
  <div class="wrapper2">
    <form action="updateUsers" method="post" name="usersForm">
      <div class="btnarea">
        <input class="btn" type="submit" value="등급변경">
        <input class="btn" type="button" value="삭제">
      </div>
       <table class="tb_header">
         <tr class="rows header blue">
             <th><input type="checkbox" id="box1" name="box1"></th>
             <th colspan=2>고객등급</th>
             <th>고객명</th>
             <th>생년월일</th>
             <th>주소</th>
             <th>아이디</th>
             <th>연락처</th>
             <th>이메일</th>
             <th>가입일</th>
             <th>신분증</th>
         </tr>
         
         <c:forEach var="vo" items="${users}">
         <tr class="rows">
           <td class="cell"><input type="checkbox" id="${vo.c_id}" name="box2" value="${vo.c_id}"></td>
           <td class="cell">${vo.c_level}</td>
           <td class="cell">
            <select name="change_users_level">
             <option value="0">승인전</option>
             <option value="1">승인1</option>
             <option value="2">승인2</option>
            </select>
           <td class="cell">${vo.c_name}</td>
           <td class="cell">${vo.c_jumin1}</td>
           <td class="cell">${vo.c_address}</td>
           <td class="cell">${vo.c_id}</td>
           <td class="cell">${vo.c_hp}</td>
           <td class="cell">${vo.c_email}</td>
           <td class="cell">${vo.c_regDate}</td>
           <td class="cell">
              <img src="/benkfit/resources/img/idcard/${vo.c_idCard}" style="width:20px;" onclick="openImg('${vo.c_idCard}')">
           </td>
         </tr>
         </c:forEach>
       </table>
       
      </form>
  </div>
</div>
<%@ include file ="../../Template/footer.jsp" %>
</body>
</html>