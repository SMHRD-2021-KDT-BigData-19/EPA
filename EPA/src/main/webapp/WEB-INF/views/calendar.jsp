<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang='en'>
<head>
    <title>EPA</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
          <link rel="stylesheet" href="assets/css/calmain.css" />
      <link rel="stylesheet" href="assets/css/main.css" />
       <link rel="stylesheet" href="${cpath}/resources/css/style.css">
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar/index.global.min.js'></script>

    <style>
        #calendar {
        	background-color : white;
            width: 70%;
            height: 70%;
            overflow : hidden;
            margin-top: 50px !important;
            margin-left: 50px !important;
            width: 700px !important;
            height: 550px !important;
            font-family: 'SejonghospitalBold';
        }
        .fc-scrollgrid {
          overflow: hidden !important;
        }
      
        .fc-view-harness {
          overflow: hidden !important;
        }
        #yrModal {
            position: fixed;
            width: 100%;
            height: 100%;
            background-color: rgb(255, 238, 230, 0.7);
            display: none;
            z-index: 1000;
        }
        

        #cont {
            margin: 50px auto;
            width: 30%;
            height: 70%;
            background-color: rgb(255, 179, 179);
            color: white;
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
  <a href="${cpath}/"><img id="icon" src="${cpath}/resources/css/img/mainlogo.png" width="150" height="80"></a>
  <a href="./info.html">운동정보</a>
  <a href="./community.html">커뮤니티</a>
  <a href="./use.html">EPA이용방법</a>
  <a href="./mypage.html">마이페이지</a>

</div>
    <div id="yrModal">
        <div id="cont" style="text-align: center;">
            <br>
            <h1>일정을 입력해주세요!</h1>
            운동시작일 <br>
            <input type="text" id="schStart" value=""><br>
            운동종료일<br>
             <input type="text" id="schEnd" value=""><br><br>
            예방접종/진료종류<br>
            <select>
             <option id="schTitle" value=""> 운동코드1<br><br></option>
             <option id="schTitle" value=""> 운동코드2<br><br></option>
             <option id="schTitle" value=""> 운동코드3<br><br></option>
            </select>
            <br><br>
            운동 완료 여부: <br>
             완료<input type="radio"  id="schYes" value="Y"  name="check" checked />
             미완 <input type="radio" id="schNo" value="N" name="check" /><br><br>
            배경색<input type="color" id="schBColor" value="">
            글자색<input type="color" id="schFColor" value=""><br><br>
            <button onclick="fCalAdd()">추가</button>
            <button onclick="fMClose()">닫기</button>
        </div>
    </div>

      <div id="Wrapper">
       <div id='calendar' style="text-align:center; width:50%; height: 50%; margin: 0 auto;"></div>
      <div>
        <button>zz</button>
      </div>
    
      </div>
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/jquery.dropotron.min.js"></script>
         <script src="assets/js/browser.min.js"></script>
         <script src="assets/js/breakpoints.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>
      <script>
        const YrModal = document.querySelector("#yrModal");
        const calendarEl = document.querySelector('#calendar');
        const mySchStart = document.querySelector("#schStart");
        const mySchEnd = document.querySelector("#schEnd");
        const mySchTitle = document.querySelector("#schTitle");
        const mySchYes = document.querySelector("#schYes");
        const mySchNo = document.querySelector("#schNo");
        const mySchAllday = document.querySelector("#allDay");
        const mySchBColor = document.querySelector("#schBColor");
        const mySchFColor = document.querySelector("#schFColor");

        const headerToolbar = {
               left: 'prevYear,prev,next,nextYear today',
                 center: 'title',
                 right: 'dayGridMonth,dayGridWeek,timeGridDay'
        }

        const calendarOption = {
            height: '700px',
            expandRows: true,
            slotMinTime: '09:00',
            slotMaxTime: '18:00',
            initialView: 'dayGridMonth',
            locale: 'kr',      
            selectable: true,   
            selectMirror: false,  
            navLinks: false,      
            weekNumbers: false,   
            editable: true,
     
            dayMaxEventRows: true,  
       
            nowIndicator: true,
   
        }

        const calendar = new FullCalendar.Calendar(calendarEl, calendarOption);
        calendar.render();

        calendar.on("eventAdd", info => console.log("Add:", info));
        calendar.on("eventChange", info => console.log("Change:", info));
        calendar.on("eventRemove", info => console.log("Remove:", info));
        
        calendar.on("eventClick", info => {
            console.log("eClick:", info);
            if (confirm("일정을 삭제하시겠습니까?")) {
                info.event.remove();
            }
            console.log('Event: ', info.event.extendedProps);
            console.log('Coordinates: ', info.jsEvent);
            console.log('View: ', info.view);
      
            info.el.style.borderColor = 'red';
        });
        calendar.on("eventMouseEnter", info => console.log("eEnter:", info));
        calendar.on("eventMouseLeave", info => console.log("eLeave:", info));
        calendar.on("dateClick", info => console.log("dateClick:", info));
        calendar.on("select", info => {
            console.log("체크", info);

            mySchStart.value = info.startStr;
            mySchEnd.value = info.endStr;

            YrModal.style.display = "block";
        });

        function fCalAdd() {
            if (!mySchTitle.value) {
                alert("*예방접종/진료종류 입력해주세요!*")
                mySchTitle.focus();
                return;
            }
            let bColor = mySchBColor.value;
            let fColor = mySchFColor.value;
            if (fColor == bColor) {
                bColor = "black";
                fColor = "yellow";
            }

            let event = {
                start: mySchStart.value,
                end: mySchEnd.value,
                title: mySchTitle.value,
                backgroundColor: bColor,
                textColor: fColor
            };
            

            calendar.addEvent(event);
            fMClose();
        }

        function fMClose() {
            YrModal.style.display = "none";
        }
       
    </script>
    <br><br><br>
</body>
</html>