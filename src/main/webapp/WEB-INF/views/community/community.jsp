<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이들 커뮤니티</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<!-- <link rel="stylesheet" href="resources/css/communityMain.css"/> -->
<style>
html, body {
	margin: 0;
	text-align: center;
	background-color: #E4E3E3;
}

ul {
	margin: 0;
	display: flex;
}

li {
	list-style: none;
}

a {
	text-decoration: none;
	color: black;
}

p {
	text-align: left;
}

.shadow {
	box-shadow: 0 .15rem .35rem rgba(0, 0, 0, .1) !important;
}

.mainMenu {
	background-color: #343a40;;
}

.mainMenu>li:first-child {
	font-size: 30px;
}

.mainMenu>li {
	margin: 10px;
	padding: 5px 10px;
	list-style: none;
	text-align: center;
	line-height: 40px;
}

.mainMenu>li:hover {
	background-color: #5E6975;
	border-radius: 5px;
}

.mainMenu>li>a {
	color: white;
}

.menu {
	padding: 0;
	background-color: white;
	height: 50px;
}

.menu>li {
	margin: auto;
	padding: 10px 20px;
}

.menu>li:hover {
	background-color: #E9E9E9;
	border-radius: 10px;
}

.menu>li>a {
	font-size: 18px;
}

.community {
	text-align: center;
}

#logo {
	height: 300px;
	padding: 30px;
}

.container {
	padding: 10px 200px 10px 200px;
}

.container>ul {
	padding: 0;
}

.container>ul>li {
	margin: auto;
}

.container>ul>li:hover {
	filter: brightness(50%);
}

.announcement, .feed {
	margin: 10px 180px;
	background-color: white;
	padding: 5px;
	border-radius: 10px;
}

.userIcon {
	width: 32px;
	height: 32px;
	margin: 10px;
}

.seeAllLink {
	margin-top: 1rem!important;
	margin-bottom: 1rem!important;
	display: block;
	text-align: right;
}

.seeAllLink > a {
	padding-right: 10px;
	padding-bottom: 10px;
}
</style>
</head>
<body>
	<nav>
		<ul class="mainMenu">
			<li><a href="#">G-IDLE</a></li>
			<li><a href="#">Dashboard</a></li>
			<li><a href="#">Home</a></li>
			<li><a href="#">Profile</a></li>
			<li><a href="#">Album</a></li>
			<li><a href="#">My Info</a></li>
		</ul>
	</nav>
	<nav class="shadow">
		<ul class="menu">
			<li><a href="#">공지사항</a></li>
			<li><a href="#">자유게시판</a></li>
			<li><a href="#">질문답변</a></li>
			<li><a href="#">공식사진</a></li>
		</ul>
	</nav>
	<div class="community">
		<a href="community"><img id="logo" alt="logo"
			src="./resources/image/logo2.jpg" /></a>
	</div>



	<iframe width="672" height="378"
		src="https://www.youtube.com/embed/Jh4QFaPmdss"
		title="YouTube video player"></iframe>
	<br>
	<img src="./resources/image/commMainImg.jpg" />
	<div class="container">
		<ul>
			<li><a href="https://www.vlive.tv/channel/CE2621"><img
					width="100px" height="100px" src="./resources/image/vapp.svg"></a></li>
			<li><a href="https://www.youtube.com/c/gidleofficial"><img
					width="100px" height="100px" src="./resources/image/youtube.svg"></a></li>
			<li><a href="https://www.instagram.com/official_g_i_dle/"><img
					width="100px" height="100px" src="./resources/image/instagram.svg"></a></li>
			<li><a href="https://www.tiktok.com/@official_gidle?lang=ko"><img
					width="100px" height="100px" src="./resources/image/tiktok.svg"></a></li>
			<li><a href="https://twitter.com/G_I_DLE"><img width="100px"
					height="100px" src="./resources/image/twitter.svg"></a></li>
			<li><a href="http://facebook.com/G.I.DLE.CUBE"><img
					width="100px" height="100px" src="./resources/image/facebook.svg"></a></li>
		</ul>
	</div>

	<div class="announcement shadow">
		<h3>공지사항</h3>
		<hr style="margin: 0 100px;">
		<div>
			<table>
				<tr>
					<td><img class="userIcon" src="./resources/image/vapp.svg"></td>
					<td><p>
							<strong>@닉네임</strong><br> "Some representative placeholder
							content, with some information about this user. Imagine this
							being some sort of status update, perhaps?
						</p></td>
				</tr>
			</table>
		</div>
		<hr style="margin: 0 100px;">
		<div style="padding-top: 1rem !important;">
			<table>
				<tr>
					<td><img class="userIcon" src="./resources/image/vapp.svg"></td>
					<td><p>
							<strong>@닉네임</strong><br> "Some representative placeholder
							content, with some information about this user. Imagine this
							being some sort of status update, perhaps?
						</p></td>
				</tr>
			</table>
		</div>
		<hr style="margin: 0 100px;">
		<div style="padding-top: 1rem !important;">
			<table>
				<tr>
					<td><img class="userIcon" src="./resources/image/vapp.svg"></td>
					<td><p>
							<strong>@닉네임</strong><br> "Some representative placeholder
							content, with some information about this user. Imagine this
							being some sort of status update, perhaps?
						</p></td>
				</tr>
			</table>
		</div>
		<hr style="margin: 0 100px;">

		<small class="seeAllLink"><a href="#">모든 게시물 보기</a>
		</small>
	</div>

	<div class="feed shadow">
		<h3>자유게시판</h3>
		<hr style="margin: 0 100px;">
		<div>
			<table>
				<tr>
					<td><img class="userIcon" src="./resources/image/vapp.svg"></td>
					<td><p>
							<strong>@닉네임</strong><br> "Some representative placeholder
							content, with some information about this user. Imagine this
							being some sort of status update, perhaps?
						</p></td>
				</tr>
			</table>
		</div>
		<hr style="margin: 0 100px;">
		<div style="padding-top: 1rem !important;">
			<table>
				<tr>
					<td><img class="userIcon" src="./resources/image/vapp.svg"></td>
					<td><p>
							<strong>@닉네임</strong><br> "Some representative placeholder
							content, with some information about this user. Imagine this
							being some sort of status update, perhaps?
						</p></td>
				</tr>
			</table>
		</div>
		<hr style="margin: 0 100px;">
		<div style="padding-top: 1rem !important;">
			<table>
				<tr>
					<td><img class="userIcon" src="./resources/image/vapp.svg"></td>
					<td><p>
							<strong>@닉네임</strong><br> "Some representative placeholder
							content, with some information about this user. Imagine this
							being some sort of status update, perhaps?
						</p></td>
				</tr>
			</table>
		</div>
		<hr style="margin: 0 100px;">

		<small class="seeAllLink"><a href="#">모든 게시물 보기</a>
		</small>
	</div>
</body>
</html>