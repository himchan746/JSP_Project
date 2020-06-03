<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓케리::여기로와 모든게 다있어!!</title>

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
	border: 1px solid purple;
}

#topul li:hover {
	background: purple;
}

#topul li a {
	font-size: 15px;
	text-decoration: none;
	color: purple;
}

#topul li a:hover {
	color: white;
}

/* ---------------------------------------------- middle */
#middle {
	text-align: center;
	color: purple;
	font-size: 30px;
	text-align: center;
}

#middle h1 a {
	text-decoration: none;
	color: purple;
}

.headerbar {
	display: flex;
	height: 40px;
	margin: 0 auto;
	text-align: center;
}

.tag {
	width: 200px;
	padding: 8px 0px;
	border-left: 1px solid purple;
	transition: 0.8s;
}

.tag:hover {
	background: purple;
	border-radius: 15px;
	color: white;
	cursor: pointer;
}

.headerbar div a:hover {
	color: white;
}

.headerbar div a {
	text-decoration: none;
	font-size: 15px;
	text-align: center;
	font-weight: bold;
	width: 30px;
}

.seartxtbox {
	padding-top: 6px;
	width: 250px;
	border: 2px solid purple;
	border-radius: 23px;
	padding: 1px 5px;
}

.searchtext {
	width: 190px;
	margin-left: 3px;
	height: 30px;
	font-size: 15px;
	padding-left: 20px;
	border: none;
	outline: none;
	border-radius: 10px;
}


.seachbt {
	padding-top: 5px;
	outline: none;
	border: none;
	background: none;
	cursor: pointer;
}




.catatxt {
	position: relative;
	width: 100%;
	height: 100%;
}
.catatxt ul{
	position: absolute;
	margin-top : 10px;
	width: 200px;
	height: 400px;
	display: flex;
	justify-content: space-around;
	align-items: center;
	flex-direction: column;	
	pointer-events: none;
	list-style: none;
	opacity: 0;
	transform: translateY(10px);
	transition: all 0.4s ease;
	border : 1px solid purple;
	border-radius: 15px;
}

.catea{
	margin: 0;
	padding: 0;
}
.catea a{
	color: black;
	text-decoration: none;
}
.catea li{
	width: 100%;
	height: 100%;
	display: inline;
	padding-top:20px;
	justify-content: center;
	align-items: center;
	cursor: pointer;
}
.catea li:hover {
	background-color: purple;
	color: white;
	pointer-events: all;
}

.cate:focus + ul{
	opacity: 1;
	pointer-events: all;
	transform: translateY(10px);
}
.cate:hover + ul{
	opacity: 1;
	pointer-events: all;
	transform: translateY(10px);
}



#searchimage {
	width: 20px;
	height: 20px;
}

#shopimage {
	margin-left: 30px;
	width: 40px;
	height: 40px;
}

#cateImage {
	width: 30px;
	height: 30px;
	margin: 0px 15px;
}

.shopping {
	width: 50px;
	padding-left: 3px;
	cursor: pointer;
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
							<li><a href="form.jsp">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="view.jsp?id=${idsession }">${idsession }</a> 님</li>
							<li><a href="logout.jsp">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<div id="middle">
				<h1>
					<a href="main.jsp">Market Kerlly</a>
				</h1>
			</div>
			<div class="headerbar">
				<div id="catetitle" class="tag">
					<div class="catatxt">
						<a class="cate" href="#">전체 카테로그</a>
						<ul class="catea">
							<li style="border-top-left-radius: 15px;border-top-right-radius: 15px"><a href="#">고기켈리</a></li>
							<li><a href="#">생선켈리</a></li>
							<li><a href="#">음주켈리</a></li>
							<li><a href="#">라면켈리</a></li>
							<li><a href="#">쌩닭켈리</a></li>
							<li style="border-bottom-left-radius: 15px;border-bottom-right-radius: 15px"><a href="#">통짜켈리</a></li>
						</ul>
					</div>
				</div>
				<div class="tag">
					<a class="new" href="#">신상품</a>
				</div>
				<div class="tag">
					<a class="hot" href="#">핫상품</a>
				</div>
				<div class="tag">
					<a class="today" href="#">오늘신상품</a>
				</div>
				<div class="searchbox">
					<form action="#">
						<div class="seartxtbox" style="display: flex;">
							<div>
								<input class="searchtext" type="text">
							</div>
							<div class="searchdivbt">
								<button class="seachbt" type="submit">
									<img id="searchimage" src="https://cdn1.iconfinder.com/data/icons/free-98-icons/32/search-512.png">
								</button>
							</div>
						</div>
					</form>
				</div>
				<div class="shopping">
					<img id="shopimage" src="https://cdn0.iconfinder.com/data/icons/elasto-online-store/26/00-ELASTOFONT-STORE-READY_cart-512.png">
				</div>
			</div>
		</div>
	</header>
</body>
</html>