<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- jstl,c태그를 사용할 수 있도록 해줌 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl,fmt태그를 사용할 수 있도록 해줌 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page session="false"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Board</title>
<script>
	// 게시글 작성으로 이동
	$(document).on(
					'click',
					'#btnWriteForm',
					function(e) {
						e.preventDefault();
						location.href = "${pageContext.request.contextPath}/board/boardWriteForm";
					});

	// 게시글 내용으로 이동
	function fn_contentView(bno) {
		var url = "${pageContext.request.contextPath}/board/getBoardContents";
		url = url + "?bno=" + bno;
		location.href = url;
	}

	//이전 버튼 이벤트
	function fn_previousPage(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/board/boardList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/board/boardList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}

	//다음 버튼 이벤트
	function fn_nextPage(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/board/boardList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}
</script>

</head>
<body>
	<article>
		<div class="container">
			<div class="table-responsive">
				<h2>Board List</h2>
				<table class="table table-striped table-sm">
					<colgroup>
						<col style="width: 5%;" />
						<col style="width: auto;" />
						<col style="width: 15%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
					</colgroup>
					<thead>
						<tr>
							<th>#No</th>
							<th>Title</th>
							<th>作成者</th>
							<th>登録日</th>
							<th>更新日</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty boardList }">
								<tr>
									<td colspan="5" align="center">No data</td>
								</tr>
							</c:when>
							<c:when test="${!empty boardList}">
								<c:forEach var="list" items="${boardList}">
									<tr>
										<td><c:out value="${list.bno}" /></td>
										<td><a href="#" onClick="fn_contentView('${list.bno}')">
												<c:out value="${list.title}" />
										</a></td>
										<td><c:out value="${list.reg_id}" /></td>
										<td><fmt:formatDate value="${list.reg_date}"
												pattern="yyyy-MM-dd" /></td>
										<td><fmt:formatDate value="${list.mod_date}"
												pattern="yyyy-MM-dd" /></td>
										<%-- String형식으로 넘겨받을 경우 Date형식 변환 후 formatDate 필요 -->
										<%-- <fmt:parseDate value='${list.trading_day}' var='trading_day' pattern='yyyymmdd'/> --%>
										<%-- <fmt:formatDate value="${trading_day}" pattern="yyyy.mm.dd"/> --%>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
			</div>
			<div>
				<button type="button" class="btn btn-sm btn-primary"
					id="btnWriteForm">Write</button>
			</div>

			<!-- pagination{s} -->
			<div id="paginationBox">
				<ul class="pagination">
					<c:if test="${pagination.prev}">
						<li class="page-item"><a class="page-link" href="#"
							onClick="fn_previousPage('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
					</c:if>
					<c:forEach begin="${pagination.startPage}"
						end="${pagination.endPage}" var="idx">
						<li class="page-item"
							value="${pagination.page == idx ? 'active' : ''}"><a
							class="page-link" href="#"
							onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">${idx}</a>
						</li>
					</c:forEach>
					<c:if test="${pagination.next}">
						<li class="page-item"><a class="page-link" href="#"
							onClick="fn_nextPage('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Next</a></li>
					</c:if>
				</ul>
			</div>
			<!-- pagination{e} -->

		</div>
	</article>
</body>
</html>