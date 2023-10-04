<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품상세</title>
</head>
<style>
    #detailview-wrap{
        width: 1200px;
        margin: auto;
        display: grid;
        grid-template-rows: auto auto auto auto auto;
        grid-template-columns: auto auto;
        row-gap: 30px;
    }

    #detailview-wrap>div:nth-child(3), div:nth-child(4), div:nth-child(5){
        grid-column: 1 / 3;
    }
</style>
<body>
    
    <%@ include file="buyMenubar.jsp" %>
    
    
    <div id="detailview-wrap">
        <div>
            <img src="/view/image/hello.png" width="500" height="500">
            <div>
                <img src="/view/image/hello.png" width="200" height="200">
                <img src="/view/image/hello.png" width="200" height="200">
            </div>
        </div>

        <div id="d_content">
            <h2>상품이름</h2>
            <h3>부제목</h3>
            <p>원산지</p>
            <p>별점</p>
            <h2>가격</h2>
            <h3>배송비</h3>
            <select name="" id="">
                <option value="">옵션 1 가격</option>
                <option value="">옵션 2 가격</option>
            </select>
            <input type="number" min="0">
            <h2>총 가격 0원</h2>
            <button>선물하기</button>
            <button>장바구니</button>
            <button>바로구매</button>
        </div>

        <div align="center">
            <h2 style="display: inline-block;">상세정보</h2>
            <h2 style="display: inline-block;">구매안내</h2>
            <h2 style="display: inline-block;">후기</h2>
        </div>

        <div>
            <div style="background-color: #e2e2e2;">
                상세내용<br>
                asdf
            </div>
            <br>
            <div style="background-color: #e2e2e2;">
                상세내용<br>
                asdf
            </div>
        </div>
        
        <div class="d_reply">
            <h2>후기</h2>
            <input type="checkbox">포토후기
            <button style="float: right;">후기작성</button>
            <br><br><br>
            <p style="margin-bottom: 0px;">주문자명</p>
            <p style="display: inline-block;">★★★</p>
            <p style="display: inline-block;">작성일</p>
            <img src="/view/image/hello.png" width="100" height="100" style="display: block;">
            <p>리뷰내용</p>
        </div>
    </div>
    
    <%@ include file="buyFooter.jsp" %>
</body>
</html>