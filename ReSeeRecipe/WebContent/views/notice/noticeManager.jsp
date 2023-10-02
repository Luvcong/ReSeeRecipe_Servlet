<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리</title>
</head>
<body>
    <br><br>
    <h2>공지사항 관리</h2>
    <br><br>
    <div class="rs-content">
        <div class="header1">
            <div class="input-group mt-3 mb-3">
                <div class="input-group-prepend">
                  <button type="button" class="btn btn-warning btn-outline-secondary dropdown-toggle" data-toggle="dropdown">
                    조회
                  </button>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">제목</a>
                    <a class="dropdown-item" href="#">작성일자</a>
                    <a class="dropdown-item" href="#">키워드</a>
                  </div>
                </div>
                <input type="text" class="form-control" placeholder="검색할 내용을 입력하세요" id="searchContent" name="searchContent" required>
                <div class="input-group-append">
                    <button class="btn btn-warning" type="submit">검색</button>
                </div>
            </div>
        </div>
<!--    <div class="header2">
            <button class="w3-button w3-round w3-yellow">작성하기</button>
            <button class="w3-button w3-round w3-yellow">수정하기</button>
            <button class="w3-button w3-round w3-yellow">삭제하기</button>
        </div>  -->
        <!--<h2>총 회원 103 명</h2>-->
        <table class="table">
 <!--           <caption class="totalMem">총 회원 103명</caption> -->
          <thead class="thead-light">
            <tr>
              <th>
                <div class="form-check">
                    <label class="form-check-label">
                    <input type="checkbox" class="form-check-input" value="">Option 1
                    </label>
                </div>
              </th>
              <th>번호</th>
              <th>작성일자</th>
              <th>공지사항 제목</th>
              <th>작성자</th>
              <th>조회</th>
              <th>좋아요</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                <div class="form-check">
                    <label class="form-check-label">
                    <input type="checkbox" class="form-check-input" value="">Option 1
                    </label>
                </div>
              </td>
              <td>3</td>
              <td>2023.09.23</td>
              <td>요린이를 위한 재료 손질법</td>
              <td>관리자</td>
              <td>55</td>
              <td>60</td>
            </tr>
            <tr>
                <td>checkbox</td>
                <td>2</td>
                <td>2023.09.20</td>
                <td>RESEE템 유사템 주의</td>
                <td>매니저</td>
                <td>90</td>
                <td>50</td>
            </tr>
            <tr>
                <td>checkbox</td>
                <td>1</td>
                <td>2023.09.03</td>
                <td>RESEE:RECIPE 가입 축하드립니다</td>
                <td>관리자</td>
                <td>100</td>
                <td>100</td>
            </tr>
          </tbody>
        </table>
    </div>
    <br><br><br><br>
    <div class="w3-bar">
        <a href="#" class="w3-button">«</a>
        <a href="#" class="w3-button w3-yellow">1</a>
        <a href="#" class="w3-button">2</a>
        <a href="#" class="w3-button">3</a>
        <a href="#" class="w3-button">4</a>
        <a href="#" class="w3-button">5</a>
        <a href="#" class="w3-button">»</a>
    </div>	




</body>
</html>