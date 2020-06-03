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
                     <li><a href="file/fileUpload.jsp">파일 올리기</a></li>
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
            <h1><a href="main.jsp">Market Kerlly</a></h1>
         </div>
         <div class="headerbar">
            <div id="catetitle" class="tag">
               <div><img id = "cateImage"src="https://cdn4.iconfinder.com/data/icons/wirecons-free-vector-icons/32/menu-alt-512.png"></div>
               <div class="catatxt"><a class="cate" href="#">전체 카테로그</a></div>
            </div>
            <div  class="tag">
               <a class="new" href="#">신상품</a>
            </div>
            <div class="tag">
               <a class="hot" href="#">핫상품</a>
            </div>
            <div class="tag">
               <a class="today" href="#">오늘신상품</a>
            </div>
            <div class="searchbox">
               <form action="search.jsp">
                  <div class="seartxtbox" style="display: flex;">
                     <div><input class="searchtext" type="text" name="search"></div>
                     <div class="searchdivbt"><button class ="seachbt"type="submit">
                        <img id="searchimage" src="https://cdn1.iconfinder.com/data/icons/free-98-icons/32/search-512.png">
                     </button>
                     </div>
                  </div>
               </form>
            </div>
            <div class="shopping">
               <img id="shopimage"src="https://cdn0.iconfinder.com/data/icons/elasto-online-store/26/00-ELASTOFONT-STORE-READY_cart-512.png">
            </div>
         </div>
      </div>
   </header>
</body>
</html>