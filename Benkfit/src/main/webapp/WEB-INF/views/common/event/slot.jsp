<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp" %>
<html>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	function slotBalance(){
		var address = $('#address').val();
		var alldata = {"address":address};
		
		$.ajax({
			url:"${pageContext.request.contextPath}/slotBalance",
			type : "GET",
			data : alldata,
			success : function(data){
				$('#balance').html(data);
			},
			error : function(){
				alert("오류")
			}
		});
	}
	
	function spin(){
		var address = $('#address').val();
		var pass = $('#pass').val();
		var bet_amount = $('#bet_amount').val();
		var alldata = {'address':address,'pass':pass,'bet_amount':bet_amount}
		$('#messages').html("결과를 출력중입니다.");
		
		$.ajax({
			url:"${pageContext.request.contextPath}/slotResult",
			type : "GET",
			data : alldata,
			dataType : "JSON",
			success : function(data){
				$('#first').html(data.n1);
				$('#second').html(data.n2);
				$('#third').html(data.n3);
				if (data.win == "true") {
					$('#messages').html("축하합니다. "+data.amount+"ETH를 얻으셨습니다.");
				} else {
					$('#messages').html("다음기회를 이용해주세요.");
				}
			},
			error : function(){
				alert("오류")
			}
		});
	}
</script>
<style>
   	body {
      text-align: center;
    }

    input, select {
      padding: 6px 10px;
      margin: 4px 0;
      display: inline-block;
      border: 1px solid #3CBC8D;
      border-radius: 4px;
      box-sizing: border-box;
    }
    input[type=button] {
      border: none;
      border-radius: 4px;
      border: 1px solid #3CBC8D;
      cursor: pointer;
    }
    input[type=button]:hover {
      background-color: #45a049;
    }
    p, a {color: #3CBC8D; font-weight: 12px; }
    .title {font-size: 50px;text-align: center;}
    #machine {text-align: center;}
    </style>
<body>
	
	<!-- TOP&SIDE -->
	<%@ include file="../../Template/top.jsp"%>
	<div class="wrapper">
		<p class="title">
		        ETH Slots
		    </p>
	
	    <p class="login">
	        ID:
	        <input type="text" id="address" value="0xba444a48a264e7fcadd9a60951623e607fee385a">
	        Pass:
	        <input type="password" id="pass" value="password">
	        <input type="button" value="잔고확인" onClick="slotBalance();">
	    </p>
	
	    <div id="machine">
	        <svg width="650" height="250" viewBox="0 0 1700 500">
	
	            <circle cx="300" cy="260" r="240" fill="white" stroke="#777" stroke-width="30" />
	            <circle cx="850" cy="260" r="240" fill="white" stroke="#777" stroke-width="30" />
	            <circle cx="1400" cy="260" r="240" fill="white" stroke="#777" stroke-width="30" />
	            <text x="150" y="415" font-family="courier" font-size="500" fill="#3CBC8D" id="first">
	                7
	            </text>
	
	            <text x="700" y="415" font-family="courier" font-size="500" fill="#3CBC8D" id="second">
	                7
	            </text>
	
	            <text x="1260" y="415" font-family="courier" font-size="500" fill="#3CBC8D" id="third">
	                7
	            </text>
	        </svg>
	    </div>
	
	    <p>
	        <select id="bet_amount">
	            <option value="200000000000000000"> 0.2 </option>
	            <option value="400000000000000000"> 0.4 </option>
	            <option value="600000000000000000"> 0.6 </option>
	            <option value="800000000000000000"> 0.8 </option>
	            <option value="1000000000000000000"> 1.0 </option>
	        </select>
	        <input type="button" value="Spin" onClick="spin()">
	    </p>
	
	    <p id="balance"></p>
	
	    <p id="messages"></p>		
    </div>
    
    	<!-- FOOTER  -->
	<%@ include file="../../Template/footer.jsp"%>
</body>
</html>