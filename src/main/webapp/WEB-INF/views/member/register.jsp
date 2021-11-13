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
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <!-- bootstrap js: jquery load 이후에 작성할것.-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
	<!-- 사용자작성 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/register.css">
    
	
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
        	
            <input type="text" name="id" id="id" placeholder="아이디">
            <span id="id_check"></span>
            <span class="id_success">사용 가능합니다.</span>
            <span class="id_fail">사용 불가합니다.(5~12자의 영문소문자,숫자만 가능합니다.)</span>

            <input type="password" name="password" id="password" placeholder="비밀번호">

            <span class="pw_success">사용 가능합니다.</span>
            <span class="pw_fail">사용 불가합니다.(8~20자의 영문자, 숫자, 특수문자가 포함되어야 합니다.)</span>

            <input type="password" id="pw_confirm" placeholder="비밀번호 확인">

            <span class="pw_confirm_success">비밀번호가 일치 합니다.</span>
            <span class="pw_confirm_fail">비밀번호가 일치 하지 않습니다.</span>
            
            <input type="text" name="nickName" id="nickName" placeholder="닉네임">

            <span class="nick_name_success">사용 가능합니다.</span>
            <span class="nick_name_fail">이미 사용중 입니다.</span>        

            <button type="button" class="reg_btn" id="reg_btn">회원가입</button>
        </form>
    </div>
    
    
<!-- 사용자 작성 js -->
<script src="${pageContext.request.contextPath}/resources/js/member/register.js"></script>

	
</body>


</html>