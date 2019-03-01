<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="msapplication-tap-highlight" content="no">
<meta name="description"
	content="Implements Google's Material Design in Bootstrap.">
<title>qrCode</title>
<!-- CSS-->
    <link href="/benkfit/resources/assets/css/exentriq-bootstrap-material-ui.min.css?v=0.4.5" rel="stylesheet">
    <link href="/benkfit/resources/assets/css/doc.css?v=0.4.5" rel="stylesheet">
</head>
<body>
<%@ include file="../../Template/top.jsp"%>
	<div class="wrapper">
		<h5 style="float:right;">마이페이지>설정>QRcode발급</h5>
		<br>
		<hr>
		<div style="margin-left:18%;">
		<div class="col-md-8">
            <div class="row">
                <div class="col-md-12">
                    <div class="eq-ui-form-group eq-ui-input-field">
                        <input id="m_strid" type="text" class="eq-ui-input" value="${qr.c_id}" disabled style="color: #000;">
                        <label for="m_strid">아이디</label>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-8">
            <div class="row">
                <div class="col-md-12">
                    <div class="eq-ui-form-group eq-ui-input-field">
                        <input id="m_name" type="text" class="eq-ui-input"  value="${qr.c_name}" disabled style="color: #000;">
                        <label for="m_name">이름</label>
                    </div>
                </div>
            </div>
        </div>
		 <div class="col-md-8">
            <div class="row">
                <div class="col-md-12">
                    <div class="eq-ui-form-group eq-ui-input-field">
                        <input id="m_phone" type="text" class="eq-ui-input"  value="${qr.c_hp}" disabled style="color: #000;">
                        <label for="m_phone">연락처</label>
                    </div>
                </div>
            </div>
        </div>
        <div>
        	<img id="qrcode" src=" " width="300" >	
			<input type="hidden" value="${qr.c_pwd}" id="m_pwd">
			<input type="hidden" id="m_qr" name="m_qr"  value="${qr.c_qr}">
		</div>	
		 <div class="col-md-8">
            <div class="row">
                <div class="col-md-12">
               	<div style="text-align: center">
               		<form action="qrPro" name="qrCreate" method="post" onsubmit="return create();">
                    	<input type="button" id="createBtn" class="btn btn-success"value="생성">
						<input type="button" id="saveBtn" class="btn btn-success"value="저장"> 
						<input type="hidden" name="hiddenId" value="0">
						<input type="submit" name="OK" class="btn btn-success" value="목록"
							onclick="qrOk();">
					</form>
                    </div>
                </div>
            </div>
        </div>			
		</div> 
	</div>
	<%@ include file="../../common/chatbot.jsp"%>
</body>
<script
	src="/benkfit/resources/assets/js/vendor/jquery/dist/jquery.min.js?v=2.1.4"></script>
<script
	src="/benkfit/resources/assets/js/vendor/moment/min/moment.min.js?v=2.13.0"></script>
<script
	src="/benkfit/resources/assets/js/vendor/jquery-timeago/jquery.timeago.js?v=1.4.3"></script>
<script
	src="/benkfit/resources/assets/js/exentriq-bootstrap-material-ui.min.js?v=0.4.5"></script>

<script src="/benkfit/resources/assets/js/tp/tp-color.html"
	type="riot/tag"></script>
<script
	src="/benkfit/resources/assets/js/vendor/riot/riot+compiler.min.js?v=2.3.0"></script>

<script src="https://unpkg.com/lodash@4.16.0"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://unpkg.com/vue@2.5.21/dist/vue.js"></script>

<script src="/benkfit/resources/assets/js/doc.js?v=0.4.5"></script>
<script src="/benkfit/resources/assets/js/ctrl/ctrl-color.js"></script>
<script src="/benkfit/resources/assets/js/vue/collapsible.js"></script>
<script src="/benkfit/resources/assets/js/vue/dropdown.js"></script>
<script src="/benkfit/resources/assets/js/vue/tabs.js"></script>

</html>