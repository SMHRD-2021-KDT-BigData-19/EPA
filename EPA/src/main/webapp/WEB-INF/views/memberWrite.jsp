<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입화면</title>

<script>
$(function(){
	$("#birth").datepicker({
	changeMonth: true,
	changeYear: true
	});
	
$("#btn_submit").click(function() {
	var userid = $("userid").val();
	var pass = $("pass").val();
	var name = $("name").val();
	
	userid = $.trim(userid);
	pass = $.trim(pass);
	name = $.trim(name);
	
	if(userid == ""){		
		alert("아이디를 입력해주세요");
		$("#userid").focus();
		return false;
	}
	
	if(pass == ""){		
		alert("암호를 입력해주세요");
		$("#userid").focus();
		return false;
	}
	
	if(name == ""){		
		alert("이름을 입력해주세요");
		$("#userid").focus();
		return false;
	}
	
	$("#userid").val(userid);
	$("#pass").val(pass);
	$("#name").val(name);
	
})
</script>
</head>

<style>
body {
	font-size: 9pt;
	font-color: #333333;
	font-family: 맑은 고딕;
}

table {
	width: 600px;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #cccccc;
	padding: 3px;
	line-height: 2;
}

.div_button {
	width: 600px;
	text-align: center;
	margin-top: 5px;
}

caption {
	font-size: 15pt;
	font-weight: bold;
	margin-top: 10px;
}
</style>

<body>

	<form id="frm">
		<table>
			<tr>
				<th>홈</th>
				<th><a href="">게시판</th>
				<th><a href="">회원가입</th>
				<th><a href="">로그인</th>
			</tr>
		</table>

		<table width="25%">
			<caption>회원가입 폼</caption>
			<tr>
				<th><label for="userid">아이디</label></th>
				<td><input type="text" name="userid" id="userid"
					placeholder="아이디 입력">
					<button type="button">중복체크</button></td>
			</tr>
			<tr>
				<th><label for="pass">암호</label></th>
				<td><input type="password" name="pass" id="pass"></td>
			</tr>
			<tr>
				<th><label for="name">이름</label></th>
				<td><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<th><label for="gender">성별</label></th>
				<td><input type="radio" name="gender" id="gender" value="M">남
					<input type="radio" name="gender" id="gender" value="F">여</td>
			</tr>
			<tr>
				<th><label for="birth">생년월일</label></th>
				<td><input type="text" name="birth" id="birth" readonly></td>
			</tr>
			<tr>
				<th><label for="phone">연락처</label></th>
				<td><input type="text" name="phone" id="phone">(예:010-0000-0000)</td>
			</tr>
			<tr>
				<th><label for="address">주소</label></th>
				<td><input type="text" name="address" id="address">
					<button type="button">우편번호찾기</button> <br> <input type="text"
					name="address" id="address"></td>
			</tr>
		</table>

		<div class="div_button">
			<button type="button">저장</button>
			<button type="reset">재작성</button>
		</div>
	</form>

</body>
</html>