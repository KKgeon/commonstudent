<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="/jspPro/resources/cdn-main/example.js"></script>
<style>
span.material-symbols-outlined {
	vertical-align: text-bottom;
}
</style>
</head>
<body>
	<header>
		<h1 class="main">
			<a href="#" style="position: absolute; top: 30px;">zero Home</a>
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
		<xmp class="code"> ex02_ajax_info.txt js ajax -> 텍스트 파일 안에 있는
		내용물을 ajax을 이용해 일부 출력 </xmp>

		서버 요청 시간 :
		<%= new Date().toLocaleString() %>
		<br> 
		
		<input type="button" value="js ajax"
			onclick="load('ex02_ajax_info.txt');"> 
		<br>

		<p id="demo"></p>



	</div>

<script>
	let httpRequest; // XMLHttpRequest객체
	function getXMLHttpRequest() {
		if ( window.ActiveXObject ) { //  IE
			try {
				return new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					return new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
					return null;	
				}
				
			}
		}else if ( window.XMLHttpRequest ) {
			return new XMLHttpRequest();
		} else {
			return null;
		}
	}
	
	function load( url ) {
		httpRequest = getXMLHttpRequest();
		httpRequest.onreadystatechange = callback; // 상태가 바뀔 때마다 호출되는 함수
		httpRequest.open("GET", url, true);
		httpRequest.send();
	}
	
	function callback() {
		if (httpRequest.readyState == 4 ) { // 4= 서버에 갔다왔다
			if( httpRequest.status == 200 ) { // 200 = 성공했다
				let rtxt = httpRequest.responseText;
				let names = rtxt.split(",");
				for( let name of names ){
					$('#demo')
						.append( $("<li></li>").text(name) ); // = append 자식으로 추가하겠다
				}
			}
			
		}
	}
	
</script>
</body>
</html>