<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.semi.product.model.vo.Product, com.kh.semi.common.model.vo.PageInfo" %>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String title = (String)request.getAttribute("title");
	String cate = (String)request.getAttribute("cate");
	int select = (int)request.getAttribute("select");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검색페이지</title>
    <style>
        #searchpage-wrap{
            width: 1200px;
            margin: auto;
        }
        li{
            list-style-type: none;
        }
        a{
            text-decoration: none;
            color: black;
        }
        a:hover{
            text-decoration: none;
            color: grey;
        }

        #s_list{
            display: block;
            float: right;
        }

        #pro_area{
            display: flex;
            flex-flow: row wrap;
        }
        .pro_list{
            width: 31.6%;
            height: 480px;
            margin: 10px;
        }
        .pro_list img{
            height: 350px;
            width: 100%;
            background-size: cover;
        }
        .pro_list>a:nth-child(2){
            display: block;
            text-align: left;
            font-size: 23px;
            margin-top: 5px;
            height: auto;
        }
        .pro_list>a:nth-child(3), a:nth-child(4){
            display: block;
            margin-bottom: 3px;
            text-align: left;
            font-size: 18px;
        }
    </style>
</head>
<body>

	<%@ include file="buyMenubar.jsp" %>
    
    <div id="searchpage-wrap">
        <div style="margin-bottom: 50px;">
            <div style="font-size: 40px; text-align: left;"><b><%= title %></b></div>
            <% if(select == 1) { %>
	            <div id="s_list">
	                <p>
						<a href="javascript:good();">추천</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
						<a href="javascript:price();">낮은가격</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
						<a href="javascript:star();">높은평점</a> 
					</p>
	            </div>
            <% } %>
        </div>
        
        <script>
	        function good(){
	        	$.ajax({
	        		url: 'psort.po',
	        		data: {cate: '<%= cate %>', sort: 'good', cpage: 1, title: '<%= title %>', select: 1},
	        		success: function(result){
	        			console.log(result);
	        		}
	        	})
	        }
			function price(){
				$.ajax({
	        		url: 'psort.po',
	        		data: {cate: '<%= cate %>', sort: 'price', cpage: 1, title: '<%= title %>', select: 1},
	        		success: function(result){
	        			console.log(result);
	        		}
	        	})  	
			}
			function star(){
				$.ajax({
	        		url: 'psort.po',
	        		data: {cate: '<%= cate %>', sort: 'star', cpage: 1, title: '<%= title %>', select: 1},
	        		success: function(result){
	        			console.log(result);
	        		}
	        	})
			}
        </script>

        
        <div id="pro_area">
        	<% for(Product p : list) { %>
        		<div class="pro_list">
        			<!-- <a style="display: none;"><%= p.getProductNo() %></a> -->
	                <a href="<%=contextPath%>/prodetail.po?pno=<%= p.getProductNo() %>">
	                    <img src="<%= p.getTitleImg() %>">
	                </a>
	                <a href="<%=contextPath%>/prodetail.po?pno=<%= p.getProductNo() %>"><%= p.getProductName() %></a>
	                <a href="<%=contextPath%>/prodetail.po?pno=<%= p.getProductNo() %>"><%= p.getPrice() %></a>
	                <a href="<%=contextPath%>/prodetail.po?pno=<%= p.getProductNo() %>">★<%= p.getProductScoreReviewAvg() %></a>
	            </div>
        	<% } %>
        
        
        
        
            <!--<div class="pro_list">
                <a href="#">
                    <img src="/view/image/hello.png">
                </a>
                <a href="#">상품이름상품이름상품이름상품이름상품이름</a>
                <a href="#">가격1231412</a>
                <a href="#">별점 ★4.6</a>
            </div>
            <div class="pro_list">
                <a href="#">
                    <img src="/view/image/hello.png">
                </a>
                <a href="#">상품이름</a>
                <a href="#">가격</a>
                <a href="#">별점</a>
            </div>
            <div class="pro_list">
                <a href="#">
                    <img src="/view/image/hello.png">
                </a>
                <a href="#">상품이름</a>
                <a href="#">가격</a>
                <a href="#">별점</a>
            </div>
            <div class="pro_list">
                <a href="#">
                    <img src="/view/image/hello.png">
                </a>
                <a href="#">상품이름</a>
                <a href="#">가격</a>
                <a href="#">별점</a>
            </div>  -->
        </div>
        
        <!--  <script>
        	$(function(){
        		$('.pro_list').click(function(){
        			location.href='<%=contextPath%>/prodetail.po?pno='+$(this).children().eq(0).text();
        		})
        	})
        </script>-->
        
        
        <div class="paging-area" align="center">
        	<% if(currentPage != 1) { %>
        		<button onclick="location.href='<%= contextPath %>/searchlist.po?cpage=<%= currentPage + - 1 %>'">&lt;</button>
        	<% } %>	
        	<% for(int i = startPage; i <= endPage; i++) { %>
        		<% if(currentPage != i) { %>
        			<button onclick="location.href='<%= contextPath %>/searchlist.po?cpage=<%= i %>'"><%= i %></button>
        		<% } else { %>
        			<button disabled><%= i %></button>
        		<% } %>	
        	<% } %>
        	<% if(currentPage != maxPage) { %>
        		<button onclick="location.href='<%= contextPath %>/searchlist.po?cpage=<%= currentPage + 1 %>'">&gt;</button>
       		<% } %>	
        </div>
    </div>
    <br><br>
    
    <%@ include file="buyFooter.jsp" %>
</body>
</html>