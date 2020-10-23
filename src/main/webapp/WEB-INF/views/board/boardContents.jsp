<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
<script>

	// 취소 버튼 클릭 이벤트
	$(document).on('click', '#btnCancel', function(){
		location.href = "${pageContext.request.contextPath}/board/boardList";
	});

	// 수정 버튼 클릭 이벤트
	$(document).on('click', '#btnModify', function(){
		var url = "${pageContext.request.contextPath}/board/modifyForm";
		url = url + "?bno=" + ${boardContents.bno};
		url = url + "&mode=modify";
		location.href = url;
	});

	//삭제 버튼 클릭 이벤트
	$(document).on('click', '#btnDelete', function(){
		var deleteConfirm;
		deleteConfirm = confirm("本当に削除しますか？");
		if (deleteConfirm){
    		var url = "${pageContext.request.contextPath}/board/deleteBoard";
    		url = url + "?bno=" + ${boardContents.bno};
			location.href = url;
		}
	});

</script>
</head>
<body>
	<article>
		<div class="container" role="main">

			<h2>Board Contents</h2>

			<div class="bg-white rounded shadow-sm">
				<div class="board_title"><c:out value="${boardContents.title}"/></div>
				<div class="board_info_box">
					<span class="board_author"><c:out value="${boardContents.reg_id}"/></span>|<span class="board_date"><c:out value="${boardContents.reg_date}"/></span>|
				</div>
				<div class="board_content">${boardContents.content}</div>
				<div class="board_tag">TAG : <c:out value="${boardContents.tag}"/></div>
			</div>

			<div style="margin-top : 20px">
				<button type="button" class="btn btn-sm btn-primary" id="btnModify">Modify</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnDelete">Delete</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnCancel">Cancel</button>
			</div>

		</div>
	</article>
</body>
</html>
