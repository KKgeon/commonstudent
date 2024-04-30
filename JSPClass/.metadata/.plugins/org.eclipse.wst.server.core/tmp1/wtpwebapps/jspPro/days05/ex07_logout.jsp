<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//약속 : auth 쿠키이름 : 로그인ID 쿠키값 저장.
	String cname = "auth";
	String logonID = null;
	
	Cookies cookies = new Cookies(request);
	if(cookies.exists(cname)){
		logonID = cookies.getValue(cname);
		//쿠키 삭제.
		Cookie c = Cookies.createCookie("auth", "", "/", 0);
		response.addCookie(c);
	} // if
%>

<script type="text/javascript">
alert("<%= logonID %>님 로그아웃하셨습니다.");
location.href = "ex07_default.jsp";
</script>
