<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 쿠폰조회</title>



</head>
<body>
    <!-- header부분 (상단 메인 메뉴바) -->
    <%@ include file="/views/common/header.jspf" %>

    <div>
        <h1 id="title"><b>쿠폰 조회</b></h1>
        <div>
            <div class="grade">
                내등급
            </div>
            <div class="grade">
                LV. loginMember.getMemGradeName <br>
                회원 등급은 로그인, 마이페이지 접속 시 갱신됩니다. <br>

            </div>

        </div>
        <div>
            <div>
                쿠폰 count(coupon_no) 개
            </div>
            <div>
                <select name="couponSort" id="couponSort">
                    <option value="saleSort">할인순</option>
                    <option value="recentSort">최근순</option>
                    <option value="limitSort">만료기한순</option>
                </select>
            </div>
            
            

        </div>


        <div>



        </div>






    </div>

    <!-- footer 푸터영역 -->
    <%@ include file="/views/common/footer.jspf" %>

</body>
</html>