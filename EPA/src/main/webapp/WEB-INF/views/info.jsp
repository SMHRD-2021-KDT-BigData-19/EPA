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
.image-container {
    padding: 0 20px;
    margin-top: 50px;
    margin-bottom: 100px;
}

.row {
    display: flex;
    justify-content: space-around; /* 이미지 간격을 좁게 조정 */
    margin-bottom: 20px; /* 각 행 사이의 간격 조정 */
    padding: 0; /* 이미지 사이의 간격을 조정 */
}
.row img {
    max-width: 100%; 
    height: auto; /* 이미지 비율 유지 */
    margin-bottom: 0; /* 이미지 아래 여백 제거 */
    border: 1px solid lightblue;
}

.image-with-text {
    position: relative; 
}

.image-with-text p {
    position: absolute; 
    top: 10px; 
    left: 50%; /* 이미지의 왼쪽으로부터 절반의 위치로 이동 */
    transform: translateX(-50%); /* 텍스트를 수평으로 중앙으로 이동 */
    color: black; 
    font-size: 18px; 
    font-weight: bold; 
    font-family: 'NPSfontBold';
}
#info_text {
    text-align: center; /* 가운데 정렬 */
    background-color: aliceblue;
    padding: 10px;
    display: inline-block; 
    border-radius: 10px; 
    margin-left: 34%;
    width: fit-content; /* 내용에 맞게 너비 설정 */
    font-family: 'NPSfontBold';
}

/* 운동 전 스트레칭하기 버튼 스타일 */
.button{
	margin-top: 20px; 
	display: block; 
	margin-left: 82%;
	background-color: white;
	color: black;
	border: 2px solid lightblue;
	width: 200px;
	height: 50px;
	border-radius: 10px;
	font-weight: bold;
	text-align: center;
	line-height: 50px;
	font-family: 'NPSfontBold';
	}
  
</style>
<body>
<header>
  <a href="#"><img id="login_icon" src="${cpath}/resources/img/login.png" width="20" height="20"></img></a>
    <a href="${cpath}/Logout.do">로그아웃</a>
</header>
<div class="navbar">
    <a href="${cpath}/mainLogin.do"><img id="icon" src="${cpath}/resources/img/mainlogo.png" width="150" height="80"></img></a>
    <a href="${cpath}/info.do">운동정보</a>
    <a href="${cpath}/boardList.do">커뮤니티</a>
    <a href="${cpath}/use.do">EPA이용방법</a>
    <a href="${cpath}/mypage.do">마이페이지</a>
</div>
<h1 id="info_text">운동 선택 후 당신의 자세를 확인하세요!</h1>
<a href="${cpath}/stretching.do" class="button">운동 전 스트레칭하기</a>
<div class="image-container">
    <div class="row">
        <div class="image-with-text">
            <a href="${cpath}/exercise.do"> <img src="${cpath}/resources/img/스탠딩사이드크런치.jpg" alt="Image 1"></a>
            <p>스탠딩사이드크런치</p>
        </div>
        <div class="image-with-text">
            <a href="${cpath}/exercise2.do">
            <img src="${cpath}/resources/img/푸쉬업.jpg" alt="Image 2">
            <p>푸쉬업</p>
            </a>
        </div>
        <div class="image-with-text">
        	<a href="${cpath}/exercise3.do">
            <img src="${cpath}/resources/img/런지.jpg" alt="Image 3">
            <p>런지</p>
            </a>
        </div>
    </div>
    <div class="row">
        <div class="image-with-text">
            <a href="#" onclick="showAlert()">
            <img src="${cpath}/resources/img/레그레이즈.jpg" alt="Image 4">
            <p>레그레이즈</p>
            </a>
        </div>
        <div class="image-with-text">
        	<a href="#" onclick="showAlert()">
            <img src="${cpath}/resources/img/v업.jpg" alt="Image 5">
            <p>v업</p>
            </a>
        </div>
        <div class="image-with-text">
            <a href="#" onclick="showAlert()">
            <img src="${cpath}/resources/img/싯업.jpg" alt="Image 6">
            <p>싯업</p>
            </a>
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
<script>
    function showAlert() {
        alert("미구현입니다");
    }
</script>
</body>
</html>
