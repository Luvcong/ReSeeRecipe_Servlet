<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자화면 네비바</title>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- css파일 따로 뺴서 link -->
<link rel="stylesheet" href="<%= contextPath %>/resources/css/manager.css">

</head>

<body>

    <!-- 관리자메뉴 title 상단 -->
    <div class="rs-title">관리자 메뉴</div>

    <!-- 카테고리 리스트 -->
    <div class="rs-main">
        <div class="rs-navbar">
            <div class="nav-item">
                <a href="#">게시판 관리</a></div>
            <div class="nav-item">
                <a href="#">회원 관리</a></div>
            <div class="nav-item">
                <a href="#">주문 관리</a></div>
            <div class="nav-item">
                <a href="#">문의 관리</a></div>
            <div class="nav-item">
                <a href="#">메뉴 관리</a></div>
            <div class="nav-item">
                <a href="#">리워드 관리</a></div>
            <div class="nav-item">
                <a href="#">쿠폰 관리</a></div>
        </div>
    <!-- rs-content추가 -->
    </div>  <!-- rs-main -->

</body>

<!-- rs-content(자식요소)를 rs-main안으로 이동시킨다 -->
<script>
    $(function(){
        let main = document.querySelector('.rs-main');
        let content = document.querySelector('.rs-content');
        main.appendChild(content);
    });
</script>

</html>