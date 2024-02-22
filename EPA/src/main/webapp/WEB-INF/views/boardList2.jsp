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
      
      
    #wirter {
        background-color: #FFC0CB;
        border: none;
        color: white;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        font-weight: bold; 
        cursor: pointer;
        border-radius: 10px;
        margin-left: 1330px;
    }

    #wirter:hover {
        background-color: #FF8E99;
    }
   
    tr{
    font-family: 'SejonghospitalBold';}
     table thead tr th {
        text-align: center;
    }
      table{
    width:90%;}
    </style>
</head>
<body>
<script type="text/javascript">
 	function goForm() {
		location.href="${cpath}/boardForm.do";
	}
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
  <a href="#"><img id="login_icon" src="${cpath}/resources/img/login.png" width="20" height="20"></img></a>
    <a href="${cpath}/Logout.do">로그아웃</a>
</header>
<div class="navbar">
  	<a href="${cpath}/mainLogin.do"><img id="icon" src="${cpath}/resources/img/mainlogo.png"width="150" height="80"></img></a>
    <a href="${cpath}/info.do">운동정보</a>
    <a href="${cpath}/boardList.do">커뮤니티</a>
    <a href="${cpath}/use.do">EPA이용방법</a>
    <a href="${cpath}/mypage.do">마이페이지</a>
</div>
<h1><a href="${cpath}/boardList.do">커뮤니티</a></h1>
<br>
<div class="category">
  <a class="fromCenter" href="${cpath}/boardList2.do">운동루틴</a>
  <span>&nbsp;&nbsp;&nbsp;</span>
  <a class="fromCenter" href="${cpath}/boardList3.do">오운완</a>
  <span>&nbsp;&nbsp;&nbsp;</span>
  <a class="fromCenter" href="${cpath}/boardList4.do">식단관리</a>
  
</div>
<br>
<div><button id="wirter" onclick="goForm()">글쓰기</button></div>

<table>
  <thead>
      <tr>
          <th id="num" class="boardtd">NO</th>
          <th class="boardtd">카테고리</th>
          <th class="boardtd">제목</th>
          <th class="boardtd">내용</th>
          <th class="boardtd">작성자</th>
          <th class="boardtd">작성 시간</th>
      </tr>
  </thead>
  <tbody>
  	<c:forEach items="${list2}" var="b">
      <tr>
          <td id="num" class="boardtd">${b.BD_NO}</td>
          <td class="boardtd">${b.BD_HEAD}</td>
          <c:url var="contentLink" value="/boardContent.do/${b.BD_NO}" />
          <td class="boardtd"><a href="${contentLink}">${b.BD_T}</a></td>
          <td class="boardtd">${b.BD_C}</td>
          <td class="boardtd">${b.MEM_ID}</td>
          <td class="boardtd">${b.BD_DATE}</td>
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