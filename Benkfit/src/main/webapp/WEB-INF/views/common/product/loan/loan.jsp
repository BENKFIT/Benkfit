<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../Template/setting.jsp"%>
<html>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1./js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
body {
	text-align: center;
}

input, select {
	padding: 6px 10px;
	margin: 4px 0;
	display: inline-block;
	border: 1px solid #FFD662;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=button] {
	border: none;
	border-radius: 4px;
	cursor: pointer;
	background-color: #FFD662;
	color: white;
}

input[type=button]:hover {
	color: black;
}

p, a {
	color: rgb(119, 119, 119);
	font-weight: 12px;
}

.title {
	font-size: 50px;
	text-align: center;
}

#machine {
	text-align: center;
}

.inputButton {
	background: #FFD662;
}
#from{
	padding: 6px 10px;
	margin: 4px 0;
	display: inline-block;
	border: 1px solid #FFD662;
	border-radius: 4px;
	box-sizing: border-box;
}
#from{
	padding: 6px 10px;
	margin: 4px 0;
	display: inline-block;
	border: 1px solid #FFD662;
	border-radius: 4px;
	box-sizing: border-box;
}
</style>


<body>
<%@ include file ="../../../Template/top.jsp" %>
	<div style="margin-top: -30px; height: 40%; width: 100%; text-align: center;">
		<div style="display: inline-block; width: 60%; margin: 200px 0px;">
			<h3>대출 신청</h3>
			<p class="login">
				지갑파일 : <input type="file" id="from"><br>
			   	     	<input type="button" value="계정확인" onClick="Balance();"> <br>
			</p>
			비밀번호 :<input type="password" id="password" value="password"><br>
			<p id="balance"></p> <br>
			<input type="button" value="대출신청" onclick="loanPro();">
			<div id="state"></div><br>
			<!-- <center>
            <table>
                <tr>
                    <td align="center">대출 원금</td>
                    <td><input type="text" id="amount"></td>
                    <td>원</td>
                </tr>„
                <tr>
                    <td align="center">대출 이율</td>
                    <td><input type="text" id="rate"></td>
                    <td>%</td>
                </tr>
                <tr>
                    <td align="center">대출 기간</td>
                    <td><input type="text" id="period"></td>
                    <td>개월</td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                    <input type="radio" id="type" value="1"> 원금 균등 상환 
                    <input type="radio" id="type" value="2"> 원리금 균등 상환
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="center"><input type="reset"
                        value="다시입력"> <input type="button" value="대출계산" onclick="loanCal();"></td>
                </tr>
            </table>
            </center> -->
	        <div id="loanState"></div>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<!-- FOOTER  -->
	<%@ include file="../../../Template/footer.jsp"%>
</body>
<script type="text/javascript">
	function loanCal(){
		var amount = $('#amount').val();
		var rate = $('#rate').val();
		var period = $('#period').val();
		var type = $('#type').val();
		var alldata = {"amount":amount,"rate":rate,"period":period,"type":type}
		$('#loanState').html("입력하신 대출을 계산중입니다.");
		
		$.ajax({
			url:"${pageContext.request.contextPath}/rtype",
			type : "GET",
			data : alldata,
			dataType : "JSON",
			success : function(data){
				$('loanState').html("완료");
				$('loanState').html(data);
			},
			beforeSend:function(xhr){
	              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	              $('.wrap-loading').removeClass('display-none');
	        },
			error : function(){
				alert("다시 시도해주세요.");
				$('#loanState').html("다시 시도해주세요.");
			}
		});
	}
	function Balance(){
		var from = $('#from').val(); 
		var alldata = {"from":from};
		$('#balance').html("잔액을 호출중입니다.");
		
		$.ajax({
			url:"${pageContext.request.contextPath}/Balance",
			type : "GET",
			data : alldata,
			success : function(data){
				$('#balance').html(data);
			},
			beforeSend:function(xhr){
	              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	              $('.wrap-loading').removeClass('display-none');
	        },
			error : function(){
				alert("지갑파일과 비밀번호를 확인해주세요.");
				$('#balance').html("다시 시도해주세요.");
			}
		});
	}
	function loanPro(){
		var from = $('#from').val();
		var value = $('#value').val();
		var password = $('#password').val();
		var alldata = {'from':from, 'value':value, 'password':password}
		$('#state').html("대출을 신청중입니다.");
		
		$ajax({
			url:"${pageContext.request.contextPath}/loanPro",
			type : "GET",
			data : alldata,
			success : function(data){
				$('#state').html("대출 신청이 완료되었습니다.");
			},
			beforeSend:function(xhr){
	              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	              $('.wrap-loading').removeClass('display-none');
	        },
			error : function(){
				alert("지갑파일과 비밀번호를 확인해주세요.");
				$('#state').html("다시 시도해주세요.");
			}
		});
	}
</script>
</html>