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
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<title>Your Website</title>
</head>
<style>
#memMContainer{
	font-family: 'SejonghospitalBold';
    font-size: 20px;
    margin-left: 50px;
}
#MEM_M{
 margin-top: 20px;
        width: 400px;
        height: 70px;
        position: absolute;
        border: 2px solid #ccc;
        border-radius: 10px;
        padding: 10px; 
        font-size: 16px; /* 텍스트 크기 설정 */
        resize: none; /* 사용자가 텍스트 상자 크기를 조정하지 못하도록  */
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
        font-family: 'SejonghospitalBold'; 
}
 .submit {
   		margin-top: 125px;
    margin-left: 320px;
    font-family: 'SejonghospitalBold';
    background-color: #dcdcdc;
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    cursor: pointer;
    border-radius: 12px;
    transition-duration: 0.4s;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}
  }
  body > div.container > div.profile-card{
  margin-bottom: 30px}
  
  body > div.container > div.profile-card > form > img{ 
  margin-left: 110px
  }
  .container {
        margin-bottom: 30px; /* 프로필 카드 아래 여백 추가 */
    }

    footer {
        margin-top: 30px; /* 푸터 위 여백 추가 */
    }
     
</style>
<body>
	<header>
		<a href="${cpath}/Logout.do">로그아웃</a>
		<!--     <span>&nbsp;</span>
    <a href="./join.html">회원가입</a> -->
	</header>
	<div class="navbar">
		<a href="#"><img id="icon"
			src="${cpath}/resources/img/mainlogo.png" width="150" height="80"></img></a>
		<a href="${cpath}/info.do">운동정보</a> <a href="${cpath}/boardList.do">커뮤니티</a>
		<a href="${cpath}/use.do">EPA이용방법</a> <a href="${cpath}/mypage.do">마이페이지</a>
	</div>
	<div class="container">
		<div class="profile-card">
			<form action="${cpath}/message.do" method="post">
				<img src="${cpath}/resources/img/사용자.png" alt="프로필 사진">
				<h2>${memId}님</h2>
				<br><br><br>
				<div id="memMContainer">${memM}</div>
				<input type="text" name="MEM_M" id="MEM_M"
					placeholder="${memM}"> <input type="submit"
					value="수정하기" class="submit">
			</form>
		</div>


		<div class="bar">
			<div class="progress-text">
				<b>이번 달 운동 목표 진행률 
			</div>
			<progress class="progress1" value="25" max="31"></progress>
		</div>
	</div>
	<div class="bar">
		<div class="progress-text2">
			<b>이번 달 운동 진행률</b>
		</div>
		<progress class="progress2" value="3" max="30"></progress>
		<div class="button-container">
			<a href="${cpath}/calendar" class="btn-3d khaki">운동루틴 설정</a> 
			<a href="${cpath}/level" class="btn-3d powderblue">등급 확인</a> 
			<a href="${cpath}/mypagecorrection" class="btn-3d lightpink">회원정보 수정</a>
		</div>
	</div>

	<script>
		// Load MEM_M value using AJAX on page load
		$(document).ready(function() {
			$.ajax({
				type : "GET",
				url : "${cpath}/getMEM_M",
				success : function(data) {
					$("#memMContainer").text("상태 메시지: " + data);
				},
				error : function() {
					console.error("AJAX 요청 오류");
				}
			});
		});
	</script>

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

