<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.semi.notice.model.vo.*" %>
<%
	//Notice n = (Notice)request.getParameter("n");d
	//NoticePic np = (NoticePic)request.getParameter("np");
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
%>
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
           <!-- 공지사항이 있을 수도 있고 없을 수도 있음 -->
				<% if(list.isEmpty()) { %>
                <!-- 공지사항이 없을 때 -->
                <tr>
                    <td colspan="5">공지사항이 존재하지 않습니다.</td>
                </tr>
				<%} else { %>
                <!-- 공지사항이 있을 때 -->
            <tr>
              <td>
                <div class="form-check">
                    <label class="form-check-label">
                    <input type="checkbox" class="form-check-input" value="">Option 1
                    </label>
                </div>
              </td>
              <% for(Notice n : list) { %>
                    <tr>
                    	<td>
                			<div class="form-check">
                    		<label class="form-check-label">
                   			 <input type="checkbox" class="form-check-input" value="">Option 1
                   			</label>
                			</div>
             			 </td>
                		<td><%= n.getNoticeNo() %></td>
                		<td><%= n.getNoticeDate() %></td>
                		<td><%= n.getNoticeTitle() %></td>
                		<td><%= n.getNoticeWriter() %></td>
                		<td><%= n.getNoticeCount() %></td>
                		<td><%= n. %></td>
                	</tr>
                <% } %>
			<% } %>
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