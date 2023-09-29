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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Re See : Recipe</title>
    <script src="https://kit.fontawesome.com/f74c934ec8.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<style>
	div {
		border: 1px solid red;
		box-sizing: border-box;
	}
	
	#wrap {
		width: 1200px;
		height: 178.14px;
		margin: auto;
	}
	
	#wrap>div {
		width: 100%;
	}
	
	#header {
		height: 100%;
	}
	
	#header>div {
		height: 100%;
		float: left;
	}
	
	#header_1, #header_3 {
		width: 30%;
	}
	
	#header_2 {
		width: 40%;
		text-align: center;
	}
	
	#header_3_1>div {
		height: 100%;
		float: left;
	}
	
	#header_3_1_1, #header_3_1_2, #header_3_1_3, #header_3_1_4 {
		width: 25%;
		text-align: center;
		padding: 6px;
		font-family: 'IBM Plex Sans KR', sans-serif;
	}
	
	#header_2 img {
		height: 100%;
	}
	
	#header_3_1 {
		height: 40%;
	}
	
	#header_3_2 {
		position: relative;
	}
	
	#search_form {
		width: 70%;
		height: 20%;
		position: absolute;
		text-align: center;
		left: 20px;
		margin-top: 25px;
	}
	
	#search_form>div {
		height: 100%;
		float: left;
	}
	
	#search_text {
		width: 90%;
	}
	
	#search_btn {
		width: 10%;
	}
	
	#search_form input {
		box-sizing: border-box;
		border: 1px solid rgb(255, 145, 77);
	}
	
	#search_form input[type=submit] {
		background-color: rgb(255, 145, 77);
	}
	
	#arrowL {
		margin-left: 90%;
		margin-top: 25%;
	}
</style>
</head>

<header>
	<div id="wrap">
		<div id="header">
		    <div id="header_1"></div>
		    <div id="header_2">
		        <a href="#">
		            <img src="resources/img/Re see recipe 로고.png" alt="Reseerecipe메인">
		        </a>
		    </div>
		    <div id="header_3">
		        <div id="header_3_1">
		            <div id="header_3_1_1">
		                <a href="#">
		                    <i class="fa-solid fa-cart-shopping"></i><br>
		                    <img src="" alt="">장바구니 
		                </a>
		            </div>
		            <div id="header_3_1_2">
		            <!-- 로그인 클릭 시 로그인 화면으로 이동 yr -->
		          <% if(loginMember == null) { %>
		              <a href="<%= contextPath %>/yrloginForm.me">
		                  <i class="fa-regular fa-user"></i><br>
		                  <img src="" alt="">로그인 
		              </a>
		          <!-- 로그인 시 로그아웃으로 변경 yr -->
		          <% } else { %>
		          	<a href="<%= contextPath %>/yrlogout.me">
		                  <i class="fa-regular fa-user"></i><br>
		                  <img src="" alt="">로그아웃
		              </a>
		          <% } %>
		          </div>
		          <div id="header_3_1_3">
		              <a href="#">
		                  <i class="fa-regular fa-handshake"></i><br> 
		                  <img src="" alt="">회원가입
		              </a>
		          </div>
		          <div id="header_3_1_4">
		              <a href="#">
		                  <i class="fa-regular fa-door-open"></i><br>
		                  <img src="" alt="">고객센터
		              </a>
		          </div>
		      </div>
		      <div id="header_3_2">
		          <form action="search.do" method="get" id="search_form">
		              <div id="search_text">
		                  <i class="fa-solid fa-magnifying-glass" style="color: #ffde59;"></i><input type="text" name="query">
		                </div>
		                <div id="search_btn">
		                    <input type="submit" value="검색">
		                </div>
		            </form>
		        </div>
		    </div>
		</div>
	</div>
</header>
</html>