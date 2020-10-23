<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>board</title>

</head>
<body>
	<article>
		<div class="container">
			<p>データの処理中に問題が発生しました。</p>
			<p>管理者に問い合わせください。</p>
			<h3>${exception.getMessage()}</h3>
			<ul>
				<c:forEach items="${exception.getStackTrace()}" var="stack">
					<li>${stack.toString()}</li>
				</c:forEach>
			</ul>
		</div>
	</article>
</body>
</html>
