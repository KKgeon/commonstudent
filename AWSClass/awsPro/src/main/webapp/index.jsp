<%@page import="aws.mysql.sslecture.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<h3>index.jsp</h3>
<body>
<%   
     Connection conn =  DBConn.getConnection();
     System.out.println( conn );
     conn.close();
%>
<sql:query var="rs" dataSource="jdbc/TestDB">
   select deptno, dname, loc 
   from dept
</sql:query>
<c:forEach var="row" items="${rs.rows}">
    deptno ${row.deptno} - 
    dname ${row.dname} - 
    loc ${row.loc}<br/>
</c:forEach>

</body>
</html>