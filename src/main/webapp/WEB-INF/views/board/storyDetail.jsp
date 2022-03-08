<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<fmt:requestEncoding value="utf-8"/>
<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/storyDetail.css">

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Emosic" name="title"/>
</jsp:include>

<section>
	<div id="storyDetail">

		<div class="storyInfo">
			
			<div class="storyTitle">
				<c:out value="${board.title}" />
			</div>
			
			<hr>
			
			<div class="story-category">
				<c:out value="${board.category}"/>
			</div>
			
			<div class="info-right">
			
				<div class="writeDate">
					<fmt:formatDate value="${board.writeDate}" pattern="yy/MM/dd"/>
				</div>
				
				<div class="viewCount">
					<c:out value="${board.viewCount}"></c:out>
				</div>
				
				<div class="userId">
					<c:out value="${board.userId}"/>
				</div>
				
			</div>
			
			<br>
			<hr>
			
			<div id="contents_container">
				<input type="text" class="contents" value="${board.contents}" readonly>
			</div>
		
		</div>
		
		<br>
		
		<div class="re-musicList">
			<div class="search">
				<input type="text"	class="search-music" placeholder="추천 음악 검색하기">
			</div>
		</div>
	</div>
	
</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>