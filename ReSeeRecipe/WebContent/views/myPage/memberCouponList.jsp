<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.semi.myPage.model.vo.MemberCoupon" %>
<% 
	ArrayList<MemberCoupon> memberCouponList = (ArrayList<MemberCoupon>)request.getAttribute("memberCouponList");
%>
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
        width : 50%;
    }

    #sort2 {
        padding : 10px;
        width : 50%;
        text-align : right;
    }
    
    #couponSort {
        height : 30px;
    }

    [name="coupon-div"] {
        height : 150px;
        background-color : lightgray;
    }

    [name="coupon1"] {
        width : 70%;
        padding : 10px;
    }

    [name="coupon2"] {
        width : 30%;
        text-align : center;
    }

    [name="percent"] {
        color : red;
        font-size: 30px;
        font-weight : 500;
        margin : 20px;

    }

    [name="couponName"] {
        font-size : 20px;
        font-weight : 600;
    }

    [name="couponExpire"] {
        color : rgb(107, 105, 105);
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

    <p id="memNo"><%= loginMember.getMemNo() %></p>

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
                <p>LV. <%= loginMember.getMemGradeName() %> </p> <br>
                회원 등급은 로그인, 마이페이지 접속 시 갱신됩니다. <br>
            </div>
        </div>
        <div class="devide" id="sort-div">
            <div class="sort" id="sort1">
                쿠폰 <%= loginMember.getMemCouponCount() %> 개
            </div>
            <div class="sort" id="sort2">
                <select name="couponSort" id="couponSort" onchange="selected();">
                    <option value="recentSort" selected>최근순</option>
                    <option value="saleSort">할인순</option>
                    <option value="limitSort">만료기한순</option>
                </select>
            </div>
            <hr>
        </div>
        <% for(int i = 0; i < loginMember.getMemCouponCount(); i++) { %>
        <div class="devide" name="coupon-div">
            <div class="coupon" name="coupon1">
                <p name="couponName"><%= memberCouponList.get(i).getCouponName() %></p>
                <p name="couponExpire"><%= memberCouponList.get(i).getCouponExpire() %>일 남음</p>
            </div>
            <div class="coupon" name="coupon2">
                <p name="percent"><%= memberCouponList.get(i).getCouponRatio() %>%</p>
                <button type="button" onclick="window.open('<%=contextPath%>/main.po')">적용상품 보러가기</button>
            </div>
        </div>    
        <% } %>

        
    </div>

    <!-- footer 푸터영역 -->
    <%@ include file="/views/common/footer.jspf" %>
    
    <script>
        
        // 선택된 옵션값 초기화
        var $selected = 'recentSort';
        var $memNo = $('#memNo').text();
        console.log($memNo);

        // 정렬 선택 시, 선택된 옵션값 대입        
        function selected(){
            console.log("엥?");
            var $selected = $('#couponSort').val();
            console.log($selected);
            $.ajax({
                url : 'yrmemberCouponListSort.me',
                data : {selected : $selected,
                        memNo : $memNo},
                success : function(result) {
                    console.log("아악");
                    // console.log(result);
                    console.log(result);
                    console.log(result[0].couponName);
                    console.log(result[0].couponRatio);
                    
                    var container = $('.container'); // 기존의 container 요소 선택
                    $('[name="coupon-div"]').remove();
                    // 반환된 데이터를 반복하며 쿠폰 정보를 추가
                    for (var i = 0; i < result.length; i++) {
                        var newDiv = $('<div class="devide" name="coupon-div">');
                        newDiv.html('<div class="coupon" name="coupon1">' +
                            '<p name="couponName">' + result[i].couponName + '</p>' +
                            '<p name="couponExpire">' + result[i].couponExpire + '일 남음</p>' +
                            '</div>' +
                            '<div class="coupon" name="coupon2">' +
                            '<p name="percent">' + result[i].couponRatio + '%</p>' +
                            '<button>적용상품 보러가기</button>' +
                            '</div>');

                        container.append(newDiv); // 새로운 데이터가 들어있는 div를 기존 container에 추가
                    }

                    
                },
                error : function(result) {
                    console.log("통신실패");
                }
            })
        }
    </script>
    

</body>
</html>