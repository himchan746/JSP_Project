<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제지</title>

<style type="text/css">
/* ---------------------------------------------- 모바일 */

/* ---------------------------------------------- basic */
#headerdiv {
	display: flex;
	flex-flow: column;
	margin: 0 auto;
	text-align: right;
}

/* ---------------------------------------------- top */
#top ul {
	text-align: right;
}

#topul li {
	margin: 3px;
	display: inline;
	list-style: none;
	font-size: 10px;
	padding: 5px;
	border-radius: 4px;
	border: 1px solid #FF3366;
}

#topul li:hover {
	background: #FF3366;
}

#topul li a {
	font-size: 13px;
	text-decoration: none;
	color: #FF3366;
}

#topul li a:hover {
	color: white;
}

/* ---------------------------------------------- middle */
#middle {
	text-align: center;
	color: #FF3366;
	font-size: 30px;
}

#middle {
	text-align: center;
}
</style>
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
							<li><a href="logout.jsp">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<div id="middle">
				<h1>CARE WEB</h1>
			</div>
		</div>
	</header>
</body>
</html>