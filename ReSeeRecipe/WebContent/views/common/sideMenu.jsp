<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 블로그 왼쪽 메뉴바</title>

<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Black+Ops+One&family=Noto+Sans+KR&family=Parisienne&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<style>
    #sidebar{
        border: 1px solid black;
        background-color: rgb(255, 222, 89);
        width: 130px;
    }
    #side-menu a{
        text-decoration: none;
        font-family: 'Noto Sans KR', sans-serif;
        font-size: 15px;
        color: black;
        font-weight: 700;
    }
    #side-menu{
        margin-top: 20px;
        margin-left: -35px;
        list-style: none;
        text-align: center;
    }
    #side-top{
        border: 1px solid black;
        width: 130px;
        height: 175px;
        background-color: rgb(255, 222, 89);
    }
    #side-top p {
        font-size: 5px;
        float: left;
    }
    #member-pic{
        border: 1px solid black;
        width: 90px;
        height: 90px;
        margin-top:25%;
        margin-left: 15%;
    }
    #member-nick{
        border: 1px solid black;
        width: 40px;
        height: 15px;
        margin-left:35% ;
        margin-top: 5%;
    }
    #member-nick p{
        text-align: center;
        font-size: 1px;
    }
    #member-degree{
        border: 1px solid black;
        width: 40px;
        height: 15px;
        margin-left:35% ;
        margin-top: 5%;
    }
    #member-degree p{
        text-align: center;
        font-size: 1px;
        text-align: center;
    }
    #sidebar li:hover{
        background-color:rgb(221, 182, 28);
    }
    #sidebar li > a:hover{
        font-size: 20px;
    }
        #header-area{
        width: 1200px;
		height: 200px;
    }
    
</style>
</head>
<body>



<%@ include file="/views/common/header.jspf" %>
   
    <div id="side-top">
        <p>방문자 수 : </p><p> 내 리워드 :</p>
        <div id="member-pic"></div>
        <div id="member-nick"><p>닉네임</p></div>
        <div id="member-degree"><p>등급</p></div>
    </div>
    
    <div id="sidebar">
        <ul>
            <li id="side-menu"><a href="#">회원정보변경</a></li>
            <li id="side-menu"><a href="">리워드</a></li>
            <li id="side-menu"><a href="">쿠폰</a></li>
            <li id="side-menu"><a href="">선물함</a></li>
            <li id="side-menu"><a href="">레시피북</a></li>
            <li id="side-menu"><a href="">구독셰프</a></li>
            <li id="side-menu"><a href="">내게시물관리</a></li>
            <li id="side-menu"><a href="">쇼핑정보</a></li>
            <li id="side-menu"><a href="">쪽지</a></li>
        </ul>
    </div>





<%@ include file="/views/common/footer.jspf" %>

</body>
</html>