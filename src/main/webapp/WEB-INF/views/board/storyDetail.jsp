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

		<input type="text" class="story-category" placeholder="카테고리" value="${board.category}" readonly required>
		
		<input type="text" class="storyTitle" name="title" value="${board.title}" readonly required>
		<input type="text" class="input_userId" name="userId" value="${loginMember.id}" readonly required>
		<div id="contents_container">
			<input type="text" value="${board.contents}" readonly>
		</div>
		
	</div>
</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>