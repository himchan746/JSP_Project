<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<link href="css/form.css"rel="stylesheet" type="text/css">
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