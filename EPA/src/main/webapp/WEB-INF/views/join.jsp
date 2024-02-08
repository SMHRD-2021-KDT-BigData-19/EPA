<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/53a8c415f1.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="./login.css">
</head>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 페이지</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="./login.css">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Noto Sans KR", sans-serif;
}

a {
	text-decoration: none;
	color: black;
}

li {
	list-style: none;
}

.wrap {
	width: 100%;
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	background: white;
}

.login {
	width: 60%;
	min-height: 700px; /* 더 큰 높이로 설정 */
	background: white;
	border-radius: 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	flex-direction: column;
	padding: 0 20px;
}

h2 {
	color: tomato;
	font-size: 2em;
	width: 100%;
	text-align: center;
	margin-bottom: 20px;
}

.login>div {
	width: 48%;
	margin-bottom: 20px;
	align-items: center;
}

.login_id, .login_pw {
	width: 100%;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: flex-start;
}

.login_id input, .login_pw input {
	width: 100%;
	height: 50px;
	border-radius: 30px;
	margin-top: 10px;
	padding: 0px 20px;
	border: 1px solid lightgray;
	outline: none;
}

.submit {
	text-align: center;
	width: 100%;
	margin-top: 20px;
}

.submit input {
	width: 50%;
	height: 50px;
	border: 0;
	outline: none;
	border-radius: 40px;
	background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
	color: white;
	font-size: 1.2em;
	letter-spacing: 2px;
}

.gender-selector {
	display: flex;
	align-items: center;
	justify-content: center;
	margin-top: 20px;
}

.gender-selector label {
	margin: 0 10px;
}
/* 회원가입 텍스트가 자꾸 잘려서 상단 마진을 추가함 */
.login>div:nth-child(1)>h2 {
	margin-top: 300px;
}

.login_id_id input {
	width: calc(80% - 10px);
	height: 50px;
	border-radius: 30px 30px;
	margin-top: 10px;
	padding: 0px 20px;
	border: 1px solid lightgray;
	outline: none;
}

.id_check {
	width: 20%;
	height: 50px;
	border-radius: 30px 30px;
	margin-top: 10px;
	background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
	color: white;
	border: 0;
	outline: none;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="wrap">
		<form action="${cpath}/Join.do" method="post">
			<div class="login">

				<div>
					<h2>회원가입</h2>
					<div class="login_id">
						<h4>이메일</h4>
						<input type="email" name="MEM_EMAIL" id="MEM_EMAIL"
							placeholder="이메일">
					</div>
					<div class="login_id_id">
						<h4>아이디</h4>
						<input type="text" name="MEM_ID" id="MEM_ID" placeholder="아이디">
						<button class="id_check">중복 확인</button>
					</div>
					<div class="login_pw">
						<h4>비밀번호</h4>
						<input type="password" name="MEM_PW" id="MEM_PW"
							placeholder="비밀번호">
					</div>
					<div class="login_pw">
						<h4>비밀번호 확인</h4>
						<input type="password" placeholder="비밀번호 확인">
					</div>
				</div>


				<div>
					<h2 style="visibility: hidden;">회원가입</h2>
					<div class="login_id">
						<h4>이름</h4>
						<input type="text" name="MEM_NM" id="MEM_NM" placeholder="닉네임">
					</div>
					<div class="login_id">
						<h4>키</h4>
						<input type="text" name="MEM_H" id="MEM_H" placeholder="키">
					</div>
					<div class="login_pw">
						<h4>몸무게</h4>
						<input type="text" name="MEM_W" id="MEM_W" placeholder="몸무게">
					</div>
					<div class="login_pw">
						<h4>생일</h4>
						<input type="date" name="MEM_AGE" id="MEM_AGE">
					</div>
					<div class="gender-selector">
						<label for="male">남성</label> <input type="radio" id="male"
							name="MEM_G" value="MEM_G"> <label for="female">여성</label>
						<input type="radio" id="female" name="MEM_G" value="MEM_G">
					</div>
				</div>
				<div class="submit">
					<input type="submit" value="가입하기">
				</div>
			</div>
		</form>
	</div>
</body>
</html>
