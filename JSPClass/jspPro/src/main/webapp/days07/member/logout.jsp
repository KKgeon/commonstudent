<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	session.invalidate();
	// 저장된 세션을 삭제
	//session.removeAttribute(name);
	
	String location = "/jspPro/days07/ex07.jsp"; //메인페이지
	response.sendRedirect(location);
%>
