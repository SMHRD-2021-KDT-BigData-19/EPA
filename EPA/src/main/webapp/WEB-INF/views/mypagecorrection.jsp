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
   <link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <title>Your Website</title>
</head>
<style>
    	.btn-save{
	        font-family: 'NPSfontBold';
	        margin-top: -30px;
	        font-size:16px;
	        margin-left: 100px;
   	 }
    	.btn-cancel{
	        font-family: 'NPSfontBold';
	        margin-top: -30px;
	        background-color:#d3d3d3;
   	 }
    	
       .container {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            position: relative;
        }
        .profile-card,
        .corr {
            width: 400px;
            margin: 0 20px;
        }
        .footer {
            margin-top: auto;
            margin-bottom: 0;
            position: relative;
        }
        .footer {
            margin-top: 30px;
            background-color: #f5f5f5;
            padding: 20px;
        }
        .profile-card,
        .corr {
            flex: 1; /* 동일한 너비를 가지도록 설정 */
        }
        
  		body > div.container > div:nth-child(2) > form{
	  		margin-right: 620px;
		    width: 300px;
		    height: 450px;
		    padding: 40px;
		    flex-direction: column;
		    align-items: center;
		    margin-left: 50px;
		    position: relative;
		    border-radius: 50px;
		    margin-top: -70px;}

        
        #MEM_PW,#MEM_NM,#MEM_EMAIL,#MEM_H,#MEM_W{
	        width: 400px; 
	    	height: 40px;
	    	font-family: 'SOGANGUNIVERSITYTTF';
	    	border-radius:20px;
	    	border: 1px solid lightgray;}
	        
     

		label{
		font-family: 'SejonghospitalBold';}
			
        footer {
        position: absolute;
         margin-top:50px;
          bottom: 0;
          width: 100%;
          color: #fff;
          padding: 10px 0;
          text-align: center;
      }
        
</style>
<body>
<header>
   <a href="#"><img id="login_icon" src="${cpath}/resources/img/login.png" width="20" height="20"></img></a>
    <a href="${cpath}/Logout.do">로그아웃</a>
</header>
<div class="navbar">
    <a href="${cpath}/mainLogin.do"><img id="icon" src="${cpath}/resources/img/mainlogo.png" width="150" height="80"></img></a>
    <a href="${cpath}/info.do">운동정보</a>
    <a href="${cpath}/boardList.do">커뮤니티</a>
    <a href="${cpath}/use.do">EPA이용방법</a>
    <a href="${cpath}/mypage.do">마이페이지</a>
</div>
    <div class="container">
        <div>
          
        </div>
        
        <div>  
        <form action="${cpath}/update.do" method="post">
        	<label for="password">비밀번호</label><br>
            <input type="password" id="MEM_PW" name="MEM_PW" placeholder="변경할 비밀번호를 입력해 주세요"><br><br>
            <input type="password" id="MEM_PW" name="MEM_PW" placeholder="변경할 비밀번호를 한 번 더 입력해 주세요">
            <br><br>
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
               
                <input class="btn-save" type="submit"></input>
                <a href="${cpath}/delete.do" class="btn-cancel">탈퇴</a>
        </form>
        </div>
    
    <footer>
        <div class="inner">
            <div class="footer-message">당신의 올바른 자세를 돕기 위해 EPA가 함께합니다.</div>
            <div class="footer-copyright">Copyright 2024 All ⓒ rights reserved</div>
            <div class="footer-contact">Designed by 바른자세</div>
        </div>
    </footer>
</body>
</html>