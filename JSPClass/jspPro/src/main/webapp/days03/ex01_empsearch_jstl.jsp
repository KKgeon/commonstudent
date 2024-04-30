<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath = request.getContextPath();//	"/jspPro"
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
  
  <form action="<%=contextPath%>/days03/empsearch.htm">
  
  <fieldset>
  <legend>부서 선택</legend>
  <c:forEach items="${dlist }" var="vo">
  <input type="checkbox" id="deptno${vo.deptno }" name="deptno" value="${vo.deptno }"/>
  <label for="deptno-${vo.deptno }">${vo.dname }</label>
  </c:forEach>
  </fieldset>
  
  <fieldset>
  <legend>잡(job) 선택</legend>
  <c:forEach items="${jlist }" var="job">
  <input type="checkbox" id="id-${job }" name="job" value="${job }"/>
  <label for="id-${job }">${job }</label>
  </c:forEach>
  </fieldset>

<input type="submit" value="search" />
<input type="button" value="emp delete" />
  </form>
    
    
<h2>emp search list</h2>
<table>
    <thead>
      <tr>
        <td><input type="checkbox"  id="ckbAll" name="ckbAll"></td>
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
    	<c:choose>
    	<c:when test="${empty elist }">
    		  	    <tr>
	          <td colspan="8">사원 존재 X</td>
	        </tr>
    	</c:when>

    	<c:otherwise>
    	<c:forEach items="${elist}" var="evo">
    		  <tr>
    		  	<td><input type="checkbox" data-empno="${evo.empno }" value="${evo.empno }" /></td>
		        <td>${evo.empno}</td>
		        <td>${evo.ename} </td>
		        <td>${evo.job}</td>
		        <td>${evo.mgr} </td>
		        <td>${evo.hiredate} </td>
		        <td>${evo.sal} </td>
		        <td>${evo.comm}</td>
		        <td>${evo.deptno} </td>
		      </tr>
		 </c:forEach>
    	</c:otherwise>
    	</c:choose>

<%--       <c:if test="${ empty elist }"> --%>
<!-- 	  	    <tr> -->
<!-- 	          <td colspan="8">사원 존재 X</td> -->
<!-- 	        </tr> -->
<%-- 	  </c:if> --%>
	  
  
<%-- 	  <c:if test="${ not empty elist }"> --%>
<%-- 	<c:forEach items="${elist}" var="evo"> --%>
<!-- 	    	  <tr> -->
<%-- 	    	    <td><input type="checkbox" data-empno="${evo.empno }" value="${evo.empno }" /></td> --%>
<%-- 		        <td>${evo.empno}</td> --%>
<%-- 		        <td>${evo.ename} </td> --%>
<%-- 		        <td>${evo.job}</td> --%>
<%-- 		        <td>${evo.mgr} </td> --%>
<%-- 		        <td>${evo.hiredate} </td> --%>
<%-- 		        <td>${evo.sal} </td> --%>
<%-- 		        <td>${evo.comm}</td> --%>
<%-- 		        <td>${evo.deptno} </td> --%>
<!-- 		      </tr> -->
	
<%-- 	</c:forEach> --%>
	
	  
<%-- 	  </c:if> --%>

    </tbody>
    <tfoot>
      <tr>
        <td colspan="9">
          <span class="badge left red">
          
<%--           ${elist!=null?0:${e.list.size()} } --%>
  <c:if test="${ empty elist }">
  		0
  	  </c:if>
  <c:if test="${!empty elist }">
  		${elist.size() }
  	  </c:if>



</span> 명.  
          <a href="javascript:history.back()">뒤로 가기</a>
          <button>선택한 empno 확인</button>
        </td>
      </tr>
    </tfoot>
  </table>
</div>

<script>

let url = location.href;

if (url.indexOf("deptno=")!=-1) {
	$(":checkbox[name=deptno]").each(function (i, element) {
		let v = $(element).val();
		if (url.indexOf(`deptno=\${v}` )!= -1) {
			$(element).prop("checked", true);
		}
		
	});
	
}

//[job 체크박스 체크 상태관리 유지]
if (url.indexOf("job=")!=-1) {
	$(":checkbox[name=job]").each(function (i, element) {
		let v = $(element).val();
		if (url.indexOf(`job=\${v}` )!= -1) {
			$(element).prop("checked", true);
		}
		
	});
	
}



</script>
</body>
</html>