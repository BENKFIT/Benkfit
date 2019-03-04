/**
 * validation check;
 */
/*page 이동*/
function move(str){
	if(str==1){//계좌관리-예금-조회
		document.mypage.action="cheq_account";
	}else if(str==2){//계좌관리-예금-해지
		document.mypage.action="delcheq";
	}else if(str==3){//계좌관리-대출-조회
		document.mypage.action="loan_account";
	}else if(str==4){//계좌관리-대출-상환
		document.mypage.action="delloan_account";
	}else if(str==5){//이체한도조회
		document.mypage.action="limit_sel";
	}else if(str==6){//서류양식 다운로드
		document.mypage.action="down";
	}else if(str==7){//qr코드 발급
		document.mypage.action="qrcode";
	}else if(str==8){//내정보- 변경
		document.mypage.action="myinfoPw";
	}else if(str==9){//서류관리-등록
		document.mypage.action="upload";
	}else if(str==10){//서류관리-삭제
		document.mypage.action="docu_del";
	}else if(str==11){//서류관리-조회
		document.mypage.action="document";
	}else if(str==12){//회원탈퇴
		document.mypage.action="deluserPw";
	}else if(str==13){//계좌관리-적금-조회
		document.mypage.action="sav_account";
	}else if(str==14){//계좌관리-적금-해지
		document.mypage.action="delsav";
	}
}
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

/* 날짜 객체 받아서 문자열로 리턴하는 함수 */
function getDateStr(myDate){
	var yyyy = myDate.getFullYear();
	var mm = ("00"+(myDate.getMonth() + 1)).slice(-2);
	var dd = ("00" +myDate.getDate()).slice(-2);
	return yyyy + '-' + mm + '-' + dd;
}
/* 오늘 날짜를 문자열로 반환 */
function today() {
  var d = new Date();
  return getDateStr(d);
}
/* 오늘로부터 1주일전 날짜 반환 */
function lastWeek() {
  var d = new Date();
  var dayOfMonth = d.getDate();
  d.setDate(dayOfMonth - 7);
  return getDateStr(d);
}
/* 오늘로부터 1주일전 날짜 반환 */
function lastWeek1() {
	  var d = new Date();
	  var dayOfMonth = d.getDate();
	  d.setDate(dayOfMonth - 14);
	  return getDateStr(d);
	}
/* 오늘로부터 1개월전 날짜 반환 */
function lastMonth1() {
  var d = new Date();
  var monthOfYear = d.getMonth();
  d.setMonth(monthOfYear - 1);
  return getDateStr(d);
}
/* 오늘로부터 3개월전 날짜 반환 */
function lastMonth3() {
	  var d = new Date()
	  var monthOfYear = d.getMonth();
	  d.setMonth(monthOfYear - 3);
	  return getDateStr(d);
	}
/* 오늘로부터 6개월전 날짜 반환 */
function lastMonth6() {
	  var d = new Date();
	  var monthOfYear = d.getMonth();
	  d.setMonth(monthOfYear - 6);
	  return getDateStr(d);
}
$(".srch_area :button").click(function(){
  var rname = $(this).attr("id")
  $("#end_date").val(today());
	if(rname == "r_today"){
    $("#start_date").val(today());
  }else if(rname == "r_week") {
  	$("#start_date").val(lastWeek());
  }else if(rname == "r_week1") {
  	$("#start_date").val(lastWeek1());
  }else if(rname == "r_month1") {
  	$("#start_date").val(lastMonth1());
  }else if(rname == "r_month3") {
  	$("#start_date").val(lastMonth3());
  }else{
  	$("#start_date").val(lastMonth6());
  }
})
/*//드래그,마우스오른쪽 금지.
$(document).ready(function() {
    $(document).bind("contextmenu", function(e){
        swal("마우스 오른쪽 클릭금지!!","Don't","error");
        return false;
    });
    $(document).bind("selectstart", function(e){
	  swal("드래그 금지!!","Don't","error");
	        return false;
	 });
    $('img').bind("contextmenu",function(e){ 
        swal("그림에서 오른쪽 마우스 금지"); 
        return false; 
    }); 
    $('img').bind("selectstart",function(e){ 
        swal("그림에서 오른쪽 마우스 금지"); 
        return false;  
    }); 
}); 
document.oncontextmenu=function(){return false;} // 우클릭 방지
document.onselectstart=function(){return false;} // 드래그 방지
document.ondragstart=function(){return true;} // 선택 방지
document.onmousedown=function(){return true;}


*/