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
    margin-bottom:150px;
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
      // 전체 선택, 해제
      $("#box1").click(function() {
        if($("#box1").prop("checked")) {
          $("input[name=box2]").prop("checked", true);
        } else {
          $("input[name=box2]").prop("checked", false);
        }
      })
      
      // 선택 회원 삭제
      $("#delBtn").click(function() {
        var con = confirm("선택 회원을 정말 삭제하시겠습니까?");
        if(con) {
          $("input[name=box2]:checked").each(function() {
              var id = $(this).val(); 
              $.ajax({
                  type: "POST",
                  data: "id=" + id,
                  url: "${pageContext.request.contextPath}/deleteUsers", //{컨트롤러}/이동페이지
                  success: function(data) {
                    if(data.trim().split("/")[0] == 1) {
                      window.location="selectUsers";
                    } else {
                      alert("회원 삭제에 실패했습니다. 잠시후 다시 시도해주십시오");
                    }
                  },
                  error: function() {
                      alert("오류");
                  }
              });
          })
        } else {
          return false;
        }
      })
      
    });
    
    // 신분증 크게 보기
    function openImg(img) {
      imgwin = window.open("", "new", "width=600, height=400, left=200, top=100");
      imgwin.document.write("<img src=/benkfit/resources/img/idcard/"+img+" onclick='self.close()' style='height:350; cursor:pointer;'>");
    }
    
    // 회원 등급 변경
    function changelevel(id, current) {
       var level = $("#level"+id+" option:selected").val();
       var params = "id=" + id + "&level=" + level;
       
       if(level == current) {
         return;
       } else {
         $.ajax({
             type: "POST",
             data: params,
             url: "${pageContext.request.contextPath}/updateUsers",
             success: function(data) {
               if(data.trim().split("/")[0] == 1) {
                 $("#level_div"+id).html(data.trim().split("/")[1]);
               } else {
                 alert("회원 등급 수정에 실패하였습니다. 잠시후 다시 시도해주십시오.");
               }
             },
             error: function() {
                 alert("오류");
             }
         });
       }
    }    
    
</script>
</head>
<body>
<%@ include file ="../../Template/top.jsp" %>

<div class=wrapper3>
  <div class="wrapper2">
      <div class="btnarea">
        <input class="btn" type="button" value="삭제" id="delBtn">
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
           <td class="cell"><div id="level_div${vo.c_id}">${vo.c_level}</div></td>
           <td class="cell">
            <select name="level" id="level${vo.c_id}" onchange="changelevel('${vo.c_id}', '${vo.c_level}')">
             <option value="" selected disabled hidden>선택</option>
             <option value="승인전">승인전</option>
             <option value="승인1">승인1</option>
             <option value="승인2">승인2</option>
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
  </div>
</div>
<%@ include file ="../../Template/footer.jsp" %>
</body>
</html>