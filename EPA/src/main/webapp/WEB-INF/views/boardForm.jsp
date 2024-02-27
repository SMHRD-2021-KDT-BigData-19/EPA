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
    <style>
       #wirter {
        background-color: #FFC0CB;
        border: none;
        color: white;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        font-weight: bold; 
        cursor: pointer;
        border-radius: 10px;
        
    }

    #wirter:hover {
        background-color: #FF8E99;
    }
   
        form {
            margin-top: -100px;
        }
        #category {
           width: 120px;
           height:35px;
           font-family: 'SejonghospitalBold';
}
        }
 footer {
    position: fixed;
    bottom: 0;
    width: 100%;
    color: #fff;
    padding: 10px 0;
    text-align: center;
    background-color: #333;
    z-index: 100; 
}

.container {
    padding-bottom: 60px; 
}
    #postForm > label > b{
    font-size:20px;}
    #content{
    height: 250px}
    
   label{
   font-family: 'SejonghospitalBold';
}
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
    <a href="${cpath}/main.do"><img id="icon" src="${cpath}/resources/img/mainlogo.png"width="150" height="80"></img></a>
    <a href="${cpath}/info.do">운동정보</a>
    <a href="${cpath}/boardList.do">커뮤니티</a>
    <a href="${cpath}/use.do">EPA이용방법</a>
    <a href="${cpath}/mypage.do">마이페이지</a>
</div>
<div class="container">
    <form id="postForm" action="${cpath}/boardInsert.do" method="post" enctype="multipart/form-data">
        <label for="title"><b>제목</b></label>
        <input type="text" id="title" name="BD_T">
        <input type="hidden" id="writer" name="MEM_ID" value="${loginMember.MEM_ID}">
        <label for="category"><b>카테고리</b></label>
       <select id="category" name="BD_HEAD">
        <option value="운동루틴">운동루틴</option>
        <option value="오운완">오운완</option>
        <option value="식단관리">식단관리</option>
       </select><br>
       
       <input type="file" class="real-upload" accept="image/*" id="file" name="file" required multiple>
       

        <label for="content"><b>내용</b></label>
        <textarea id="content" name="BD_C"></textarea>
        
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