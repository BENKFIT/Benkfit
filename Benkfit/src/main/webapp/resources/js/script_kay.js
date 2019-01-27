/**
 * validation check;
 */
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
		document.mypage.action="document_kay";
	}else if(str==12){//회원탈퇴
		document.mypage.action="deluserPw";
	} 
}


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