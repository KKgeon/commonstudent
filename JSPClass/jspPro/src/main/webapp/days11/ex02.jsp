<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon"
	href="http://localhost/jspPro/images/favicon.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
span.material-symbols-outlined {
	vertical-align: text-bottom;
}
</style>
</head>
<body>
	<header>
		<h1 class="main">
			<a href="#" style="position: absolute; top: 30px;">bonobono</a>
		</h1>
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
		
		 1. 쌍용 센터의 위치를 중심으로 임의의 위치 10개를 선정해서 마커 표시 
		
		</xmp>
		
		<div id="googleMap" style="width: 100%; height: 400px"></div>

	</div>

	<script>
   function getRndNumber(min,max){
      return (Math.random()*(max-min))+min ;
   }
  function myMap() {
        var lat = 37.499294 ;
        var lng = 127.0331883 ;
        
        var mapCanvas = document.getElementById("googleMap") ;
        var mapCenter = new google.maps.LatLng(lat ,lng);
        var mapOptions = {
           center:mapCenter
             , zoom: 15
     };
     var map = new google.maps.Map( 
           mapCanvas
           , mapOptions);

  //쌍용 위치를 표시 마커 (지도의 객체)
  //[마커], 폴리라인, 다각형 ,원 ,직사각형
 /*  var marker = new google.maps.Marker({
     position:mapCenter,
     animation : google.maps.Animation.BOUNCE
     icon : "pinkball.png"
     
  });
  marker.setMap(map);
  
  //2 .정보창 표시
  let message = "<img alt='lezhin.com 로고' src='//img-s-msn-com.akamaized.net/tenant/amp/entityid/BBFwET1.img'>";
  let infoWindow = new google.maps.InfoWindow({
     content: message
  });
  infoWindow.open(map,marker); */
  
  // 한독빌딩 주위의 임의의 10군데 : 마커 표시 
  for (var i = 0; i < 10; i++) {
   lat += getRndNumber(-0.005,0.005);
   lng += getRndNumber(-0.005,0.005);
   var marketps = new google.maps.LatLng(lat ,lng);
   let marker = new google.maps.Marker({
        position:marketps,
        animation : google.maps.Animation.BOUNCE ,
        icon : "pinkball.png"
        
     });
     marker.setMap(map);
 
  let message = "맛집-" +i;
  let infoWindow = new google.maps.InfoWindow({
     content: message
  });
  infoWindow.open(map,marker);
   }
  }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCch2mLCEXerLXeIMVWnlYlZfgO_sD3u48&callback=myMap"></script>
</body>
</html>