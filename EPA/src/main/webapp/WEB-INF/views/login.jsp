<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id" content="387218639784-ae1jch9aurgpjk22c0amliljj0ap16b8.apps.googleusercontent.com"> 
    <title>Document</title>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${cpath}/resources/css/style.css">
</head>
<style>
    * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Noto Sans KR", sans-serif;
}

a {
  text-decoration: none;
  color: black;
}

li {
  list-style: none;
}

.wrap {
  width: 100%;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background: white;
}

.login {
  width: 60%;
  height: 600px;
  background: white;
  border-radius: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

h2 {
  color: tomato;
  font-size: 2em;
}


.login_id {
  margin-top: 20px;
  width: 80%;
}

.login_id input {
  width: 100%;
  height: 50px;d\
  border-radius: 30px;
  margin-top: 10px;
  padding: 0px 20px;
  border: 1px solid lightgray;
  outline: none;
}

.login_pw {
  margin-top: 20px;
  width: 80%;
}

.login_pw input {
  width: 100%;
  height: 50px;
  border-radius: 30px;
  margin-top: 10px;
  padding: 0px 20px;
  border: 1px solid lightgray;
  outline: none;
}

.login_etc {
  padding: 10px;
  width: 80%;
  font-size: 14px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-weight: bold;
}

.submit {
  margin-top: 50px;
  width: 80%;
}
.submit input {
  width: 100%;
  height: 50px;
  border: 0;
  outline: none;
  border-radius: 40px;
  background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
  color: white;
  font-size: 1.2em;
  letter-spacing: 2px;
}

</style>
<body>
    <div class="wrap">
    <form action="${cpath}/Login.do" method="post" class="login">
        <div class="login">
            <h2>로그인</h2>
        
            <div class="login_id">
                <h4>ID</h4>
                <input type="text" name="MEM_ID" id="MEM_ID" placeholder="ID">
            </div>
            <div class="login_pw">
                <h4>Password</h4>
                <input type="password" name="MEM_PW" id="MEM_PW" placeholder="Password">
            </div>
            <div class="login_etc">
                <div class="checkbox">
                <input type="checkbox"> 암호 기억하기
                </div>
                <div class="find_pw">
                <a href="">비밀번호 찾기</a>
                </div>
            </div>
              <div class="g-signin2" data-onsuccess="onSignIn"></div>
              
            <!-- 실패 메시지가 있을 경우에만 출력 -->
            <c:if test="${not empty loginError}">
               <!-- 팝업을 띄우기 위한 스크립트 호출 -->
               <script>
                  alert('${loginError}');
               </script>
            </c:if>
              
              
			<script>
			
			var cpath = "${cpath}/googleLogin";
			function onSignIn(googleUser) {
			     var profile = googleUser.getBasicProfile();
			     console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			     console.log('Name: ' + profile.getName());
			     console.log('Image URL: ' + profile.getImageUrl());
			     console.log('Email: ' + profile.getEmail());
			     
			          var id_token = googleUser.getAuthResponse().id_token;
			     console.log("ID Token:" + id_token);
			   }
			

       
            </script>
            <div class="submit">
               <input type="submit" value="로그인">
            </div>
        </div>
        </form>
    </div>
</body>
</html>