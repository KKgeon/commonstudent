<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>
    <link rel="shortcut icon" type="image/x-icon" href="http://localhost/webPro/images/SiSt.ico">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="http://localhost/webPro/resources/cdn-main/example.css">
    <script src="http://localhost/webPro/resources/cdn-main/example.js"></script>
    <style>
      span.material-symbols-outlined {
        vertical-align: text-bottom;
      }
    </style>
  </head>

  <body>
    <header>
      <h1 class="main"><a href="#" style="position: absolute;top:30px;">kenik HOme</a></h1>
      <ul>
        <li><a href="#">로그인</a></li>
        <li><a href="#">회원가입</a></li>
      </ul>
    </header>
    <div>
      <xmp class="code">
      </xmp>
      <!-- ex04_ok.jsp?subject=eng -->
      <% // 스크립트릿 - 자바 코딩. // 요청할 때의 파라미터 얻어오려면 // 요청할 때의 모든 정보를 가지고 있는 객체 : request String
        subject=request.getParameter("subject"); System.out.printf("> 전송된 subject = %s \n", subject);
        %>
        <!-- 표현식 -->
        > 전송된 과목 = <%= subject %>
          <br>
          <br>
          [ex04.html 선택한 과목]<br>
          <!-- input[type=radio name=subject value]*4>lable -->
          <input type="radio" name="subject" value="kor"><label for="">국어</label>
          <input type="radio" name="subject" value="eng"><label for="">영어</label>
          <input type="radio" name="subject" value="mat"><label for="">수학</label>
          <input type="radio" name="subject" value="pe"><label for="">체육</label>
          <br>
          <br>
          <a href="">뒤로가기</a>
    </div>

    <script>
      const rdbs = document.querySelectorAll("input[name=subject]");
      // alert(rdbs.length);

    </script>
  </body>

  </html>