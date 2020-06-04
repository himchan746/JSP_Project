<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="DBupload.jsp">
		<input type="file" name="file"><br>
		이름 : <input type="text" name = "name"> <br>
		수량 : <input type="text" name = "cnt"> 숫자만!!!!!!!!!! <br>
		가격 : <input type="text" name = "price"> 숫자만 !!!!!!!!!<br>
		카테고리 : <input type="text" name = "group"><br>
		<input type="submit" value="DB파입 업로드">
		
	</form>
	
	<input type="button" onclick="location.href='../main.jsp'" value="메인으로">

	

</body>
</html>