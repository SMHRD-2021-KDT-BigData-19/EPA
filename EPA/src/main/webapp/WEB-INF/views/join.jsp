<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<link rel="stylesheet" href="${cpath}/resources/css/style.css"">
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
	min-height: 100vh;
	margin-top: 30px;
	display: flex;
	align-items: center;
	justify-content: center;
	background: white;
}

.login {
	width: 60%;
	min-height: 700px; 
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
	margin-top: -20px
}

.submit {
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

     form {
        width: 90%; 
        max-width: 500px; 
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    form div {
        width: 100%;
        margin-bottom: 20px;
        align-items: center;
        display: flex;
        justify-content: space-between; 
    }

    form .signup-heading {
        font-size: 1.5em; 
        margin-bottom: 20px; 
    }

    form input[type="text"],
    form input[type="password"],
    form input[type="email"],
    form input[type="date"] {
        width: 100% !important; 
        max-width: 400px; 
        height: 50px !important; 
        border-radius: 30px; 
        margin-top: 10px;
        padding: 0px 20px;
        border: 1px solid lightgray;
        outline: none;
    }

    form .id_check {
        width: 80px; 
        height: 50px; 
        border-radius: 30px; 
        background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
        color: white;
        font-size: 0.8em; 
        letter-spacing: 1px; 
        cursor: pointer;
        margin-left: 10px;
    }

    form .submit input[type="submit"] {
        width: 100%;
        max-width: 400px; 
        height: 40px; 
        border: 0;
        outline: none;
        border-radius: 20px; 
        background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
        color: white;
        font-size: 1em; 
        letter-spacing: 1px; 
        cursor: pointer;
    }


    @media (max-width: 600px) {
        form {
            width: 100%;
            padding: 0 10px; 
        }
    }
    
    h5{
    margin-top:-20px; !important}

form input[type="text"]#id {
       margin-left: -80px !important;}

form .id_check {
   margin-left: 310px;
   margin-top: -50px
   
}

form input[type="radio"]{
 
} 
.male {
    margin-left: -100px;
}

.female {
   position: relative;
    top: -60px;
    margin-left: 100px;
}

</style>
</head>
<body>
	<div class="wrap">
		<div class="login">

			<div>
				<form action="${cpath}/joinInsert.do" method="post">
					<h2>회원가입</h2>
					<h5>*모든 항목 필수 입력*</h5><br><br>
					
						
						<h4>아이디</h4>
						<input type="text" name="MEM_ID" id="id" placeholder="아이디" style="width: 60%; max-width: 300px;" required>
						<button class ="id_check">중복 확인</button><br>
						
						<h4>비밀번호</h4>
						<input type="password" name="MEM_PW" placeholder="비밀번호" required><br>
						
						
						<h4>비밀번호 확인</h4>
                    	<input type="password" name="confirm_password" id="confirm_password" placeholder="비밀번호 확인" required><br>
				
						
						<h4>이메일</h4>
						<input type="email" name="MEM_EMAIL" id="email" placeholder="이메일" required><br>
					
				
				<h2 style="visibility: hidden;">회원가입</h2>
				
					<h4>닉네임</h4>
					<input type="text" name="MEM_NM" placeholder="닉네임" required><br>
				
					<h4>키</h4>
					<input type="text" name="MEM_H" placeholder="키" required><br>
				
					<h4>몸무게</h4>
					<input type="text" name="MEM_W" placeholder="몸무게" required><br>
				
					<h4>생일</h4>
					<input type="date" name="MEM_AGE" required><br>
				
					<label for="male" class="male">남성</label> 
					<input type="radio" id="male" name="MEM_G" value="male" class="male" required> <br>
					<label for="female" class="female">여성</label>
					<input type="radio" id="female" name="MEM_G" value="female" class="female" required>
				
					<input type="submit" value="가입하기" class="submit">
              </form>
			</div>

		</div>

	</div>
</body>
</html>

