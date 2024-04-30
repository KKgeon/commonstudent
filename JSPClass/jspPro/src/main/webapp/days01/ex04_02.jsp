<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%
  String content = "";
  
  int sum = 0;
  for(int i = 1; i<=10;i++){
	  sum+=i;
	content += (i+(i==10?"":"+"));
  }
	content += String.format("=%d", sum);
  
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
  <p id="demo"><%= content %></p>
  <p id="demo2"></p>

</div>

<script>
let content = '<%= content %>';
$("#demo2").html(content);

// let sum = 0;
// 	for (var i = 1; i <= 10; i++) {
		
// 		sum+=i +"+"
		
// 	}
// $("#demo").html(sum);

// const arr = [];
// for (var i = 1; i <= 10; i++) arr.push(i); 
// let result = arr.reduce((total, value)=> total+value);
// $("#demo").html( `\${arr.join("+")}=\${result}` );


</script>
</body>
</html>