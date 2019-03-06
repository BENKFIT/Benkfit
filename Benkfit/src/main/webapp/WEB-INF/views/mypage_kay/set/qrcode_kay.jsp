<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title> 설정 > QRcode발급</title>
</head>
<body>
<%@ include file="../../Template/top.jsp"%>
	<div class="wrapper">
		<span class="style">마이페이지>설정>QRcode발급</span>
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
/*QR코드발급*/
$(document).ready(function() {
	$('#qrcode').hide();
	$('#createBtn').click(function() {
		$('#qrcode').show();
		
		// input에 입력하는 값들을 뽑아서 변수에 저장
		var m_strid = $('#m_strid').val();
		var m_name = $('#m_name').val();
		var m_phone = $('#m_phone').val();
		var m_pwd	=$('#m_pwd').val();
		
		// encodeURIComponent로 인코딩 합시당. 
		m_strid = encodeURIComponent(m_strid);
		m_name = encodeURIComponent(m_name);
		m_phone = encodeURIComponent(m_phone);
		m_pwd = encodeURIComponent(m_pwd);
		
		// 뒤에 코드가 길어지니까 그냥 한번 변수에 주소를 저장
		googleQRUrl = "https://chart.googleapis.com/chart?chs=177x177&cht=qr&chl=" ;
		
		// 이미지가 나타날 영역에 원하는 내용을 넣은 QR code의 이미지를 출력합니다.
		// 여기 주소 부분을 변경해주면 원하는 값을 언제든 맘대로
		var qrurl = googleQRUrl + "ID:"+ m_strid +"/PWD:"+m_pwd + "/NAME:"+ m_name
		+ "/HP:"+ m_phone + '&choe=UTF-8'; 
		 $('#qrcode').prop('src', qrurl);
	});
}); 
//qr코드 저장.
$('#saveBtn').click(function() {
	var x = new XMLHttpRequest();
	var qrurl = googleQRUrl + "&ID="+ m_strid +"&PWD="+m_pwd + "&NAME="+ m_name
	+ "&HP="+ m_phone +'&choe=UTF-8'; 
	swal("qr발급완료","OK","success");
	x.open("GET", qrurl , true);
	x.responseType = 'blob';
	x.onload=function(e){download(x.response, "qrcode.png", "image/png" ); }
	x.send();
});
</script>
<%@ include file="../../Template/footer.jsp"%>
</body>
</html>