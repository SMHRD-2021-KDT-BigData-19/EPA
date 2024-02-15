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
    <link rel="stylesheet" href="${cpath}/resources/css/community.css">
    <title>boardList</title>
    <style>
      tr:hover {
      background-color: #f5f5f5;
      }
    </style>
</head>
<body>
<script type="text/javascript">
 	function goForm() {
		location.href="${cpath}/boardForm.do";
	}
 </script>
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
<h1>커뮤니티</h1>
<br>
<div class="category">
  <a class="fromCenter" href="#">운동루틴</a>
  <span>&nbsp;&nbsp;&nbsp;</span>
  <a class="fromCenter" href="#">오운완</a>
  <span>&nbsp;&nbsp;&nbsp;</span>
  <a class="fromCenter" href="#">식단관리</a>
  
</div>
<br>
<div><button id="wirter" onclick="goForm()">글쓰기</button></div>

<table>
  <thead>
      <tr>
          <th id="num">NO</th>
          <th>카테고리</th>
          <th>제목</th>
          <th>내용</th>
          <th>작성자</th>
          <th>작성 시간</th>
      </tr>
  </thead>
  <tbody>
  	<c:forEach items="${list}" var="b">
      <tr>
          <td id="num">${b.BD_NO}</td>
          <td>${b.BD_HEAD}</td>
          <c:url var="contentLink" value="/boardContent.do/${b.BD_NO}" />
          <td><a href="${contentLink}">${b.BD_T}</a></td>
          <td>${b.BD_C}</td>
          <td>${b.MEM_ID}</td>
          <td>${b.BD_DATE}</td>
      </tr>
     </c:forEach>
      
  </tbody>
</table>
<footer>
    <div class="inner">
      <div class="footer-message">당신의 올바른 자세를 돕기 위해 EPA가 함께합니다</div>
      <div class="footer-copyright">Copyright 2024 All ⓒ rights reserved</div>
      <div class="footer-contact">Designed by 바른자세</div>
    </div>
</footer>

</body>
</html>