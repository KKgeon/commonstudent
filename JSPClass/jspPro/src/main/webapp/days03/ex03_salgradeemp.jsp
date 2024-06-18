<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/favicon.ico">
<!-- <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#accordion" ).accordion();
    $( "#tabs" ).tabs();
  } );
  </script>
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
  <div id="accordion">
  <c:forEach items="${map}" var="entry">
     <h3>${entry.key.grade}(${entry.key.losal} ~ ${entry.key.hisal}) - ${entry.key.cnt}</h3>
     <div>
     <p>
     <c:forEach items="${entry.value }" var="vo">
     <li>${vo}</li>
     </c:forEach>
     </p>
     </div>
  </c:forEach>
  </div>
  
  <hr />
  
  
  <div id="tabs">
    <ul>
<!--     <li><a href="#tabs-1">Nunc tincidunt</a></li> -->
<!--     <li><a href="#tabs-2">Proin dolor</a></li> -->
<!--     <li><a href="#tabs-3">Aenean lacinia</a></li> --> 
      <c:forEach items="${map }" var ="entry">
		<li>  <a href="#tabs-${entry.key.grade }">${entry.key.grade } 등급</a></li>
	  </c:forEach>
   </ul>
;
	<c:forEach items="${map}" var="entry">
	   <div id="tabs-${entry.key.grade }">
         <p>
			<c:forEach items="${ entry.value }" var="vo">
               <li>${ vo }</li>
            </c:forEach>
			
		
		</p>
       </div>
	
	</c:forEach> 
 
</div>
 
</div>

<script>

</script>
</body>
</html>