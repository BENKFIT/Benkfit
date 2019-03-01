<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:set var="path" value="/benkfit/resources" />

<!-- JQuery -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="//code.jquery.com/jquery-latest.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="${path}/css/bootstrap.css" />
<link rel="stylesheet" href="${path}/css/component.css" />
<link rel="stylesheet" href="${path}/css/demo.css" />
<link rel="stylesheet" href="${path}/css/footer.css" />
<link rel="stylesheet" href="${path}/css/search.css" />
<link rel="stylesheet" href="${path}/css/table.css" />
<link rel="stylesheet" href="${path}/css/table2.css" />
<link rel="stylesheet" href="${path}/css/top.css" />
<link rel="stylesheet" href="${path}/css/TOP2.css" />
<link rel="stylesheet" href="${path}/css/mypage_kay.css" />

<!-- JS -->
<script type="text/javascript" src="${path}/js/classie.js"></script>
<script type="text/javascript" src="${path}/js/main.js"></script>
<script type="text/javascript" src="${path}/js/modernizr-custom.js"></script>
<script type="text/javascript" src="${path}/js/jquery.qrcode.js"></script>
<script type="text/javascript" src="${path}/js/qrcode.js"></script>
<script type="text/javascript" src="${path}/js/classie.js"></script>
<!-- 사이드메뉴 -->
<script type="text/javascript" src="${path}/js/main.js"></script>
<!-- 사이드메뉴 -->
<script type="text/javascript" src="${path}/js/modernizr-custom.js"></script>
<!-- 사이드메뉴 -->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- qr코드 -->
<script type="text/javascript" src="${path}/js/jquery.qrcode.js"></script>
<!-- qr코드 -->
<script type="text/javascript" src="${path}/js/qrcode.js"></script>
<!-- qr코드 -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script type="text/javascript" src="${path}/js/script_kay.js"></script>
<!-- kay 스크립트 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- 추가(alert) -->
<script type="text/javascript" src="${path}/js/download.js"></script>
<!-- qr다운, -->
<script type="text/javascript" src="${path}/js/request.js"></script>
<!-- qr다운, -->
<script type="text/javascript" src="${path}/js/request2.js"></script>
<!-- qr다운, -->
<script type="text/javascript" src="${path}/js/classie.js"></script><!-- 사이드메뉴 -->
<script type="text/javascript" src="${path}/js/main.js"></script><!-- 사이드메뉴 -->
<script type="text/javascript" src="${path}/js/modernizr-custom.js"></script><!-- 사이드메뉴 -->
<script type="text/javascript" src="${path}/js/jquery.qrcode.js"></script><!-- qr코드 -->
<script type="text/javascript" src="${path}/js/qrcode.js"></script><!-- qr코드 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script type="text/javascript" src="${path}/js/script_kay.js"></script><!-- kay 스크립트 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script><!-- 추가(alert) -->
<script type="text/javascript" src="${path}/js/download.js"></script><!-- qr다운, -->
<script type="text/javascript" src="${path}/js/request.js"></script><!-- qr다운, -->
<script type="text/javascript" src="${path}/js/request2.js"></script><!-- qr다운, -->

<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- Form, Table, Button -->

 <!-- CSS-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="msapplication-tap-highlight" content="no">
<meta name="description" content="Implements Google's Material Design in Bootstrap.">

<link href="/benkfit/resources/assets/css/exentriq-bootstrap-material-ui.min.css?v=0.4.5" rel="stylesheet">
<link href="/benkfit/resources/assets/css/doc.css?v=0.4.5" rel="stylesheet">
    
<script src="/benkfit/resources/assets/js/vendor/jquery/dist/jquery.min.js?v=2.1.4"></script>
<script src="/benkfit/resources/assets/js/vendor/moment/min/moment.min.js?v=2.13.0"></script>
<script src="/benkfit/resources/assets/js/vendor/jquery-timeago/jquery.timeago.js?v=1.4.3"></script>
<script src="/benkfit/resources/assets/js/exentriq-bootstrap-material-ui.min.js?v=0.4.5"></script>

<script src="/benkfit/resources/assets/js/tp/tp-color.html" type="riot/tag"></script>
<script src="/benkfit/resources/assets/js/vendor/riot/riot+compiler.min.js?v=2.3.0"></script>

<script src="https://unpkg.com/lodash@4.16.0"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://unpkg.com/vue@2.5.21/dist/vue.js"></script>

<script src="/benkfit/resources/assets/js/doc.js?v=0.4.5"></script>
<script src="/benkfit/resources/assets/js/ctrl/ctrl-color.js"></script>
<script src="/benkfit/resources/assets/js/vue/collapsible.js"></script>
<script src="/benkfit/resources/assets/js/vue/dropdown.js"></script>
<script src="/benkfit/resources/assets/js/vue/tabs.js"></script>

<!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
<script>
    (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
    function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
    e=o.createElement(i);r=o.getElementsByTagName(i)[0];
    e.src='//www.google-analytics.com/analytics.js';
    r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
    ga('create','UA-XXXXX-X','auto');ga('send','pageview');
</script>


