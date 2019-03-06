<!-- 손리아 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 조회</title>
<style>
  .wrapper3 {
    width:100%;
    vertical-align:middel;
    text-align:center;
  }
  
  .wrapper2 {
      display:inline-block;
      margin-top:150px;
      width:90%;
      align:center;
  }
  
  .btnarea {
    text-align:left;
  }
  
  .btnarea .btn {
    margin-bottom:10px;
    color:#ffffff;
  }
  
  .tb_header{
     display:inline-block;
  }
  
  .tb_header tr th {
    color:#fff;
    padding: 10px;
    text-align:center;
  }
  
  .tb_header tr td {
    text-align:center;
  }
  
  .thCenter {
    text-align:center;
  }
  
  .levelSelelct {
    background-color:transparent;
    border:none;
    border-bottom: 1px solid #9e9e9e;
    border-radius: 0;
    outline: 0;
    box-shadow: none;
    transition: all .3s;
    text-align:center;  
  }
  
  .paging {
    margin-top:25px;
  }

  .paging tr {
    text-align:center;
  }
  
  .pageno {
    color:#2D5772;
    cursor:pointer;
    font-size:18px;
  }
  
  .pageno:hover {
    color:#53a0d1;
    
  }
  
  #currentPage {
    color:#666666;
    font-size:18px;
  }
  
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
   rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1./js/bootstrap.min.js"></script>
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
      imgwin = window.open("", "new", "width=600, height=400, left=600, top=200");
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
                 $("#level_div"+id).css("color","#C64545");
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

    // 가입 상품 조회
    function showAccount(id) {
      $.ajax({
            type: "POST",
            data: "id="+id,
            url: "${pageContext.request.contextPath}/selAccount",
            success: function(data) {
              $("#myModal2").css('text-align','center');
              $("#modal-content").css('width','200%');
              $("#modal-content").html(data);
            },
            error: function() {
                alert("가입상품 조회 오류");
            }
        });
    }
    
    // 거래내역 조회
    function getTrans(account, code, pageNum) {
      var params = "account=" + account + "&code=" + code + "&pageNum=" + pageNum;
        $.ajax({
              type: "POST",
              data: params,
              url: "${pageContext.request.contextPath}/selTransaction",
              success: function(data) {
                $("#modal-contentT").html(data);
              },
              error: function() {
                  alert("거래 내역 조회 오류");
              }
          }); 
      }
    
    // 거래내역 모달 닫기
    function closeModal2() {
       document.getElementById("myModalT").click();
    }
    
</script>
</head>
<body>
<%@ include file ="../../Template/top.jsp" %>

<div class="wrapper3">
  <div class="wrapper2">
    <div class="btnarea">
      <a class="btn btn-danger eq-ui-waves-light" id="delBtn" style="color:#fff">삭제</a>
     </div>
       <table class="table eq-ui-data-table eq-ui-with-checkbox z-depth-1">
         <thead>
         <tr>
             <th><input type="checkbox" class="eq-ui-input filled-in" id="box1" />
	               <label for="box1"></label></th>
             <th colspan=2 style="text-align:center">고객등급</th>
             <th style="text-align:center">고객명</th>
             <th style="text-align:center">생년월일</th>
             <th style="text-align:center">주소</th>
             <th style="text-align:center">아이디</th>
             <th style="text-align:center">연락처</th>
             <th style="text-align:center">이메일</th>
             <th style="text-align:center">가입일</th>
             <th style="text-align:center">신분증</th>
             <th class="eq-ui-data-table-cell-non-numeric">가입상품</th>
         </tr>
         </thead>
         <c:forEach var="vo" items="${users}">
         <tbody>
         <tr>
           <td class="cell"><input type="checkbox" class="eq-ui-input filled-in" id="${vo.c_id}" name="box2" value="${vo.c_id}" />
            <label for="${vo.c_id}"></label></td>
           <td class="cell"><div id="level_div${vo.c_id}">${vo.c_level}</div></td>
           <td class="eq-ui-data-table-cell-non-numeric">
            <select class="levelSelelct" name="level" id="level${vo.c_id}" onchange="changelevel('${vo.c_id}', '${vo.c_level}')">
             <option value="" selected disabled hidden>변경</option>
             <option value="승인전">승인전</option>
             <option value="승인1">승인1</option>
             <option value="승인2">승인2</option>
            </select></td>
           <td style="text-align:center">${vo.c_name}</td>
           <td style="text-align:center">${vo.c_jumin1}</td>
           <td class="eq-ui-data-table-cell-non-numeric">${vo.c_address}</td>
           <td style="text-align:center">${vo.c_id}</td>
           <td style="text-align:center">${vo.c_hp}</td>
           <td class="eq-ui-data-table-cell-non-numeric">${vo.c_email}</td>
           <td style="text-align:center">${vo.c_regDate}</td>
           <td style="text-align:center">
              <img src="/benkfit/resources/img/idcard/${vo.c_idCard}" style="width:20px;" 
                    onclick="openImg('${vo.c_idCard}')"></td>
           <td style="display:table">
           <div style="padding-left:20px; display:table-cell; vertical-align:middle">
           <button type="button" class="btn btn-primary eq-ui-waves-light" id="mdBtn" data-toggle="modal" data-target="#myModal" 
                    onclick="showAccount('${vo.c_id}')" style="">조회</button></div></td>
         </tr>
         </tbody>     
          <!-- Modal -->
          <div class="modal fade bd-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg-centered" id="myModal2" style="margin-top:5%; margin-left:25%">
              <div class="modal-content" id="modal-content" style="width:200%;">
              </div>
            </div>
          </div>
         </c:forEach>
       </table>
       
       <!-- 페이지 컨트롤 -->
          <table class="paging" align="center">
            <tr>
              <th style="text-align:center">
                <!-- 회원 있으면 -->
                <c:if test="${ucnt > 0}">
                  <c:if test="${startPage > pageBlock}">
                    <span class="pageno" id="viewCheq" onclick="window.location='selectUsers'">◁◁</span>
                    <span class="pageno" id="viewCheq" 
                      onclick="window.location='selectUsers?pageNum=${startPage - pageBlock}'">◀</span>
                  </c:if>
                  
                  <!-- 블록내의 페이지 번호 -->
                  <c:forEach var="i" begin="${startPage}" end="${endPage}">
                    <c:if test="${i == currentPage}">
                      <span id="currentPage"><b>[${i}]</b></span>
                    </c:if>
                    
                    <c:if test="${i != currentPage}">
                      <span class="pageno" id="viewCheq"
                        onclick="window.location='selectUsers?pageNum=${i}'">${i}</span>
                    </c:if>
                  </c:forEach>
                  
                  <!-- 다음블록[▶] / 끝[▶▶] -->
                  <c:if test="${pageCount > endPage}">
                   <span class="pageno" id="viewCheq"
                      onclick="window.location='selectUsers?pageNum=${startPage + pageBlock}'">▶</span>
                   <span class="pageno" id="viewCheq"
                      onclick="window.location='selectUsers?pageNum=${pageCount}'">▷▷</span>
                  </c:if>
                </c:if>
                
                <!-- 내역 없으면 -->
                <c:if test="${ucnt == 0}">
                
                </c:if>
              </th>
            </tr>
          </table>
  </div>
</div>
         
<%@ include file ="../../Template/footer.jsp" %>
</body>
</html>