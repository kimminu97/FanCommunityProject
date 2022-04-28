<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이들과 함께해조</title>
<style type="text/css">
div{
	width:200px;height: 200px;
	border: 1px solid gray;
	padding:50px;
	margin: 100px auto;
}
</style>
</head>
<body>
<c:if test="${success=='y' }">
	<script>
		alert("로그인 하셨습니다.!");
		location.href="./";	//상대결로 -> http://localhost:8085/idev/
	</script>
</c:if>

<c:if test="${update==1}">
	<script>
		alert("회원정보를 수정하였습니다.!");
		location.href="./";	//상대결로 -> http://localhost:8085/idev/
	</script>
</c:if>
<div>
<!-- 객체가 null 인지 비교 : 같다(==)는 eq , 같지않다(!=)  ne  -->
<!-- member 애트리뷰는 로그인 성공하면 session 에 저장했다. -->
<c:choose>  
	<c:when test="${users == null}">  
	<!-- 로그인 안했을 때 메뉴 -->
		<a href="login.do">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="./member/join.do">회원가입</a><br>
		<a href="./member/list.do">회원목록</a>
	</c:when>
	<c:otherwise>  
	<!-- 로그인했을 때 메뉴 -->
		<h5 style="color:orange;">${users.user_name}&nbsp;님 환영합니다.</h5>
		<a href="./member/update.do">내 정보 수정</a>
		<a href="logout.do">로그아웃</a>
	</c:otherwise>
</c:choose>
</div>

</body>
</html>








