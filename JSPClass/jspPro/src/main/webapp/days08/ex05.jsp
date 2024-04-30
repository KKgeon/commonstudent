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
<script src="httpRequest.js"></script>
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
	 ex05_cd_catalog.xml
  </xmp>
  <button type="button" onclick="loadXml()">Get my CD Collection</button>
  
  <br />
  <br />

	<p id="demo"></p>
  
    
</div>

<script>
	function loadXml(){
		sendRequest("ex05_cd_catalog.xml",null,callback,"GET");
	}
	
	function callback(){
		if (httpRequest.readyState ==4){
			if(httpRequest.status ==200){
// 				$("#demo").html(httpRequest.responseText);
				let xmlDoc = httpRequest.responseXML;
// 				console.log(xmlDoc);
				let cdList = xmlDoc.getElementsByTagName("CD");
// 				alert(cdList.length);
				
				let tblcdlist = "<table>";
				
				
				tblcdlist+="<tr>";
				tblcdlist+="<th>TITLE</th><th>ARTIST</th>";
				tblcdlist+="</tr>";
				
				for (var i = 0; i < cdList.length; i++) {
					title = cdList[i].getElementsByTagName("TITLE")[0].childNodes[0].nodeValue;
					artist = cdList[i].getElementsByTagName("ARTIST")[0].childNodes[0].nodeValue;
					
					tblcdlist+=`<tr>
									<td>\${title}</td><td>\${artist}</td> 
									</tr>`;
					
				}//for
				
				tblcdlist += "</table>";
				$("#demo").html(tblcdlist);
		}else{
			alert("실패 : " +  httpRequest.status);
			}//if2
		}//if1
	}//funcallback
</script>
</body>
</html>