<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  String [] names = request.getParameterValues("name");
  String [] ages = request.getParameterValues("age");
  
  for(int i=0; i<names.length; i++){
     String name = names[i];
     int age =  Integer.parseInt( ages[i] );
     // 출력
  }
%>
<hr>
<!-- EL 코딩 수정 -->
<c:forEach items="${  paramValues.name }" 
           var="name"  
           varStatus="status">
   ${ name } - ${ paramValues.age[status.index] } - ${ status.index }
</c:forEach>