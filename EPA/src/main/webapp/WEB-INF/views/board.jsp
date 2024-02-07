<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="community.css">
    <title>board list</title>
    <style>
      tr:hover {
      background-color: #f5f5f5;
      }
    </style>
</head>
<body>
<header>
    <a href="./login.html">로그인</a>
    <span>&nbsp;</span>
    <a href="./join.html">회원가입</a>
</header>
<div class="navbar">
    <img id="icon" src="./img/mainlogo.png" width="70" height="65"></Img>
    <a id="logo" href="main.html">EPA</a>
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
  <span>&nbsp;&nbsp;&nbsp;</span>
  <a class="fromCenter" href="#">Q&A</a>
</div>
<br>
<div><button id="wirter" type="submit">글쓰기</button></div>

<table>
  <thead>
      <tr>
          <th id="num">NO</th>
          <th>카테고리</th>
          <th>제목</th>
          <th>내용</th>
          <th>작성 시간</th>
      </tr>
  </thead>
  <tbody>
      <tr>
          <td id="num">1</td>
          <td>식단관리</td>
          <td>첫 번째 게시물 제목</td>
          <td>첫 번째 게시물 내용입니다.</td>
          <td>2024-02-05 10:30</td>
      </tr>
      <!-- 추가 게시물은 이어서 나열할 수 있습니다. -->
      <tr>
          <td id="num">2</td>
          <td>일상</td>
          <td>두 번째 게시물 제목</td>
          <td>두 번째 게시물 내용입니다.</td>
          <td>2024-02-06 14:45</td>
      </tr>
  </tbody>
</table>
<footer>
    <div class="inner">
      <div class="footer-message">당신의 올바른 자세를 돕기 위해 EPA가 함께합니다</div>
      <div class="footer-copyright">Copyrigh 2024 All ⓒ rights reserved</div>
      <div class="footer-contact">Designed by 바른자세</div>
    </div>
  </footer>

</body>
</html>