<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 상세보기</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
    h2{
        text-align: center;
    }

    #memberdetailbtn{
        text-align : center;
    }

</style>    
</head>
<body>
    <br><br>
    <h2>회원 정보 상세보기</h2>
    <br><br>
    <div class="container">
        <div class="from-control">
            <table class="table">
                <tr>
                    <th>회원번호</th>
                    <td></td>
                </tr>
                <tr>
                    <th>회원이름</th>
                    <td></td>
                </tr>    
                <tr>
                    <th>회원아이디</th>
                    <td></td>
                </tr>        
                <tr>
                    <th>회원닉네임</th>
                    <td></td>
                </tr>      
                <tr>
                    <th>이메일</th>
                    <td></td>
                </tr>        
                <tr>
                    <th>가입일자</th>
                    <td></td>
                </tr>        
                <tr>
                    <th>회원등급명</th>
                    <td></td>
                </tr>        
            </table>
            <br><br>
            <div id="memberdetailbtn">
                <button class="w3-button w3-round w3-yellow">수정하기</button>
                <button class="w3-button w3-round w3-yellow">목록으로</button>
            </div>
        </div>
    </div>
</body>
</html>