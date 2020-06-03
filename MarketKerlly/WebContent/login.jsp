<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓 케리</title>
<style type="text/css">
#loginwrap {
	height: 600px;
}

#idandpw {
	font-size: 15px;
	
	color: black;
	text-decoration: none;
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
	border: 1px solid #FF3366;
	border-radius: 4px;
	text-indent: 0.9em;
	transition: 1s;
	outline: none;
}

#id:focus{
	border-color: #FF3366;
	box-shadow: 0 0 15px 0 #FF3366;
	transform: scale(1.1);
}

#password {
	width: 400px;
	height: 50px;
	border: 1px solid #FF3366;
	border-radius: 4px;
	text-indent: 0.9em;
	transition: 1s;
	outline: none;
}
#password:focus{
	border-color: #FF3366;
	box-shadow: 0 0 15px 0 #FF3366;
	transform: scale(1.1);
}
#buttonLg {
	width: 100%;
	height: 50px;
	background-color: #FF3366;
	border-radius: 4px;
	border: 1px solid #FF3366;
	color: white;
	transition : 0.3s;
	cursor: pointer;
	outline: none;
}
#buttonLg:hover{
	transform: scale(1.1);
}
#buttonLg:focus{
	transform: scale(1.1);
}

#buttonJo {
	width: 100%;
	height: 50px;
	border-width: 1px;
	border-radius: 4px;
	background-color: white;
	border-color: #FF3366;
	color: #FF3366;
	cursor: pointer;
	transition : 0.3s;
	outline: none;
}
#buttonJo:hover{
	transform: scale(1.1); 
}
#buttonJo:focus {
	transform: scale(1.1);
}

</style>
</head>
<body>
${msg }

<c:choose>
	<c:when test="${empty idsession }">
	<%@include file="header.jsp"%>
	<section id="loginwrap">
		<form action="loginChk.jsp" method="post">
			<table id="logintable">
				<tr>
					<td colspan="2"><h2 style="color: #ff3366;">로그인</h2></td>
				</tr>
				<tr>
					<th colspan="2"><input type="text" value="${id}" autocomplete="off"  id="id" name="id" placeholder="아이디를 입력해주세요" autofocus="autofocus" required><br></th>
				</tr>
				<tr>
					<th colspan="2"><input type="password" autocomplete="off" id="password" name="pwd" placeholder="비밀번호를 입력해주세요" required><br></th>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" id="buttonLg" value="로그인"></th>
				</tr>
				<tr>
					<th colspan="2"><input type="button" id="buttonJo" value="회원가입" onclick="location.href='form.jsp?method=join'"></th>
				</tr>
			</table>
		</form>
	</section>
	<%@include file="footer.jsp"%>
</c:when>
	<c:otherwise>
		<c:redirect url="main.jsp" />		
	</c:otherwise>
</c:choose>
</body>
</html>