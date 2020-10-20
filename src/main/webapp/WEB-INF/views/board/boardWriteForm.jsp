<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
<script>

	// 글 저장 이벤트
	$(document).on('click', '#btnSave', function(e) {
		e.preventDefault();

		// form 이라는 id를 가진 객체(여기서는 form 자체가 됨)
		$("#form").submit();
	});

	// 취소 이벤트
	$(document).on('click', '#btnBack', function(e) {
		e.preventDefault();
		location.href = "${pageContext.request.contextPath}/board/boardList";
	});

</script>
</head>
<body>
	<article>
		<div class="container" role="main">
			<h2>Board Write</h2>
			<%-- 일반적인 form태그 --%>
			<form name="form" id="form" role="form" method="post"
			action="${pageContext.request.contextPath}/board/saveBoardForm">
				<div class="mb-3">
					<label for="title">Title</label>
					<input type="text" class="form-control" name="title" id="title" placeholder="Please Insert Title">
				</div>

				<div class="mb-3">
					<label for="reg_id">Writer</label>
					<input type="text" class="form-control" name="reg_id" id="reg_id" placeholder="Please Insert Name">
				</div>

				<div class="mb-3">
					<label for="content">Content</label>
					<textarea class="form-control" rows="5" name="content" id="content" placeholder="Please Insert Content" ></textarea>
				</div>

				<div class="mb-3">
					<label for="tag">TAG</label>
					<input type="text" class="form-control" name="tag" id="tag" placeholder="Please Insert Tag">
				</div>
			</form>
			<div>
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">Save</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnBack">Back</button>
			</div>
		</div>
	</article>
</body>
</html>
