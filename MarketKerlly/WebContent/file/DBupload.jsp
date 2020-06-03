<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<fmt:requestEncoding value="utf-8" />
	<jsp:useBean id="Upload" class="file.FileUpload" />
	${Upload.fileUpload(param.file , param.name , param.cnt , param.price , param.group)}
	<c:redirect url="fileUpload.jsp"/>
	


</body>
</html>