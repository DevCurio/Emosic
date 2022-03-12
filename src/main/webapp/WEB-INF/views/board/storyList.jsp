<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.project.emosic.board.model.vo.Board, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<fmt:requestEncoding value="utf-8"/>
<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/storyList.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/board/storyList.js">


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Emosic" name="title"/>
</jsp:include>

<section>
	<div id="storyList_container">
		<table class="table">
			<thead>
				<tr>
					<th class="list-no">번호</th>
					<th class="list-category">카테고리</th>
					<th class="list-title">제목</th>
					<th class="list-nickName">작성자</th>
					<th class="list-viewCount">조회수</th>
					<th class="list-date">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="board">
					<tr data-no="${board.no}">
						<td>${board.no}</td>
						<td>${board.category}</td>
						<td><a href="${pageContext.request.contextPath}/board/storyDetail?no=${board.no}" class="detailLink">${board.title}</a></td>
						<td>${board.id}</td>
						<td>${board.viewCount}</td>
						<td><fmt:formatDate value="${board.writeDate}" pattern="yy/MM/dd"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>