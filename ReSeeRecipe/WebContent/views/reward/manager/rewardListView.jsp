<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.semi.reward.model.vo.Reward, com.kh.semi.common.model.vo.PageInfo" %> 
<%
	ArrayList<Reward> list = (ArrayList<Reward>)request.getAttribute("list");
	String successMsg = (String)session.getAttribute("successMsg");
	String failMsg = (String)session.getAttribute("failMsg");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int rewardListCount = pi.getListCount();
	int rewardListPage = pi.getCurrentPage();
	int rewardStartPage = pi.getStartPage();
	int rewardEndPage = pi.getEndPage();
	int rewardMaxPage = pi.getMaxPage();
%>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[리워드관리] 리워드 관리</title>

<!-- sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
.searchTable{
	padding: 0 10px;
}
.paging-area{
	padding-top: 65px;
	text-align: center;
}	
</style>

</head>
<body>
	
	<%@ include file="../../manager/navbar.jsp" %>
	
	<div class="rs-content">        
        <div class="header">
            <div class="h-title p-3">   <!-- 패딩 1rem -->
                [메뉴 관리] 리워드 관리
            </div>
            
            <div class="searchTable">
            	<table>
            		<tr>
            			<td><button type="button" data-toggle="dropdown">선택</button>
            			  <div class="dropdown-menu">
            			  		<a class="dropdown-item" href="#">전체</a>
							    <a class="dropdown-item" href="#">아이디</a>
							    <a class="dropdown-item" href="#">닉네임</a>
						  </div>
            			</td>
            			<td><input type="text" placeholder="검색명을 입력하세요" size="30"><button type="submit">조회</button></td>
            		</tr>
            	</table>
            </div>
            <div class="h-content d-flex p-3">  <!-- 패딩 1rem -->
                <div class="mr-auto">
                    조회수 <span class="waiting">10</span><span>개</span>
                </div>
                <div >
                    <button onclick="showAddCategorydModal()" class="btn btn-sm btn-warning">리워드 지급</button>
                    <button onclick="showUpdateCategoryModal()"class="btn btn-sm btn-warning">리워드 차감</button>
                    <button onclick="showUpdateCategoryModal()"class="btn btn-sm btn-warning">리워드 상세조회</button>
                </div>
            </div>
        </div>
        <div class="tableBody">
            <table id='tb-category' class="table table-sm table-hover">
                <thead>
                    <tr>
                        <th data-idx=0><input type="checkbox"></th>
                        <th data-idx=1 data-type="num">번호<div class="sort"></div></th>
                        <th data-idx=2>아이디<div class="sort"></div></th>
                        <th data-idx=3>닉네임<div class="sort"></div></th>
                        <th data-idx=4>회원등급<div class="sort"></div></th>
                        <th data-idx=5>지급일<div class="sort"></div></th>
                        <th data-idx=6>지급사유<div class="sort"></div></th>
                        <th data-idx=7>지급 포인트<div class="sort"></div></th>
                        <th data-idx=8>누적 포인트<div class="sort"></div></th>
	                    </tr>
                </thead>
                <tbody>
                	<% if(list == null || list.isEmpty()) { %>
   	                <tr>
	                    <td colspan="9">회원 리워드 내역이 없습니다</td>
	                </tr>
	                <% } else { %>
	                	<% for(Reward reward : list) { %>
	                    <tr>
	                        <td><input type="checkbox"></td>
	                        <td><%= reward.getRewardNo() %></td>
	                        <td><%= reward.getMemId() %></td>
	                        <td><%= reward.getMemNickname() %></td>
	                        <td><%= reward.getMemGradeName() %></td>
	                        <td><%= reward.getRewardDate() %></td>
	                        <td><%= reward.getRewardReason() %></td>
	                        <td><%= reward.getRewardScore() %></td>
	                        <td><%= reward.getSumRewardScore() %></td>
	                    </tr>
	                    <% } %>
	                <% } %>
                </tbody>
            </table>	<!-- tb-category -->
        </div>	<!-- tableBody  -->
        
   	<!-- 페이징바 -->
	<div class="paging-area">
		<% if(rewardListPage != 1) { %>
			<button onclick="page('<%= rewardListPage -1 %>');" class="btn btn-warning">&lt;</button>
		<% } %>
		<% for(int i = rewardStartPage; i <= rewardEndPage; i++) { %>
			<% if(rewardListPage != i) { %>
				<button onclick="page('<%= i %>');" class="btn btn-warning"><%= i %></button>
			<% } else { %>
				<button disabled class="btn btn-warning"><%= i %></button>
			<% } %>
		<% } %>
		<% if(rewardListPage != rewardMaxPage) { %>
			<button onclick="page('<%= rewardListPage + 1 %>');" class="btn bbtn-warning">&gt;</button>
		<% } %>
	</div>	<!-- 페이징바 -->
   	</div>  <!-- rs-content -->
	
	<script>
		function page(element){
			this.location.href = "<%= contextPath %>/jhselect.rw?page=" + element;
		}
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>