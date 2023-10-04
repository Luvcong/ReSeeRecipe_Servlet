<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구매</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
    
    <div id="orderdetail_wrap">
        <div>
            <h2 style="display: inline-block;">주문서 작성/결제</h2>
            <p style="display: inline-block;">장바구니 - <b>주문결제 -</b> 주문완료</p>
        </div>
        <br>
        <h3>주문상세내역</h3>
        <table class="table">
            <thead class="table-active">
                <th>사진</th>
                <th>상품명</th>
                <th>수량</th>
                <th>금액</th>
                <th>배송비</th>
                <th>총액</th>
            </thead>
            <tbody>
                <tr>
                    <td><img src=""></td>
                    <td>
                        귤<br>
                        한라봉
                    </td>
                    <td>1</td>
                    <td>15064</td>
                    <td>3000</td>
                    <td>348987</td>
                </tr>
            </tbody>
        </table>
        <br>
        <div>
            <h3>배송정보</h3>
            <p>배송지관리</p>
        </div>
        <table class="table">
            <tr>
                <th class="table-active" width="300">받으시는분</th>
                <td></td>
            </tr>
            <tr>
                <th class="table-active">주소</th>
                <td></td>
            </tr>
            <tr>
                <th class="table-active">휴대전화</th>
                <td></td>
            </tr>
            <tr>
                <th class="table-active">이메일</th>
                <td></td>
            </tr>
            <tr>
                <th class="table-active">배송시 남길말</th>
                <td></td>
            </tr>
        </table>
        <br>
        <div>
            <h3>주문자정보</h3>
            <input type="checkbox">배송정보와 동일
        </div>
        <table class="table">
            <tr>
                <th class="table-active" width="300">주문하시는분</th>
                <td></td>
            </tr>
            <tr>
                <th class="table-active">이름</th>
                <td></td>
            </tr>
            <tr>
                <th class="table-active">휴대전화</th>
                <td></td>
            </tr>
        </table>
        <br>
        <div>
            <h3>선물받을사람 정보</h3>
        </div>
        <table class="table">
            <tr>
                <th class="table-active" width="300">선물받으시는분 아이디</th>
                <td></td>
            </tr>
            <tr>
                <th class="table-active">선물시 남길말</th>
                <td></td>
            </tr>
        </table>
        <br>
        <h3>쿠폰</h3>
        <button class="btn btn-secondary" >추가</button>
        <table class="table">
            <tr>
                <th class="table-active" width="300">쿠폰명</th>
                <td></td>
            </tr>
        </table>
        <br>
        <h3>결제정보</h3>
        <table class="table">
            <tr>
                <th class="table-active" width="300">상품 합계 금액</th>
                <td></td>
            </tr>
            <tr>
                <th class="table-active">배송비</th>
                <td></td>
            </tr>
            <tr>
                <th class="table-active">쿠폰사용</th>
                <td></td>
            </tr>
            <tr>
                <th class="table-active">최종결제금액</th>
                <td></td>
            </tr>
        </table>
        <br>
        <button class="btn btn-secondary">결제하기</button>
    </div>
</body>
</html>