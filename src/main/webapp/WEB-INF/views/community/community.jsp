<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이들 커뮤니티</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/communityMain.css" />

</head>
<body>
	<nav>
		<ul class="mainMenu">
			<li><a href="home">G-IDLE</a></li>
			<li><a href="community">Dashboard</a></li>
			<li><a href="profile">Profile</a></li>
			<li><a href="albumList">Album</a></li>
			<li>
			  <c:choose>
                  <c:when test="${admin==null }">
                     <a href="update.do">My Info</a>
                  </c:when>
                  <c:when test="${users==null }">
                   <a href="list.do">Admin</a>
                  </c:when>
               </c:choose>
			</li>
		</ul>
	</nav>

	<nav class="shadow">
		<ul class="menu">
			<li><a href="list?action=1">공지사항</a></li>
			<li><a href="list?action=2">자유게시판</a></li>
			<li><a href="list?action=3">아이들에게 편지</a></li>
			<li><a href="list?action=4">등업요청</a></li>
		</ul>
	</nav>
	<div class="community">
		<a href="community"><img id="logo" alt="logo"
			src="${pageContext.request.contextPath}/resources/image/logo2.jpg" /></a>
	</div>



	<iframe width="672" height="378"
		src="https://www.youtube.com/embed/Jh4QFaPmdss"
		title="YouTube video player"></iframe>
	<br>
	<img
		src="${pageContext.request.contextPath}/resources/image/commMainImg.jpg" />
	<div class="container">
		<ul>
			<li><a href="https://www.vlive.tv/channel/CE2621"><img
					width="100px" height="100px"
					src="${pageContext.request.contextPath}/resources/image/vapp.svg"></a></li>
			<li><a href="https://www.youtube.com/c/gidleofficial"><img
					width="100px" height="100px"
					src="${pageContext.request.contextPath}/resources/image/youtube.svg"></a></li>
			<li><a href="https://www.instagram.com/official_g_i_dle/"><img
					width="100px" height="100px"
					src="${pageContext.request.contextPath}/resources/image/instagram.svg"></a></li>
			<li><a href="https://www.tiktok.com/@official_gidle?lang=ko"><img
					width="100px" height="100px"
					src="${pageContext.request.contextPath}/resources/image/tiktok.svg"></a></li>
			<li><a href="https://twitter.com/G_I_DLE"><img width="100px"
					height="100px"
					src="${pageContext.request.contextPath}/resources/image/twitter.svg"></a></li>
			<li><a href="http://facebook.com/G.I.DLE.CUBE"><img
					width="100px" height="100px"
					src="${pageContext.request.contextPath}/resources/image/facebook.svg"></a></li>
		</ul>
	</div>

	<div class="announcement shadow">
		<h3>공지사항</h3>
		<hr style="margin: 0 100px;">
		<div>
			<table >
			<c:forEach var="vo" items="${list1 }">
				<tr>
					<td><img class="userIcon"
						src="${pageContext.request.contextPath}/resources/image/captainhook.png"></td>
					<td style="text-align:left;">
							<strong>${vo.board_name }</strong><br><a
						href="detail?board_idx=${vo.board_idx }&pageNo=${page.pageNo}&action=2"
						class="title">${vo.board_sub }</a> 
						</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		
		<small class="seeAllLink"><a href="list?action=1">모든 게시물
				보기</a> </small>
	</div>

	<div class="feed shadow">
		<h3>자유게시판</h3>
		<div>
				<hr style="margin: 0 100px;">
			<table>
			<c:forEach var="vo" items="${list2 }">
				<tr>
					<td><img class="userIcon"
						src="${pageContext.request.contextPath}/resources/image/peterpan.png"></td>
					<td style="text-align:left;">
							<strong>${vo.board_name }</strong><br><a
						href="detail?board_idx=${vo.board_idx }&pageNo=${page.pageNo}&action=2"
						class="title">${vo.board_sub }</a> 
						</td>
				</tr>
				</c:forEach>
			</table>
		</div>

		<small class="seeAllLink"><a href="list?action=2">모든 게시물 보기</a> </small>
	</div>
</body>
</html>