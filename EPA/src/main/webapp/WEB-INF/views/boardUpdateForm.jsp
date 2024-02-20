<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${cpath}/resources/css/style.css">
    <link rel="stylesheet" href="${cpath}/resources/css/community.css">
    <style>
        #wirter {
            background-color: #3F568B;
            color: aliceblue;
            border-radius: 10px;    
        }
        
        form {
            margin-top: -100px;
        }
        #category {
        	width: 120px;
        }
        
    </style>
</head>
<body>
<header>
   <a href="#"><img id="login_icon" src="${cpath}/resources/img/login.png" width="20" height="20"></img></a>
    <a href="${cpath}/login.do">로그인</a>
    <span>&nbsp;</span>
    <span>&nbsp;</span>
    <span>&nbsp;</span>
    <a href="#"><img id="member_icon" src="${cpath}/resources/img/member.png" width="20" height="20"></img></a>
    <a href="${cpath}/join.do">회원가입</a>
</header>
<div class="navbar">
    <a href="#"><img id="icon" src="${cpath}/resources/img/mainlogo.png"width="150" height="80"></img></a>
    <a href="./info.html">운동정보</a>
    <a href="./community.html">커뮤니티</a>
    <a href="./use.html">EPA이용방법</a>
    <a href="./mypage.html">마이페이지</a>
</div>
<div class="container">
    <form id="postForm" action="${cpath}/boardUpdate.do" method="post">
    		<input type="hidden" name="BD_NO" value="${vo.BD_NO}">
        <label for="title"><b>제목</b></label>
        <input type="text" id="title" value="${vo.BD_T}" name="BD_T">
        <input type="text" id="memid" name="MEM_ID">
        <label for="category"><b>카테고리</b></label>
    	<select id="category" name="BD_HEAD">
        <option value="운동루틴">운동루틴</option>
        <option value="오운완">오운완</option>
        <option value="식단관리">식단관리</option>
    	</select>

        <label for="content"><b>내용</b></label>
        <textarea id="content" name="BD_C">${vo.BD_C}</textarea>
        
        <button id="wirter" type="submit">작성</button>
    </form>
</div>
    <footer>
        <div class="inner">
          <div class="footer-message">당신의 올바른 자세를 돕기 위해 EPA가 함께합니다</div>
          <div class="footer-copyright">Copyright 2024 All ⓒ rights reserved</div>
          <div class="footer-contact">Designed by 바른자세</div>
        </div>
      </footer>

</body>
</html>