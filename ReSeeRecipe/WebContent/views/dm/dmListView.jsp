<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.semi.dm.model.vo.Dm" %>       
<%
	ArrayList<Dm> list = (ArrayList<Dm>)request.getAttribute("list");
	int waitingCount = (int)request.getAttribute("waitingCount");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[문의관리] 쪽지함관리</title>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

	<%@ include file="../manager/manager.jsp" %>

    <div class="rs-content">        
        <div class="header">
            <div class="h-title p-3">   <!-- 패딩 1rem -->
                [문의 관리] 쪽지함 관리
            </div>
            <div class="h-content d-flex p-3">  <!-- 패딩 1rem -->
                <div class="mr-auto">
                    미답변 <span class="waiting"><%= waitingCount %></span> 개 / 답변완료 <span class="replied"><%= list.size() - waitingCount %></span>개
                </div>
                <div >
                    <div class="btn btn-sm btn-warning">쪽지 답변</div>
                    <div class="btn btn-sm btn-secondary">쪽지 삭제</div>
                </div>
            </div>
        </div>
        <div class="tableBody">
            <table class="table table-sm table-hover">
                <thead>
                    <tr>
                        <th><input type="checkbox"></th>
                        <th>번호</th>
                        <th>등록일</th>
                        <th>아이디</th>
                        <th>닉네임</th>
                        <th>쪽지 문의내용</th>
                        <th>답변여부</th>
                    </tr>
                </thead>
                <tbody>
                <% if(list == null || list.isEmpty()) { %>
   	                <tr>
	                    <td colspan="6">받은 쪽지가 없습니다</td>
	                </tr>
	            <% } else { %>
	            	<% for(Dm dm : list) { %>    
	                    <tr>
	                        <td><input type="checkbox"></td>
	                        <td><%= dm.getDmNo() %></td>
	                        <td><%= dm.getSendDate() %></td>
	                        <td><%= dm.getMemId() %></td>
	                        <td><%= dm.getMemNickname() %></td>
	                        <td><%= dm.getDmContent() %></td>
	                        <td class="<%= dm.getDmStatus().equals("Y") ? "replied" : "waiting" %>">
	                        	답변<%= dm.getDmStatus().equals("Y") ? "완료": "대기"  %>
	                        </td>
	                    </tr>
   	                <% } %>
                <% } %>     
                </tbody>
            </table>
        </div>

    	</div>  <!-- rs-content -->
    

</body>
</html>