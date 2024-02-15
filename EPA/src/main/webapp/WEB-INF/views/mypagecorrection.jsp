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
</head>
<style>
    .correction{
        font-family: 'NPSfontBold';
    }
    .correction2{
        font-family: 'NPSfontBold';
    }
    .btn-save{
        font-family: 'NPSfontBold';
        margin-top: -30px;
    }
    .btn-cancel{
        font-family: 'NPSfontBold';
        margin-top: -30px;
    }
</style>
<body>
<header>
    <a href="${cpath}/Logout.do">로그아웃</a>
<!--     <span>&nbsp;</span>
    <a href="./join.html">회원가입</a> -->
</header>
<div class="navbar">ㄴㄴㄴ
    <a href="#"><img id="icon" src="${cpath}/resources/img/mainlogo.png" width="150" height="80"></img></a>
    <a href="${cpath}/info.do">운동정보</a>
    <a href="${cpath}/boardList.do">커뮤니티</a>
    <a href="${cpath}/use.do">EPA이용방법</a>
    <a href="${cpath}/mypage.do">마이페이지</a>
</div>
    <div class="container">
        <div class="profile-card">
            <img src="${cpath}/resources/img/사용자.png" alt="프로필 사진">
            <h2>${memId}님</h2>
            <h4 id="message">헤어진 기념 바프할거다.....</h4>
        </div>
        
        <div>
        <form action="${cpath}/update.do" method="post">
            <input type="password" id="MEM_PW" name="MEM_PW" placeholder="변경할 비밀번호를 입력해 주세요">
            <br>
            <label for="nickname">닉네임</label>
            <br>
            <input type="text" id="MEM_NM" name="MEM_NM" placeholder="변경할 닉네임을 입력해 주세요">
            <br>
            <br>
            <label for="email">이메일</label>
            <br>
            <input type="email" id="MEM_EMAIL" name="MEM_EMAIL" placeholder="변경할 이메일을 입력해 주세요">
            <br>
            <br>
            <label for="height">키(cm)</label>
            <br>
            <input type="text" id="MEM_H" name="MEM_H" placeholder="내용을 입력해 주세요">
            <br>
            <br>
            <label for="weight">몸무게(kg)</label>
            <br>
            <input type="text" id="MEM_W" name="MEM_W" placeholder="내용을 입력해 주세요">
            <br>
            <br>
            	
                <input class="btn-save" type="submit">저장</input>
<!--                 <button class="btn-save" type="submit"><b>저장</b></button> -->
                <button class="btn-cancel" ><b>취소</b></button>
        </form>
        </div>
    <a href="${cpath}/delete.do">탈퇴</a>
    <footer>
        <div class="inner">
            <div class="footer-message">당신의 올바른 자세를 돕기 위해 EPA가 함께합니다.</div>
            <div class="footer-copyright">Copyright 2024 All ⓒ rights reserved</div>
            <div class="footer-contact">Designed by 바른자세</div>
        </div>
    </footer>
</body>
</html>
