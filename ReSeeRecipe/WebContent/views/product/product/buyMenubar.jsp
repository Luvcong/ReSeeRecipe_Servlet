<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semi.member.model.vo.Member" %>
<%
	// 메인경로	
	String contextPath = request.getContextPath();

	// 로그인한 회원
	Member loginMember = (Member)session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴바</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<style>
	#top{
        text-align: center; 
        letter-spacing: -0.05em; 
        height: 50px;
        width: auto;
        position: relative;
    }
    #top>img{
        height: 100%;
        width: 100%;
    }
    #top>button{
        position: absolute;
        top: 10%;
        left : 90%;
    }
        
    a{
        text-decoration: none;
        color: black;
    }
    a:hover{
        text-decoration: none;  
        color: grey; 
    }
    hr{
        border: 1px outset lightgrey;
    }
    li{
        list-style-type: none;
    }
    ul{
        margin: 0;
        padding: 0;
    }
    
    /* 헤더 */
    #header{
        height: 150px;
        width: 1200px;
        margin: auto;
    }
    /* 헤더위쪽 */
    .header_top{
        height: 70px;
        display: grid;
        grid-auto-flow: column;
        grid-template-columns: 1fr;
    }
    .header_top>div{
        display: inline-block; 
        margin-top: 23px;
        margin-left: 10px;
    }
    .header_top img{
        display: inline-block;
        height: 20px;
        width: 50px;
    }
    .header_top>div:nth-child(7){
        margin-right: 10px;
    }
    .header_top>div:nth-child(8){
        margin-right: 10px;
    }
    .header_top>div:nth-child(2){
        color: green;
    }
    /* 헤더아래쪽 */
    .header_bottom>div{
        display: inline-block;
        margin-top: 10px;
        margin-left: 15px;
        font-size: 35px;
    }
    .header_bottom>div:nth-child(1){
        margin-right: 15px;
    }
    .header_bottom img{
        height: 20px;
        width: 50px;
    }
    #shopping-basket{
        height: 50px;
        width: 50px;
        margin-left: 130px;
    }
    .header_bottom input:nth-child(1){
        position: relative;
        left: 970px;
        bottom: 40px;
        height: 30px;
        width: 180px;
    }
    .header_bottom button:nth-child(2){
        position: relative;
        left: 965px;
        bottom: 40px;
        height: 30px;
        width: 50px;
    }
    
    #m_title{
    	position: relative;
    	z-index: 1;
    }
    #m_title>p{
    	margin-bottom: 0px;
    	paddint-bottom: 16px;
    }
    #m_title>ul{
    	display: none;
    	position: absolute;
    }
    #m_title>p:hover{
    	cursor: pointer;
    }
    #m_title>p:hover + ul{
    	display: block;
    }
    #m_title>ul:hover{
    	display: block;
    }
</style>

</head>
<body>
	<div id="top">
        <img src="../image/hello.png" alt="">
        <button class="btn btn-outline-light text-dark">X</button>
    </div>
    
    <div id="header">
            <div class="header_top">
                <div>
                    <a href="<%= contextPath %>"> <!-- 홈 화면으로 리다이렉트 -->
                        <img src="../image/hello.png">
                    </a>
                </div>
                <% if(loginMember == null) {%>
	                <div>
	                    <a href="<%= contextPath %>/yrloginForm.me">로그인</a> <!-- 로그인 화면으로 포워딩 -->
	                </div>
	                <div>
	                    <a href="#">회원가입</a> <!-- 회원가입 화면으로 포워딩 -->
	                </div>
                <% } else { %>
                	<% if(loginMember.getMemGrade() == 4) { %>
	                	<div>
		                    <a href="<%= contextPath %>/hllogin.ma">관리자메뉴</a> <!-- 관리자메뉴 화면으로 포워딩 -->
		                </div>
	                <% } %>
                	<div>
                    	<b>내 리워드 : 123원</b>
                	</div>
                	<div>
	                    <a href="<%= contextPath %>/yrlogout.me">로그아웃</a> <!-- 로그인세션 삭제 -->
	                </div>
	                <div>
                    <a href="#">마이페이지</a> <!-- 마이페이지 화면으로 포워딩 -->
	                </div>
	                <div>
	                    <a href="<%= contextPath %>/cart.po">장바구니</a> <!-- 장바구니 화면으로 포워딩 -->
	                </div>
	            <% } %>
            </div>
            <div class="header_bottom">
                <div id="m_title">
                   	<p>전체카테고리</p>
                    <ul>
                        <li><a href="#">육류</a></li> <!-- 검색페이지 화면으로 포워딩 -->
                        <li><a href="#">수산물</a></li> <!-- 검색페이지 화면으로 포워딩 -->
                        <li><a href="#">채소</a></li> <!-- 검색페이지 화면으로 포워딩 -->
                        <li><a href="#">간편식/가공</a></li> <!-- 검색페이지 화면으로 포워딩 -->
                    </ul>
                </div>
                <div>
                    <a href="<%= contextPath %>/main.po">스토어홈</a> <!-- 홈 화면으로 리다이렉트 -->
                </div>
                <div>
                    <a href="<%= contextPath %>/">베스트</a> <!-- 검색페이지 화면으로 포워딩 -->
                </div>
                <div>
                    <a href="<%= contextPath %>/">추천</a> <!-- 검색페이지 화면으로 포워딩 -->
                </div>
                <div>
                    <a href="<%= contextPath %>/">신상</a> <!-- 검색페이지 화면으로 포워딩 -->
                </div>
                <div>
                    <a href="#"> <!-- 레시피메인 화면으로 포워딩 -->
                        <img src="../image/hello.png">
                    </a>
                </div>
                <a href="<%= contextPath %>/"> <!-- 장바구니 화면으로 포워딩 -->
                    <img id="shopping-basket" src="../image/hello.png">
                </a>
                <form action="<%= contextPath %>/">
                    <input type="text">
                    <button type="submit">검색</button> <!-- 검색페이지 화면으로 포워딩 -->
                </form>
            </div>
        </div>
        <hr>











</body>
</html>