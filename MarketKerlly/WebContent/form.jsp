<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
	<c:choose>
		<c:when test="${(param.method eq 'modify') and (not empty sessionScope.idsession)}">
		<jsp:useBean id="dao" class="customer.CustomerDAO"/>
		<c:set var="dto" value="${dao.getById(param.id)}"/>
			<section id="loginwrap">
				<form action="modifyok.jsp" method="post">
					<!-- -------------- formtag  -->
					<table id="logintable">
						<tr>
							<td colspan="2"><h2 style="color: #ff3366;">회 원 수 정</h2></td>
						</tr>
						<tr>
							<th colspan="2"><input type="text" value="${dto.id }"
								id="id" name="id" readonly><br></th>
						</tr>
						<tr>
							<th colspan="2"><input type="password" value="${dto.pwd }"
								id="password" name="pwd" required><br></th>
						</tr>
						<tr>
							<th colspan="2"><input type="text" value="${dto.name }"
								id="id" name="name" autocomplete="off"><br></th>
						</tr>
						<tr>
							<th colspan="2"><input type="text" value="${dto.addr }"
								id="id" name="addr" autocomplete="off"><br></th>
						</tr>
						<tr>
							<th colspan="2"><input type="text" value="${dto.tel }"
								id="id" name="tel" autocomplete="off"><br></th>
						</tr>
						<tr>
							<th colspan="2"><input type="submit" id="okbutton"
								value="수정"></th>
						</tr>
						<tr>
							<th colspan="2"><input type="button" id="canbutton"
								value="취소" onclick="location.href='view.jsp?id=${idsession}'"></th>
						</tr>
					</table>
				</form>
			</section>
		</c:when>
	<c:otherwise>
${msg}
			<section id="loginwrap">
				<form action="joinok.jsp" method="post">
					<!-- -------------- formtag  -->
					<table id="logintable">
						<tr>
							<td colspan="2"><h2 style="color: #ff3366;">회 원 가 입</h2></td>
						</tr>
						<tr>
							<th colspan="2"><input type="text" value="${dto.id }"
								id="id" name="id" autocomplete="off" required
								placeholder="아이디를 입력해주세요" autofocus="autofocus"><br></th>
						</tr>
						<tr>
							<th colspan="2"><input type="password" value="${dto.pwd }"
								id="password" name="pwd" placeholder="비밀번호를 입력해주세요" required><br></th>
						</tr>
						<tr>
							<th colspan="2"><input type="text" value="${dto.name }"
								id="id" name="name" autocomplete="off" placeholder="이름을 입력해주세요"><br></th>
						</tr>
						<tr>
							<th colspan="2"><input type="text" value="${dto.addr }"
								id="id" name="addr" autocomplete="off" placeholder="주소를 입력해주세요"><br></th>
						</tr>
						<tr>
							<th colspan="2"><input type="text" value="${dto.tel }"
								id="id" name="tel" autocomplete="off" placeholder="전화번호를 입력해주세요"><br></th>
						</tr>
						<tr>
							<th colspan="2"><input type="submit" id="okbutton"
								value="회원가입"></th>
						</tr>
						<tr>
							<th colspan="2"><input type="button" id="canbutton"
								value="취소" onclick="location.href='login.jsp'"></th>
						</tr>
					</table>
				</form>
			</section>
		</c:otherwise>
	</c:choose>
	<%@include file="footer.jsp"%>
</body>
</html>