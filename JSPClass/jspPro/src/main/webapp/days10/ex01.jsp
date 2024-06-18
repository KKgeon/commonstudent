<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  <a href="/jspPro/days10/replyboard/list.do">목록보기</a>
  <xmp class="code">
         1.게층형(답변형) 게시판     -MVC 패턴 작업
         2.days09
            ㄴ replyboard 폴더 추가
                  ㄴemoticon
                  ㄴimages        
        1. 계층형(답변형) 게시판 - MVC 패턴 작업
     2. days10
           ㄴ replyboard 폴더 추가
                ㄴ emoticon
                ㄴ images      
     *** 3. 로직 이해...*** 
     [DB]
     글번호 제목           작성자 ... 
     1      첫번째게시글         홍길동(새글)
     2      두번째게시글         서영학(새글)
     3      세번째게시글         정창기(새글)
     4      2-1 답글          정창기(답글)
     5      2-1-1 답글        홍길동(답글)
     6      네번째게시글         정창기(새글)
     7      6-1 답글         홍길동(답글)
     8      2-2 답글          정창기(답글)
     
     
     [화면출력] order by 글번호 desc  
     글번호 제목           작성자 ... 
     6      네번째게시글   정창기(새글)
     7        ㄴ6-1 답글       홍길동(답글)
     3      세번째게시글   정창기(새글)
     2      두번째게시글   서영학(새글)
     8        ㄴ 2-2 답글       정창기(답글)
     4        ㄴ 2-1 답글  정창기(답글) 
     5          ㄴ2-1-1 답글     홍길동(답글) 
     1      첫번째게시글   홍길동(새글)   
     
     
     *** 첫 번째 방법) 컬럼 3개 추가   *** 풀이
     글번호(PK) 제목 작성자  + 글그룹(REF) + 그룹 순서(STEP) + 깊이(DEPTH)
     

      
      규칙)1새글이 작성되면 항상 글그룹(==글번호) STEP 1 DEPTH 0
      규칙2)답글작성 -> 항상 부모글[2]      글그룹[2]
     [DB]
     글번호    제목           작성자 ...     REF      STEP   DEPTH
      1      첫번째         홍길동(새글)   글번호1       1        0
      2      두번째         서영학(새글)   글번호2       1        0
      3      세번째         정창기(새글)   글번호3       1        0
     
     
     
     
     [화면출력] order by 글번호 desc  
     글번호     제목           작성자 ... 
      3      세번째         정창기(새글)   글번호3       1        0
      2      두번째         서영학(새글)   글번호2       1        0
      1      첫번째         홍길동(새글)   글번호1       1        0 
     
     
     두 번째 방법) 컬럼 2개 추가       
             
                  
        
        
                         days10.replyboard.command 패키지
                     days10.replyboard.controllor 패키지
                     days10.replyboard.domain 패키지
                     days10.replyboard.persistence 패키지
                     	IReplyBoard.java	인터페이스
                     	ReplyBoardDAO.java  클래스	
                     days10.replyboard.service 패키지               
  </xmp>  
  
</div>

<script>
</script>
</body>
</html>