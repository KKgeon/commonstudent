<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	JSTL은 EL에서 사용할수 있는 함수를 제공.
  </xmp>  
  
  <%
  	String message = "<h3>Hello World</H3><br>홍길동";
  %>
  <c:set var="msg" value="<%=message %>"></c:set>
  
  ${msg } <br />
 escapeXml = ${fn:escapeXml(msg)} <br />
 length = ${fn:length(msg)} <br />
 toUpperCase =  ${fn:toUpperCase(msg)} <br />
 toLowerCase = ${fn:toLowerCase(msg)} <br />
 trim = ${fn:trim(msg)} <br />
 contains = ${fn:contains(msg,"ell")} <br />
 substring = ${fn:substring(msg,1,4)} <br />
 
  fn:replace() <br>
  fn:startWith() <br>
  fn:endsWith() <br>
  fn:split() <br>
  fn:join() <br>
  등등 <br>
  </div>

<script>
</script>
</body>
</html>