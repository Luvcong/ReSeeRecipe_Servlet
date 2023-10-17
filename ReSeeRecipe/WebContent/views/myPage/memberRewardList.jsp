<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리워드 내역</title>
    <!-- sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>

        /* Full-width inputs */
        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0px 0px 0px;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        /* Set a style for all buttons */
        button {
            background-color: rgb(88, 87, 87);
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        /* Add a hover effect for buttons */
        button:hover {
            opacity: 0.8;
        }

        /* Add padding to containers */
        .container {
            padding: 50px 300px;
        }

        #title{
            padding-top: 50px;
            display : flex;
            align-items: center;
            justify-content: center;
        }

        #tb-reward {
            width:100%;
            text-align: center;
        }
        th {
            width: 20%;
        }
        tr {
            height: 40px;
        }

</style>
</head>

<body>
    <!-- header부분 (상단 메인 메뉴바) -->
	<%@ include file="/views/common/header.jspf" %>
    <h1 id="title"><b>리워드</b></h1>
    
    <div class="container">
        <div>
            <div>
                ※
            </div>

        </div>



        <div class="tableBody">
            <table id='tb-reward' class="table table-sm table-hover">
                <thead>
                    <tr>
                        <th data-idx=0 data-type="num">번호<div class="sort"></div></th>
                        <th data-idx=1>일시<div class="sort"></div></th>
                        <th data-idx=2>내용<div class="sort"></div></th>
                        <th data-idx=3>리워드<div class="sort"></div></th>
                        <th data-idx=4>남은 리워드<div class="sort"></div></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>	<!-- tb-category -->
        </div>	<!-- tableBody  -->
    </div>
    <!-- footer 푸터영역 -->
	<%@ include file="/views/common/footer.jspf" %>

</body>
</html>