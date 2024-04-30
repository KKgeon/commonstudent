<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	4:04 수업 시작 ~~
	[MVC 패턴 프로젝트]
						[로직처리부분]				[출력처리부분]
	/scott/dept 요청 -> DB 로직처리					-> dept.jsp
						서블릿
						ArrayList<DeptVO> list
						포워딩 
		[days01.ex06_02.jsp 참조]
		ex12.dept.jsp
		부서 옵션을 하나 선택
		->	 /scott/emp?deptno=10 요청 URL
			-> /scott/emp -> 서블릿 클래스 ScottEmp.java
				->	ex12_emp.jsp 포워딩
  </xmp>
  
  <a href="/jspPro/scott/dept">부서 정보 조회</a>
  <br />  
</div>

<script>
</script>
</body>
</html>