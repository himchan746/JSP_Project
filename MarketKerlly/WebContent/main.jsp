<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>올마켓::여기 다있어 모두다 모여!</title>

<style type="text/css">
* {
text-align: center;
}
img {
	width: 220px;
	height: 300px;
}

#mainpic {
	height: 200px;
}

#howAboutThis {
	margin: 0 auto;
}

#article1 {
	display: flex;
	vertical-align: middle;
}
#article1 article{
	padding: ;
}

</style>
</head>
<body>
<%@ include file="header.jsp" %>
	<section>
		<div id="mainpic">사진 넣어주세요</div>
		<div id="howAboutThis">
			<h3>이 상품 어때요?</h3>
			<div id = "article1">
				<article>
					<img src="#">
				</article>
				<article>
					<img src="#">
				</article>
				<article>
					<img src="#">
				</article>
				<article>
					<img src="#">
				</article>
			</div>
		</div>
	</section>
</body>
</html>