<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓 케리</title>
	<link href="css/login.css" rel="stylesheet" type="text/css">
</head>
<body>

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