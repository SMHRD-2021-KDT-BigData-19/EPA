<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<title>EPA</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <link rel="stylesheet" href="assets/css/calmain.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="${cpath}/resources/css/style.css">
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar/index.global.min.js'></script>
    <!-- jquery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JavaScript -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- fullcalendar CDN -->
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
    <!-- fullcalendar 언어 CDN -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<style>
  /* body 스타일 */
  html, body {
   
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
  /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
  .fc-header-toolbar {
    padding-top: 1em;
    padding-left: 1em;
    padding-right: 1em;
  }
  a {
    color: black; 
    text-decoration: none; /* 하이퍼 링크 밑줄 제거 */
    transition: color 0.3s; 
  }
  
a:hover {
    color: black; 
  }
  
  .navbar {
    overflow: hidden;
    background: white;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    justify-content: flex-end;
    display: flex;
    font-family: 'SejonghospitalBold';
}

.navbar a {
    display: block;
    color: black;
    text-align: center;
    padding: 0px 16px;
    text-decoration: none;
    transition: background-color 0.3s;
    font-size: 18px;
    margin-top: 25px;
}
/* 운동정보 링크에 회색 배경색 적용 */
.navbar a:nth-child(2):not(#icon):hover {
    background-color: #ddd;
    color: black;
    margin-top: 0;
    margin-bottom: 0;
    padding-top: 25px;
    padding-bottom: 25px;
}

/* 커뮤니티 링크에 회색 배경색 적용 */
.navbar a:nth-child(3):not(#icon):hover {
    background-color: #ddd;
    color: black;
    margin-top: 0;
    margin-bottom: 0;
    padding-top: 25px;
    padding-bottom: 25px;
}

/* EPA이용방법 링크에 회색 배경색 적용 */
.navbar a:nth-child(4):not(#icon):hover {
    background-color: #ddd;
    color: black;
    margin-top: 0;
    margin-bottom: 0;
    padding-top: 25px;
    padding-bottom: 25px;
}

/* 마이페이지 링크에 회색 배경색 적용 */
.navbar a:nth-child(5):not(#icon):hover {
    background-color: #ddd;
    color: black;
    margin-top: 0;
    margin-bottom: 0;
    padding-top: 25px;
    padding-bottom: 25px;
}

/* 아이디가 "icon"인 이미지 링크에 hover 효과 적용하지 않음 */
.navbar a#icon:hover {
    background-color: transparent;
}


#login_icon{
   margin-top:10px;
}

/* 로그인,회원가입 상단바 */
header{
    text-align: right;
    background-color: white;
    margin-right: 50px;
    font-family: 'SejonghospitalBold';
    margin-bottom: 10px;
}
/* 로고글씨 */
#logo {
    margin-right: auto;
    font-size: 50PX;
    background-color: white;
    font-family: 'Tenada';
}
/* 로고사진 */
#icon{
    margin-top: -30px;
    margin-left: -1900px;
}
  
#calendar{
font-family: 'NPSfontBold';
width:1000px;
margin-left: 230px;
margin-top: 20px;
}


footer{
margin-top: 20px;}

#exampleModal > div > div{
font-family: 'NPSfontBold';
border-radius:20px;
background-color:#FFE3EE;}

.modal-title {
  text-align: center;
  margin: 0 auto;
}
#saveChanges {
    background-color: #007bff; /* 파란색 */
    border-color: #007bff;
    color: #fff; /* 흰색 */
  }

  /* 취소 버튼 */
  #cancelButton {
    background-color: #6c757d; /* 회색 */
    border-color: #6c757d;
    color: #fff; /* 흰색 */
  }
</style>
</head>
<body style="padding:10px;">
<header>
  
      <a href="${cpath}/Logout.do">로그아웃</a>
      <!--     <span>&nbsp;</span>
    <a href="./join.html">회원가입</a> -->
 
</header>
<div class="navbar">
  <a href="${cpath}/"><img id="icon" src="${cpath}/resources/img/mainlogo.png" width="150" height="80"></a>
  <a href="./info.html">운동정보</a>
  <a href="./community.html">커뮤니티</a>
  <a href="./use.html">EPA이용방법</a>
  <a href="./mypage.html">마이페이지</a>
</div>
  <div id='calendar-container'  style="text-align: center;">
    <div id='calendar'></div>
  </div>
  <form action="${cpath}/calInsert.do" method="post">
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">운동루틴</h5>
          
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          운동코드 : 
          
          <select name="EX_ID">
            <option id="EX_ID" value="code1">운동코드1</option>
            <option id="EX_ID" value="code2">운동코드2</option>
            <option id="EX_ID"  value="code3">운동코드3</option>
          </select><br /><br>
          
          일정이름 : <input type="text" name="EXPL_ID" id="EXPL_ID" /><br /><br>
          <input type="hidden" id="writer" name="MEM_ID" value="${loginMember.MEM_ID}" />
          운동시작시간 : <input type="datetime-local" name="EX_SDATE" id="EX_SDATE" /><br /><br>
          운동종료시간 : <input type="datetime-local" name="EX_FDATE" id="EX_FDATE" /><br /><br>
          배경색상 :
          <select name="P_COLOR" id="P_COLOR">
              <option value="red">빨강색</option>
              <option value="orange">주황색</option>
              <option value="pink">핑크색</option>
              <option value="green">초록색</option>
              <option value="blue">파랑색</option>
              <option value="navy">남색</option>
              <option value="DarkSlateGray">어두운회색</option>
              <option value="black">검정색</option>
              <option value="purple">보라색</option>
          </select><br>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary" id="saveChanges">추가</button>
          <button type="button" class="btn btn-secondary" id="cancelButton">취소</button>
          
        </div>
      </div>
    </div>
  </div>
</form>
  <script>
  (function(){
     $(function(){
       // calendar element 취득
       var calendarEl = $('#calendar')[0];
       // full-calendar 생성하기
       var calendar = new FullCalendar.Calendar(calendarEl, {
         height: '600px', // calendar 높이 설정
         expandRows: true, // 화면에 맞게 높이 재설정
         slotMinTime: '08:00', // Day 캘린더에서 시작 시간
         slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
        /*   customButtons:{
            mySaveButton:{
             text: "루틴저장하기",
             click: function() {
                  if (confirm("저장하시겠습니까?")) {
                    var allEvents = calendar.getEvents();
                    console.log("이벤트 저장 로직을 구현하세요.");
                   
                }            
                }
            }
          }, */
         headerToolbar: {
           left: 'prev,next today',
           center: 'title',
           right: 'dayGridMonth' //timeGridWeek,timeGridDay,listWeek
         },
         initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
         navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
         editable: true, // 수정 가능?
         selectable: true, // 달력 일자 드래그 설정가능
         nowIndicator: true, // 현재 시간 마크
         dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
         locale: 'ko', // 한국어 설정
         
         select: function(arg) {
           // 모달을 표시
           $("#exampleModal").modal("show");
           var startDate = new Date(arg.start).toISOString().substring(0, 16);
           var endDate = new Date(arg.end).toISOString().substring(0, 16);
           $("#EX_ID").val('code1');
           $("#EXPL_ID").val("");
           $("#EX_SDATE").val(startDate);
           $("#EX_FDATE").val(endDate);
           $("#P_COLOR").val("pink"); // 기본 색상 설정

           
           // '추가' 버튼 클릭 이벤트 핸들러 설정
           $("#saveChanges").off("click").on("click", function() {
             var eventData = {
               title: $(list.EXPL_ID).val(), // 사용자가 입력한 일정 이름
               start: $(list.EX_SDATE).val(), // 사용자가 선택한 시작 시간
               end: $(list.EX_FDATE).val(), // 사용자가 선택한 종료 시간
               color: $(list.P_COLOR).val() // 사용자가 선택한 배경색상
             };
             if (eventData.title && eventData.start && eventData.end) {
               if (eventData.start > eventData.end) {
                 alert("시작 시간이 종료 시간보다 늦을 수 없습니다.");
               } else {
                 calendar.addEvent(eventData);
                 $("#exampleModal").modal("hide");
                 
               }
             } else {
               alert("비어있는 일정을 채워주세요.");
             }
             
            $("#cancelButton").off("click").on("click", function() {
                $("#exampleModal").modal("hide"); // 모달을 숨깁니다.
              });
           });
           $("#deleteEvent").hide(); // 새 이벤트 추가시 '삭제' 버튼 숨김
         },
         eventClick: function(info) {
           var eventObj = info.event;
           if (confirm("이 이벤트를 삭제하시겠습니까?")) {
               info.event.remove(); // 이벤트 삭제
         }
         },

      });
      // 캘린더 랜더링
      calendar.render();
    });
  })();
</script>
<footer>
      <div class="inner">
         <div class="footer-message">당신의 올바른 자세를 돕기 위해 EPA가 함께합니다.</div>
         <div class="footer-copyright">Copyright 2024 All ⓒ rights
            reserved</div>
         <div class="footer-contact">Designed by 바른자세</div>
      </div>
</footer>
</body>
</html>