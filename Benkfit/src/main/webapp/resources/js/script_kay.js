/**
 * validation check;
 */
/*page 이동*/
function move(str){
	if(str==1){//계좌관리-예금-조회
		document.mypage.action="sel_account";
	}else if(str==2){//계좌관리-예금-해지
		document.mypage.action="delsel_account";
	}else if(str==3){//계좌관리-대출-조회
		document.mypage.action="loan_account";
	}else if(str==4){//계좌관리-대출-상환
		document.mypage.action="delloan_account";
	}else if(str==5){//이체한도조회
		document.mypage.action="limit_sel";
	}else if(str==6){//알림
		document.mypage.action="#";
	}else if(str==7){//qr코드 발급
		document.mypage.action="qrcode";
	}else if(str==8){//내정보- 변경
		document.mypage.action="myinfoPw";
	}else if(str==9){//서류관리-등록
		document.mypage.action="#";
	}else if(str==10){//서류관리-삭제
		document.mypage.action="#";
	}else if(str==11){//서류관리-조회
		document.mypage.action="document";
	}else if(str==12){//회원탈퇴
		document.mypage.action="deluserPw";
	} 
}
/*마이페이지 - tab*/
$(document).ready(function() {
	//When page loads...
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content

	//On Click Event
	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content

		var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active ID content
		return false;
	});
});

/*QR코드발급*/
$(document).ready(function() {
	$('#qrcode').hide();
$('#createBtn').click(function() {
	$('#qrcode').show();
	// input에 입력하는 값들을 뽑아서 변수에 저장
	var m_strid = $('#m_strid').val();
	var m_name = $('#m_name').val();
	var m_phone = $('#m_phone').val();
	
	// encodeURIComponent로 인코딩 합시당. 
	m_strid = encodeURIComponent(m_strid);
	m_name = encodeURIComponent(m_name);
	m_phone = encodeURIComponent(m_phone);
	
	// 뒤에 코드가 길어지니까 그냥 한번 변수에 주소를 저장
	googleQRUrl = "https://chart.googleapis.com/chart?chs=177x177&cht=qr&chl=";
	
	// 이미지가 나타날 영역에 원하는 내용을 넣은 QR code의 이미지를 출력합니다.
	// 여기 주소 부분을 변경해주면 원하는 값을 언제든 맘대로
	$('#qrcode').attr('src', googleQRUrl + "&ID="+ m_strid + "&NAME="+ m_name
						+ "&HP="+ m_phone	+ '&choe=UTF-8');
});
});

/*드래그,마우스오른쪽 금지.*/
$(document).ready(function() {
    $(document).bind("contextmenu", function(e){
        swal("마우스 오른쪽 클릭금지!!","Don't","error");
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
