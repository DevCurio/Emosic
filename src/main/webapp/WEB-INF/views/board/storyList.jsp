<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<fmt:requestEncoding value="utf-8"/>
<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/storyList.css">

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Emosic" name="title"/>
</jsp:include>

<section>
	<div id="storyList_container">
		<table class="table">
			<thead>
				<tr>
					<th class="list-num">번호</th>
					<th class="list-category">카테고리</th>
					<th class="list-title">제목</th>
					<th class="list-nickName">작성자</th>
					<th class="list-views">조회수</th>
					<th class="list-date">작성일</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${list != null}">
				<c:forEach items="${list}" var="post">
					
				</c:forEach>
			</c:if>
			</tbody>
		</table>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>