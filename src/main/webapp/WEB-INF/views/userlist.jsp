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
<body>
    ${list } <br>
    <c:forEach var="vo" items="${list }">
    	<br>아이디 : ${vo.name }
    	<br>비밀번호 : ${vo.name }
    	<br>팬닉 : ${vo.name }
    	<br>가입날짜 : ${vo.name }
    	<br>이메일 : ${vo.name }
    	<br>등급 : ${vo.name }
    	<br>게시글 개수 : ${vo.name }
    	<br>댓글 개수 : ${vo.name }
    </c:forEach>
	<a href="../home.do">홈으로</a>

</body>
</html>