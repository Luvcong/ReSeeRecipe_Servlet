<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>해시태그 관리</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        /* 팝업창 */
        .h_popup_overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        display: flex;
        justify-content: center;
        align-items: center;
        visibility: hidden;
        opacity: 0;
        transition: visibility 0s, opacity 0.3s ease;
        }
        .popup-content {
        width: 750px;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
    	
    	<%@ include file="../../manager/navbar.jsp" %>
    	
        <div class="rs-content">        
            <div class="header">
                <div class="h-title p-3">   <!-- 패딩 1rem -->
                    [ 메뉴관리 ] 해시태그 관리
                </div>
                <div>
                    <form action="" method="">
                        <input id="h_search" type="text" placeholder="검색할 해시태그명을 입력해주세요" style="width: 300px; margin-left: 10px;"><button type="submit">조회</button>
                    </form>
                </div>
                <div class="h-content d-flex p-3">  <!-- 패딩 1rem -->
                    <div class="mr-auto">
                        	해시태그목록 <span class="text-danger">1</span> 개
                    </div>
                    <div >
                        <div class="btn btn-sm btn-warning" onclick="openPopup1()">해시태그 추가</div>
                        <div class="btn btn-sm btn-warning" onclick="openPopup2()">해시태그 수정</div>
                        <div class="btn btn-sm btn-secondary" onclick="openPopup3()">해시태그 삭제</div>
                    </div>
                </div>
            </div>
            <br>
            <div class="tableBody">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th><input type="checkbox"></th>
                            <th>번호</th>
                            <th>해시태그명</th>
                            <th>사용횟수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td>#ㅁㄴㅇㄹ</td>
                            <td>4</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>2</td>
                            <td>2023-09-23</td>
                            <td>5</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>3</td>
                            <td>2023-09-22</td>
                            <td>6</td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>  <!-- rs-content -->
    </div>  <!-- rs-main -->


    <div id="h_popup1" class="h_popup_overlay">
        <div class="popup-content">
            <div align="center">해시태그 추가</div>
            <form action="">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>해시태그명</th>
                            <th>사용횟수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <input type="text" name="">
                                
                            </td>
                            <td>231</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                	해당 해시태그를 추가하시겠습니까?
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button type="submit">확인</button>
                                <button onclick="closePopup()">취소</button>
                            </td>   
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>

    <div id="h_popup2" class="h_popup_overlay">
        <div class="popup-content">
            <div align="center">해시태그 수정</div>
            <form action="">
                <table class="table table-hover">
                    <tr>
                        <th width="150">해시태그명</th>
                        <th width="150">사용횟수</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="">
                        </td>
                        <td>4534</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            	해당 해시태그를 수정하시겠습니까?
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="submit">확인</button>
                            <button onclick="closePopup()">취소</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    

    <div id="h_popup3" class="h_popup_overlay">
        <div class="popup-content">
            <div align="center">해시태그 삭제</div>
            <form action="">
                <table class="table table-hover">
                    <tr>
                        <th width="150">해시태그명</th>
                        <th width="150">사용횟수</th>
                    </tr>
                    <tr>
                        <td>#aasdf</td>
                        <td>1233</td>
                    </tr>
                    <tr>
                        <td colspan="2">
			                            해당 해시태그를 정말 삭제하시겠습니까? <br>
			                            삭제 후 복원이 불가합니다.
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="submit">확인</button>
                            <button onclick="closePopup()">취소</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

    <script>
        function openPopup1() {
            var popup = document.getElementById("h_popup1");
            popup.style.visibility = "visible";
            popup.style.opacity = "1";
        }

        function openPopup2() {
            var popup = document.getElementById("h_popup2");
            popup.style.visibility = "visible";
            popup.style.opacity = "1";
        }

        function openPopup3() {
            var popup = document.getElementById("h_popup3");
            popup.style.visibility = "visible";
            popup.style.opacity = "1";
        }

        function closePopup() {
            var popup1 = document.getElementById("h_popup1");
            var popup2 = document.getElementById("h_popup2");
            var popup3 = document.getElementById("h_popup3");
            popup1.style.visibility = "hidden";
            popup1.style.opacity = "0";
            popup2.style.visibility = "hidden";
            popup2.style.opacity = "0";
            popup3.style.visibility = "hidden";
            popup3.style.opacity = "0";
        }
    </script>
</body>
</html>