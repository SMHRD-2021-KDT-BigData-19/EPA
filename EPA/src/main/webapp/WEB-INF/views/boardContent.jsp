<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="${cpath}/resources/css/style.css">
    <link rel="stylesheet" href="${cpath}/resources/css/community.css">
    <style>
        #small {
            margin-right: 70%;
        }
        #midium {
            font-size: 14px;
        }
        input {
            width: 900px;
            height: 25px;
            font-size: 15px;
        }
        button {
            background-color: #3F568B;
            color: aliceblue;
            border-radius: 5px;
        }ㄴㄴㄴㄴㄴㄴ
    </style>
</head>
<body>
<script type="text/javascript">
	function goDelete() {
		location.href="<c:url value='/boardDelete.do/${vo.BD_NO}'/>";
		
	}
	function goUpdate() {
		location.href="${cpath}/boardUpdateForm.do?BD_NO=${vo.BD_NO}";
	
	}
	function goList() {
		location.href="${cpath}/boardList.do";
	
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
    <a id="logo" href="main.html">EPA</a>
    <a href="./info.html">운동정보</a>
    <a href="./community.html">커뮤니티</a>
    <a href="./use.html">EPA이용방법</a>
    <a href="./mypage.html">마이페이지</a>
</div>
<div class="panel-body">
    <table class="table table-hover table-striped">
        <tr>
            <td><b>제목</b></td>
            <td>${vo.BD_T}</td>
        </tr>

        <tr>
            <td><b>내용</b></td>
            
            <% // 스크립틀릿
    			 	pageContext.setAttribute("newLine", "\n");
    			  %>
    			
    		<td>${fn:replace(vo.BD_C, newLine, "<br>") }</td>
        </tr>
        
        <tr id="midium">
            <td><b>작성자</b></td>
            <td>${vo.MEM_ID}</td>
        </tr>
        
        <tr id="small">
            <td style="text-align: right;"></td>
            <td style="text-align: right;">작성일&nbsp;:&nbsp;&nbsp;${vo.BD_DATE}&nbsp;
            <button onclick="goUpdate()">수정</button>
            <button onclick="goDelete()">삭제</button>
            <button onclick="goList()">목록</button>
            </td>
        </tr>
        <tr>
              <td>
                <b>댓글</b></td>
              <td><input type="text">&nbsp;<button>작성</button></td>
        </tr>
        <tr>
            <td></td>
            <td>댓글내용1</td>
        </tr>
    </table>
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