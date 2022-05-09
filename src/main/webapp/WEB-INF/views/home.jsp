<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>아이들과 함께해조</title>
<style>
html, body {
	padding: 0;
	margin: 0;
	height: 100%;
}

.bg {
	background-image: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
		url('./resources/image/gidle.png');
	background-repeat: no-repeat;
	background-attachment: fixed; background-size : cover; background-color
	: black;
	min-height: 100%;
	overflow: auto;
	background-attachment: fixed;
	background-size: cover;
	background-color: black;
	background-size: cover;
	background-color: black;
}

a {
	color: white;
	text-decoration: none;
	font-size: 50px;
	line-height: 100px;
}

a:hover {
	color: gray;
}

.menus {
	position: absolute;
	top: 25%;
	left: 40%;
	list-style-type: none;
}

.logo {
	height: 100px;
	padding: 30px 0px 0px 30px;
}
</style>
</head>
<body>
	<div class="bg">
		<a href="home"><img class="logo" alt="logo"
			src="./resources/image/logo.png" /></a>
		<c:if test="${users != null }">
			<a href="" id="wel">${users.user_name }&nbsp;님 어서오세요</a>
		</c:if>
		<ul class="menus">
			<li><a href="profile"><b>Profile</b></a></li>
			<li><a href="albumList"><b>Album</b></a></li>
			<li><a href="community/community"><b>Community</b></a></li>
			<c:choose>
				<c:when test="${users==null }">
					<!-- 로그인 안했을 때 메뉴 -->
					<li><a href="login.do"><b>Login</b></a></li>
				</c:when>
				<c:otherwise>
					<!-- 로그인 했을 때 메뉴 -->
					<li><a href="logout.do"><b>Logout</b></a></li>
				</c:otherwise>
			</c:choose>
			<li><a href="join.do"><b>Sign up</b></a></li>
			<!-- <li><a href="goods"><b>Goods</b></a></li> -->
		</ul>
	</div>
</body>
</html>