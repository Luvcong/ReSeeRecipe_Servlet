<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.semi.reward.model.vo.Reward" %>
<%
	ArrayList<Reward> memberRewardList = (ArrayList<Reward>)request.getAttribute("memberRewardList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리워드 내역</title>
<!-- sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>

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
            padding : 50px 350px;
        }

        .info-div {
            margin : 50px 0px;
        }

        .info-div > div {
            float : left;
        }

        #infoText {
            width : 80%;
        }

        #infoTotal {
            width : 20%;
            border-radius : 20px;
            background-color : rgb(21, 21, 71);
            color : white;
            text-align : center;
        }

        #title{
            padding-top: 50px;
            display : flex;
            align-items: center;
            justify-content: center;
            font-weight : bold;
        }

        #tb-reward {
            width:100%;
            text-align: center;
        }

        #tb-reward > thead {
            background-color : lightgray;
        }
        
        tr {
            height: 40px;
            
        }

        th, td {
            width: 20%;
            border : 1px solid black;
        }

</style>
</head>

<body>
    <!-- header부분 (상단 메인 메뉴바) -->
	<%@ include file="/views/common/header.jspf" %>
    <h1 id="title"><b>리워드 내역</b></h1>
    
    <div class="container">
        <div class="info-div">
            <div class="info" id="infoText">
             	※ 회원 등급은 로그인, 마이페이지 접속 시 갱신됩니다.
            </div>
            <div class="info" id="infoTotal">
            	내 리워드 : <%= memberRewardList.get(0).getRemainRewardScore() %>p
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
                    <% if(memberRewardList != null) { 
                        
                        <!--
                            int num = 50
                            if(memberRewardList.size() < num) => size
                            else => num

                            click
                            if(size < num + 50) => size
                            else => num + 50


                         -->
                        

                    	for(int i = 0; i < memberRewardList.size(); i++) {%>
                    <tr>
                        <td><%= memberRewardList.get(i).getRownum() %></td>
                        <td><%= memberRewardList.get(i).getRewardDate() %></td>
                        <td><%= memberRewardList.get(i).getRewardReason() %></td>
                        <td><%= memberRewardList.get(i).getRewardScore() %></td>
                        <td><%= memberRewardList.get(i).getRemainRewardScore() %></td>
                    </tr>
                    	<% } %>
                   	<% } %>
                </tbody>
            </table>	<!-- tb-category -->
        </div>	<!-- tableBody  -->
    </div>
    <!-- footer 푸터영역 -->
	<%@ include file="/views/common/footer.jspf" %>

</body>
</html>