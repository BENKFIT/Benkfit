<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>qrCode</title>
</head>
<body>
<%@ include file="../../Template/top.jsp"%>
	<div class="wrapper">
		<p style="float:right;font-size:12px;">마이페이지>설정>QRcode발급</p>
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
                    	<input type="button" id="createBtn" class="btn btn-success "value="생성">
						<input type="button" id="saveBtn" class="btn btn-primary "value="저장"> 
						<input type="hidden" name="hiddenId" value="0">
						<input type="submit" name="OK" class="btn btn-success " value="목록"
							onclick="qrOk();">
					</form>
                    </div>
                </div>
            </div>
        </div>			
		</div> 
	</div>
<script>
//qr코드 저장/
$('#saveBtn').click(function() {
	var x = new XMLHttpRequest();
	var qrurl = googleQRUrl + "&ID="+ m_strid +"&PWD="+m_pwd + "&NAME="+ m_name
	+ "&HP="+ m_phone +'&choe=UTF-8'; 
	swal("qr발급완료","OK","success");
	x.open("GET", qrurl , true);
	x.responseType = 'blob';
	x.onload=function(e){download(x.response, "qrcode.png", "image/png"); 
	}
	x.send();
});
</script>
<%@ include file="../../Template/footer.jsp"%>
</body>
</html>