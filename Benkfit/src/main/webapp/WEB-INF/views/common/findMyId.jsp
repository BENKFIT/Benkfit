<!-- 19/02/01 손리아 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>
    #logindiv1 {
    text-align:center;
  }
  
  #logindiv2 {
    display:inline-block;
    width:30%;
  }
  
  label {
    text-align:left;
  }
  
  #find_result {
    text-align:center;
    font-size:20px;
    margin-top:40px;
    color:#ff0000;
  }
  
  #gotologin {
      text-align:center;
      font-size:20px;
      margin-top:15px;
    } 
    
   #gotologin a {
     text-decoration:none;
   }
    
</style>
<script type="text/javascript">
    function inputChk() {
    	var name = document.findForm.name;
    	var email = document.findForm.email;
    	
    	if(name.value == "") {
	    		alert("이름을 입력해주세요");
	    		name.focus();
    	} else if(email.value == "") {
	    		alert("이메일을 입력해주세요");
	    		email.focus();
    	} else if(name.value != null && email.value!= null) {
<<<<<<< HEAD
    		  $(function() {
	           var name = $("#name").val();
	           var email = $("#email").val();
	           
	           $.ajax({
	             type: "POST",
	             data: "name="+name+"&email="+email,
	             url: "${pageContext.request.contextPath}/findAccount",
	             success: function(data) {
		              if(data == 0) {
		            	     $("#find_result").css("visibility", "visible");
	                     $("#find_result").html("일치하는 정보가 없습니다");
	                     $("#gotologin").css("visibility", "invisible");
		              } else {
		            	     $("#find_result").css("visibility", "visible");
		                   $("#find_result").html("아이디는 " + data + " 입니다."); 
		                   $("#gotologin").css("visibility", "visible");
		              }
	             },
	             beforeSend:function(xhr){
	                 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	                 $('.wrap-loading').removeClass('display-none');
	             },
	             error: function() {
	            	  alert("오류")
	             }
	           });
	         }); 
=======
           var name = $("#name").val();
           var email = $("#email").val();
           $.ajax({
             type: "POST",
             data: "name="+name+"&email="+email,
             url: "${pageContext.request.contextPath}/findAccount",
             success: function(data) {
	              if(data == 0) {
	            	     $("#find_result").css("visibility", "visible");
                     $("#find_result").html("일치하는 정보가 없습니다");
                     $("#gotologin").css("visibility", "invisible");
	              } else {
	            	     $("#find_result").css("visibility", "visible");
	                   $("#find_result").html("아이디는 " + data + " 입니다."); 
	                   $("#gotologin").css("visibility", "visible");
	              }
             },
             error: function() {
            	  alert("오류")
             }
           });
>>>>>>> branch 'master' of https://github.com/BENKFIT/benkfit.git
    	 }
    }
    
    function gotologin() {
    	window.location="login?${_csrf.parameterName}=${_csrf.token}";
    }
</script>
</head>
<body>
<%@ include file ="../Template/top.jsp" %>

<div id="logindiv1">
  <div id="logindiv2">
    
    <form id="login-form" name="findForm" action="" method="post" style="margin-top:250px;">
    
	    <div class="row">
         <div class="eq-ui-form-group eq-ui-input-field">
             <h3>아이디 찾기</h3>
         </div>
	    </div>
	    
	    <div class="row" style="margin-bottom:20px;">
	       <div class="eq-ui-form-group eq-ui-input-field">
	          <input id="name" name="name" type="text" class="eq-ui-input">
	          <label for="name">한글 이름</label>
	       </div>
	    </div>
	    
	    <div class="row" style="margin-bottom:20px;">
	      <div class="eq-ui-form-group eq-ui-input-field">
	          <input id="email" name="email" type="email" class="eq-ui-input">
	          <label for="email">가입시 등록한 이메일 (예: benkfit@benkfit.com )</label>
	      </div>
	    </div>
	    
	    <div class="row" style="margin-top:20px;">
	      <input type="button" class="btn btn-default" id="search" name="search" onclick="inputChk();" value="확인" style="background-color:#2D5772; color:#fff;">
        <input type="button" class="btn btn-default" id="cancel" name="cancel" onclick="gotologin();" value="취소" style="background-color:#2D5772; color:#fff;">
	    </div>
	    
	    <div id="find_result"></div>
	    <div id="gotologin" style="visibility:hidden">
	      <a href="login?${_csrf.parameterName}=${_csrf.token}">로그인하러 가기</a>
	    </div>
   </form>
  </div>
</div>  
<%@ include file ="../Template/footer.jsp" %>
</body>
</html>