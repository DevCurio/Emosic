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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

	<%-- RedirectAttributes.addFlashAttribute의 저장된 속성값 사용(1회용) --%>
	<c:if test="${not empty msg}">
	<script>
		alert("${msg}");
	</script>
	</c:if>
</head>

<body>
	<header class="p-3 mb-3 border-bottom">
		<div class="container">
			<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				<a href="" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none"></a>
				<ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<li><a href="#" class="nav-link px-2 link-secondary">Emosic</a></li>
					<li><a href="#" class="nav-link px-2 link-dark">PlayList</a></li>
					<li><a href="#" class="nav-link px-2 link-dark">Daily</a></li>
					<li><a href="#" class="nav-link px-2 link-dark">Notice</a></li>
				</ul>
				
				<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
					<input type="search" class="form-control" placeholder="Search..." aria-label="Search">
				</form>
				<div class="dropdown text-end">
					<a href="${pageContext.request.contextPath}/login" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
						<span class="material_icons_outlined">login</span>
					</a>
					<ul></ul>
				</div>
			</div>
		</div>
	</header>

<section id="content">