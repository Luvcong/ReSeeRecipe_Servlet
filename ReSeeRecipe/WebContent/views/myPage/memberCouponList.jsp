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

<link rel="stylesheet" href="resources/css/myPage/memberCouponList.css">


</head>
<body>
    <!-- header부분 (상단 메인 메뉴바) -->
    <%@ include file="/views/common/header.jspf" %>

    <input type="hidden" id="memNo" name="memNo" value="<%= loginMember.getMemNo() %>">

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
        <% if(!memberCouponList.isEmpty()){ %>
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
        <% } else { %>
        조회된 결과가 없습니다.
        <% } %>
        
    </div>

    <!-- footer 푸터영역 -->
    <%@ include file="/views/common/footer.jspf" %>

    <script src="resources/js/myPage/memberCouponList.js"></script>

    <script>
        // 선택된 옵션값 초기화
        var $selected = 'recentSort';
        var $memNo = $('#memNo').val();
        console.log($memNo);
    </script>

</body>
</html>