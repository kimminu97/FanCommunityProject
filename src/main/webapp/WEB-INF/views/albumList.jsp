<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이들 앨범 목록</title>
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
	background-attachment: fixed;
	background-size: cover;
	background-color: black;
	min-height: 100%;
	height: 1100px;
}

.logo {
	height: 100px;
	padding: 30px;
}

ul {
	list-style-type: none;
}

li {
	padding: 10px 0px 10px 0px;
}

a {
	color: white;
	text-decoration: none;
	font-size: 20px;
}

a:hover {
	text-decoration: underline;
}

a:visited {
	color: white;
}

.album:hover {
	filter: brightness(50%);
}

h1 {
	text-align: center;
	color: white;
	font-size: 50px;
	margin: 0 0 70px 0;
}

</style>
</head>
<body>
	<div class="bg">
		<a href="home"><img class="logo" alt="logo"
			src="./resources/image/logo.png" /></a> <br>
			
	<h1>ALBUM</h1>
	
		<ul class="albums">
			<li style="float: left; width: 33%; text-align: center;"><a
				href="https://www.melon.com/album/detail.htm?albumId=10163578"><img class="album"
					alt="I am" src="./resources/image/firstMiniAlb.jpg" width="200px"
					height="200px" /><br> I am</a></li>
			<li style="float: left; width: 33%; text-align: center;"><a
				href="https://www.melon.com/album/detail.htm?albumId=10194362"><img class="album"
					alt="한(一)" src="./resources/image/firstDigiAlb.jpg" width="200px"
					height="200px" /><br>한(一)</a></li>

			<li style="float: left; width: 33%; text-align: center;"><a
				href="https://www.melon.com/album/detail.htm?albumId=10255272"><img class="album"
					alt="I made" src="./resources/image/secMiniAlb.jpg" width="200px"
					height="200px" /><br>I made</a></li>

			<li style="float: left; width: 33%; text-align: center;"><a
				href="https://www.melon.com/album/detail.htm?albumId=10300342"><img class="album"
					alt="Uh-Oh" src="./resources/image/secDigiAlb.jpg" width="200px"
					height="200px" /><br>Uh-Oh</a></li>

			<li style="float: left; width: 33%; text-align: center;"><a
				href="https://www.melon.com/album/detail.htm?albumId=10413088"><img class="album"
					alt="I trust" src="./resources/image/thirdMiniAlb.jpg"
					width="200px" height="200px" /><br>I trust</a></li>

			<li style="float: left; width: 33%; text-align: center;"><a
				href="https://www.melon.com/album/detail.htm?albumId=10456879"><img class="album"
					alt="I trust" src="./resources/image/thirdDigiAlb.jpg"
					width="200px" height="200px" /><br>I trust</a></li>

			<li style="float: left; width: 33%; text-align: center;"><a
				href="https://www.melon.com/album/detail.htm?albumId=10470992"><img class="album"
					alt="DUMDi DUMDi" src="./resources/image/firstSinAlb.jpg"
					width="200px" height="200px" /><br>DUMDi DUMDi</a></li>

			<li style="float: left; width: 33%; text-align: center;"><a
				href="https://www.melon.com/album/detail.htm?albumId=10545281"><img class="album"
					alt="I burn" src="./resources/image/fourthMiniAlb.jpg"
					width="200px" height="200px" /><br>I burn</a></li>
			<li style="float: left; width: 33%; text-align: center;"><a
				href="https://www.melon.com/album/detail.htm?albumId=10890384"><img class="album"
					alt="I NEVER DIE" src="./resources/image/firstFullAlb.png"
					width="200px" height="200px" /><br>I NEVER DIE</a></li>
		</ul>
	</div>
</body>
</html>