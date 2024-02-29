<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>

<c:set var="cpath" value="${pageContext.request.contextPath}" />
<c:set var="memId" value="${sessionScope.loginMember.MEM_ID}" />

<script>
	var cpath = "${pageContext.request.contextPath}";
</script>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>웹카메라 영상 좌우 반전</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/4.3.2/socket.io.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="${cpath}/resources/css/style.css">
</head>
<style>
#videoElement, #canvasElement {
	transform: scaleX(-1);
}

#videoElement {
	width: 600px;
	margin-top: 30px;
	margin-left: 100px;
	height: 600px;
	display: none;
}

#ex_video {
    width: 600px;
    height: 600px;
    position: absolute;
    bottom: 0;
    right: 70px; /* 조절 가능한 값으로 설정, 예: 300px */
}

#processedImage {
    width: 600px;
    height: 400px;
	margin-top: 60px;
	margin-left : 40px;
}

#startButton, #stopButton {
	padding: 10px 20px;
	font-size: 16px;
	background-color: #4CAF50;
	color: white;
	border: none;
	cursor: pointer;
	border-radius: 5px;
	margin-bottom: 10px;
}

#startButton:hover, #stopButton:hover {
	background-color: #45a049;
}

#startButton {
	display: block;
	margin: 0 auto;
}

#stopButton {
	display: none;
	margin: 0 auto;
}

footer {
	position: absolute;
	margin-top: auto;
	width: 100%;
	margin-bottom: -200px;
}
</style>
<body>
	<header>
		<a href="#"><img id="login_icon"
			src="${cpath}/resources/img/login.png" width="20" height="20"></img></a>
		<a href="${cpath}/Logout.do">로그아웃</a>
	</header>
	<div class="navbar">
		<a href="${cpath}/mainLogin.do"><img id="icon"
			src="${cpath}/resources/img/mainlogo.png" width="150" height="80"></img></a>
		<a href="${cpath}/info.do">운동정보</a> <a href="${cpath}/boardList.do">커뮤니티</a>
		<a href="${cpath}/use.do">EPA이용방법</a> <a href="${cpath}/mypage.do">마이페이지</a>
	</div>
	<button id="startButton">시작하기</button>
	<button id="stopButton" style="display: none;">종료하기</button>
	<img id="processedImage" src="" alt="Processed Image"
		style="display: none;">
	<!-- 초기에는 이미지를 숨김 처리 -->
	<video id="videoElement" autoplay></video>
	<video id="ex_video" autoplay muted loop>
		<source src="${cpath}/resources/video/스탠딩 사이드 크런치.mp4"
			type="video/mp4">
	</video>

	<canvas id="canvasElement" width="400" height="300"
		style="display: none;"></canvas>


	<footer>
		<div class="inner">
			<div class="footer-message">당신의 올바른 자세를 돕기 위해 EPA가 함께합니다.</div>
			<div class="footer-copyright">Copyright 2024 All ⓒ rights
				reserved</div>
			<div class="footer-contact">Designed by 바른자세</div>
		</div>
	</footer>
	<script>
  
//이미지 요소 가져오기
  const processedImageElement = document.getElementById('processedImage');

  // 이미지가 로드되었을 때 호출되는 이벤트 핸들러
  processedImageElement.onload = function() {
    // 이미지가 로드되면 보여주기
    processedImageElement.style.display = 'block';
  };

  // 이미지가 로드되지 않았을 때 호출되는 이벤트 핸들러
  processedImageElement.onerror = function() {
    // 이미지가 없으면 숨기기
    processedImageElement.style.display = 'none';
  };

  // 시작하기 버튼 요소 가져오기
  const startButton = document.getElementById('startButton');
  // 종료하기 버튼 요소 가져오기
  const stopButton = document.getElementById('stopButton');

  let startTime;
  
//시작하기 버튼 클릭 이벤트 핸들러 추가
  startButton.addEventListener('click', function() {
      // 비디오 실행
      startVideo();
      // 시작한 시간 기록
      startTime = new Date().getTime();
      // 시작하기 버튼 숨기고, 종료하기 버튼 보이기
      startButton.style.display = 'none';
      stopButton.style.display = 'block';

      // 타이머 업데이트 간격 설정 (1초마다)
      timerIntervalId = setInterval(updateTimer, 1000);
  });

  stopButton.addEventListener('click', function() {
	    // 비디오 종료
	    stopVideo();
	    // setInterval 함수 종료
	    clearInterval(intervalId);

	    // 비동기로 운동 종료 요청 보내기
	    fetch(cpath + '/stopExercise', {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json'
	        },
	        // 여기에 필요한 데이터를 JSON 형태로 전송할 수 있습니다.
	        // 예: body: JSON.stringify({ memId: '사용자 아이디' }),
	    })
	    .then(response => response.text())
	    .then(message => {
	        // 클라이언트에게 받은 메시지를 적절한 방식으로 처리
	        alert(message);
	    })
	    .catch(error => {
	        console.error('운동 종료 요청 오류:', error);
	    });

	    // 시작하기 버튼 보이기, 종료하기 버튼 숨기기
	    startButton.style.display = 'block';
	    stopButton.style.display = 'none';
	});

  function updateTimer() {
	    const currentTime = new Date().getTime();
	    const elapsedTime = Math.floor((currentTime - startTime) / 1000); // 경과 시간 계산 (초 단위)

	    // 타이머를 화면에 표시 (예: 아래는 콘솔에 출력하는 예시)
	    console.log(`경과 시간: ${elapsedTime}초`);
	  }

  // 비디오 실행 함수
  function startVideo() {
    navigator.mediaDevices.getUserMedia({ video: true })
      .then(function(stream) {
        const video = document.getElementById('videoElement');
        const canvas = document.getElementById('canvasElement');
        const ctx = canvas.getContext('2d');
        
        video.srcObject = stream;
        video.play();

        // 비디오 캡처 및 전송 간격 설정
        intervalId = setInterval(captureFrame, 200);

        function captureFrame() {
          ctx.clearRect(0, 0, canvas.width, canvas.height);
          ctx.save();
          ctx.scale(-1, 1);
          ctx.drawImage(video, -canvas.width, 0, canvas.width, canvas.height);
          ctx.restore();
          
          captureAndSend();
        }

        function captureAndSend() {
          canvas.toBlob(function(blob) {
            const formData = new FormData();
            formData.append('image', blob, 'captured_image.jpg');

            fetch('http://localhost:5000/epa/upload', {
              method: 'POST',
              body: formData,
              headers: {
                'Origin': 'http://localhost:8080'
              }
            })
            .then(response => response.blob())
            .then(blob => {
              // 이미지 업데이트
              processedImageElement.src = URL.createObjectURL(blob);
            })
            .catch(error => {
              console.error('이미지 업로드 오류:', error);
            });
          }, 'image/jpeg');
        }
      })
      .catch(function(err) {
        console.error('웹카메라 액세스 오류:', err);
      });
  }

  // 비디오 종료 함수
  function stopVideo() {
    const video = document.getElementById('videoElement');
    // 비디오 정지
    video.pause();
    // 비디오 소스 제거
    video.srcObject = null;
  }
  </script>
</body>
</html>