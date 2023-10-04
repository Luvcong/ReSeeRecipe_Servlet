<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품메인</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <style>
        #buymain-wrap{
            width: 1200px;
            margin: auto;
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

        /* 내용 */
        #content{
            height: auto;
        }
        /* 배너 */
        .content_banner{
            height: 500px;
        }
        .content_banner img{
            height: 500px;
            width: 1200px;
        }
        /* 본문 */
        .content_best, .content_good, .content_new{
            height: 600px;
        }
        /* 상품제목 */
        .c_head{
            height: 120px;
        }
        .c_head>div{
            display: inline-block;
        }
        .c_title{
            font-size: 40px;
            margin-top: 30px;
            margin-left: 10px;
        }
        .more{
            margin-top: 90px;
            float: right;
        }
        /* 상품내용 */
        .c_product{
            display: flex;
        }
        .product1{
            flex:1;
            width:30%;
            height: 480px;
            box-sizing: border-box;
        }
        .product2{
            flex:1;
            margin: 0px 1%;
            width:30%;
            height: 480px;
            box-sizing: border-box;
        }
        .product3{
            flex:1;
            width:30%;
            height: 480px;
            box-sizing: border-box;
        }
        .p_img img{
            width: 100%;
            height: 350px;
            background-size: cover;
        }
        .p_name{
            font-size: 25px;
        }
        .p_price{
            font-size: 27px;
        }
    </style>
</head>
<body>

	<%@ include file="buyMenubar.jsp" %>
	
    <div id="buymain-wrap">
        <div id="content">
            <div class="content_banner">
                <a href="#"> <!-- 레시피메인 화면으로 포워딩 -->
                    <img src="/view/image/hello.png">
                </a>
            </div>

            <div class="content_best">
                <div class="c_head">
                    <div class="c_title">
                        <b>베스트상품</b>
                    </div>
                    <div class="more">
                        <a href="#">더보기</a>
                    </div>
                </div>
                
                <div class="c_product">
                    <div class="product1">
                        <div class="p_img">
                            <a href="#">
                                <img src="/view/image/hello.png">
                            </a>
                        </div>
                        <div class="p_name">
                            <a href="#">상품이름</a>
                        </div>
                        <div class="p_price">
                            <a href="#">가격</a>
                        </div>
                    </div>
                    <div class="product2">
                        <div class="p_img">
                            <a href="#">
                                <img src="/view/image/hello.png">
                            </a>
                        </div>
                        <div class="p_name">
                            <a href="#">상품이름</a>
                        </div>
                        <div class="p_price">
                            <a href="#">가격</a>
                        </div>
                    </div>
                    <div class="product3">
                        <div class="p_img">
                            <a href="#">
                                <img src="/view/image/hello.png">
                            </a>
                        </div>
                        <div class="p_name">
                            <a href="#">상품이름</a>
                        </div>
                        <div class="p_price">
                            <a href="#">가격</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content_good" style="background-color: #e2e2e2;">
                <div class="c_head">
                    <div class="c_title">
                        추천상품
                    </div>
                    <div class="more">
                        <a href="#">더보기</a>
                    </div>
                </div>

                <div class="c_product">
                    <div class="product1">
                        <div class="p_img">
                            <a href="#">
                                <img src="/view/image/hello.png">
                            </a>
                        </div>
                        <div class="p_name">
                            <a href="#">상품이름</a>
                        </div>
                        <div class="p_price">
                            <a href="#">가격</a>
                        </div>
                    </div>
                    <div class="product2">
                        <div class="p_img">
                            <a href="#">
                                <img src="/view/image/hello.png">
                            </a>
                        </div>
                        <div class="p_name">
                            상품이름
                        </div>
                        <div class="p_price">
                            <a href="#">가격</a>
                        </div>
                    </div>
                    <div class="product3">
                        <div class="p_img">
                            <a href="#">
                                <img src="/view/image/hello.png">
                            </a>
                        </div>
                        <div class="p_name">
                            <a href="#">상품이름</a>
                        </div>
                        <div class="p_price">
                            <a href="#">가격</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content_new">
                <div class="c_head">
                    <div class="c_title">
                        신상품
                    </div>
                    <div class="more">
                        <a href="#">더보기</a>
                    </div>
                </div>

                <div class="c_product">
                    <div class="product1">
                        <div class="p_img">
                            <a href="#">
                                <img src="/view/image/hello.png">
                            </a>
                        </div>
                        <div class="p_name">
                            <a href="#">상품이름</a>
                        </div>
                        <div class="p_price">
                            <a href="#">가격</a>
                        </div>
                    </div>
                    <div class="product2">
                        <div class="p_img">
                            <a href="#">
                                <img src="/view/image/hello.png">
                            </a>
                        </div>
                        <div class="p_name">
                            <a href="#">상품이름</a>
                        </div>
                        <div class="p_price">
                            <a href="#">가격</a>
                        </div>
                    </div>
                    <div class="product3">
                        <div class="p_img">
                            <a href="#">
                                <img src="/view/image/hello.png">
                            </a>
                        </div>
                        <div class="p_name">
                            <a href="#">상품이름</a>
                        </div>
                        <div class="p_price">
                            <a href="#">가격</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%@ include file="buyFooter.jsp" %>
</body>
</html>