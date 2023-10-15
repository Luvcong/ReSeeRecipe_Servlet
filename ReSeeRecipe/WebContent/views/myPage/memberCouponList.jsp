<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 쿠폰조회</title>

<style>
    /* Add padding to containers */
    .container {
        padding: 50px 350px;
    }
    
    .container > div{
        margin : 10px 0px;
    }

    .container > div > div{
        float : left;
        width : 50%;
        height : 100%;
    }

    #title{
        padding-top: 50px;
        display : flex;
        align-items: center;
        justify-content: center;
    }

    #grade-div{
        height : 130px;
    }

    #sort-div{
        height : 50px;
    }

    #coupon-div{
        background-color : lightgray;
        height : 150px;
    }

    #coupon1 {
        width : 70%;
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
        color : gray;
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

</style>



</head>
<body>
    <!-- header부분 (상단 메인 메뉴바) -->
    <%@ include file="/views/common/header.jspf" %>

    <div class="container">
        <h1 id="title"><b>쿠폰 조회</b></h1>
        <div class="devide" id="grade-div">
            <div class="grade">
                내등급
            </div>
            <div class="grade">
                <p>LV. = loginMember.getMemGradeName() </p> <br>
                회원 등급은 로그인, 마이페이지 접속 시 갱신됩니다. <br>
            </div>
        </div>
        <div class="devide" id="sort-div">
            <div class="sort">
                쿠폰 count(coupon_no) 개
            </div>
            <div class="sort">
                <select name="couponSort" id="couponSort">
                    <option value="saleSort">할인순</option>
                    <option value="recentSort">최근순</option>
                    <option value="limitSort">만료기한순</option>
                </select>
            </div>
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