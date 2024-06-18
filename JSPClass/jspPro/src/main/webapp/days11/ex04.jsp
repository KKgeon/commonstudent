<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="/jspPro/resources/cdn-main/example.js"></script>
<style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }
</style>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">kenik HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<h3>
  <span class="material-symbols-outlined">view_list</span> jsp days00
</h3>
<div>
  <xmp class="code">
            1. 지도위에서  마우스를 클릭하면 이벤트 처리.
               ( 마커 표시, 정보창 표시 )        
  </xmp>  
   
   
   
  <div id="googleMap" style="width: 100%;height:400px"></div>
  
</div>

<script>
  function getRndNumber(min, max) {
         return (Math.random() * (max - min) ) + min;
  }

  function myMap() {
     // 한독빌딩 위도, 경도
     var lat = 37.499294;
     var lng = 127.0331883;
     
     let mapCanvas = document.getElementById("googleMap") ;
     let mapCenter =  new google.maps.LatLng(lat, lng);
     
     var mapOptions = {
           center:mapCenter
             , zoom: 15
     };
     var map = new google.maps.Map( 
           mapCanvas
           , mapOptions);
    //
    map.addListener("click",(event)=>{
    	
    	// alert(event.latLng);
    	placeMaker(map,event.latLng);
    });

  }//myMap
  function placeMaker(map,markerCenter) {
	    let marker = new google.maps.Marker({
	        position:markerCenter   
	     });
	     marker.setMap(map);
	    
	     let message = `위도 : \${markerCenter.lat()}<br>
	     				경도 : \${markerCenter.lng()}`;
	     let infoWindow = new google.maps.InfoWindow({
	        content: message
	     });
	     infoWindow.open( map, marker );
}
  
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCch2mLCEXerLXeIMVWnlYlZfgO_sD3u48&callback=myMap"></script>

<!-- Maps JavaScript API 검색
구글 지도 API 키 발급 받는 방법 (Maps JavaScript API)
https://blog.cosmosfarm.com/archives/389/%EA%B5%AC%EA%B8%80-%EC%A7%80%EB%8F%84-api-%ED%82%A4-%EB%B0%9C%EA%B8%89-%EB%B0%9B%EB%8A%94-%EB%B0%A9%EB%B2%95-maps-javascript-api/
 -->
</body>
</html>