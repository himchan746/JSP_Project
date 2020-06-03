<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓케리::여기로와 모든게 다있어!!</title>
	<link href="css/header.css" rel="stylesheet" type="text/css">
</head>
<body>
	<fmt:requestEncoding value="utf-8" />
	<header>
		<div id="headerdiv">
			<div Class="top">
				<ul id="topul">
					<c:choose>
						<c:when test="${sessionScope.idsession == null }">
							<li><a href="login.jsp">로그인</a></li>
							<li><a href="join.jsp">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="view.jsp?id=${idsession }">${idsession }</a> 님</li>
							<li><a href="logout.jsp">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<div id="middle">
				<h1>Market Kerlly</h1>
			</div>
		</div>
	</header>
</body>
</html>