<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>

<c:set var="cpath" value="${pageContext.request.contextPath}" />
<c:set var="memId" value="${sessionScope.loginMember.MEM_ID}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${cpath}/resources/css/style.css">
<title>Your Website</title>
<style>
#memMContainer {
   font-family: 'SejonghospitalBold';
   font-size: 20px;
   margin-left: -40px;
   overflow: hidden; /* 텍스트가 넘칠 경우 숨김 처리 */
   white-space: nowrap;
}

#MEM_M {
   margin-top: 20px;
   width: 400px;
   height: 70px;
   position: absolute;
   border: 2px solid #ccc;
   border-radius: 10px;
   padding: 10px;
   font-size: 16px; /* 텍스트 크기 설정 */
   resize: none; /* 사용자가 텍스트 상자 크기를 조정하지 못하도록  */
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
   font-family: 'SejonghospitalBold';
   margin-left: -110px;
   overflow: hidden;
}

body>div.container>div.profile-card>form:nth-child(1)>img {
   margin-left: 0px;
}

.submit {
   margin-top: 62%;
   font-family: 'SejonghospitalBold';
   background-color: #dcdcdc;
   border: none;
   color: white;
   padding: 10px 20px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   cursor: pointer;
   border-radius: 5px;
   transition-duration: 0.4s;
   box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
   margin-left: 115px;
   position: absolute;
   bottom: 10px; /* 원하는 위치로 조정 */
   right: 120px; /* 원하는 위치로 조정 */
}

.submit:hover {
   background-color: gray
}

}
body>div.container>div.profile-card {
   margin-bottom: 30px
}

body>div.container>div.profile-card>form>img {
   margin-left: 110px
}

.container {
   margin-bottom: 30px;
}

.profile-text h2 {
   position: absolute;
   top: 0%;
   left: 70%;
   transform: translate(-25%, -50%);
   color: black;
   font-family: 'NPSfontBold';
   text-align: center;
   z-index: 1;
   white-space: nowrap;
}

.profile-text h3 {
   color: black;
   margin-top: 20px;
   margin-left: 300px;
   font-family: 'NPSfontBold';
}

.levelbar {
   width: 200px;
   position: absolute;
   bottom: 350px;
   left: 50%;
   transform: translateX(-50%);
}

.levelpro1 {
   position: absolute;
   top: -30px;
   width: 500px;
   height: 50px;
   background-image: linear-gradient(to right, red, red);
   margin-left: 50px;
}

.levelpro2 {
   margin-top: 200px;
   position: absolute;
   top: -90px;
   width: 500px;
   height: 50px;
   background-image: linear-gradient(to right, red, red);
   margin-left: 50px;
}

.leveltext {
   position: absolute;
   top: -50px;
   right: -330px;
   transform: translateX(-50%);
   font-size: 20px;
   font-family: 'NPSfontBold';
}
/* progress 진행률 숫자로 표현하기 */
progress::after {
   content: attr(value) "/" attr(max); /* value와 max 속성 값 표시 */
   position: absolute;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%); /* 가운데 정렬 */
   font-size: 16px;
   font-weight: bold;
}

.leveltext2 {
   position: absolute;
   top: -80px;
   right: -400px;
   transform: translateX(-50%);
   font-size: 20px;
   margin-top: 160px;
   font-family: 'NPSfontBold';
}

/* progress 두개 bar색상과 안에 텍스트색상 설정 */
progress::-webkit-progress-bar {
   background: #eee;
} /* Chrome */
progress::-webkit-progress-value {
   background: #c2c2c2;
} /* Chrome */
progress::-moz-progress-bar {
   background: #eee;
} /* Firefox */
progress, progress[role] {
   appearance: none;
   -moz-appearance: none;
   -webkit-appearance: none;
   border: none;
   background-size: auto;
   width: 500px;
   height: 50px; /* 높이값과 넓이값은 맘대로 조정 */
   margin: 10px 0;
}

progress[role]:after {
   background-image: none;
}

.levelpro1::-webkit-progress-value {
   background: green !important;
}

.levelpro2::-webkit-progress-value {
   background: yellowgreen !important;
}
/* IE10 이상 */
progress {
   color: #c2c2c2;
}

progress.levelpro1 {
   color: white !important;
}

progress.levelpro2 {
   color: white !important;
}

.button-container {
   display: flex;
   justify-content: flex-end;
   align-items: flex-start;
   margin-top: -100px;
   position: absolute;
   margin-left: 230px;
}

.attend {
   font-family: 'SejonghospitalBold';
   background-color: #dcdcdc;
   border: none;
   color: white;
   padding: 10px 20px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   cursor: pointer;
   border-radius: 12px;
   transition-duration: 0.4s;
   box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
   margin-left: -50px;
}

footer {
   margin-top: 30px; /* 푸터 위 여백 추가 */
}

#ques {
   margin-top: 50px;
   margin-right: 60px;
   float: right;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
   <header>
      <a href="#"><img id="login_icon"
         src="${cpath}/resources/img/login.png" width="20" height="20"></img></a>
      <a href="${cpath}/Logout.do">로그아웃</a>
   </header>
   <div class="navbar">
      <a href="${cpath}/mainLogin.do"><img id="icon"
         src="${cpath}/resources/img/mainlogo.png" width="150" height="80"></a>
      <a href="${cpath}/info.do">운동정보</a> <a href="${cpath}/boardList.do">커뮤니티</a>
      <a href="${cpath}/use.do">EPA이용방법</a> <a href="${cpath}/mypage.do">마이페이지</a>
   </div>
   <a id="ques"><img src="${cpath}/resources/img/ques.png" width="50"
      height="50"></a>
   <div class="container">
      <div class="profile-card">
         <form action="${cpath}/message.do" method="post">
            <img
               src="<c:choose>
    <c:when test='${tearVO.ATTEND_COUNT <= 1}'>${cpath}/resources/img/Tear/입문.jpg</c:when>
    <c:when test='${tearVO.ATTEND_COUNT <= 30}'>${cpath}/resources/img/Tear/초급.jpg</c:when>
    <c:when test='${tearVO.ATTEND_COUNT <= 90}'>${cpath}/resources/img/Tear/중급.jpg</c:when>
    <c:when test='${tearVO.ATTEND_COUNT <= 180}'>${cpath}/resources/img/Tear/상급.jpg</c:when>
    <c:when test='${tearVO.ATTEND_COUNT >= 365}'>${cpath}/resources/img/Tear/마스터.jpg</c:when>
    <c:otherwise>${cpath}/resources/img/default_profile.png</c:otherwise>
</c:choose>"
               alt="프로필 사진">
            <h2>${memId}님</h2>
            <br> <br> <br>
            <div id="memMContainer">${memM}</div>
            <input type="text" name="MEM_M" id="MEM_M" placeholder="${memM}">
            <input type="submit" value="수정하기" class="submit">
         </form>
         <form action="${cpath}/updateTear" method="post"
            onsubmit="return handleAttendance()">
            <button type="submit" class="attend">출석하기</button>
         </form>
      </div>

      <div class="profile-text">

         <h2 id="id_">${memId}님의
            현재 등급은
            <c:choose>
               <c:when test="${tearVO.ATTEND_COUNT <= 1}">
                  <span style="color: red;">"입문"</span>
               </c:when>
               <c:when test="${tearVO.ATTEND_COUNT <= 30}">
                  <span style="color: red;">"초급"</span>
               </c:when>
               <c:when test="${tearVO.ATTEND_COUNT <= 90}">
                  <span style="color: red;">"중급"</span>
               </c:when>
               <c:when test="${tearVO.ATTEND_COUNT <= 180}">
                  <span style="color: red;">"상급"</span>
               </c:when>
               <c:when test="${tearVO.ATTEND_COUNT >= 365}">
                  <span style="color: red;">"마스터"</span>
               </c:when>
            </c:choose>
            입니다!
         </h2>
         <div class="levelbar">
            <div class="leveltext">
               <b>출석 수</b>
            </div>
            <c:set var="attendCount" value="${tearVO.ATTEND_COUNT}" />
            <progress class="levelpro1" value="${attendCount}" max="70"></progress>
         </div>

         <div class="levelbar">
            <div class="leveltext2">
               <b>운동 완료 횟수</b>
            </div>
            <progress class="levelpro2" value="3" max="70"></progress>
         </div>
         <div class="button-container">
            <a href="${cpath}/calendar.do" class="btn-3d khaki">운동루틴 설정</a> <a
               href="${cpath}/mypagecorrection" class="btn-3d lightpink">회원정보
               수정</a>
         </div>
      </div>
   </div>
   <footer>
      <div class="inner">
         <div class="footer-message">당신의 올바른 자세를 돕기 위해 EPA가 함께합니다.</div>
         <div class="footer-copyright">Copyright 2024 All ⓒ rights
            reserved</div>
         <div class="footer-contact">Designed by 바른자세</div>
      </div>
   </footer>
   <script>
      window.onload = function() {
         var memMContainer = document.getElementById("memMContainer");
         var memMInput = document.getElementById("MEM_M");

         memMInput.addEventListener("input", function() {
            var textWidth = this.scrollWidth;
            var inputWidth = this.offsetWidth;
            if (textWidth > inputWidth) {
               this.style.width = textWidth + "px";
            } else {
               this.style.width = "400px"; // 기본 너비로 복원
            }
         });
      };

      document
            .getElementById("ques")
            .addEventListener(
                  "mouseover",
                  function() {
                     // 말풍선이 표시될 위치 계산
                     var iconPosition = this.getBoundingClientRect();
                     var tooltip = document.createElement("div");
                     tooltip.innerHTML = "*등급은 출석 수를 반영합니다.<br>"
                           + "<span style='font-size: 15px;'>(단, 출석 수 반영은 회원가입 후 다음 날부터 적용됩니다.)</span><br>"
                           + "입문 : 2회 미만<br>" + "초급 : 2회 ~ 30회<br>"
                           + "중급 : 31회 ~ 90회<br>"
                           + "상급 : 91회 ~ 180회<br>" + "마스터 : 365회 이상"; // 말풍선 내용 설정

                     // 말풍선 스타일 설정
                     tooltip.style.position = "absolute";
                     tooltip.style.top = (iconPosition.top + 30) + "px"; // 아이콘 위에 위치하도록 설정
                     tooltip.style.right = (window.innerWidth
                           - iconPosition.right + 30)
                           + "px"; // 아이콘 왼쪽에 위치하도록 설정
                     tooltip.style.backgroundColor = "white";
                     tooltip.style.color = "black";
                     tooltip.style.padding = "15px";
                     tooltip.style.borderRadius = "5px";
                     tooltip.style.border = "2px solid black";
                     tooltip.style.zIndex = "9999";
                     tooltip.style.border = "1px solid #ccc";
                     tooltip.style.boxShadow = "0 2px 4px rgba(0, 0, 0, 0.1)";
                     tooltip.style.maxWidth = "300px";
                     tooltip.style.lineHeight = "1.6"; // 줄 간격 설정
                     tooltip.style.fontFamily = "'omyu_pretty', Arial, sans-serif";
                     tooltip.style.fontSize = "18px";

                     // 말풍선을 body에 추가
                     document.body.appendChild(tooltip);

                     // 아이콘에서 마우스를 벗어났을 때 말풍선을 제거합니다.
                     this.addEventListener("mouseout", function() {
                        document.body.removeChild(tooltip);
                     });
                  });

       function handleAttendance() {
           // AJAX로 서버에 데이터 요청
           var xhr = new XMLHttpRequest();
           xhr.onreadystatechange = function () {
               if (xhr.readyState === 4 && xhr.status === 200) {
                   var attendanceMessage = xhr.responseText;
                   if (attendanceMessage) {
                       alert(attendanceMessage);
                   }
               }
           };
           xhr.open("POST", "${cpath}/updateTear", true);
           xhr.send();
           
           return false; // 폼이 실제로 서버로 제출되지 않도록 합니다.
       }
   </script>
</body>
</html>
