<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <!-- bootstrap js: jquery load 이후에 작성할것.-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
	<!-- 사용자작성 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/register.css">
    <!-- 사용자 작성 js -->
	<script src="${pageContext.request.contextPath}/resources/js/member/register.js"></script>
	
    <%-- RedirectAttributes.addFlashAttribute의 저장된 속성값 사용(1회용) --%>
	<c:if test="${not empty msg}">
	<script>
		alert("${msg}");
	</script>
	</c:if>
</head>

<body>
	<div class="container">
        <h1>회원가입</h1>
        <form
			class="form_memberReg"
        	action="${pageContext.request.contextPath}/member/register"
        	id="reg_info"
        	method="post">
        	
            <input type="text" name="id" id="id" placeholder="아이디" required>
            <span class="id_checked"></span>

            <input type="password" name="password" id="password" placeholder="비밀번호">
            <span class="pw_checked"></span>

            <input type="password" name="pw_confirm" id="pw_confirm" placeholder="비밀번호 확인">
            <span class="pw_confirm_checked"></span>
            
            <input type="text" name="nickName" id="nickName" placeholder="닉네임" required>
            <span class="nickName_checked"></span>
  
            <button type="submit" class="reg_btn" id="reg_btn">회원가입</button>
        </form>
    </div>
 
 	<script type="text/javascript">
 	//아이디 유효성 검사 & 아이디 중복 검사(1 = 중복 / 0 != 중복)
 	$("#id").change(function() {
 		const $id = $("#id");	//const는 중복불가 변수
 		const id = $id.val();
 		const idReg = /^[a-z0-9_-]{5,15}$/;
 		
 		//debugger;
 		$.ajax({
 			type: "get",
 			url: "${pageContext.request.contextPath}/member/id/duplicate",
 			data: {"id": id},
 			success:function(isduplicate){
 				//debugger;
 				if(idReg.test(id) == false) {
 					$(".id_checked").text("5~15자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.").css("color","red");
 					$id.focus();
 					
 				} else if(isduplicate != 1) {	//중복 사용자 없음 (사용 가능)
 					$(".id_checked").text("사용 가능합니다.").css("color","green");
 					
 				} else if(isduplicate == 1) {	//중복 사용자 존재 (사용 불가)
 					$(".id_checked").text("이미 존재하는 ID 입니다.").css("color","red");
 					$id.focus();
 				}
 				
 			},
 			error : function(e){
 				//debugger;
 				alert("에러 입니다.")
 			}
 		});

 	});

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
</body>

</html>