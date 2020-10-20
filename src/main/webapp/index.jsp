<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!-- 화면에 공통으로 들어가는 부분 관리 -->
<%@ include file="/WEB-INF/views/layout/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 새로 만든 css 파일을 참조 -->
<!-- <link rel="stylesheet" href="css/custom.css"> -->
<c:set var="base" value="${pageContext.request.contextPath}"/>
<link href="<c:url value="${base}/resources/css/custom.css" />" rel="stylesheet">

<title>BBS</title>
</head>
<body>
	<!-- 로그인 페이지로 이동하는 스크립트 코드 -->
	<script>
		location.href="board/boardList";
	</script>
</body>
</html>