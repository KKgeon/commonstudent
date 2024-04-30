<%@page import="java.io.DataInputStream"%>
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
     ex11_ok_02.jsp                
  </xmp>  
 	
 	<h2>스트림(Stream) 전송된 데이터 출력</h2>
 	<%
 		ServletInputStream sis = request.getInputStream();
 		DataInputStream dis = new DataInputStream(sis);
 		String line = "";
 		while((line=dis.readLine())!=null){
 			out.print(new String(line.getBytes("ISO-8859-1"),"UTF-8"));
 		}
 	%>
 
</div>

<script>
</script>
</body>
</html>