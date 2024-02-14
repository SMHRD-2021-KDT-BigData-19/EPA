<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${cpath}/resources/css/style.css">
    <title>Your Website</title>
</head>
<style>
.image-containers {
    padding: 0 20px;
    margin-top: 50px;
    margin-bottom: 100px;
}

.roww {
    display: flex;
    justify-content: space-around;
    margin-bottom: 40px;
    padding: 0; 
}
.roww img {
    max-width: 100%;
    height: auto;
    margin-bottom: 0;
}


#info_text {
    text-align: center; /* 가운데 정렬 */
    background-color: aliceblue;
    padding: 10px;
    display: inline-block; 
    border-radius: 10px; 
    margin-left: 25%;
    width: fit-content; /* 내용에 맞게 너비 설정 */
    font-family: 'NPSfontBold';
}

</style>
<body>
<header>
    <a href="./login.html">로그인</a>
    <span>&nbsp;</span>
    <a href="./join.html">회원가입</a>
</header>
<div class="navbar">
    <a href="${cpath}/"><img id="icon" src="${cpath}/resources/img/mainlogo.png" width="150" height="80"></a>
    <a href="./info.html">운동정보</a>
    <a href="./community.html">커뮤니티</a>
    <a href="./use.html">EPA이용방법</a>
    <a href="./mypage.html">마이페이지</a>
</div>
<h1 id="info_text">클릭 후 운동 전 스트레칭으로 부상을 예방하세요!</h1>
<div class="image-containers">
    <div class="roww">
        <div class="image-with-text">
           <a href="https://www.youtube.com/watch?v=XdFhIyu_7Vw&t=12s">
            <img src="${cpath}/resources/css/img/스트레칭1.jpg" alt="Image 1"></a> 
           
        </div>
        <div class="image-with-text">
            <a href="https://www.youtube.com/watch?v=ahbAnkN4KJ0&t=3s">
                <img src="${cpath}/resources/css/img/스트레칭2.jpg" alt="Image 2"></a>
           
        </div>
        <div class="image-with-text">
            <a href="https://www.youtube.com/watch?v=7gR50n00rQ4">
                <img src="${cpath}/resources/css/img/스트레칭3.jpg" alt="Image 4"></a>
        </div>
    </div>
    <div class="roww">
        <div class="image-with-text">
          <a href="https://www.youtube.com/watch?v=WVIk4Aja4b4">
            <img src="${cpath}/resources/css/img/스트레칭4.jpg" alt="Image 4"></a>  
        </div>
        <div class="image-with-text">
            <a href="https://www.youtube.com/watch?v=cJqOpyhy9rI">
                <img src="${cpath}/resources/css/img/스트레칭5.jpg" alt="Image 5"> </a>
        </div>
        <div class="image-with-text">
            <a href="https://www.youtube.com/watch?v=yyjOhsNEqtE">
                <img src="${cpath}/resources/css/img/스트레칭6.jpg" alt="Image 6"></a>

        </div>
    </div>
</div>
<footer>
    <div class="inner">
      <div class="footer-message">당신의 올바른 자세를 돕기 위해 EPA가 함께합니다.</div>
      <div class="footer-copyright">Copyright 2024 All ⓒ rights reserved</div>
      <div class="footer-contact">Designed by 바른자세</div>
    </div>
</footer>
</body>
</html>
