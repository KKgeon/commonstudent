<%@page import="java.util.Iterator"%>
<%@page import="domain.EmpVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
  <h2>emp list</h2>
	<table>
	  <thead>
      <tr>
        <td>empno</td>
        <td>ename</td>
        <td>job</td>
        <td>mgr</td>
        <td>hiredate</td>
        <td>sal</td>
        <td>comm</td>
        <td>deptno</td>
      </tr>
	  </thead>
	  <tbody>
<!-- 	  empty EL -->
	  <c:if test="${ empty list }">
	  	    <tr>
	          <td colspan="8">사원 존재 X</td>
	        </tr>
	  </c:if>
	  
  
	  <c:if test="${ not empty list }">
	<c:forEach items="${list}" var="vo">
	    	  <tr>
		        <td>${vo.empno}</td>
		        <td>${vo.ename} </td>
		        <td>${vo.job}</td>
		        <td>${vo.mgr} </td>
		        <td>${vo.hiredate} </td>
		        <td>${vo.sal} </td>
		        <td>${vo.comm}</td>
		        <td>${vo.deptno} </td>
		      </tr>
	
	</c:forEach>
	
	  
	  </c:if>
	  
	  



	  </tbody>
	  <tfoot>
	    <tr>
	      <td colspan="8">
	        <span class="badge left red">
	        
	        <c:if test="${ empty list }">
	        0
	        </c:if>
	        
	        <c:if test="${ !empty list }">
	        ${list.size()}

	        </c:if>
	        
	        
	        </span>
	        명.
	        <a href="javascript:history.back()">뒤로 가기</a>
	      </td>
	    </tr>
	  </tfoot>
	</table>
  
</div>

<script>
</script>
</body>
</html>