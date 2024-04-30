<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// ex10.jsp 인증
	// ex10.jsp?ok&name=admin 인증성공
	// ex10.jsp?error 인증실패
	String ok = request.getParameter("ok"); // "" 인증성공
	String name = request.getParameter("name"); //
	String error = request.getParameter("error"); // "" 인증실패
%>
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
 
 #logon, #logout{
 border:1px solid gray;
 width:300px;
 padding:20px;
 border-radius: 10px;
 
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
                     
  </xmp>
  <div id="logon">  
     <form action="ex10_ok.jsp" method="get">
      아이디 : <input type="text"  name="id"  value="admin"><br>
      비밀번호 : <input type="password"  name="passwd"  value="1234"><br>
      <input type="submit"  value="logon"> 
     </form>  
  </div>
  <div id="logout" style="display:none">
   [<%=name %>]님 로그인하셨습니다.<br>
    <button>로그아웃</button>
  </div>
  <a href="#">설문조사</a> <br>
  
<!--   로그인 O -->
<%
if(ok!=null){
%>	

  <a href="#">일정관리</a> <br>
  <a href="#">게시판</a> <br>

<script type="text/javascript">
alert("로그인 성공");
$("#logon").hide();
$("#logout").show();
</script>

<%
}
%>

<% 
if(error !=null){
%>
<script type="text/javascript">
alert("로그인 실패~");
</script>
<%
}
%>

</div>

<script>

// $(function () {
// 	$("#logon").show();
// 	$("#logout").hide();
// })
</script>
</body>
</html>