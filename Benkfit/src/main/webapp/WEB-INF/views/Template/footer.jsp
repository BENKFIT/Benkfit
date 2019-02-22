<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
<!-- 챗봇 -->
<%@ include file="../common/chatbot.jsp"%>
	<!-- footer  -->
	<footer> 
	<div class="container1">
		<div class="row">
			<div class="btn-group btn-group-justified">
				<div class="btn-group">
					<button type="button" class="btn btn-nav">
						<span class="glyphicon glyphicon-map-marker"></span>
						<p>회사위치</p>
					</button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-nav">
						<span class="glyphicon glyphicon-briefcase"></span>
						<p>회사정보</p>
					</button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-nav">
						<span class="glyphicon glyphicon-earphone"></span>
						<p>고객센터</p>
					</button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-nav">
						<span class="glyphicon glyphicon-question-sign"></span>
						<p>문의사항</p>
					</button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-nav">
						<span class="glyphicon glyphicon-info-sign"></span>
						<p>이용약관</p>
					</button>
				</div>
			</div>
		</div>
	</div>
</footer>
<script>
	var activeEl = 2;
	$(function() {
	    var items = $('.btn-nav');
	    $(items[activeEl]).addClass('active');
	    $('.btn-nav').click(function() {
	        $( items[activeEl] ).removeClass('active');
	        $( this ).addClass('active');
	        activeEl = $('.btn-nav').index( this );
	    });
	});
</script>
</body>
</html>