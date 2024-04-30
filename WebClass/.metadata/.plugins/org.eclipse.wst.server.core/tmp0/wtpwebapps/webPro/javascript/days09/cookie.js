/**
 * cookie.js
 */

// 쿠키 생성
function setCookie(cName, cValue, path , expiresDays){

    let now = new Date();
    now.setDate(   now.getDate() + expiresDays   );
    let expire = now.toUTCString();
    
    // 쿠키 생성
    document.cookie = `${ cName}=${ cValue }; expires=${ expire }; path=${path}`;
     
 }
 
 function setCookie(cname, cvalue, exdays) {
   const d = new Date();
   d.setTime(d.getTime() + (exdays*24*60*60*1000));
   let expires = "expires="+ d.toUTCString();
   document.cookie = cname + "=" + cvalue + ";" + expires + ";";
 }
 
 /*
 function getCookie(cname) {
   let name = cname + "=";
   let decodedCookie = decodeURIComponent(document.cookie);
   let ca = decodedCookie.split(';');
   for(let i = 0; i <ca.length; i++) {
     let c = ca[i];
     while (c.charAt(0) == ' ') {
       c = c.substring(1);
     }
     if (c.indexOf(name) == 0) {
       return c.substring(name.length, c.length);
     }
   }
   return "";
 }
 */
 // 쿠키이름 조회
 function getCookie( cName ){
        let cValue ;       
        let cookies =  document.cookie;
         
        let cookieArr = cookies.split(   /;\s/  );
        cookieArr.forEach(function(elt, i, array) {
           let cnv =  elt.split("=");
           if( cnv[0] == cName){
              cValue =  unescape( cnv[1] );
              // break;
           }
        });
        
        if( cValue ) {
           return  cValue;
        }else{
           return null;
        }
         
     }
 
 function checkCookie() {
   let username = getCookie("username");
   if (username != "") {
    alert("Welcome again " + username);
   } else {
     username = prompt("Please enter your name:", "");
     if (username != "" && username != null) {
       setCookie("username", username, 365);
     }
   }
 } 
 
 // 모든 쿠키 조회
 function getAllCookies(){ 
     let cookies =  document.cookie;
     return  cookies;
 }
 
 // 쿠키 삭제
 function delCookie( cName , path ){
         
        let now = new Date();
        now.setDate(   now.getDate() - 10   );
        let expire = now.toUTCString();
        
        // 쿠키 생성
        document.cookie = `${ cName}=; expires=${ expire }; path=${ path }`;
               
     }

     
     