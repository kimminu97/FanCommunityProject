<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필</title>
<script type="text/javascript">
	function fnTab(num){
		const element = 
			document.getElementById(num);
		const all =
			document.getElementsByClassName("pf_inner");
		 for(var i=0; i<all.length; i++){
			all[i].style.display="none";
		} 
		/* all.forEach(function(item){
		 	item.style.display='none';
		 	}); */

		element.style.display='block';
	}
</script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/profile.css">
</head>
<body>
	<!--side-->
	<div id="side">
		<a href="home">
		<img id="logo" alt="logo" src="./resources/image/logo.png" />
		</a>
	</div>
	<!--//side-->
	<!-- Container-->
	<div class="container">
		<div class="cont profile">
			<div class="member_name">
				<p>
					<a href="javascript:fnTab('145')">MIYEON</a>
				</p>
				<p>
					<a href="javascript:fnTab('146')">MINNIE</a>
				</p>
				<p>
					<a href="javascript:fnTab('147')">SOYEON</a>
				</p>
				<p>
					<a href="javascript:fnTab('148')">YUQI</a>
				</p>
				<p>
					<a href="javascript:fnTab('149')">SHUHUA</a>
				</p>
			</div>
			<div class="pf_inner" id="145">
				<div class="profile_img">
					<div class="color_bg artist_crbg"></div>
					<div class="artist_img">
						<img alt="NAYEON" width="455" height="580"
							src="./resources/image/prof_miyeon4.jpg">
					</div>
				</div>
				<div class="profile_txt">
					<div class="name_tt">MIYEON</div>
					<div class="birth">
						이름 : 미연 <br>생일 : 1997.1.31.
					</div>
				</div>
			</div>
			<div class="pf_inner" id="146" style="display: none;">
				<div class="profile_img">
					<div class="color_bg artist_crbg"></div>
					<div class="artist_img">
						<img alt="JEONGYEON" width="455" height="580"
							src="./resources/image/prof_minnie2.jpg">
					</div>
				</div>
				<div class="profile_txt">
					<div class="name_tt">MINNIE</div>
					<div class="birth">
						이름 : 민니<br>생일 : 1997.10.23.
					</div>
				</div>
			</div>
			<div class="pf_inner" id="147" style="display: none;">
				<div class="profile_img">
					<div class="color_bg artist_crbg"></div>
					<div class="artist_img">
						<img alt="MOMO" width="455" height="580"
							src="./resources/image/prof_soyeon.jpg">
					</div>
				</div>
				<div class="profile_txt">
					<div class="name_tt">SOYEON</div>
					<div class="birth">
						이름 : 소연<br>생일 : 1998.8.26.
					</div>
				</div>
			</div>
			<div class="pf_inner" id="148" style="display: none;">
				<div class="profile_img">
					<div class="color_bg artist_crbg"></div>
					<div class="artist_img">
						<img alt="SANA" width="455" height="580"
							src="./resources/image/prof_yuqi2.jpg">
					</div>
				</div>
				<div class="profile_txt">
					<div class="name_tt">YUQI</div>
					<div class="birth">
						이름 : 우기<br>생일 : 1999.09.23.
					</div>
				</div>
			</div>
			<div class="pf_inner" id="149" style="display: none;">
				<div class="profile_img">
					<div class="color_bg artist_crbg"></div>
					<div class="artist_img">
						<img alt="JIHYO" width="455" height="580"
							src="./resources/image/prof_shuhua.jpg">
					</div>
				</div>
				<div class="profile_txt">
					<div class="name_tt">SHUHUA</div>
					<div class="birth">
						이름 : 슈화 <br>생일 : 2000.01.06
					</div>
				</div>
			</div>
			</div>
		</div>
		<!-- //cont notice -->
	</div>
	<!-- //Container -->
</body>
</html>