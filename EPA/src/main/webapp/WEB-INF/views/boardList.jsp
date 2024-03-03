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
    padding: 10px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    font-weight: bold; 
    cursor: pointer;
    border-radius: 10px;
    margin-left: 90px;
    float: left;
    margin-top: 10px; 
    margin-right: 80px;
    margin-bottom: 20px;
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
    input{
       width:300px;
       margin-left: 600px;
    
    }
    
  #inputContainer {
    margin-right: 70px; 
    float: right;
    margin-top: 10px; 
}

#myInput {
    padding: 8px 16px; 
    border: none; 
    border-radius: 20px; 
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    float: left; 
    margin-top:-5px;
}

/* 검색 버튼 스타일 */
#submitButton {
    padding: 15px; 
    width: 40px; 
    height: 40px;
    border: none; 
    background-image: url('${cpath}/resources/img/검색.png'); 
    background-size: cover; 
    background-repeat: no-repeat; 
    background-position: center; 
    cursor: pointer; 
    background-color: transparent;
    float: left;
    margin-left: 10px; 
    margin-top: -5px; 
}
    /* 마우스를 올렸을 때 버튼 스타일 */
   #submitButton:hover {
    opacity: 0.8; /* 호버 효과 */
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
    
    
    
    $(document).ready(function(){
        $("#submitButton").click(function(){
            var inputValue = $("#myInput").val(); // 입력값 가져오기
            $.ajax({
                type: "POST", // 또는 "GET"
                url: "${cpath}/search.do", // 컨트롤러 URL
                data: { input: inputValue }, // 전송할 데이터
                dataType : "json",
                async : false,
                success: callBack,
                error: function(xhr, status, error){
                    // 에러 발생 시 실행할 코드
                    console.error("에러 발생: " + error);
                }
            });
        });
    });
    
    function callBack(data) {
       $("#listTable").hide();
      var bList = "<table>";
      bList += "<thead>";
      bList += "<tr>";
      bList += "<th id='num' class='boardtd'>NO</th>";
      bList += "<th class='boardtd'>카테고리</th>";
      bList += "<th class='boardtd'>제목</th>";
      bList += "<th class='boardtd'>내용</th>";
      bList += "<th class='boardtd'>작성자</th>";
      bList += "<th class='boardtd'>작성 시간</th>";
      bList += "</tr>";
      bList += "</thead>";
      // 여러개의 데이터를 반복문으로 꺼내서 출력
      // 제이쿼리의 반복문 $.each(데이터,데이터를 처리할 함수);
      // 가져온 데이터 배열, 인덱스를 가지고 있음 -> json데이터 인덱스(index),데이터(object)
      bList += "<tbody>";
      $.each(data,(index,obj)=>{
         bList += "<tr>";
         bList += "<td id='num' class='boardtd'>"+obj.bd_NO+"</td>";
         bList += "<td class='boardtd'>"+ obj.bd_HEAD+ "</td>";
         // a태그를 눌렀을때 새로운 페이지X, 새로운요청X, 다른 JS함수로 보내겠다~
         // javascript: 함수이름
         bList += "<td class='boardtd'><a href='javascript:void(0);' onclick='goToContent(" + obj.bd_NO + ")'>" + obj.bd_T + "</a></td>";
         bList += "<td class='boardtd'>"+ obj.bd_C + "</td>";
         bList += "<td class='boardtd'>"+ obj.mem_ID+ "</td>";
         bList += "<td class='boardtd'>"+ obj.bd_DATE+ "</td>";
         bList += "</tr>";   
      });// each끝
      bList += "</tbody>";
      bList += "</table>";
      $("#list").html(bList);
   }// callBack 끝
   
   function goToContent(bd_NO) {
       // 해당 게시물의 상세 내용을 보여주는 페이지로 이동
       window.location.href = "${cpath}/boardContent.do/" + bd_NO;
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
<div>
    <button id="wirter" onclick="goForm()">글쓰기</button>
    <div id="inputContainer">
       <input type="text" id="myInput" name="myInput" placeholder="검색할 내용을 입력해주세요.">
        <button id="submitButton"></button>
    </div>
</div>
<div id="list"></div>
<table id="listTable">
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
     <c:forEach items="${list}" var="b">
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
      <div class="footer-message">당신의 올바른 자세를 돕기 위해 EPA가 함께합니다.</div>
      <div class="footer-copyright">Copyright 2024 All ⓒ rights reserved</div>
      <div class="footer-contact">Designed by 바른자세</div>
    </div>
</footer>

</body>
</html>