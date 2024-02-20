<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>웹카메라 영상 좌우 반전</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/4.3.2/socket.io.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="${cpath}/resources/css/style.css">
</head>
<style>
  #videoElement, #canvasElement {
    transform: scaleX(-1); /* 영상 좌우 반전을 위한 CSS 속성 */
  }
  #videoElement{
     width: 600px;
    margin-top: 30px;
    margin-left: 50px;
    height: 600px;}
  
</style>
<body>
<header>
		<a href="${cpath}/Logout.do">로그아웃</a>
		<!--     <span>&nbsp;</span>
    <a href="./join.html">회원가입</a> -->
	</header>
	<div class="navbar">
		<a href="#"><img id="icon"
			src="${cpath}/resources/img/mainlogo.png" width="150" height="80"></img></a>
		<a href="${cpath}/info.do">운동정보</a> <a href="${cpath}/boardList.do">커뮤니티</a>
		<a href="${cpath}/use.do">EPA이용방법</a> <a href="${cpath}/mypage.do">마이페이지</a>
	</div>
  <video id="videoElement" width="400" autoplay></video>
  <canvas id="canvasElement" width="400" height="300" style="display: none;"></canvas>
  
  
  
  
<footer>
    <div class="inner">
      <div class="footer-message">당신의 올바른 자세를 돕기 위해 EPA가 함께합니다</div>
      <div class="footer-copyright">Copyright 2024 All ⓒ rights reserved</div>
      <div class="footer-contact">Designed by 바른자세</div>
    </div>
  </footer>
  <script>
    // 웹카메라 액세스 권한 요청 및 스트림 표시
    navigator.mediaDevices.getUserMedia({ video: true })
      .then(function(stream) {
        const video = document.getElementById('videoElement');
        const canvas = document.getElementById('canvasElement');
        const ctx = canvas.getContext('2d');
        
        video.srcObject = stream; // 웹카메라 스트림을 비디오 요소의 소스로 설정
        video.play(); // 영상 재생

        // 캡처된 영상을 좌우 반전하여 캔버스에 그리는 함수
        function captureFrame() {
          ctx.clearRect(0, 0, canvas.width, canvas.height); // 캔버스 초기화
          ctx.save(); // 현재 그래픽 상태 저장
          ctx.scale(-1, 1); // 좌우 반전
          ctx.drawImage(video, -canvas.width, 0, canvas.width, canvas.height); // 영상을 캔버스에 그림
          ctx.restore(); // 이전 그래픽 상태로 복원
          
          // 캡처된 이미지를 서버로 전송하는 함수 호출
          captureAndSend();
        }

        // 실시간으로 캡처된 이미지를 서버로 전송하는 함수
        function captureAndSend() {
          canvas.toBlob(function(blob) {
            const formData = new FormData();
            formData.append('image', blob, 'captured_image.jpg'); // Blob 객체를 FormData에 추가

            fetch('http://localhost:5000/epa/upload', {
              method: 'POST',
              body: formData, // FormData 객체 전송
              headers: {
                'Origin': 'http://localhost:8080' // 요청 헤더에 Origin 추가
              }
            })
            .then(response => {
              if (!response.ok) {
                throw new Error('이미지 업로드 실패');
              }
              return response.text(); // 서버로부터 받은 응답 텍스트를 반환
            })
            .then(data => {
              console.log('서버 응답:', data); // 서버로부터 받은 응답 출력
            })
            .catch(error => {
              console.error('이미지 업로드 오류:', error);
            });
          }, 'image/jpeg');
        }

        setInterval(captureFrame, 1000); // 일정 시간마다 캡처 및 반전 적용 (1초마다)
      })
      .catch(function(err) {
        console.error('웹카메라 액세스 오류:', err);
      });
    
    // 웹 소켓 클라이언트 연결
    //const socket = new WebSocket('ws://localhost:5000/socket');
    const socket = io('http://localhost:5000');

    // 연결이 열리면 실행되는 이벤트 핸들러
    socket.onopen = function(event) {
      console.log('WebSocket 연결이 열렸습니다.');
    };

    // 메시지를 받았을 때 실행되는 이벤트 핸들러
    socket.onmessage = function(event) {
      console.log('서버로부터 메시지를 받았습니다:', event.data);
    };

    // 에러가 발생했을 때 실행되는 이벤트 핸들러
    socket.onerror = function(error) {
      console.error('WebSocket 오류:', error);
    };

    // 연결이 닫혔을 때 실행되는 이벤트 핸들러
    socket.onclose = function(event) {
      console.log('WebSocket 연결이 닫혔습니다.');
    };

    // 서버에 메시지를 보내는 함수
    function sendMessage(message) {
      socket.send(message);
    }

  </script>
</body>
</html>
