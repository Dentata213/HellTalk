<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kor">
<style>
legend {
  background-color: yellow;
  color: white;

}
fieldset{
background-color:gray;
}
</style>

 <style>
.map_wrap, .map_wrap * {margin:0;padding:0; margin-top:30; font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>

<!-- JSP / HTML -->
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script> 

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2d6166a1b5a525187fa1a868dbaf55cb&libraries=services,clusterer,drawing"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>


</head>


 <div class="container">
    
    <fieldset class="form-group border p-3">
    	
    	<legend class="float:left"><img class="img-thumbnail"/> </legend></br>
	   
	   
	    <body>
		<br>
		
		<div class="map_wrap">
		
		<br>
		<div></div>
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>



    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
     
</div>
			<!-- 현재 위도 경도 -->
			<p><em>Plz Click Map</em></p>
			<div id="clickLatlng"></div>
			
	</body>
		  		
    </fieldset>
  </div>
  
<script>
      //geolocation api 가 지원되는 브라우저 인지 확인
      if (Modernizr.geolocation) {
        // 현재 위치 가져오기
        navigator.geolocation.getCurrentPosition(
          // 성공이면 위치를 찍어준다.
          function (pos) {
            console.log(pos.coords.latitude);
            console.log(pos.coords.longitude);
          },
          function () {}
        );
      }
 </script>
  
 
<script>
	//마커를 담을 배열
	var markers =[];
	
	//지도 설정//
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
	
	//주소-좌표변환 객체를 생성 
	var geocoder = new daum.map.service.Geocoder();
	console.log("geocoder:"+geocoder);
	
	//실시간 위치 
	function success(position) {
	  console.log(position);
	            lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	            
	            // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	            var locPosition = new kakao.maps.LatLng(lat, lon),
	        	 // 인포윈도우에 표시될 내용입니다
	            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; 
	       
	        // 마커와 인포윈도우를 표시합니다
	        displayMarker(locPosition, message);
	        
	};

	function error(err) {
		console.log(err);
	};
	
	if(navigator.geolocation){
	    alert('실시간 위치 정보를 확인하겠습니까?');
	    var na =navigator.geolocation.watchPosition(success,error,options);
	    console.log(na);  
	   
	}
	
	//마커 생성기
	var marker;
	var flag=false;
	function displayMarker(locPosition,message){
		console.log(1);
		if(flag){
	        marker.setMap(null);
	}
	//마커를 생성
	marker = new kakao.maps.Marker({
		position:locPosition
	});
    marker.setMap(map);
    flag=true;
    
    //지도 중심좌표를 접속 위치로 변경
    map.setCenter(locPosition);
    }
   
  
	
	
	
   
	//설정한 지도 생성
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	//마커 초기화(초기화 시 지도에 미리 지정 가능 : 카카오맵 API 문서 참조)
	var marker = new kakao.maps.Marker();
	//일반 지도/ 스카이뷰로 지도 타입을 전환 할수 잇는 도타입 컨트롤 생성
	var mapTypeControl = new kakao.maps.MapTypeControl();
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	//지도 확대 축소를 제어할수 있는 줌 컨트롤을 생성 
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	
		//클릭 이벤트시 위치,경도 나타내는 로직 
		kakao.maps.event.addListener(map,'click',function(mouseEvent){
			
			var latlng = mouseEvent.latLng;
			
			marker.setPosition(latlng);
			
			var message = '클릭한 위치의 위도는'+latlng.getLat()+'이고,';
				message += '경도는'+latlng.getLng()+'입니다.';
				
			var resultDiv = document.getElementById('clickLatlng'); 
			resultDiv.innerHTML = message;
		});
 </script>
 
 <script>
 	kakao.maps.event.addListener(map,'click',function(mouseEvent){
 		searchDetailAddrFromCoords(mouseEvent.latLng,function(result,status){
 			if(status == kakao.maps.services.Status.OK){
 				var detailAddr = !result[0].road_address ? result[0].road_address.address_name :'';
 				detailAddr += result[0].address.address_name;
 				
 				var latlng = mouseEvent.latLng;
 				
 				marker.setPosition(latlng);
 				
 				latitude - latlng.getLat();
 				longitude = latlng.getLng();
 				mapLevel = map.getLevel();
 				
 				var message ='클릭한 위치의 위도는'+latlng.getLat()+'이고,';
 					message +='경도는'+latlng.getLng()+'입니다';
 					message +='또 지도 레벨은 ' + detailAddr + '입니다';
 					message +='상세주소는' + detailAddr+'입니다';
 					address = detailAddr;
 					var resultDiv = document.getElementById('clickLatlng');
 					resultDiv.innerHTML = message;
 			}
 		});
 	});
 	function searchDetailAddrFromCoords(coors,callback){
 		geocoder.coordAddress(coords.getLng(),coords.getLat(),callback);
 	}
 	
 	function searchAddrFromCoords(coords,callback){
 		geocoder.coord2RegionCode(coords.getLng(),coords.getLat(),callback);
 	}
 
 </script>
 
 
 
 
 <script>
 

 
		//장소 검색 객체를 생성합니다
		 var ps = new kakao.maps.services.Places(map);  
		
		 // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		 var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
		 // 키워드로 장소를 검색합니다
		 searchPlaces();
		
		 // 키워드 검색을 요청하는 함수입니다
		 function searchPlaces() {
		
		     var keyword = document.getElementById('keyword').value;
		
		     if (!keyword.replace(/^\s+|\s+$/g, '')) {
		         alert('키워드를 입력해주세요!');
		         return false;
		     }
		
		     // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		     ps.keywordSearch( keyword, placesSearchCB); 
		 }
		
		 // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		 function placesSearchCB(data, status, pagination) {
		     if (status === kakao.maps.services.Status.OK) {
		
		         // 정상적으로 검색이 완료됐으면
		         // 검색 목록과 마커를 표출합니다
		         displayPlaces(data);
		
		         // 페이지 번호를 표출합니다
		         displayPagination(pagination);
		
		     } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		
		         alert('검색 결과가 존재하지 않습니다.');
		         return;
		
		     } else if (status === kakao.maps.services.Status.ERROR) {
		
		         alert('검색 결과 중 오류가 발생했습니다.');
		         return;
		
		     }
		 }
		
		 // 검색 결과 목록과 마커를 표출하는 함수입니다
		 function displayPlaces(places) {
		
		     var listEl = document.getElementById('placesList'), 
		     menuEl = document.getElementById('menu_wrap'),
		     fragment = document.createDocumentFragment(), 
		     bounds = new kakao.maps.LatLngBounds(), 
		     listStr = '';
		     
		     // 검색 결과 목록에 추가된 항목들을 제거합니다
		     removeAllChildNods(listEl);
		
		     // 지도에 표시되고 있는 마커를 제거합니다
		     removeMarker();
		     
		     for ( var i=0; i<places.length; i++ ) {
		
		         // 마커를 생성하고 지도에 표시합니다
		         var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
		             marker = addMarker(placePosition, i), 
		             itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
		
		         // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		         // LatLngBounds 객체에 좌표를 추가합니다
		         bounds.extend(placePosition);
		
		         // 마커와 검색결과 항목에 mouseover 했을때
		         // 해당 장소에 인포윈도우에 장소명을 표시합니다
		         // mouseout 했을 때는 인포윈도우를 닫습니다
		         (function(marker, title) {
		             kakao.maps.event.addListener(marker, 'mouseover', function() {
		                 displayInfowindow(marker, title);
		             });
		
		             kakao.maps.event.addListener(marker, 'mouseout', function() {
		                 infowindow.close();
		             });
		
		             itemEl.onmouseover =  function () {
		                 displayInfowindow(marker, title);
		             };
		
		             itemEl.onmouseout =  function () {
		                 infowindow.close();
		             };
		         })(marker, places[i].place_name);
		
		         fragment.appendChild(itemEl);
		     }
		
		     // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
		     listEl.appendChild(fragment);
		     menuEl.scrollTop = 0;
		
		     // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		     map.setBounds(bounds);
		 }
		
		 // 검색결과 항목을 Element로 반환하는 함수입니다
		 function getListItem(index, places) {
		
		     var el = document.createElement('li'),
		     itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
		                 '<div class="info">' +
		                 '   <h5>' + places.place_name + '</h5>';
		
		     if (places.road_address_name) {
		         itemStr += '    <span>' + places.road_address_name + '</span>' +
		                     '   <span class="jibun gray">' +  places.address_name  + '</span>';
		     } else {
		         itemStr += '    <span>' +  places.address_name  + '</span>'; 
		     }
		                  
		       itemStr += '  <span class="tel">' + places.phone  + '</span>' +
		                 '</div>';           
		
		     el.innerHTML = itemStr;
		     el.className = 'item';
		
		     return el;
		 }
		
		 // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		 function addMarker(position, idx, title) {
		     var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		         imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
		         imgOptions =  {
		             spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
		             spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		             offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
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
		
		 
		 
		 
		 // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		 function displayPagination(pagination) {
		     var paginationEl = document.getElementById('pagination'),
		         fragment = document.createDocumentFragment(),
		         i; 
		
		     // 기존에 추가된 페이지번호를 삭제합니다
		     while (paginationEl.hasChildNodes()) {
		         paginationEl.removeChild (paginationEl.lastChild);
		     }
		
		     for (i=1; i<=pagination.last; i++) {
		         var el = document.createElement('a');
		         el.href = "#";
		         el.innerHTML = i;
		
		         if (i===pagination.current) {
		             el.className = 'on';
		         } else {
		             el.onclick = (function(i) {
		                 return function() {
		                     pagination.gotoPage(i);
		                 }
		             })(i);
		         }
		
		         fragment.appendChild(el);
		     }
		     paginationEl.appendChild(fragment);
		 }
		
		 // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		 // 인포윈도우에 장소명을 표시합니다
		 function displayInfowindow(marker, title) {
		     var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
		
		     infowindow.setContent(content);
		     infowindow.open(map, marker);
		 }
		
		  // 검색결과 목록의 자식 Element를 제거하는 함수입니다
		 function removeAllChildNods(el) {   
		     while (el.hasChildNodes()) {
		         el.removeChild (el.lastChild);
		     }
		  }
 
  /*
  function makeOverListener(map,marker,infowindow){
	  return function() {
		  infowindow.open(map,marker);
	  }
  }
 
  
  //인포윈도우 닫는 클로저
  function makeOutListener(infowindow){
	  return function(){
		  infowindow.close();
	  }
  }
  */
  
 
 </script>
 














 


