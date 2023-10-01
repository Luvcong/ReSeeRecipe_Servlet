<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자화면 틀</title>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- css파일 따로 뺴서 link -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/manager.css">

</head>

<body>

	<!-- 관리자메뉴는 다 같이 사용하는 common 화면이 아니니까
		 member폴더 내부 등 다른 곳으로 옮겨주시길 부탁드림다
		 common폴더들에는 프로젝트 전역에서 쓰이는 공용 resource(JDBCTemplate 등)나
		 화면(헤더, 푸터 등)만 넣어주시면 됩니다!
		 너무 새벽이라 여기다 편지를남겨요,,, 읽고 지워주심 됩니다,, MJY -->

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
            <div class="nav-item active">
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
        console.log(main);
        console.log(content);
        main.appendChild(content);
    });
</script>

</html>