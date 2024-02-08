<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 페이지</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">

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
	<form action="${cpath}/Join.do" method="post">
		<div class="wrap">
			<div class="login">

				<div>
					<h2>회원가입</h2>
					<div class="login_id">
						<h4>이메일</h4>
						<input type="email" name="email" id="email" placeholder="이메일">
					</div>
					<div class="login_id_id">
						<h4>아이디</h4>
						<input type="text" name="login_id" id="login_id" placeholder="아이디">
						<button class="id_check">중복 확인</button>
					</div>
					<div class="login_pw">
						<h4>비밀번호</h4>
						<input type="password" name="login_pw" id="login_pw"
							placeholder="비밀번호">
					</div>
<!-- 					<div class="login_pw">
						<h4>비밀번호 확인</h4>
						<input type="password" name="confirm_password"
							id="confirm_password" placeholder="비밀번호 확인">
					</div> -->
				</div>


				<div>
					<h2 style="visibility: hidden;">회원가입</h2>
					<div class="login_id">
						<h4>닉네임</h4>
						<input type="text" name="nick" id="nick" placeholder="닉네임">
					</div>
					<div class="login_id">
						<h4>키</h4>
						<input type="text" name="height" id="height" placeholder="키">
					</div>
					<div class="login_id">
						<h4>몸무게</h4>
						<input type="text" name="weight" id="weight" placeholder="몸무게">
					</div>
					<div class="login_id">
						<h4>생일</h4>
						<input type="text" name="birth" id="birth">
					</div>
					<div class="gender-selector">
						<label for="male">남성</label> <input type="radio" id="male"
							name="gender" value="male"> <label for="female">여성</label>
						<input type="radio" id="female" name="gender" value="female">
					</div>
				</div>
				<div class="submit">
					<input type="submit" value="가입하기">
				</div>
			</div>
		</div>
	</form>
</body>
</html>