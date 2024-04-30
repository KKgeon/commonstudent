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
        ex04_update.jsp             
  </xmp>  
  <h2>글 수정</h2>
      <form action="update_ok.ss" method="post" enctype="multipart/form-data">
         <table border="1" align="center">
            <tr>
               <td>제목</td>
               <td><input type="text" name="subject" value="${dto.subject }"/></td>
            </tr>
            <tr>
               <td>첨부파일</td>
               <td>
               <input type="file" name="attachFile" />
               <input type="text" name="filesystemname" value="${dto.filesystemname}" />
               </td>
            </tr>
            <tr>
               <td colspan="2"><input type="submit" />
               <input type="hidden" name="num" value="${dto.num }" /><a href="list.ss">Home</a></td>
               
            </tr>
         </table>
      </form>
</div>

<script>
</script>
</body>
</html>