<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 쿠폰조회</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

<style>
    /* Add padding to containers */
    .container {
        padding: 50px 350px;
    }
    
    .container > div{
        margin : 30px 0px;
    }

    .container > div > div{
        float : left;
        width : 50%;
        height : 100%;
    }

    #title{
        padding: 50px 0px 30px 0px;
        display : flex;
        align-items: center;
        justify-content: center;
    }

    #grade-div{
        height : 150px;
    }

    
    #grade1 {
        width : 20%;
        text-align : center;
        background-color : lightgray;
        border-radius : 100px;
    }
    
    #grade2 {
        width : 80%;
        padding : 10px;
    }
    
    #sort-div {
        height : 50px;
    }

    #sort1 {
        padding : 10px;
    }

    #sort2 {
        padding : 10px;
        text-align : right;
    }

    #coupon-div{
        height : 150px;
        background-color : lightgray;
    }

    #coupon1 {
        width : 70%;
        padding : 10px;
    }

    #coupon2 {
        width : 30%;
        text-align : center;
    }

    #percent {
        color : red;
        font-size: 30px;
        font-weight : 500;
        margin : 20px;

    }

    #couponName {
        font-size : 20px;
        font-weight : 600;
    }

    #couponExpire {
        color : rgb(107, 105, 105);
    }

    #couponSort {
        height : 30px;
    }

    button {
        background-color: rgb(88, 87, 87);
        color: white;
        padding: 8px 0px;
        margin: 8px 0px;
        border: none;
        cursor: pointer;
        width: 80%;

        
    }

    .material-symbols-outlined {
        font-size : 100px;
        font-variation-settings:
        'FILL' 0,
        'wght' 400,
        'GRAD' 0,
        'opsz' 240
        
    }

</style>



</head>
<body>
    <!-- header부분 (상단 메인 메뉴바) -->
    <%@ include file="/views/common/header.jspf" %>

    <div class="container">
        <h1 id="title"><b>쿠폰 조회</b></h1>
        <div class="devide" id="grade-div">
            <div class="grade" id="grade1">
                <span class="material-symbols-outlined">
                    person
                </span>
                <p>내등급</p>
            </div>
            <div class="grade" id="grade2">
                <p>LV. = loginMember.getMemGradeName() </p> <br>
                회원 등급은 로그인, 마이페이지 접속 시 갱신됩니다. <br>
            </div>
        </div>
        <div class="devide" id="sort-div">
            <div class="sort" id="sort1">
                쿠폰 count(coupon_no) 개
            </div>
            <div class="sort" id="sort2">
                <select name="couponSort" id="couponSort">
                    <option value="saleSort">할인순</option>
                    <option value="recentSort">최근순</option>
                    <option value="limitSort">만료기한순</option>
                </select>
            </div>
            <hr>
        </div>
        <div class="devide" id="coupon-div">
            <div class="coupon" id="coupon1">
                <p id="couponName">회원 새싹 쿠폰 20% 할인</p>
                <p id="couponExpire">200일 남음</p>
            </div>
            <div class="coupon" id="coupon2">
                <p id="percent">20%</p>
                <button>적용상품 보러가기</button>
            </div>
        </div>
    </div>

    <!-- footer 푸터영역 -->
    <%@ include file="/views/common/footer.jspf" %>

</body>
</html>