<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/favicon.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }
</style>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">bonobono</a></h1>
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
		pageContext 
		ㄴ 기본 내장 객체
		ㄴ 속성 처리
			page Scope(영역)
			pageContext.setAttribute();
			pageContext.getAttribute();
			
		ㄴ 페이지 흐름 제어
		ㄴ 에러 데이터 구하기.
		jsp 기본 내장 객체 (커스텀 태그)
		request == pageContext.getRequest()
		response== pageContext.getResponse()
		out = pageContext.getout()
		config = pageContext.getServletConfig()
		application = 
		  
  </xmp>  
</div>

<script>
</script>
</body>
</html>