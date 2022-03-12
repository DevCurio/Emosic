<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<fmt:requestEncoding value="utf-8"/>
<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/storyReg.css">
<script src="https://cdn.ckeditor.com/ckeditor5/31.1.0/classic/ckeditor.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Emosic" name="title"/>
</jsp:include>

<section>
	<div id="storyReg">
	
		<form
			action="${pageContext.request.contextPath}/board/storyReg"
			id="form_storyReg"
			method="post">
			
			<select id="storyReg-category" name="category" required>
				<option value="">카테고리</option>
				<option value="일상">일상</option>
				<option value="연애">연애</option>
				<option value="직장">직장</option>
				<option value="취업">취업</option>
				<option value="우정">우정</option>
				<option value="기타">기타</option>
			</select>
			
			<input type="text" class="storyTitle" name="title" placeholder="제목을 입력하세요">
			<input type="text" class="id" name="id" value="${loginMember.id}" readonly required>
			<div id="editor_container">
				<textarea id="contents" name="contents" class="ckeditor" placeholder="내용을 입력하세요">${data.contents}</textarea>
			</div>
			
        	<div class="storyReg_button">
        		<input type="submit" value="저장" class="reg_btn">
        		<input type="button" value="취소" class="cancle_btn">
        	</div>
        	
        	
		</form>
		
	</div>
</section>

<script>
ClassicEditor
	.create( document.querySelector( '#contents' ) )
	.catch( error => {
    	console.error( error );
});

function boardValidate(){
	const $contents = $("#contents");
	const contents = CKEDITOR.instances.contents.getData();
}

CKEDITOR.editorConfig = function( config ) {
    config.enterMode = CKEDITOR.ENTER_BR

};
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>