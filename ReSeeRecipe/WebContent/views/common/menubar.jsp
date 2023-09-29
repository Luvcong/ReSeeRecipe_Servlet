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
        div{
            border : 1px solid red;
            box-sizing : border-box;
        }

        #wrap{
            width : 1200px;
            height : 1200px;
            margin : auto;
        }

        #wrap > div {width : 100%;}

        #header, #footer{height : 15%;}

        #navigator{height : 5%;}

        #content{height : 65%;}

        #header > div, #footer > div{
            height : 100%;
            float : left;
        }

        #content > div{height : 25%;}

        #header_1, #header_3{width : 30%;}

        #header_2{width : 40%; text-align: center;}

        #footer_1{
            width : 75%;
            font-family: 'IBM Plex Sans KR', sans-serif;
        }

        #footer_2{
            width : 25%;
        }
        
        
        #header_3_1 > div{
            height : 100%;
            float : left;
        }

        #header_3_1_1, #header_3_1_2, #header_3_1_3, #header_3_1_4{
            width : 25%;
            text-align: center;
            padding : 6px;
            font-family: 'IBM Plex Sans KR', sans-serif;
        }

        #header_2 img{
        height: 100%;
        }

        #header_3_1{height : 40%;}

        #header_3_2{position : relative;}

        #search_form{
            width : 70%;
            height : 20%;
            position : absolute;
            text-align: center;
            left : 20px;
            margin-top: 25px;
        }
        
        #search_form > div{
            height : 100%;
            float : left;
        }

        #search_text{width : 90%;}

        #search_btn{width : 10%;}

        #search_form input {
            box-sizing: border-box;
            border : 1px solid rgb(255, 145,77);
        }

        #search_form input[type=submit]{
            background-color : rgb(255, 145,77);
        }

       /* 여기부터 navi CSS */
        #navi{
                list-style : none;
                margin : 0;
                padding : 0;
                height : 100%;
        }

        #navi > li{
                background-color : rgb(255, 222, 89);
                float : left;
                height : 100%;
                width : 200px;
                text-align: center;
        }

        #navi a{
                text-decoration: none;
                width : 100%;
                height : 100%;
                display : block;
                line-height : 40px;
                font-family: 'IBM Plex Sans KR', sans-serif;
                font-size: 20px;
                padding : 5px;
        }

        #content_1 > div{
                height : 100%;
                float : left;
        }
        
        #content1_1, #content1_3{
                height : 100%;
                width : 30%;
        }

        #content1_2{
                width : 40%;
                height : 100%;
                text-align: center;
        }

        #content1_2 > img{
                height : 100%;
        }

        #arrowL{
                margin-left: 90%;
                margin-top : 25%;
        }
        
        
        /* Content_2, Content_3 영역 레시피 더보기 */
        #content_2, #content_3{
            width: 100%;
            box-sizing: border-box;
            margin: auto;
        }

        .more_content_area1 {
            height: 25%;
        }

        .more_content_title_a {
            width: 85%;
            height: 100%;
            float: left;
            padding-left: 1%;
            padding-top: 1%;
        }

        .more_content_title_a p {
            margin: 0px;
        }

        .more_content_title_b {
            width: 15%;
            height: 100%;
            float: right;
            padding-right: 5.5%;
            padding-top: 1%;
            text-align: right;
            cursor:pointer;
        }

        .more_content_title_b p {
            margin: 0px;
        }

        .more_content_area2 {
            height: 75%;
        }

        .more_content_area2 div {
            display: inline-block;
            width: 33%;
            height: 100%;
        }

        

        #footer1_1{font-size: 17px;}

        #footer1_2{font-size: 15px;}

        #footer_2_1{
            height : 30%;
            margin-left : 40%;
            margin-top : 5%;
        }

        #footer_2_2{height : 70%;}

    </style>
</head>
<body>
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
        <div id="navigator">
            <ul id="navi">
                <li>
                    <a href="">레시피</a>
                </li>
                <li>
                    <a href="">셰프</a>
                </li>
                <li>
                    <a href="">마켓</a>
                </li>
            </ul>
        </div>
        
        
       
        <div id="content">
            <div id="content_1">
                <div id="content1_1">
                    <button type="button" id="arrowL"><i class="fa-solid fa-chevron-left"></i></button>
                </div>
                <div id="content1_2">
                    <img src="resources/img/제1회요리대회썸네일.png" alt="">
                </div>
                <div id="content1_3">
                    <i class="fa-solid fa-chevron-right"></i>
                </div>
            </div>
          
            <div id="content_2">
                <!-- 최신 레시피 더보기 -->
                <div id="content_2_1" class="more_content_area1">
                    <div id="content_2_1a" class="more_content_title_a"><p>최신레시피</p></div>
                    <div id="content_2_1b" class="more_content_title_b" onclick="location.href='#';"><p>더보기</p></div>
                </div>
                <!-- 사진 썸네일 영역 -->
                <div id="content_2_2" class="more_content_area2">
                    <div id="content2_2a"><a href="#"><img src="#">이미지1</a></div>
                    <div id="content2_2b"><a href="#"><img src="#">이미지2</a></div>
                    <div id="content2_2c"><a href="#"><img src="#">이미지3</a></div>
                </div>
            </div>

            <div id="content_3">
                <!-- 지금HOT한 레시피 더보기 -->
                <div id="content_3_1" class="more_content_area1">
                    <div id="content_3_1a" class="more_content_title_a"><p>지금 HOT한 레시피</p></div>
                    <div id="content_3_1b" class="more_content_title_b" onclick="location.href='#';"><p>더보기</p></div>
                </div>
                <!-- 사진 썸네일 영역 -->
                <div id="content_3_2" class="more_content_area2">
                    <div id="content3_2a"><a href="#"><img src="#">이미지1</a></div>
                    <div id="content3_2b"><a href="#"><img src="#">이미지2</a></div>
                    <div id="content3_2c"><a href="#"><img src="#">이미지3</a></div>
                </div>
            </div>

            <div id="content_4">
                <p>인기 Re See 템</p><a href="">더보기</a>
            </div>
        </div>
	

        <div id="footer">
            <div id="footer_1">
                <p id="footer1_1">Re See : Recipe</p>
                <a href="#">회사소개</a> |
                <a href="#">이용약관</a> |
                <a href="#">개인정보취급방침</a> |
                <a href="#">고객센터</a>
                <p id="footer1_2">
                    회사명 : 주식회사 배고프조 대표자 : 손혜림 개인정보관리책임자 : 김진희, 강현지, 목지윤, 이종혁, 여  랑 <br>
                    사업자번호 :2308-29-230703    통신판매업신고:제2023-서울중구-0829 전화 : 02-0703-0829 팩스 :       메일 : reseerecipe@gmail.com <br>
                    COPYRIGHT@배고프조 ALLRIGHTRESERVED.
                </p>
            </div>
            <div id="footer_2">
                <div id="footer_2_1">
                    <i class="fa-brands fa-instagram fa-2xl" style="color: #ff9111;"></i>
                </div>
                <div id="footer_2_2">
                    <i class="fa-solid fa-qrcode fa-4xl" style="color: #ff9111;"></i>
                </div>
            </div>
        </div>
    </div>
</body>
</html>