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

progress::after {
	content: attr(value) "/" attr(max);
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 16px;
	font-weight: bold;
}

.leveltext2 {
	position: absolute;
	top: -50px;
	right: -300px;
	transform: translateX(-50%);
	font-size: 16px;
	margin-top: 160px;
	font-family: 'NPSfontBold';
}

progress::-webkit-progress-bar {
	background: #eee;
}

progress::-webkit-progress-value {
	background: #c2c2c2;
}

progress::-moz-progress-bar {
	background: #eee;
}

progress, progress[role] {
	appearance: none;
	-moz-appearance: none;
	-webkit-appearance: none;
	border: none;
	background-size: auto;
	width: 500px;
	height: 50px;
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

progress {
	color: #c2c2c2;
}

progress.levelpro1, progress.levelpro2 {
	color: white !important;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    // DOM이 로드된 후에 실행되도록 설정
    $(document).ready(function() {
        // 현재 ATTEND_COUNT 값으로 초기화
        var attendCount = ${ATTEND_COUNT};
        document.getElementById("attendButton").setAttribute("data-attendCount", attendCount);

        // 클라이언트에서 쿠키를 확인하여 이미 출석한 경우 버튼 비활성화
        var hasAttendedToday = getCookie("attendedToday");
        if (hasAttendedToday) {
            disableAttendButton();
        }

        // 출석 버튼 클릭 시 실행되는 함수
        $("#attendButton").click(function() {
            // 클라이언트에서 쿠키를 설정하여 출석 상태 기록
            setCookie("attendedToday", "true", 1); // 쿠키는 하루간 유지됨

            // 기존 ATTEND_COUNT 값을 가져와 증가
            var currentAttendCount = parseInt($("#attendButton").attr("data-attendCount"));
            currentAttendCount++;
            
            // 새로운 ATTEND_COUNT 값을 버튼에 적용
            $("#attendButton").attr("data-attendCount", currentAttendCount);

            // 기존 ATTEND_COUNT 값을 화면에 표시
            updateAttendCountDisplay(currentAttendCount);

            // 기존 출석 버튼을 비활성화
            disableAttendButton();
        });

        // ATTEND_COUNT 값을 화면에 표시하는 함수
        function updateAttendCountDisplay(count) {
            // 해당 부분에 ATTEND_COUNT를 표시하는 로직 추가
        }

        // 출석 버튼을 비활성화하는 함수
        function disableAttendButton() {
            $("#attendButton").prop("disabled", true);
        }

        // 쿠키 설정 함수
        function setCookie(name, value, days) {
            var expires = "";
            if (days) {
                var date = new Date();
                date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
                expires = "; expires=" + date.toUTCString();
            }
            document.cookie = name + "=" + value + expires + "; path=/";
        }

        // 쿠키 가져오기 함수
        function getCookie(name) {
            var nameEQ = name + "=";
            var ca = document.cookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) === ' ') c = c.substring(1, c.length);
                if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
            }
            return null;
        }
    });
</script>
<!-- 해당 부분에 JavaScript 코드 추가 종료 -->
</head>
<body>
	<header>
		<a href="${cpath}/Logout.do">로그아웃</a>
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
				<h2>${memId}님의현재등급은"중급자"입니다!</h2>
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
		<!-- onClick 속성에 클라이언트 측에서 쿠키를 설정하는 JavaScript 함수를 호출하는 코드 추가 -->
		<form action="${cpath}/attend" method="post">
			<button id="attendButton" type="submit">출석하기</button>
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