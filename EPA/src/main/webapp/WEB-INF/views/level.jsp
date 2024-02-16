<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<c:set var="memId" value="${sessionScope.loginMember.MEM_ID}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${cpath}/resources/css/style.css">
<title>Your Website</title>
<style>
.circle-container {
	position: relative;
}

.circle-container::before {
	content: "";
	display: block;
	width: 100px;
	height: 100px;
	background-color: gold;
	border-radius: 50%;
	position: absolute;
	top: 110px;
	left: 460px;
	transform: translate(-50%, -50%);
}

.circle-text {
	position: absolute;
	top: 110px;
	left: 460px;
	transform: translate(-50%, -50%);
	color: white;
	font-size: 18px;
	font-weight: bold;
	font-family: 'NPSfontBold';
}

.profile-text h2 {
	color: black;
	margin-bottom: 70%;
	margin-left: 225px;
	font-family: 'NPSfontBold';
}

.profile-text h3 {
	color: black;
	margin-top: 20px;
	margin-left: 300px;
	font-family: 'NPSfontBold';
}

.levelbar {
	width: 200px;
	position: absolute;
	bottom: 350px;
	left: 50%;
	transform: translateX(-50%);
}

.levelpro1 {
	position: absolute;
	top: 40px;
	left: 100px;
	width: 500px;
	height: 50px;
	background-image: linear-gradient(to right, red, red);
	margin-left: 50px;
}

.levelpro2 {
	margin-top: 200px;
	position: absolute;
	top: -60px;
	left: 100px;
	width: 500px;
	height: 50px;
	background-image: linear-gradient(to right, red, red);
	margin-left: 50px;
}

.leveltext {
	position: absolute;
	top: 20px;
	right: -250px;
	transform: translateX(-50%);
	font-size: 16px;
	font-family: 'NPSfontBold';
}
/* progress 진행률 숫자로 표현하기 */
progress::after {
	content: attr(value) "/" attr(max); /* value와 max 속성 값 표시 */
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%); /* 가운데 정렬 */
	font-size: 16px;
	font-weight: bold;
}

.leveltext2 {
	position: absolute;
	top: -50px; /* progress 위로  */
	right: -300px;
	transform: translateX(-50%);
	font-size: 16px;
	margin-top: 160px;
	font-family: 'NPSfontBold';
}

/* progress 두개 bar색상과 안에 텍스트색상 설정 */
progress::-webkit-progress-bar {
	background: #eee;
} /* Chrome */
progress::-webkit-progress-value {
	background: #c2c2c2;
} /* Chrome */
progress::-moz-progress-bar {
	background: #eee;
} /* Firefox */
progress, progress[role] {
	appearance: none;
	-moz-appearance: none;
	-webkit-appearance: none;
	border: none;
	background-size: auto;
	width: 500px;
	height: 50px; /* 높이값과 넓이값은 맘대로 조정 */
	margin: 10px 0;
}

progress[role]:after {
	background-image: none;
}

.levelpro1::-webkit-progress-value {
	background: green !important;
}

.levelpro2::-webkit-progress-value {
	background: yellowgreen !important;
}
/* IE10 이상 */
progress {
	color: #c2c2c2;
}

progress.levelpro1 {
	color: white !important;
}

progress.levelpro2 {
	color: white !important;
}
</style>
</head>
<body>
	<header>
		<a href="#"><img id="login_icon"
			src="${cpath}/resources/img/login.png" width="20" height="20"></img></a>
		<a href="${cpath}/login.do">로그인</a> <span>&nbsp;</span> <span>&nbsp;</span>
		<span>&nbsp;</span> <a href="#"><img id="member_icon"
			src="${cpath}/resources/img/member.png" width="20" height="20"></img></a>
		<a href="${cpath}/join.do">회원가입</a>
	</header>
	<div class="navbar">
		<a href="#"><img id="icon"
			src="${cpath}/resources/img/mainlogo.png" width="150" height="80"></img></a>
		<a href="./info.html">운동정보</a> <a href="./community.html">커뮤니티</a> <a
			href="./use.html">EPA이용방법</a> <a href="./mypage.html">마이페이지</a>
	</div>
	<div class="container">
		<div class="profile-card">
			<img src="${cpath}/resources/css/img/사용자.png" alt="프로필 사진">
			<h2>${memId}님</h2>
			<h4 id="message">헤어진 기념 바프할거다.....</h4>
		</div>
		<div class="profile-text">
			<div class="circle-container">
				<h2>${memId}님의현재등급은 "중급자"입니다!</h2>
				<div class="circle-text">중급자</div>
			</div>
			<div class="levelbar">
				<div class="leveltext">
					<b>출석 수</b>
				</div>
				<progress class="levelpro1" value="${ATTEND_COUNT}" max="70"></progress>
			</div>

			<div class="levelbar">
				<div class="leveltext2">
					<b>운동 완료 횟수</b>
				</div>
				<progress class="levelpro2" value="3" max="70"></progress>
			</div>
		</div>
	</div>
	    <div class="attendance-button">
        <form action="${cpath}/attend" method="post">
            <button type="submit">출석하기</button>
        </form>
    </div>
	<footer>
		<div class="inner">
			<div class="footer-message">당신의 올바른 자세를 돕기 위해 EPA가 함께합니다.</div>
			<div class="footer-copyright">Copyright 2024 All ⓒ rights
				reserved</div>
			<div class="footer-contact">Designed by 바른자세</div>
		</div>
	</footer>
</body>
</html>