<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이들과 함께해조</title>
<style>
html, body {
	padding: 0;
	margin: 0;
	height: 100%;
}
@font-face {
    font-family: 'Donoun-Medium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2205@1.0/Donoun-Medium.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
.welcome{
   font-family:'Donoun-Medium';
}
.bg {
	background-image: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
		url('./resources/image/gidle.png');
	background-repeat: no-repeat;
	background-size: cover;
	background-color: black;
	min-height: 100%;
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
img {
	height: 100px;
	padding: 30px 0px 0px 30px;
}
#wel{
	padding-left: 100px;
	color: white;
}
</style>
</head>
<body>
	<div class="bg">
		<a href="home"><img alt="logo" src="./resources/image/logo.png"/></a>
		<c:if test="${users != null}">
		<p class="welcome"  id="wel">${users.user_name}&nbsp;님 </p>
		</c:if>
		<c:if test="${admin != null}">
		<p class="welcome"  id="wel">${admin.adm_name}&nbsp;님 </p>
		</c:if>
		
		<ul class="menus">
			<li><a href="profile"><b>Profile</b></a></li>
			<li><a href="albumList"><b>Album</b></a></li>
			<li><a href="community/community"><b>Community</b></a></li>
			<c:choose>
				<c:when test="${users == null && admin==null}">
					<!-- 로그인 안했을 때 메뉴 -->
					<li><a href="login.do"><b>Login</b></a></li>
				</c:when>
				<c:otherwise>
					<!-- 로그인했을 때 메뉴 -->
					<li><a href="logout.do"><b>Logout</b></a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</body>
</html>