<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검색페이지</title>
    <style>
        #searchpage-wrap{
            width: 1200px;
            margin: auto;
        }
        li{
            list-style-type: none;
        }
        a{
            text-decoration: none;
            color: black;
        }
        a:hover{
            text-decoration: none;
            color: grey;
        }

        #s_list{
            display: block;
            float: right;
            position: absolute;
            width: 200px;
            left: 80.5%;
        }

        #pro_area{
            display: flex;
            flex-flow: row wrap;
        }
        .pro_list{
            width: 31.6%;
            height: 480px;
            margin: 10px;
        }
        .pro_list img{
            height: 350px;
            width: 100%;
            background-size: cover;
        }
        .pro_list>a:nth-child(2){
            display: block;
            text-align: left;
            font-size: 23px;
            margin-top: 5px;
            height: auto;
        }
        .pro_list>a:nth-child(3), a:nth-child(4){
            display: block;
            margin-bottom: 3px;
            text-align: left;
            font-size: 18px;
        }
    </style>
</head>
<body>

	<%@ include file="buyMenubar.jsp" %>
    
    <div id="searchpage-wrap">
        <div style="margin-bottom: 50px;">
            <div style="font-size: 40px; text-align: left;"><b>검색결과/베스트/추천/신상</b></div>
            <ul id="s_list">
                <li class="btn btn-secondary"><a href="">추천순</a></li>
                <li class="btn btn-light" style="display: none;"><a href="">별점높은순</a></li>
                <li class="btn btn-light" style="display: none;"><a href="">가격낮은순</a></li>
                <li class="btn btn-light" style="display: none;"><a href="">가격높은순</a></li>
            </ul>
        </div>

        
        <div id="pro_area">
            <div class="pro_list">
                <a href="#">
                    <img src="/view/image/hello.png">
                </a>
                <a href="#">상품이름상품이름상품이름상품이름상품이름</a>
                <a href="#">가격1231412</a>
                <a href="#">별점 ★4.6</a>
            </div>
            <div class="pro_list">
                <a href="#">
                    <img src="/view/image/hello.png">
                </a>
                <a href="#">상품이름</a>
                <a href="#">가격</a>
                <a href="#">별점</a>
            </div>
            <div class="pro_list">
                <a href="#">
                    <img src="/view/image/hello.png">
                </a>
                <a href="#">상품이름</a>
                <a href="#">가격</a>
                <a href="#">별점</a>
            </div>
            <div class="pro_list">
                <a href="#">
                    <img src="/view/image/hello.png">
                </a>
                <a href="#">상품이름</a>
                <a href="#">가격</a>
                <a href="#">별점</a>
            </div>
        </div>
        <div class="paging-area">
        	
        </div>
    </div>
    
    <%@ include file="buyFooter.jsp" %>
</body>
</html>