<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<fmt:requestEncoding value="utf-8"/>
<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/myPage.css">

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Emosic" name="title"/>
</jsp:include>


	<div class="myPage_container">
		<h2>마이페이지</h2>
		<form
			action="${pageContext.request.contextPath}/member/update"
			name="memberUpdate"
			id="update_info"
			method="post">
			
			<input type="text" id="id" name="id" placeholder="아이디" value="${loginMember.id}" required readonly/>
			
			<input type="text" id="nickName" name="nickName" placeholder="닉네임" value="${loginMember.nickName}" required readonly/>
			
			<input type="text" id="email" name="email" placeholder="이메일" value="" required readonly/>
			
			<button type="submit" class="update_btn" id="update_btn">정보 변경</button>
			<button type="button" class="modifyPw_btn" onclick="window.open('add')">비밀번호 변경</button>
			<button type="reset" class="cancle_btn" id="cancle_btn">취소</button>
			
		</form>
	</div>
	
	<script src="${pageContext.request.contextPath}/resources/js/member/register.js"></script>
	
	<script type="text/javascript">
	
	//닉네임 유효성 검사 & 닉네임 중복 검사(1 = 중복 / 0 != 중복)
	$("#nickName").change(function() {
		const $nickName = $("#nickName");	//const는 중복불가 변수
		const nickName = $nickName.val();
		const nickReg = /^[가-힣ㄱ-ㅎa-zA-Z0-9._-]{2,10}\$/;
		
		
		$.ajax({
			type: "get",
			url: "${pageContext.request.contextPath}/member/nickName/duplicate",
			data: {"nickName": nickName},
			success:function(nickNameDuplicate){
				
				if(nickReg.test(nickName) == false) {
					$(".nickName_checked").text("2~10자 가능합니다.").css("color","red");
					$nickName.focus();
					
				} else if(nickNameDuplicate != 1) {	//중복 사용자 없음 (사용 가능)
					$(".nickName_checked").text("사용 가능합니다.").css("color","green");
					
				} else if(nickNameDuplicate == 1) {	//중복 사용자 존재 (사용 불가)
					$(".nickName_checked").text("이미 존재하는 닉네임 입니다.").css("color","red");
					$nickName.focus();
				}
				
			},
			error : function(e){
				
				alert("에러 입니다.")
			}
		});

	});
		
	</script>
	


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>