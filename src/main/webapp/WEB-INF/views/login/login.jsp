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
	<!-- 사용자작성 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/login.css">
</head>
<body>
	
	<div class="container">
        <h1>로그인</h1>
        	<form
        	action="${pageContext.request.contextPath}/member/login"
        	method="post"
        	id="login_info">
	            <input type="text" name="id" id="id" placeholder="아이디">
	            <input type="password" name="password" id="password" placeholder="비밀번호">
	            
				<input type="checkbox" name="remember-me" id="remember-me">
	            <label for="remember-me" class="remember-me_text">로그인 유지</label>

	            <button type="submit" id="login_btn">로그인</button>
        	</form>
        
        
        
        <div class="sub_btn">
            <a href="${pageContext.request.contextPath}/register">회원가입</a>
            <a href="#">ID 찾기</a>
            <a href="#">비밀번호 재설정</a>
        </div>
        <div class="oauth">
            <input type="button" class="kakao_btn" style="background-image:url('${pageContext.request.contextPath}/resources/images/oauth/kakao/kakao_login_large_wide.png')">
        </div>
    </div>
</body>
</html>