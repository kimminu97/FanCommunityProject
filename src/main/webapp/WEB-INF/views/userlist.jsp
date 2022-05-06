<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<form name="frmUser" method="post" action="./allsave.do">
	<table>
		<tr>	
			<th>이름</th>
			<th>비밀번호</th>
			<th>팬닉</th>
			<th>가입일자</th>
			<th>이메일</th>
			<th>등급</th>
			<th>댓글</th>
			<th>게시글</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="vo" items="${list }">
		<tr>
			<td>
				<input type="text" value="${vo.user_id }"> 
			</td>
			<td>
				<input type="text" value="${vo.user_password }"> 
			</td>
			<td>
				<input type="text" value="${vo.user_name }"> 
			</td>
			<td>
				<input type="text" value="${vo.joindate }"> 
			</td>
			<td>
				<input type="text" value="${vo.user_email }"> 
			</td>
			<td>
				<input type="text" value="${vo.user_grade }"> 
			</td>
			<td>
				<input type="text" value="${vo.user_replynum }"> 
			</td>
			<td>
				<input type="text" value="${vo.user_articlenum }"> 
			</td>
			
			<!-- 수정 삭제 기능 -->
			<td>
				<input type="button" onclick="update_id('${vo.user_id}')" value="수정">
			</td>
			<td>
				<input type="button" onclick="allupdate_id()" value="삭제">
			</td>
		</tr>
		</c:forEach>
	</table>
	</form>
</div>
	<script type="text/javascript">
			function delete_id(user_id) {
				const yn=confirm('아이디를 삭제할까요?')
				console.log(yn);
				if(yn==true)
					location.href="./delete.do?user_id="+user_id;
			}
			
			function allupdate_id(user_id) {
				const yn=confirm('회원정보 수정을 완료하시겠습니까?')
				console.log(yn);
				if(yn==true)
					loaciont.href="./allupdate.do?user_id="+user_id;
			}
	</script>

</body>
</html>