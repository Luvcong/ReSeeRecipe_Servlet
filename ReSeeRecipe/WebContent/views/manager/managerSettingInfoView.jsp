<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semi.member.model.vo.Member" %>
<%
    //Member loginMember = (Member)session.getAttribute("loginMember");
    Member m = (Member)request.getAttribute("m");
    Member mp = (Member)request.getAttribute("mp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 정보 설정 화면</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
    h2{
        text-align: center;
    }

    #adminupdatebtn{
        text-align : center;
    }

</style>


</head>

<body>
    <body>
        <%@ include file="../manager/navbar.jsp" %>
    <div class="rs-content">
        <br><br>
        <h2>관리자 정보 상세보기</h2>
        <br><br>
        <div class="container">
            <div class="from-control">
                <table class="table">
                    <tr>
                        <th>관리자 프로필</th>
                        <td colspan="3">
                            <% if(mp == null) { %>
                            <!-- 프로필 사진이 없을 경우 -->
                                프로필 사진이 없어요 ~
                            <% } else { %>
                            <!-- 프로필 사진이 있을 경우 -->
                                <a href="<%=contextPath%>/<%=m.getMemPicture() %>"></a>
                            <% } %>
                        </td>
                    </tr>
                    <tr>
                        <th>관리자 번호</th>
                        <td><%=m.getMemNo() %></td>
                    </tr>
                    <tr>
                        <th>관리자 이름</th>
                        <td><%=m.getMemName() %></td>
                    </tr>    
                    <tr>
                        <th>관리자 아이디</th>
                        <td><%=m.getMemId() %></td>
                    </tr>        
                    <tr>
                        <th>관리자 닉네임</th>
                        <td><%=m.getMemNickname() %></td>
                    </tr>      
                    <tr>
                        <th>관리자 이메일</th>
                        <td><%=m.getMemEmail() %></td>
                    </tr>        
                    <tr>
                        <th>가입일자</th>
                        <td><%=m.getEnrollDate() %></td>
                    </tr>               
                </table>
                <br><br>
                <div id="memberdetailbtn">
                    <a href="<%=contextPath %>/hhlsettingmanager.ma?adNo=<%=m.getMemNo() %>" class="w3-button w3-round w3-yellow" id="adminupdatebtn">수정하기</a>
                 <!-- <button type="submit" id="memberupdatebtn" class="w3-button w3-round w3-yellow">수정하기</button>-->
                    <button type="button" class="w3-button w3-round w3-yellow" onclick="history.back();">목록으로</button>
                </div>
            </div>
        </div>
    </div>




</body>