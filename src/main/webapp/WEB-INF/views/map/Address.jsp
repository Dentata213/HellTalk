<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<!DOCTYPE html>
	
	<html>
	<head>
	    <meta charset="utf-8">
	    <title>헤엘토옥</title>
	    <style>
	.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
	.map_wrap {position:relative;width:100%;height:350px;}
	#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
	#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
	#category li.on {background: #eee;}
	#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
	#category li:last-child{margin-right:0;border-right:0;}
	#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
	#category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
	#category li .bank {background-position: -10px 0;}
	#category li .mart {background-position: -10px -36px;}
	#category li .pharmacy {background-position: -10px -72px;}
	#category li .oil {background-position: -10px -108px;}
	#category li .cafe {background-position: -10px -144px;}
	#category li .store {background-position: -10px -180px;}
	#category li.on .category_bg {background-position-x:-46px;}
	.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
	.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
	.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
	.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
	.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
	.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
	.placeinfo .tel {color:#0f7833;}
	.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
	</style>
	
	
	</head>
	<body>
	<h2><i>헤에에엘토오오오오오오오오오오토옥</i></h2>
	<div class="map_wrap">
	    <div id="map" style="width:100%;height:90vh;position:relative;overflow:hidden;"></div>
	    <ul id="category">
	        <li id="CT1" data-order="0"> 
	            <span class="category_bg health"></span>
	          	헬스장
	        </li>       
	        <li id="PM9" data-order="1"> 
	            <span class="category_bg pharmacy"></span>
	            약국
	        </li>  
	        <li id="FD6" data-order="2"> 
	            <span class="category_bg oil"></span>
	            음식점
	        </li>  
	        <li id="CE7" data-order="3"> 
	            <span class="category_bg cafe"></span>
	            카페
	        </li>  
	        <li id="CS2" data-order="4"> 
	            <span class="category_bg store"></span>
	            편의점
	        </li>
	        <li id="user" data-order="5"> 
	            <span class="category_bg user"></span>
	            사용자
	        </li>      
	    </ul>
	</div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2d6166a1b5a525187fa1a868dbaf55cb&libraries=services,clusterer,drawing"></script> 
	<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>


	
	
	
	
	
	
	// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
	var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
	    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
	    markers = [], // 마커를 담을 배열입니다
	    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
	 
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.478673050045316, 126.8789041628882), // 지도의 중심좌표
	        level: 5 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(map); 
	
	// 지도에 idle 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', searchPlaces);
	
	// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
	contentNode.className = 'placeinfo_wrap';
	
	// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
	// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
	addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
	addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);
	
	// 커스텀 오버레이 컨텐츠를 설정합니다
	placeOverlay.setContent(contentNode);  
	
	// 각 카테고리에 클릭 이벤트를 등록합니다
	addCategoryClickEvent();
	
	// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
	function addEventHandle(target, type, callback) {
	    if (target.addEventListener) {
	        target.addEventListener(type, callback);
	    } else {
	        target.attachEvent('on' + type, callback);
	    }
	}
	
	// 카테고리 검색을 요청하는 함수입니다
	function searchPlaces() {
	    if (!currCategory) {
	        return;
	    }
	    
	    // 커스텀 오버레이를 숨깁니다 
	    placeOverlay.setMap(null);
	
	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
	    //ps.keywordSearch('헬스장',placeSearchCB,{useMapBounds:true});
	}
	
	
	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	
	        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
	        displayPlaces(data);
	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
	
	    } else if (status === kakao.maps.services.Status.ERROR) {
	        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
	        
	    }
	}
	
	// 지도에 마커를 표출하는 함수입니다
	function displayPlaces(places) {
	
	    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
	    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
	    var order = document.getElementById(currCategory).getAttribute('data-order');
	
	    
	
	    for ( var i=0; i<places.length; i++ ) {
	
	            // 마커를 생성하고 지도에 표시합니다
	            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);
	
	            // 마커와 검색결과 항목을 클릭 했을 때
	            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
	            (function(marker, place) {
	                kakao.maps.event.addListener(marker, 'click', function() {
	                    displayPlaceInfo(place);
	                });
	            })(marker, places[i]);
	    }
	}
	
	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, order) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });
	
	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	
	    return marker;
	}
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	
	// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
	function displayPlaceInfo (place) {
	    var content = '<div class="placeinfo">' +
	                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   
	
	    if (place.road_address_name) {
	        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
	                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
	    }  else {
	        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
	    }                
	   
	    content += '    <span class="tel">' + place.phone + '</span>' + 
	                '</div>' + 
	                '<div class="after"></div>';
	
	    contentNode.innerHTML = content;
	    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
	    placeOverlay.setMap(map);  
	}
	
	
	// 각 카테고리에 클릭 이벤트를 등록합니다
	function addCategoryClickEvent() {
	    var category = document.getElementById('category'),
	        children = category.children;
	
	    for (var i=0; i<children.length; i++) {
	        children[i].onclick = onClickCategory;
	    }
	}
	
	// 카테고리를 클릭했을 때 호출되는 함수입니다
	function onClickCategory() {
	    var id = this.id,
	        className = this.className;
	
	    placeOverlay.setMap(null);
	
	    if (className === 'on') {
	        currCategory = '';
	        changeCategoryClass();
	        removeMarker();
	    } else {
	        currCategory = id;
	        changeCategoryClass(this);
	        searchPlaces();
	    }
	}
	
	// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
	function changeCategoryClass(el) {
	    var category = document.getElementById('category'),
	        children = category.children,
	        i;
	
	    for ( i=0; i<children.length; i++ ) {
	        children[i].className = '';
	    }
	
	    if (el) {
	        el.className = 'on';
	    } 
	} 
	
	
	
	
	
	// 지도 타입 변경 컨트롤을 생성한다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);	

	// 지도에 확대 축소 컨트롤을 생성한다
	var zoomControl = new kakao.maps.ZoomControl();

	// 지도의 우측에 확대 축소 컨트롤을 추가한다
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	
	</script>
	
	
	
	
	<script>
	
	
	
	
	$.ajax({
    	// url은 본인의 환경에 따라 작성 합니다.
		url : "locationMapList.do",
		data : {},
		success : function(result){
		    var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
		        center : new kakao.maps.LatLng(37.478673050045316, 126.8789041628882), // 지도의 중심좌표 
		        level : 14 // 지도의 확대 레벨 
		    });
		    
		    // 마커 클러스터러를 생성합니다 
		    var clusterer = new kakao.maps.MarkerClusterer({
		        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
		        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
		        minLevel: 10 // 클러스터 할 최소 지도 레벨 
		    });
		 	
		    // 데이터를 가져오기 위해 jQuery를 사용합니다
		    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
		    $.get("", function(data) {
		        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
		        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
		        var markers = $(data.positions).map(function(i, position) {
		            return new kakao.maps.Marker({
		                position : new kakao.maps.LatLng(position.lat, position.lng)
		            });
		        });
		        // 클러스터러에 마커들을 추가합니다
		        clusterer.addMarkers(markers);
		    });
		},
		error : function(){
			//console.log(error);
			console.log("통신--Address--실패");
		}
	})
	
	</script>
	
	
	 
	
	<!--  <script>
	
	//제세동기 관련 script
	
	var xhr = new XMLHttpRequest();
	var url = 'http://apis.data.go.kr/B552657/AEDInfoInqireService/getAedLcinfoInqire'; /*URL*/
	var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'de2553c691645e8735077c1309f5ffc5'; /*Service Key*/
	queryParams += '&' + encodeURIComponent('') + '=' + encodeURIComponent(''); /**/
	xhr.open('GET', url + queryParams);
	xhr.onreadystatechange = function () {
	    if (this.readyState == 4) {
	        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
	    }
	};

	xhr.send('');
	
	</script> -->
	</body>
	</html>
