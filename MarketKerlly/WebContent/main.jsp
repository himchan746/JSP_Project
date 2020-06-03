<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
* {
   list-style: none;
}

.thumb_goods {
   width: 100%;
   height: 370px;
   background-repeat: no-repeat;
   background-position: 50% 50%;
   background-size: auto auto;
   font-size: 0;
   line-height: 0;
   background: pink;
}

#mainImageBox {
   height: 400px;
}

#mainImageView {
   width: 100%;
   height: 400px;
   margin: auto;
}

#mainImageView img {
   width: 100%;
   height: 100%;
}

#mainmiddleList1 {
   width: 100%;
   margin: 0 auto;
   background: white;
}

#mainmiddleList2 {
   width: 100%;
   margin: 0 auto;
   background: #f5F5dc;
}

#mainmiddleTitle {
   padding: 79px 0 35px;
   text-align: center;
   color: #333333;
}

#mainMdVeiw {
   width: 1050px;
   margin: 0 auto;
   height: 506px;
   border: 1px solid black;
}

#MdVeiw {
   max-width: 1050px;
   margin: 0px auto;
}

#MdViewBox {
   display: flex;
   width: 100%;
}

#kurlyMain {
   width: 100%;
   opacity: 1;
}

.list_goods {
   width: 1050px;
   height: 506px;
   margin: 0 auto;
}

.bx-wrapper {
   max-width: 1050px;
   margin: 0px auto;
}

.bx-viewport {
   width: 100%;
   overflow: hidden;
   position: relative;
   height: 506px;
}

.list {
   width: 1015%;
   position: relative;
   transition-duration: 0s;
   transform: translate3d(-40px, 0px, 0px);
}

.list li {
   float: left;
   list-style: none;
   position: relative;
   width: 249px;
   margin-right: 18px;
}

.thumb_goods {
   position: relative;
   display: block;
   overflow: hidden;
   cursor: pointer;
   overflow: hidden;
}

.thumb {
   display: block;
   margin: 0 auto;
   background-position: 50% 50%;
   background-size: cover;
   transform: scale(1);
   transition: all 0.3s ease-in-out;
   width: 249px;
   height: 320px;
}

#name {
   background-color: black;
   overflow: hidden;
   max-height: 50px;
   margin-top: 30px;
   text-overflow: ellipsis;
}

.txt {
   font-size: 16px;
   line-height: 23px;
   color: #333333;
}

.price {
   display: block;
   color: #333333;
   font-weight: 700;
   font-size: 16px;
   line-height: 20px;
}

.info_goods {
   padding-top: 10px;
}

.thumba {
   cursor: pointer;
}
</style>
</head>
<body>
   <jsp:useBean id="fileDAO" class="file.FileDAO"/>

	<div id="wrap">
		<div>
			<%@include file="header.jsp"%>
		</div>
		<section>
			<!-- section1 -->
			<div id="mainImageBox">
				<div id="mainImageView">
					<img alt="" src="/MarketKerlly/pic/icecream.png">
				</div>
			</div>
			<div>
				section2 이 상품 어때요?
				<div id="mainmiddleList1">
					<div id="mainmiddleTitle">
						<h2>이 상품 어때요?</h2>
					</div>
					
					<div id="kurlyMain">
						<div>
							<div class="main_type2">
								<div class="product_list">
									<div class="list_goods">
										<div class="bx-wrapper">
											<div class="bx-viewport">
												<ul class="list">
												
													<c:forEach var="Randomlist" items="${fileDAO.getRandomFile()}">
														<li>
															<a class="thumba"href="productView.jsp?proId=${Randomlist.pro_id}"> 
																<img src='data:x-image/jpg;base64,${Randomlist.img}' class="thumb"/>
															</a>
															<div class="info_goods">
																<span class="name">
																	<a class="txt" href="productView.jsp?proId=${Randomlist.pro_id}">${Randomlist.pro_name}</a>
																</span> 
																<span class="price">
																	<fmt:formatNumber value="${Randomlist.price}" pattern="#,###" />원
																</span>
															</div>
														</li>
													</c:forEach>
													
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				section3
				<div id="mainmiddleList2">
					<div id="mainmiddleTitle">
						<h2>최근 입고 상품</h2>
					</div>
					
					<div id="kurlyMain">
						<div>
							<div class="main_type2">
								<div class="product_list">
									<div class="list_goods">
										<div class="bx-wrapper">
											<div class="bx-viewport">
												<ul class="list">
												
													<c:forEach var="RecentFile" items="${fileDAO.getRecentFile()}">
														<li>
															<a class="thumba" href="productView.jsp?proId=${RecentFile.pro_id}">
														 		<img src='data:x-image/jpg;base64,${RecentFile.img}' class="thumb"/>
															</a>
															<div class="info_goods">
																<span class="name"> 
																<a class="txt" href="productView.jsp?proId=${RecentFile.pro_id}">${RecentFile.pro_name}</a>
																</span>
																<span class="price">
																	<fmt:formatNumber value="${RecentFile.price}" pattern="#,###"/>원
																</span>
															</div>
														</li>
													</c:forEach>
													
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				section4
				<div id="mainmiddleList1">
					<div id="mainmiddleTitle">
						<h2>Hot 상품</h2>
					</div>
					
					<div id="kurlyMain">
						<div>
							<div class="main_type2">
								<div class="product_list">
									<div class="list_goods">
										<div class="bx-wrapper">
											<div class="bx-viewport">
												<ul class="list">
													<c:forEach var="HotFile" items="${fileDAO.getHotFile()}">
														<li>
															<a class="thumba" href="productView.jsp?proId=${HotFile.pro_id}">
														 		<img src='data:x-image/jpg;base64,${HotFile.img}' class="thumb"/>
															</a>
															<div class="info_goods">
																<span class="name"> 
																<a class="txt" href="productView.jsp?proId=${HotFile.pro_id}">${HotFile.pro_name}</a>
																</span>
																<span class="price">
																	<fmt:formatNumber value="${HotFile.price}" pattern="#,###"/>원
																</span>
															</div>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<div>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>