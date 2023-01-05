<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
		<meta name="format-detection" content="telephone=no">
		<link rel="icon" type="image/x-icon" href="/images/biz/DATA.ico"> 
		<title>공공데이터포털</title>

		
 
<!-- css -->
<link rel="stylesheet" href="/css/biz/cmm/tcs/import.css" media="all">
<link rel="stylesheet" href="/css/app.css?t=20230105_1853" media="all">

<!-- js -->
<script src="/js/address/jquery-1.12.4.js"></script>
<script src="/js/biz/cmm/tcs/jquery-ui.1.12.1.js"></script>
<script src="/js/biz/cmm/tcs/jquery.easing.1.3.js"></script>
<script src="/js/biz/cmm/tcs/tooltipster.bundle.js"></script>
<script src="/js/biz/cmm/tcs/jquery.modal.js"></script>
<script src="/js/biz/cmm/tcs/dayjs.min.js"></script>
<script src="/js/biz/cmm/tcs/ui.common.js"></script>
<script src="/js/biz/cmm/tcs/swiper.min.js"></script>
	
	<!-- UI/UX팀 작업결과물 -->
		 
 
<!-- js -->
<script type="text/javascript" src="/js/biz/cmm/cmm/jquery.form.min.js"></script>					<!-- JQUERY form -->
<script type="text/javascript" src="/js/biz/cmm/cmm/placeholders.jquery.min.js"></script>			<!-- placeholder-->
<script type="text/javascript" src="/js/biz/cmm/cmm/script_codeSetting.js"></script>				<!-- 공통js : 공통코드 selectbox 세팅 -->
<script type="text/javascript" src="/js/biz/cmm/cmm/script_cmmFunction.js"></script>				<!-- 공통js : 공통 기능 -->
<script type="text/javascript" src="/js/biz/cmm/cmm/script_stringUtil.js"></script>					<!-- 공통js : 공통 문자열처리 -->
<script type="text/javascript" src="/js/biz/cmm/cmm/script_numberUtil.js"></script>					<!-- 공통js : 공통 숫자처리 -->
<script type="text/javascript" src="/js/biz/cmm/cmm/script_openSourceSetting.js"></script>			<!-- 공통js : 오픈소스 세팅 - -->
<script type="text/javascript" src="/js/biz/cmm/cmm/script_cmmPopup.js"></script>					<!-- 공통js : 공통 팝업 -->
<script type="text/javascript" src="/js/biz/cmm/cmm/moment.js"></script>							<!-- 공통js : 날짜 -->

<script type="text/javascript" src="/js/biz/cmm/cmm/loading.js"></script>			             	<!-- 임시 스크립트 : 로딩바 -->
<script type="text/javascript" src="/js/biz/cmm/cmm/underscore.js"></script>						<!-- 임시 스크립트 : 언더스코어 -->

<!-- css -->
<link rel="stylesheet" type="text/css" href="/css/biz/cmm/cmm/style_cmmCustom.css">   				<!-- 개발팀 공통 css  -->

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> 									<!-- 공통js : 카카오 SDK  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.0/clipboard.min.js"></script>  <!-- 공통js : copyJS  -->
<!-- Fine Uploader template w/ customization
  ====================================================================== -->
<script type="text/template" id="qq-template-validation">
        <div class="qq-uploader-selector qq-uploader">
            <div class="qq-total-progress-bar-container-selector qq-total-progress-bar-container">
                <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-total-progress-bar-selector qq-progress-bar qq-total-progress-bar"></div>
            </div>
            <div class="qq-upload-button-selector qq-upload-button">
                <div>파일 선택</div>
            </div>
            <ul class="qq-upload-list-selector qq-upload-list" aria-live="polite" aria-relevant="additions removals">
                <li>
                    <div class="qq-progress-bar-container-selector">
                        <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-progress-bar-selector qq-progress-bar"></div>
                    </div>
                    <span class="qq-upload-spinner-selector qq-upload-spinner"></span>
                    <img class="qq-thumbnail-selector" qq-max-size="100" qq-server-scale>
                    <span class="qq-upload-file-selector qq-upload-file"></span>
                    <span class="qq-upload-size-selector qq-upload-size"></span>
                    <button type="button" class="qq-btn qq-upload-cancel-selector qq-upload-cancel">[취소]</button>
                    <button type="button" class="qq-btn qq-upload-retry-selector qq-upload-retry">[재시도]</button>
                    <button type="button" class="qq-btn qq-upload-delete-selector qq-upload-delete">[삭제]</button>
                    <span role="status" class="qq-upload-status-text-selector qq-upload-status-text"></span>
                </li>
            </ul>
            <dialog class="qq-alert-dialog-selector">
                <div class="qq-dialog-message-selector"></div>
                <div class="qq-dialog-buttons">
                    <button type="button" class="qq-cancel-button-selector">[닫기]</button>
                </div>
            </dialog>
            <dialog class="qq-confirm-dialog-selector">
                <div class="qq-dialog-message-selector"></div>
                <div class="qq-dialog-buttons">
                    <button type="button" class="qq-cancel-button-selector">[아니오]</button>
                    <button type="button" class="qq-ok-button-selector">[예]</button>
                </div>
            </dialog>

            <dialog class="qq-prompt-dialog-selector">
                <div class="qq-dialog-message-selector"></div>
                <input type="text">
                <div class="qq-dialog-buttons">
                    <button type="button" class="qq-cancel-button-selector">[취소]</button>
                    <button type="button" class="qq-ok-button-selector">[확인]</button>
                </div>
            </dialog>
        </div>
</script>
 <script type="text/javascript">
//  document.domain = "data.go.kr";

	/**
    * document Ready
    */
	$(document).ready(function(){
		$('.date-from:text').each(function () {
			$(this).prop("readonly", "true");
		});
		$('.date-to:text').each(function () {
			$(this).prop("readonly", "true");
		});
		$('.date-picker-select:text').each(function () {
			$(this).prop("readonly", "true");
		});
		
	});
</script>

		<link rel="stylesheet" type="text/css" href="/assets/biz/fine-uploader/fine-uploader.min.css" />
		<script type="text/javascript" src="/assets/biz/fine-uploader/fine-uploader.min.js"></script>
		<script type="text/javascript" src="/js/biz/oml/extensions/ol/v4.6.2-dist/ol-debug.js"></script>
		<script type="text/javascript" src="/js/biz/oml/proj4.js"></script>
		<script type="text/javascript" src="/js/biz/cmm/cmm/html2canvas.min.js"></script>
		<script type="text/javascript" src="/js/biz/cmm/cmm/papaparse.js"></script>

		<script type="text/javascript" src="/js/biz/oml/oml-app.js"></script>
		<script type="text/javascript" src="/js/biz/oml/oml-util.js"></script>
		<script type="text/javascript" src="/js/biz/oml/oml-config.js"></script>
		<script type="text/javascript" src="/js/biz/oml/oml-map.js"></script>
		<script type="text/javascript" src="/js/biz/oml/oml-layer.js"></script>
		<script type="text/javascript" src="/js/biz/oml/oml-app.js"></script>
		<script type="text/javascript" src="/js/biz/oml/oml-symbol.js"></script>
		<script type="text/javascript" src="/js/biz/oml/oml-draw.js"></script>
		<script type="text/javascript" src="/js/biz/oml/oml-measure.js"></script>
		<script type="text/javascript" src="/js/biz/oml/oml-write.js"></script>
		<script type="text/javascript" src="/js/biz/oml/oml-print.js"></script>
		<script type="text/javascript" src="/js/biz/oml/oml-swipe.js"></script>
		<script type="text/javascript" src="/js/biz/oml/oml-highlight.js"></script>
		<script type="text/javascript" src="/js/biz/oml/oml-select.js"></script>
		<script type="text/javascript" src="/js/biz/oml/oml-tooltip.js"></script>
		<script type="text/javascript" src="/js/biz/oml/oml-graphic.js"></script>
		<script type="text/javascript" src="/js/biz/oml/oml-file.js"></script>
		<script type="text/javascript" src="/js/biz/oml/oml-geocoording.js"></script>
		<script type="text/javascript" src="/js/biz/oml/oml-edit.js"></script>
		<script type="text/javascript" src="/js/biz/oml/oml-analysis.js"></script>


	</head>
	






 

<style>
	
	
	#header {position:relative;z-index:100;height: 160px;color:#fff;background-color:#0b70b9;}

	#header h1.logo {position:absolute;left:50%; top:58px; width:168px; height: 27px; margin:40px 0 0 -600px;padding: 0;}

	#header .gov-info {display: flex; margin: 0 auto; vertical-align: bottom; padding: 18px 0 0px 11px; box-sizing:border-box; max-width: 1200px; height: 64px;}
	#header .gov-info > ul {margin: 15px 0 0 0;}
	#header .gov-info > ul img { vertical-align: middle; margin-right: 10px;}
	#header .gov-info .gov-search {text-align: right;width: 400px;height: 40px;margin: 0px 0 0 auto;display: flex;}
	#header .gov-info .input-text {width:400px; height: 100%;}
	#header .gov-info .btn-search {overflow:hidden; display:block; right:0; top:0; width:40px; height:100%; text-indent:-9999px; background:#18a9ec url('/images/biz/main/btn-main-search2.png') no-repeat center;}
	#header .gov-info .gov-search .atcmp_wrap {position:absolute; text-align: left; top:60px; z-index:2; width:400px; background-color:#fff; color:#333; border-top:1px solid #396fe1;}

	#header .header-wrap {width:100%; height:100%; padding: 16px 0 0 0;}
	#header .header-wrap .util {position:absolute; left:50%; top:0; width:600px; margin: 67px 0 0 0; text-align:right; line-height:1.1;}

	#gnb ul.gnb-pc .depth2 {display:none; position:absolute;left:0; top: 160px;width:100%;margin:0;padding:0;background-color:#0b70b9;}
	@media all and (max-width:1024px){

		.inner-wrap {width:100%; max-width:100%;}

		#header {position:fixed; left:0; top:0; z-index:10; width:100%; height:86px;}

		#header h1.logo {position:absolute; left:20px; top:19px; width:116px; height:19px; margin:0; padding:0; margin-top: 30px;}
		#header h1.logo a {background-size:100% auto;}

		#header .btn-open-gnb {overflow:hidden; display:block; position:absolute; right:20px; top:20px; width:20px; height:17px; text-indent:-9999px; background:url('/images/biz/common/btn/btn-open-gnb.png') no-repeat 0 0; background-size:20px 17px; margin-top: 30px;}

		#header .header-wrap {float:none; display:block; overflow:hidden; overflow-y:auto; position:fixed; left:100%; top:0; width:100%; height:100%; padding:56px 0 0 0; background-color:#0b70b9; transition:left 0.1s ease-in-out;}
		#header .header-wrap.on {left:0;}
		#header .header-wrap .logo {position:absolute; left:20px; top:19px; width:116px; height:19px; margin:0; padding:0;}
		#header .header-wrap .logo a {overflow:hidden; display:block; width:100%; height:100%; text-indent:-9999px; background:url('/images/biz/common/logo/logo-top.png') no-repeat 0 0 / 100% auto;}

		#header .header-wrap .util {overflow:hidden; position:static; left:inherit; top:inherit; width:100%; height:auto; padding:20px 0 20px 0; font-size:1em; line-height:1.1; text-align:center; border:1px solid #2886c9; border-width:1px 0;}

		#header .header-wrap .util .login {float:none; display:inline-block;}
		#header .header-wrap .util .login a {float:none; margin:0 10px;}
		#header .header-wrap .util .login a:first-of-type {margin-left:0;}
		#header .header-wrap .util .login .before {float:none; display:inline-block;}
		#header .header-wrap .util .login .after {float:none;}
		#header .header-wrap .util .link {float:none; margin:0 0 0 10px; display:inline-block;}
		#header .header-wrap .util .link a {float:none; margin:0;}
		#header .header-wrap .util .link a:first-of-type {margin-left:0;}

		#header .header-wrap .btn-close-gnb {overflow:hidden; display:block; position:absolute; right:20px; top:20px; width:16px; height:16px; text-indent:-9999px; background:url('/images/biz/common/btn/btn-close-gnb.png') no-repeat 0 0; background-size:16px 16px;}

		#header .gov-info { margin-left: 15px;  display: inline-block; vertical-align: middle; margin-right: 10px; padding: 9px 0 3px 0;  margin-bottom: 20px; box-sizing:border-box; text-align:left; font-size: 12px;}
		#header .gov-info img { vertical-align: bottom; margin-right: 10px;}
		#header .gov-info .gov-search {width: 45%; height: 30px; margin: 5px 0px 0px 130px;display: flex; position: absolute;}
		#header .gov-info .input-text {width: 100%; height: 100%; font-size:10px;}
		#header .gov-info .btn-search {overflow:hidden; display:block; right:0; top:0; width:30px; height:100%; text-indent:-9999px; background:#18a9ec url('/images/biz/main/btn-main-search2.png') no-repeat center;}
		#header .gov-info .gov-search .atcmp_wrap {position:absolute; text-align: left; top:86px; z-index:2; width:150px; background-color:#18a9ec; color:#fff; border-top:1px solid #396fe1;}

		/* gnb */
		#gnb {float:none; width:100%;}
		#gnb ul.gnb-pc {display:none;}

		#gnb ul.gnb-mb {display:block;}
		#gnb ul.gnb-mb > li {position:relative; margin:0; padding:0; border-bottom:1px solid #2886c9;}
		#gnb ul.gnb-mb > li:first-of-type {margin:0;}
		#gnb ul.gnb-mb > li > a {display:block; position:relative; height:56px; padding:0 20px; font-size:1.2857em; line-height:55px; font-weight:700; letter-spacing:-0.05em;}
		#gnb ul.gnb-mb > li > a:after {content:''; display:block; position:absolute; right:20px; top:50%; width:14px; height:8px; margin:-4px 0 0 0; padding:0; background:url('/images/biz/common/bg/bg-gnb-arr-mb.png') no-repeat 0 0 / 100% auto;}
		#gnb ul.gnb-mb > li > a:hover {color:#fff584; text-decoration:none;}
		#gnb ul.gnb-mb > li > a:focus {text-decoration:none;}
		#gnb ul.gnb-mb > li.active > a {color:#fff584;}
		#gnb ul.gnb-mb > li.active > a:after {transform:rotate(180deg);}
		#gnb ul.gnb-mb > li.active .depth2 {display:none;}

		#gnb ul.gnb-mb .depth2 {display:none; width:100%; margin:0; padding:0 0 20px 0;}
		#gnb ul.gnb-mb .depth2 a {color:#fff;}
		#gnb ul.gnb-mb .depth2 a:hover {color:#fff584; text-decoration:none;}
		#gnb ul.gnb-mb .depth2 a:focus {text-decoration:none;}
		#gnb ul.gnb-mb .depth2 ul {padding-left:38px;}
		#gnb ul.gnb-mb .depth2 ul li {margin-top:4px;}
		#gnb ul.gnb-mb .depth2 ul li:first-child {margin-top:0;}
		#gnb ul.gnb-mb .depth2 ul li a {font-size:1.0714em; letter-spacing:-0.05em;}
		#gnb ul.gnb-mb .depth2 ul li.active a {color:#fff584;}
		#gnb ul.gnb-mb .depth2 ul li:last-child .depth3 {padding-bottom:0;}

		#gnb ul.gnb-mb .depth3 {width:100%; margin:0; padding:5px 0 15px 0;}
		#gnb ul.gnb-mb .depth3 a {color:#fff;}
		#gnb ul.gnb-mb .depth3 a:hover {color:#fff584; text-decoration:none;}
		#gnb ul.gnb-mb .depth3 a:focus {text-decoration:none;}
		#gnb ul.gnb-mb .depth3 ul {padding-left:18px;}
		#gnb ul.gnb-mb .depth3 ul li {margin-top:4px;}
		#gnb ul.gnb-mb .depth3 ul li:first-child {margin-top:0;}
		#gnb ul.gnb-mb .depth3 ul li a {font-size:1em; letter-spacing:-0.05em;}
		#gnb ul.gnb-mb .depth3 ul li.active a {color:#fff584;}
	}
	@media all and (max-width:355px){
		#header .gov-info .gov-search {display:none;}
	}
	
	
	
</style>

<script type="text/javascript">

	/**
	 * document Ready
	 */
	$(document).ready(function(){

		//현재메뉴 표시
		var currentMainMenuId = fn_getCookie("currentMainMenuId");

		if(!fn_empty(currentMainMenuId)){
			$("#"+currentMainMenuId).addClass("active");
			$("#"+currentMainMenuId).parent().parent().parent().parent().addClass("active");
		}else{
			$("#gnb").find(".active").each(function(idx, entry){
				$(this).removeClass("active");
			});
		}

		//하위메뉴 없는 경우 불필요한 태그 삭제
		$(".ulLower").each(function(idx, entry){
			if($(this).find("li").length == 0){
				$(this).parent().parent().remove();
			}
		});

		//마이페이지는 모바일 시 depth3 스타일 지정되므로 불필요한 태그 삭제는 별도로 동작
		$(".depth2 > ul > .depth3 > ul").each(function(idx, entry){
			if($(this).find("li").length == 0){
				$(this).parent().remove();
			}
		});

	});

</script>


<script type="text/javascript">

	/**
	 * 페이지 이동
	 * @param  : menuId - 메뉴 ID
	 * @param  : menuUrl - 이동 menuUrl
	 * @return : 없음
	 */
	function fn_movePage(obj, menuId, menuUrl){

		if(fn_empty(menuUrl)) return;

		//상위메뉴가 아닌 경우만 URL 호출
		if($(obj).prop("class") != "upperMenu"){
			if(menuUrl == "/"){
				alert("서비스 준비중입니다.");
				return;
			}

			fn_setCookie("currentMainMenuId", menuId, 1);
			window.location.href = menuUrl;
			//상위메뉴면서 하위메뉴가 없는 경우, URL 호출
		}else{
			if($(obj).next().length == 0){
				if(menuUrl == "/"){
					alert("서비스 준비중입니다.");
					return;
				}else{
					fn_setCookie("currentMainMenuId", menuId, 1);
					document.location.href = menuUrl;
				}

			}
		}
	}

	/*
    * 검색
    */
	function fn_searchDataList(){

		if(!checkCloseRoundBrackets($('#keyword').val())) {
			alert('괄호를 닫거나, 제거한 후 재검색하여 주시기 바랍니다');
			return false;
		}

		if(checkSpecial($('#keyword').val())) {
			alert('해당 특수문자는 검색에서 사용될 수 없습니다. 특수문자를 제외하고 재검색하여 주시기 바랍니다.');
			return false;
		}

		$('#searchHeaderFrm').attr("onSubmit", "");
		$('#searchHeaderFrm').submit();
	}

	/*
	* 검색 텍스트 영역 키다운 이벤트
	*/
	function fn_searchKeyup(target) {
		var searchKeyword = target.value;

		if (event.keyCode === 13) {
			fn_searchDataList();
			return;
		}

		fn_autoComplete(searchKeyword);
	}

	/*
	* 자동완성
	*/
	function fn_autoComplete(searchKeyword) {

		var dataObj = {
			keyword	: searchKeyword
		}

		$.ajax({
			"url"		: "/tcs/dss/selectAutoComplete.do",
			"data"		: dataObj,

			success		: function(data) {
				var dataArr = JSON.parse(data);
				var $autoCompleteDiv = $("#autoCompleteDiv");

				if (dataArr.length > 0) {
					$autoCompleteDiv.show();
					$autoCompleteDiv.html("");

					for (var i = 0; i < dataArr.length; i++) {
						var tempObj = dataArr[i];

						$autoCompleteDiv.append("<p onclick='fn_autoCompleteClick(\"" + tempObj.text + "\")'>" + tempObj.text + "</p>");
					}

				} else {
					$autoCompleteDiv.hide();
				}
			}
		})
	}

	/*
	* 자동완성 텍스트 클릭시 호출 메서드
	*/
	function fn_autoCompleteClick(keyword) {
		$("#keyword").val(keyword);

		fn_searchData();
	}


	// 특수문자 체크
	function checkSpecial(str) {
		const regExp = /[!?@#$%^&*:;-=~{}<>\[\]\|\\\"\'\,\.\/\`\₩]/g;
		return regExp.test(str);
	}

	// 소괄호 닫힘 체크
	function checkCloseRoundBrackets(str) {
		//결과 초기값 true
		var result = true;
		//괄호만 넣을 빈 배열 생성
		var s_arr =[];
		var map = {
			'(':')',
			'[':']',
			'{':'}'
		}
		for (var i = 0; i < str.length; i++) {
			//문자열 str 의 ( 만 추출해서 배열에 담는다.
			if(str[i] === "(" || str[i] === "[" || str[i] === "{") {
				s_arr.push(str[i]);
			}
			else if(str[i]===")" || str[i]==="]" || str[i]==="}") {
				//닫는 괄호가 나오면 여는괄호 모아둔데 가장 바깥꺼를 s_key로 담고 지금 str[i] 와 비교
				var s_key = s_arr.pop();
				if(str[i] !== map[s_key]) {
					return false;
				}
			}
		}

		//남은 (가 있어도 false
		if(s_arr.length !== 0) {
			result = false;
		}

		return result;
	}
</script>


			<div class="container full-map" >
				<!-- 본문 상단 네비게이터 : 메인화면에서 표출 X-->
				






 <script type="text/javascript">
	
	/**
	 * document Ready
	 */
	$(document).ready(function(){
		
		//현재메뉴 표시
		var currentMenuId = fn_getCookie("currentMainMenuId");
		if(!fn_empty(currentMenuId)){
			//상위메뉴명
			$(".location > .locationDepth1").text($('#gnb > ul > li.active > a').text());
			//소메뉴명
			// $(".location > .locationDepth2").text($('#gnb > ul > li.active > .depth2').find('.active').text());
			$(".location > .locationDepth2").append($('#gnb > ul > li.active > .depth2').find('.active').html());
			$(".location > .locationDepth1").show();
			$(".location > .locationDepth2").show();
		} else {
			$(".location").hide();
		}
		
	});
 
</script>
			<div class="location">
				<span><a href="/index.do">홈</a></span>
				<span class="locationDepth1"><a href=""></a></span>
				<strong class="locationDepth2"></strong>
			</div>

				<div class='content-layout'>

					<div id="contents">

						<!-- 본문 -->
						






 
<script type="text/javascript">
var mapContainer = document.getElementById('map'),
mapOption = { 
    center: new kakao.maps.LatLng(37.4785584,126.8787565),	// 지도의 중심 좌표(임의 설정)
    level: 3// 지도의 확대 레벨(임의 설정)
};

var map = new kakao.maps.Map(mapContainer, mapOption);
//위치 정보 가져오기
var lat;
var lon;
var options ={
	enableHighAccuracy:true,
	timeout: 10000,//5000
	maximumAge:0
};


var vworldCrtfcKey = "";

$(function(){

	 $(this).prop("title", $("#contents").find("h2").text()+" | 공공데이터포털");
	 $('.container').attr('class','container full-map');

	init("fac_map");


	$(".map-util-view [type='button']").click(function(evt) {
		var mapEvent = $(this).find('i').attr('class');
		var imgOn = $(this).attr('class');
		setMapEvent(mapEvent,imgOn);
		$(this).addClass('on').siblings().removeClass('on');
	});

	//사용자 위치 이동
	$(document).on('click', '.btn-location-now', function(evt){
		$(".scroll-list ul").empty();
		$(".service-choice ul").empty();
		window.navigator.geolocation.getCurrentPosition(function(position) {
			setUserLocale(position.coords.latitude, position.coords.longitude);
		});
	});

	//시도 콤보박스 이벤트
	$("#sido").change(function(){
		$(".scroll-list ul").empty();
		$(".service-choice ul").empty();
		var val = this.value;
		if(val!="") {
			setCombo("sigungu" , "/tcs/lms/liv/selectSigunguCodeList.do", $("#sido").val()).then(function(){
				getDataList();
			});
		}else{
			//select box 기본 값 남기고 삭제 하기
			$("select[name='sigungu'] option").not("[value='']").remove();
			reset();
			setHome();
		}
	});

	//시군구 콤보박스 이벤트
	$("#sigungu").change(function(){
		$(".scroll-list ul").empty();
		$(".service-choice ul").empty();
		getDataList();
	});


	var selectedLayer;
	$(document).on('change', '.position-service-list li [type="checkbox"]', function(evt){
		removeOverlay();
		var layerId = $(this).parent().val();
		selectedLayer = $(this).val();
		var checked = $(this).is(":checked");
		$leng = $(this).closest('.position-service-list').find('[type="checkbox"]:checked').length;
		var idx = $(this).parent().val();
		var layerKorNm = $('label[for="position_'+ idx +'"]').text();
		var iconNm = $('label[for="position_'+ idx +'"] i  img').attr('src');

		if ( $leng > 3 ){
			alert("위치정보 표시는 최대 3개까지 가능합니다.");
			$(this).prop('checked', false);
			return false;
		}

		if(checked){
			drawLayerNm(layerKorNm, idx);
			addLayer(selectedLayer,idx , iconNm);
		}
		else {
			layerInit();
			delLayerNm(idx);
			selectedLayer = $(this).val();
			oml.layer.removeLayer(selectedLayer+"_vector");	 // vector
		}
	});

	$(document).on('click', '.service-choice ul li .btn', function(evt){
		removeOverlay();
		var idx = $(this).attr('id').substring(4);
		var selected = $('label[for="position_'+ idx +'"]').parent().find('[type="checkbox"]');
		selectedLayer = selected.parent().find('[type="checkbox"]').val();
		getFeatureList(selectedLayer);
	});

	$(document).on('click', '.service-choice ul li .btn-del', function(evt){
		removeOverlay();
		layerInit();
		var idx = $(this).parent().find('.btn').attr('id').substring(4);
		var selected = $('label[for="position_'+ idx +'"]').parent().find('[type="checkbox"]');
		selectedLayer = selected.parent().find('[type="checkbox"]').val();
		selected.prop('checked', false);
		$(this).parent().remove();
		$(".scroll-list ul").empty();
		oml.layer.removeLayer(selectedLayer+"_vector");
	});

	$(document).on('click', '.layer-map-attr .wrap .btn-layer-map-close', function(evt){
		removeOverlay();
	});

	$('.map-util-btn').click(function(evt) {
	});

	$("#fac_map").on('click', function(evt) {
		selectFeature(selectedLayer);
	});

	$(".csv_download").on('click', function(evt) {
 		downloadCSV(selectedLayer);
	});
})


</script>
<h2>지도 영역입니다</h2>
<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
</hr></hr></hr>
<h2>여기까지 지도영역 </h2>
<!-- portal-map-area -->
<div class="portal-map-area">
	<p class="tit-map-area">위치정보시각화</p>
	<button type="button" class="btn-toggle-info">위치정보 시각화 크게 보기</button>

	<!-- left-section -->
	<div class="left-section">

		<!-- section -->
		<div class="section">
			<p class="tit">행정구역</p>

			<div class="portal-map-detail clearfix">
				<div class="float-l w49pc">
					<select title="행정구역 시/도 선택" class="input-text" id="sido">
					</select>
				</div>
				<div class="float-r w49pc">
					<select title="행정구역 시/군/구 선택" class="input-text" id="sigungu">
					</select>
				</div>
			</div>
		</div>
		<!--// section -->

		<!-- section -->
		<div class="section">
			<div class="tit-group">
				<p class="tit">위치정보 서비스 목록</p>
			</div>

			<!-- 토픽 -->
			<div class="portal-map-detail position">
				<ul class="position-service-list"></ul>
			</div>
			<!--// 토픽 -->
		</div>
		<!--// section -->

		<!-- section -->
		<div class="section">
			<div class="tit-group">
				<p class="tit">속성 목록</p>

				<div class="right">
					<button type="button" id="csv_download_pc" class="button white h32 csv_download" title="파일 다운로드"><i class="iconset ico-down black"></i>다운로드</button>
				</div>
			</div>

			<div class="portal-map-detail attr">
				<!-- 2020-02-11 위치변경 -->
				<div class="service-choice" style="height:72px;">
					<ul></ul>
				</div>
				<!-- // 2020-02-11 위치변경 -->
				<div class="scroll-list">
					<ul style="height: 170px;"></ul>
				</div>
			</div>
		</div>
		<!--// section -->

	</div>

	<!-- 위에 이벤트 있음 -->
	<div class="map-util-view">
		<button type="button" class="btn on">
			<i class="iconset ico-map-util-view-marker"></i>
			<strong>마커</strong>
		</button>

		<button type="button" class="btn">
			<i class="iconset ico-map-util-view-cluster"></i>
			<strong>클러스터</strong>
		</button>

		<button type="button" class="btn">
			<i class="iconset ico-map-util-view-hitmap"></i>
			<strong>히트맵</strong>
		</button>
	</div>

	<!-- 현재위치 버튼 -->
	<div class="map-util-now">
		<button type="button" class="btn-location-now">현재위치</button>
	</div>
	<div class="map-section" id="fac_map"></div>
</div>


					</div>
				</div>
			</div>

		</div>
	</body>
</html>
 --%>