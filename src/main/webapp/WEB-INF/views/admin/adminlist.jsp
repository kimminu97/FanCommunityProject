<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GIDLE 회원 리스트(관리자)</title>
</head>
<link rel="stylesheet" href="./resources/css/adminlist.css" />
<body class="bg">
<h3 class="align-center">GIDLE 회원 리스트(관리자)</h3>
<div>
	<a href="home"><img class="logo" alt="logo"
			src="./resources/image/logo.png" /></a> <br>
	<form name="frmUser" method="post" action="./allupdate.do">
	<table class="wrap">
			<tr>
				<th>아이디</th>
			 	<th>비밀번호</th>
			 	<th>팬닉</th>
			 	<th>가입날짜</th>
			 	<th>이메일</th>
			 	<th>등급</th>
			 	<th>댓글수</th>
			 	<th>게시글수</th>
			 	<th>수정</th>
			 	<th>삭제</th>
			 	
			</tr>
		<c:forEach var="vo" items="${list }">
			 <tr>
				<td>${vo.user_id}</td> 
				<td>${vo.user_password }</td>
			 	<td>${vo.user_name }</td>
			 	<td>${vo.joindate}</td>
			 	<td>${vo.user_email }</td>
			 	<td>${vo.user_grade }</td>
			 	<td>${vo.user_replynum }</td>
			 	<td>${vo.user_articlenum }</td>
				<td>
					<a href="adminupdate.do?user_id=${vo.user_id }" class="update">수정</a>
				</td>
				<td>
					<input type="button" onclick="delete_id('${vo.user_id}')" value="삭제" class="delete">
				</td>
			 </tr>
			 
			
			<!-- 수정 삭제 기능 -->
		</c:forEach>
	</table>
	</form>
</div>
	<script type="text/javascript">
	 	function delete_id(user_id){
	 		 const frm = document.forms[0];
	 		 var isValid = true;
	 		 
	 		if(isValid){
	             alert('삭제하시겠습니까?')
	             location.href="./delete.do?user_id="+user_id;
	         }
	 	}
	 	
	</script>

</body>
</html>