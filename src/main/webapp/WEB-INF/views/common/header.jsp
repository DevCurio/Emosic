<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--tablib-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	

    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!--home.jsp에서 정의-->
    <title>${param.title}</title> 
    
    <!-- 사용자작성 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/footer.css">
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   	
	<!-- bootstrap js: jquery load 이후에 작성할것.-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

    <!-- 구글 아이콘 -->
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
    
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
			<a href="#" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none"></a>
			<ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
				<li><a href="#" class="nav-link px-2 link-secondary">Emosic</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">PlayList</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">Daily</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">Notice</a></li>
			</ul>
			<!-- 통합 검색 -->
			<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
				<input type="search" class="form-control" placeholder="Search..." aria-label="Search">
			</form>
			<!-- 로그인 하지 않은 경우 -->
			<!-- loginMember는 LoginController에서 addObject함 -->
			<c:if test="${loginMember == null}">
			<div class="dropdown text-end">
				<a href="${pageContext.request.contextPath}/login">
					<span class="material-icons-outlined">login</span>
				</a>
			</div>
			</c:if>
			<!-- 로그인 한 경우 -->
			<c:if test="${loginMember != null}">
			<div class="dropdown text-end">
				<a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
					<img src="resources/images/header/profile/cat.png" alt="프로필" class="rounded-circle" width="40px" height="40px">
				</a>
				<ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
	            	<li><a class="dropdown-item" href="#">게시물 작성</a></li>
	            	<li><a class="dropdown-item" href="${pageContext.request.contextPath}/myPage">프로필</a></li>
	            	<li><hr class="dropdown-divider"></li>
	            	<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
				</ul>				
			</div>
			</c:if>
		</div>
	</div>
</header>