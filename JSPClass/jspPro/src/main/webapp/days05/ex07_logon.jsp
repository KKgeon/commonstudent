<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

String location = "ex07_default.jsp";

if (id.equals("admin") && passwd.equals("1234")) {
	//관리자로 로그인 성공.
	//auth 쿠키 생성
	Cookie c = Cookies.createCookie("auth", id, "/", -1);
	response.addCookie(c);
} else if (id.equals("hong") && passwd.equals("1234")) {
	Cookie c = Cookies.createCookie("auth", id, "/", -1);
	response.addCookie(c);
	//일반회원으로 로그인 성공.
} else if (id.equals("park") && passwd.equals("1234")) {
	Cookie c = Cookies.createCookie("auth", id, "/", -1);
	response.addCookie(c);
	//일반회원으로 로그인 성공.
} else {
	//로그인 실패
	location = "ex07_default.jsp?logon=fail";
}
response.sendRedirect(location);
%>