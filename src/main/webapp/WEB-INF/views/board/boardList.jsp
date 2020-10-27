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

<c:url var="getBoardListURL" value="/board/boardList"></c:url>

<title>Board</title>
<script>
	// 게시글 작성으로 이동
	$(document).on('click', '#btnWriteForm', function(e) {
		e.preventDefault();
		location.href = "${pageContext.request.contextPath}/board/boardWriteForm";
	});

	// 게시글 내용으로 이동
	function fn_contentView(bno) {
		var url = "${pageContext.request.contextPath}/board/getBoardContents";
		url = url + "?bno=" + bno;
		location.href = url;
	}

	// 이전 버튼 이벤트
	function fn_previousPage(page, range, rangeSize, searchType, keyword) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/board/boardList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		location.href = url;
	}

	// 페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/board/boardList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		location.href = url;
	}

	// 다음 버튼 이벤트
	function fn_nextPage(page, range, rangeSize, searchType, keyword) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/board/boardList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		location.href = url;
	}

	// 검색 버튼 이벤트
	$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();
		var url = "${getBoardListURL}"; // c:url사용(선언은 head밑에 있음)
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = encodeURI(url); // encodeURI한글검색 가능
		console.log(url);
	});
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
						<col style="width: 5%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
					</colgroup>
					<thead>
						<tr>
							<th>#No</th>
							<th>Title</th>
							<th>作成者</th>
							<th>照会</th>
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
										<td><c:out value="${list.view_cnt}" /></td>
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

			<div style="padding: 1%"></div>

			<!-- pagination{s} -->
			<div id="paginationBox">
				<ul class="pagination">
					<c:if test="${pagination.prev}">
						<li class="page-item"><a class="page-link" href="#"
							onClick="fn_previousPage('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.searchType}', '${pagination.keyword}')">Previous</a></li>
					</c:if>
					<c:forEach begin="${pagination.startPage}"
						end="${pagination.endPage}" var="idx">
						<li class="page-item"
							value="${pagination.page == idx ? 'active' : ''}"><a
							class="page-link" href="#"
							onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.searchType}', '${pagination.keyword}')">${idx}</a>
						</li>
					</c:forEach>
					<c:if test="${pagination.next}">
						<li class="page-item"><a class="page-link" href="#"
							onClick="fn_nextPage('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.searchType}', '${pagination.keyword}')">Next</a></li>
					</c:if>
				</ul>
			</div>
			<!-- pagination{e} -->

			<!-- search{s} -->
			<div class="form-group row justify-content-center">
				<div class="w100" style="padding-right: 10px">
					<select class="form-control form-control-sm" name="searchType"
						id="searchType">
						<option value="title">Title</option>
						<option value="content">内容</option>
						<option value="reg_id">作成者</option>
					</select>
				</div>
				<div class="w300" style="padding-right: 10px">
					<input type="text" class="form-control form-control-sm"
						name="keyword" id="keyword" value="${pagination.keyword}">
				</div>
				<div>
					<button class="btn btn-sm btn-primary" name="btnSearch"
						id="btnSearch">検索</button>
				</div>
			</div>
			<!-- search{e} -->

		</div>
	</article>
</body>
</html>