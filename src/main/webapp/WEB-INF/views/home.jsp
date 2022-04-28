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
</style>
</head>
<body>
	<div class="bg">
		<a href="home"><img alt="logo" src="./resources/image/logo.png"/></a>
		<ul class="menus">
			<li><a href="profile"><b>Profile</b></a></li>
			<li><a href="albumList"><b>Album</b></a></li>
			<li><a href="community"><b>Community</b></a></li>
			<li><a href="login.do"><b>Login</b></a></li>
		</ul>
	</div>
</body>
</html>