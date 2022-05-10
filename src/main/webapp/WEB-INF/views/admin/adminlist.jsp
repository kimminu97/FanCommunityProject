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
<link rel="stylesheet" href="./resources/css/userlist.css" />
	<a href="home"><img class="logo" alt="logo"
			src="./resources/image/logo.png" /></a> <br>
<body>
<h3 class="align-center">GIDLE 회원 리스트(관리자)</h3>
<div class="bg">
	<form name="frmUser" method="post" action="./allupdate.do">
	<table>
			<tr>
				<td>아이디</td>
			 	<td>비밀번호</td>
			 	<td>팬닉</td>
			 	<td>가입날짜</td>
			 	<td>이메일</td>
			 	<td>등급</td>
			 	<td>댓글수</td>
			 	<td>게시글수</td>
			 	<td>수정</td>
			 	<td>삭제</td>
			 	
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
					<a href="adminupdate.do?user_id=${vo.user_id }">수정</a>
				</td>
				<td>
					<input type="button" onclick="delete_id('${vo.user_id}')" value="삭제">
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