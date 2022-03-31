<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<fmt:requestEncoding value="utf-8"/>
<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/home.css">

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Emosic" name="title"/>
</jsp:include>

<section class="intro">
    <h2 class="intro__title hidden">오늘 나에게 필요한 음악</h2>
    <div class="intro__background intro__background--left"></div>
    <div class="intro__background intro__background--right"></div>
</section>

<section class="hero">
    <div class="hero__col hero__col--2">
        <img src="https://cdn.pixabay.com/photo/2016/11/09/23/16/music-1813100_960_720.png">
    </div>
    
</section>

<!-- partial -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/3.2.6/gsap.min.js'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/GSDevTools3.min.js'>
</script><script  src="${pageContext.request.contextPath}/resources/js/common/home.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>