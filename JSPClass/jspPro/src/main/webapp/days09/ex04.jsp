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
	<a href="/jspPro/days09/list.ss">자료실 목록보기</a>
  <xmp class="code">
	파일첨부 1개 + 게시글 -> 자료실
				제목

	1. 테이블 , 시퀀스 생성
    create table filetest(          
     num number not null primary key  
     , subject varchar2(50) not null     
     
     , filesystemname varchar2(100) -- 실제 저장되는 파일명       a1.txt
     , originalfilename varchar2(100) -- 저장할 때 파일명             a.txt
     , filelength number  -- 파일크기
    );
    
   create sequence seq_filetest;
   
   MVC 비슷하게 개념...
   
   실습)
   	days09 패키지
   		ㄴFileTestDTO.java
   		ㄴFileTestDAO.java
   		ㄴFileTestServlet.java
   	days09 폴더
   		ㄴ ex04_list.jsp	
   		ㄴ ex04_write.jsp	
   		ㄴ ex04_update.jsp	
   				
	
  </xmp>  
</div>

<script>
</script>
</body>
</html>