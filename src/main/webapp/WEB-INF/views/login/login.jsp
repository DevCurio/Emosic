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
        	action=""
        	id="login_info">
	            <input type="text" name="id" id="id" placeholder="아이디">
	            <input type="password" name="password" id="pw" placeholder="비밀번호">
	            
	            <button type="submit" id="login_btn">로그인</button>
	
	            <input type="checkbox" name="id_save" id="id_save">
	            <span class="id_save_text">아이디 저장</span>
        	</form>
        
        
        <hr>
        <div class="sub_btn">
            <a href="${pageContext.request.contextPath}/register">회원가입</a>
            <a href="#">아이디 찾기</a>
            <a href="#">비밀번호 재설정</a>
        </div>
        <div class="oauth">
            <input type="button" class="kakao_btn" style="background-image:url('${pageContext.request.contextPath}/resources/images/oauth/kakao/kakao_login_large_wide.png')">
        </div>
    </div>
</body>
</html>