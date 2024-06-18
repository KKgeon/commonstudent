<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/inc/auth.jspf" %>

<%
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/WHclass/images/favicon.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost/WHclass/resources/cdn-main/example.css">
<script src="http://localhost/WHclass/resources/cdn-main/example.js"></script>
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
  list.jsp
  </xmp>  
  
  
  <h2><a href="<%= contextPath%>/board/list.do">목록 보기</a></h2>
  <a href="<%= contextPath%>/board/write.do">글쓰기</a>
  <select id="cmbNumberPerPage" name="cmbNumberPerPage">
  </select>
  <script>
    for (var i = 10; i <= 50; i+=5) {
     $("#cmbNumberPerPage").append(`<option>\${i}</option>`);      
   }
    
    $("#cmbNumberPerPage").on("change", function (){
//        location.href = `/WHclass/cstvsboard/list ?currentpage=&`;   
    });
  </script> 
  
  
  <table>
   <thead>
     <tr>
        <th width="10%">번호</th>
        <th width="45%">제목</th>
        <th width="17%">작성자</th>
        <th width="20%">등록일</th>
        <th width="10%">조회</th>
      </tr>
   </thead>
   <tbody>
     <c:choose>
       <c:when test="${ not empty list }">
         <c:forEach items="${list }" var="dto">
           <tr>
             <td>${ dto.id }</td>
             <td class="title">
             <a href="<%= contextPath %>/board/list.do?seq=${ dto.pdName }">${ dto.id }</a></td>
             <td>${ dto.categoryId }</td>
             <td>${ dto.specialPriceId }</td>
             <td>${ dto.shippingOptionId }</td>
             <td>${ dto.sellerStoreId }</td>
             <td>${ dto.brandId }</td>
             <td>${ dto.pdName }</td>
             <td>${ dto.pcontent }</td>
             <td>${ dto.updateDay }</td>
           </tr>
         </c:forEach>
       </c:when>
       <c:otherwise>
         <tr>
            <td colspan="5">등록된 게시글이 없습니다.</td>
         </tr>
       </c:otherwise>
     </c:choose>
   </tbody>
   <tfoot>
    

   </tfoot>
  </table>
  
</div>

<script>
   // list.htm?write=success or fail
   if( '<%= request.getParameter("write") %>'== "success" ){
	   alert("글 쓰기 완료!!!")
   }else if( '<%= request.getParameter("write") %>'== "fail" ){
	   alert("글 쓰기 실패!!!")
   }else if( '<%= request.getParameter("delete") %>'== "success" ){
	   alert("글 삭제 완료!!!")
   }	   
   
   // 검색어, 검색조건 상태 유지
   //http://localhost/WHclass/cstvsboard/list.htm?searchCondition=3&searchWord=%EA%B6%8C%EB%A7%91%EC%9D%8C
		   $("#searchCondition").val(${param.searchCondition});
		   $("#searchWord").val("${param.searchWord}");
		   
		 
  // 검색 후 	1 [2] 페이지번호를 클릭
  $(".pagination a").attr("href"
		  , function(index,oldHref) {
		return `\${oldHref}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}`;
	});
		 
  // 검색 후 	1 [2] 게시글의 제목을 클릭
  // oldHref == view.htm?seq=57
  $(".title a").attr("href"
		  , function(index,oldHref) {
		return `\${oldHref}&currentPage=${param.currentpage}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}`;
	});
</script>
</body>
</html>