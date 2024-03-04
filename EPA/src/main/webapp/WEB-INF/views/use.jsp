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
<style>
.additional-content{
 font-family: 'omyu_pretty';
 margin-top:5%;
 margin-left:10%;

}
 
body > div.additional-content > h3{
color:red;}


#info_img> a:nth-child(1) > img{
border: 2px solid black;}

#info_img > a:nth-child(2) > img{
margin-left:50px;

border: 2px solid black;}
#com_img > a:nth-child(1) > img{
border: 2px solid black;}

#com_img > a:nth-child(2) > img{
margin-left:50px;
border: 2px solid black;}

#my_img > a:nth-child(1) > img{
border: 2px solid black;}

#my_img > a:nth-child(2) > img{
margin-left:50px;
border: 2px solid black;}

#cal_img > a:nth-child(1) > img{
border: 2px solid black;}

#cal_img > a:nth-child(2) > img{
margin-left:50px;
border: 2px solid black;}
</style>
<body>
<script>
$(document).ready(function(){
    adjustFooterPosition(); // 페이지 로드 시 푸터 위치 조정

    $(window).resize(function(){
        adjustFooterPosition(); // 윈도우 크기 변경 시 푸터 위치 재조정
    });

    $(document).on('DOMContentLoaded', function(){
        adjustFooterPosition(); // DOMContentLoaded 이벤트 발생 시 푸터 위치 조정
    });
});

function adjustFooterPosition() {
    var contentHeight = $('body').height(); // 콘텐츠의 높이
    var windowHeight = $(window).height(); // 화면의 높이

    if (contentHeight < windowHeight) {
        $('footer').css({
            'position': 'fixed',
            'bottom': '0',
            'width': '100%'
        });
    } else {
        $('footer').css({
            'position': 'static' // 콘텐츠가 화면보다 클 때는 푸터를 페이지 내에서 유동적으로 위치시킵니다.
        });
    }
}
</script>
<header>
    <a href="#"><img id="login_icon"
			src="${cpath}/resources/img/login.png" width="20" height="20"></img></a>
		<a href="${cpath}/login.do">로그인</a> <span>&nbsp;</span> <span>&nbsp;</span>
		<span>&nbsp;</span> <a href="#"><img id="member_icon"
			src="${cpath}/resources/img/member.png" width="20" height="20"></img></a>
		<a href="${cpath}/join.do">회원가입</a>
</header>
<div class="navbar">
    <a href="${cpath}/main.do"><img id="icon" src="${cpath}/resources/img/mainlogo.png" width="150" height="80"></img></a>
    <a href="${cpath}/info.do">운동정보</a>
    <a href="${cpath}/boardList.do">커뮤니티</a>
    <a href="${cpath}/use.do">EPA이용방법</a>
    <a href="${cpath}/mypage.do">마이페이지</a>
</div>
<div class="additional-content">
    <h1>- EPA란?</h1>
	<h2>EPA(Exercise Posture Analysis)는 운동 자세 분석 서비스로, <br>
		사용자의 운동 자세를 실시간으로 분석하여 올바른 자세로 운동할 수 있도록 도움을 주는 사이트입니다.</h2><br>
	<h1>- 서비스 이용방법</h1>
	<h3>* EPA의 모든 서비스는 로그인 후 사용가능합니다!</h3><br>
	<h2 style="color:blue;">· 운동 정보</h2>
	<h2> - 운동 정보 메뉴에서는 자세 분석을 할 수 있습니다.<br><br>
		 - 운동 전 스트레칭하기 버튼을 클릭하면 간단한 스트레칭 영상이 제공됩니다.<br><br>
		 - 스탠딩 사이드 크런치, 푸쉬업 등 해당 운동을 클릭하면 카메라 허용 알림이 뜹니다. 허용을 누르면, 화면 좌측에 사용자의 웹 카메라가 켜집니다.<br><br> 
		 - 우측에 예시 영상을 보고 운동을 따라하면, EPA에서 자세 분석을 제공합니다.
	</h2>
	<div id="info_img">
	<a><img src="${cpath}/resources/img/운동정보.png" style = "width:600px; height:500px;"></img></a>
	<a><img src="${cpath}/resources/img/운동분석.png" style = "width:600px; height:500px;"></img></a>
	</div>
	<h2 style="color:blue;">· 커뮤니티</h2>
	<h2>- 커뮤니티 탭에서 카테고리별로 글을 작성할 수 있습니다.<br><br>
		- "검색할 내용을 입력해주세요."에 검색어를 입력하면, 해당 검색어가 포함된 게시물을 확인 할 수 있습니다.  </h2>
	
	<div id="com_img">
	<a><img src="${cpath}/resources/img/커뮤니티메인.png" style = "width:600px; height:500px;"></img></a>
	<a><img src="${cpath}/resources/img/커뮤니티작성.png" style = "width:600px; height:500px;""></img></a>
	</div><br>
	<h2 style="color:blue;">· 마이페이지</h2>
	<h2>- 마이페이지 탭에서 상태메세지를 입력 후 수정하기 버튼을 클릭하면 상태메세지를 나타낼 수 있습니다.<br><br>
		- 출석하기 버튼을 클릭하면 우측 그래프에 출석 수가 반영됩니다! 
		    출석을 통해 등업을 할 수 있으며, 우측 상단 ?에서 등업기준을 확인할 수 있습니다.<br><br>
		- 운동 완료 횟수도 그래프를 통해 확인할 수 있습니다.<br><br>
		- 회원정보 수정 버튼을 클릭하면 , 회원 정보를 수정할 수 있습니다.<br><br>
		- 탈퇴 버튼을 누르면 즉시 탈퇴되므로, 신중하게 누르시길 바랍니다!
	</h2>
	<div id="my_img">
	<a><img src="${cpath}/resources/img/마이페이지.png" style = "width:600px; height:500px;"></img></a>
	<a><img src="${cpath}/resources/img/회원정보 수정.png" style = "width:600px; height:500px;"></img></a>
	</div><br><br><br><br><br><br><br>
	<h2>- 마이페이지에서 운동루틴 설정 버튼을 클릭하면, 캘린더에 나의 루틴을 설정할 수 있습니다.</h2>
	<div id="cal_img">
	<a><img src="${cpath}/resources/img/일정추가.png" style = "width:600px; height:500px;"></img></a>
	<a><img src="${cpath}/resources/img/일정추가2.png" style = "width:600px; height:500px;"></img></a>
	</div>
</div><br><br><br><br>
<footer>
    <div class="inner">
      <div class="footer-message">당신의 올바른 자세를 돕기 위해 EPA가 함께합니다.</div>
      <div class="footer-copyright">Copyright 2024 All ⓒ rights reserved</div>
      <div class="footer-contact">Designed by 바른자세</div>
    </div>
  </footer>
</body>
</html>