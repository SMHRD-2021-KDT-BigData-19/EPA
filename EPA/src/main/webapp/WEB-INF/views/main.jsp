<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="${cpath}/resources/css/style.css">
    <title>Your Website</title>
</head>
<body>
<header>
    <a href="./login.html">로그인</a>
    <span>&nbsp;</span>
    <a href="./join.html">회원가입</a>
</header>
<div class="navbar">
    <a href="#"><img id="icon" src="${cpath}/resources/img/mainlogo.png"width="150" height="80"></img></a>
    <a id="logo" href="main.html">EPA</a>
    <a href="./info.html">운동정보</a>
    <a href="./community.html">커뮤니티</a>
    <a href="./use.html">EPA이용방법</a>
    <a href="./mypage.html">마이페이지</a>
</div>
<video width="100%" height="auto" autoplay muted loop>
    <source src="${cpath}/resources/video/epa_video.mp4" type="video/mp4">
</video>

<footer>
    <div class="inner">
      <div class="footer-message">당신의 올바른 자세를 돕기 위해 EPA가 함께합니다</div>
      <div class="footer-copyright">Copyrigh 2024 All ⓒ rights reserved</div>
      <div class="footer-contact">Designed by 바른자세</div>
    </div>
  </footer>

</body>
</html>
