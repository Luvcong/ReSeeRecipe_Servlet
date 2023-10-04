<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴바</title>
</head>
<body>
	<div id="top">
        <img src="../image/hello.png" alt="">
        <button class="btn btn-outline-light text-dark">X</button>
    </div>
    
    <div id="header">
            <div class="header_top">
                <div>
                    <a href="#"> <!-- 홈 화면으로 리다이렉트 -->
                        <img src="../image/hello.png">
                    </a>
                </div>
                <div>
                    <b>내 리워드 : 123원</b>
                </div>
                <div>
                    <a href="#">로그인</a> <!-- 로그인 화면으로 포워딩 -->
                </div>
                <div style="display: none">
                    <a href="#">로그아웃</a> <!-- 로그인세션 삭제 -->
                </div>
                <div>
                    <a href="#">회원가입</a> <!-- 회원가입 화면으로 포워딩 -->
                </div>
                <div style="display: none">
                    <a href="#">마이페이지</a> <!-- 마이페이지 화면으로 포워딩 -->
                </div>
                <div>
                    <a href="#">장바구니</a> <!-- 장바구니 화면으로 포워딩 -->
                </div>
                <div style="display: none">
                    <a href="#">관리자메뉴</a> <!-- 관리자메뉴 화면으로 포워딩 -->
                </div>
            </div>
            <div class="header_bottom">
                <div>
                    <div>
                        <ul>
                            <li>전체카테고리</li>
                            <li style="display: none; font-size: 20px;"><a href="#">육류</a></li> <!-- 검색페이지 화면으로 포워딩 -->
                            <li style="display: none; font-size: 20px;"><a href="#">수산물</a></li> <!-- 검색페이지 화면으로 포워딩 -->
                            <li style="display: none; font-size: 20px;"><a href="#">채소</a></li> <!-- 검색페이지 화면으로 포워딩 -->
                            <li style="display: none; font-size: 20px;"><a href="#">간편식/가공</a></li> <!-- 검색페이지 화면으로 포워딩 -->
                        </ul>
                    </div>
                </div>
                <div>
                    <a href="#">스토어홈</a> <!-- 홈 화면으로 리다이렉트 -->
                </div>
                <div>
                    <a href="#">베스트</a> <!-- 검색페이지 화면으로 포워딩 -->
                </div>
                <div>
                    <a href="#">추천</a> <!-- 검색페이지 화면으로 포워딩 -->
                </div>
                <div>
                    <a href="#">신상</a> <!-- 검색페이지 화면으로 포워딩 -->
                </div>
                <div>
                    <a href="#"> <!-- 레시피메인 화면으로 포워딩 -->
                        <img src="../image/hello.png">
                    </a>
                </div>
                <a href="#"> <!-- 장바구니 화면으로 포워딩 -->
                    <img id="shopping-basket" src="../image/hello.png">
                </a>
                <form action="">
                    <input type="text">
                    <button type="submit">검색</button> <!-- 검색페이지 화면으로 포워딩 -->
                </form>
            </div>
        </div>
        <hr>











</body>
</html>