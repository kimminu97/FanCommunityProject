<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- sessionCheck.jsp -->
<!-- member 는 session 객체의 애트리뷰트 -->
<c:if test="${member==null }">  
	<script>
		alert('로그인을 해야합니다.!!');
		location.href='${pageContext.request.contextPath}/login.do';
	</script>
</c:if>
