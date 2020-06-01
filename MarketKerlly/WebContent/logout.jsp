<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제지</title>
</head>
<body>
<c:remove var="idsession" scope="session"/>
<c:redirect url="login.jsp"/>
</body>
</html>