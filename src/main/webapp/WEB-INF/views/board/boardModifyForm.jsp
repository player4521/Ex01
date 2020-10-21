<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--form:from 스프링 2.0부터 지원 --%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
		$("#form").submit();
	});

	// 취소 이벤트
	$(document).on('click', '#btnBack', function(e) {
		e.preventDefault();
		location.href = "${pageContext.request.contextPath}/board/boardList";
	});

	// 글 수정 이벤트
	$(document).ready(function(){
		var mode = '<c:out value="${mode}"/>';
		if ( mode == 'modify'){

			//입력 폼 셋팅
			$("#reg_id").prop('readonly', true);
			$("input:hidden[name='bno']").val(<c:out value="${boardContents.bno}"/>);
			$("input:hidden[name='mode']").val('<c:out value="${mode}"/>');
			$("#reg_id").val('<c:out value="${boardContents.reg_id}"/>');
			$("#title").val('<c:out value="${boardContents.title}"/>');
			$("#content").val('<c:out value="${boardContents.content}"/>');
			$("#tag").val('<c:out value="${boardContents.tag}"/>');
		}
	});

</script>
</head>
<body>
	<article>
		<div class="container" role="main">

			<h2>Board Modify</h2>

			<form:form name="form" id="form" role="form"
				modelAttribute="boardDto" method="post"
				action="${pageContext.request.contextPath}/board/saveBoardForm">
				<form:hidden path="bno" />
				<input type="hidden" name="mode" />
				<div class="mb-3">
					<label for="reg_id">Writer</label>
					<form:input path="reg_id" id="reg_id" class="form-control"
						placeholder="Please Insert Name" />
				</div>
				<div class="mb-3">
					<label for="title">Title</label>
					<form:input path="title" id="title" class="form-control"
						placeholder="Please Insert Title" />
				</div>
				<div class="mb-3">
					<label for="content">Content</label>
					<form:textarea path="content" id="content" class="form-control"
						rows="5" placeholder="Please Insert Content" />
				</div>
				<div class="mb-3">
					<label for="tag">TAG</label>
					<form:input path="tag" id="tag" class="form-control"
						placeholder="Please Insert Tag" />
				</div>
			</form:form>

			<div>
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">Save</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnBack">Back</button>
			</div>

		</div>
	</article>
</body>
</html>
