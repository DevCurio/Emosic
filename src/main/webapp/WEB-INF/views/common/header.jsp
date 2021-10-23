<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<!--tablib-->
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${param.title}</title>
    
    <!-- 사용자작성 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/footer.css">
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
   	<!-- 구글 아이콘 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

	<!-- bootstrap js: jquery load 이후에 작성할것.-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

	<%-- RedirectAttributes.addFlashAttribute의 저장된 속성값 사용(1회용) --%>
	<c:if test="${not empty msg}">
	<script>
		alert("${msg}");
	</script>
	</c:if>
</head>

<body>
	<div id="container">
        <header>
            <div class="header">
              <a class="main_link" href="${pageContext.request.contextPath}/">Emosic</a>

              <nav id="nav">
	              <ul>
	                <li>
	                  <a href="#">PlayList</a>
	                </li>
	                <li>
	                  <a href="#">Daliy</a>
	                </li>
	                <li>
	                  <a href="#">Notice</a>
	                </li>
	              </ul>
	          </nav>

              <div class="nav_login">
                <button id="login_button">
                  <a href="${pageContext.request.contextPath}/login"><span class="material_icons_outlined">login</span></a>
                </button>
              </div>
            </div>

        </header>
<section id="content">