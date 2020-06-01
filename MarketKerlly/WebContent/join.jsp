<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제지</title>
<style type="text/css">
#loginwrap {
	height: 600px;
}
#logintable {
	text-align: center;
	width: 400px;
	margin: auto;
}

#logintable tr {
	height: 60px;
}

#id {
	width: 400px;
	height: 50px;
	border: 1px solid #ff3366;
	border-radius: 4px;
	text-indent: 0.9em;
	transition: 0.5s;
	outline: none;
}

#id:focus {
	border-color: #FF3366;
	box-shadow: 0 0 15px 0 #FF3366;
	transform: scale(1.1);
}

#password {
	width: 400px;
	height: 50px;
	border: 1px solid #ff3366;
	border-radius: 4px;
	text-indent: 0.9em;
	transition: 0.5s;
	outline: none;
}

#password:focus {
	border-color: #FF3366;
	box-shadow: 0 0 15px 0 #FF3366;
	transform: scale(1.1);
}

#okbutton {
	width: 100%;
	height: 50px;
	background-color: #FF3366;
	border: 1px solid #FF3366;
	border-radius: 4px;
	color: white;
	cursor: pointer;
	transition: 0.5s;
	outline: none;
}
#okbutton:hover {
	transform: scale(1.1);
}
#okbutton:focus {
	transform: scale(1.1);
}


#canbutton {
	width: 100%;
	height: 50px;
	border: 1px solid #FF3366;
	border-radius: 4px;
	background-color: white;
	color: #FF3366;
	cursor: pointer;
	transition: 0.5s;
	outline: none;
}
#canbutton:hover {
	transform: scale(1.1);
}
#canbutton:focus {
	transform: scale(1.1);
}
#check {
	cursor: pointer;
}
</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<section id="loginwrap">
		<form action="joinok.jsp" method="post"> <!-- -------------- formtag  -->
			<table id="logintable">
				<tr>
					<td colspan="2"><h2 style="color: #ff3366;">회 원 가 입</h2></td>
				</tr>
				<tr>
					<th colspan="2"><input type="text" id="id" name="id" autocomplete="off" placeholder="아이디를 입력해주세요" autofocus="autofocus"><br></th>
				</tr>
				<tr>
					<th colspan="2"><input type="password" id="password" name="pwd" placeholder="비밀번호를 입력해주세요"><br></th>
				</tr>
				<tr>
					<th colspan="2"><input type="text" id="id" name="name" autocomplete="off" placeholder="이름을 입력해주세요"><br></th>
				</tr>
				<tr>
					<th colspan="2"><input type="text" id="id" name="depart" autocomplete="off" placeholder="부서를 입력해주세요"><br></th>
				</tr>
				<tr>
					<th colspan="2"><input type="text" id="id" name="rank" autocomplete="off" placeholder="직급을 입력해주세요"><br></th>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" id="okbutton" value="회원가입"></th>
				</tr>
				<tr>
					<th colspan="2"><input type="button" id="canbutton" value="취소" onclick="location.href='login.jsp'"></th>
				</tr>
			</table>
		</form>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>