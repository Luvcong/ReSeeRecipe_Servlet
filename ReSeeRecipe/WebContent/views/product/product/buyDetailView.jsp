<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.semi.product.model.vo.Product, 
				com.kh.semi.product.model.vo.ProductPicture,
				com.kh.semi.product.model.vo.Option" %>
<%
	Product p = (Product)request.getAttribute("p");
	ArrayList<ProductPicture> list = (ArrayList<ProductPicture>)request.getAttribute("list");
	ArrayList<Option> list2 = (ArrayList<Option>)request.getAttribute("list2");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품상세</title>
</head>
<style>
    #detailview-wrap{
        width: 1200px;
        margin: auto;
        display: grid;
        grid-template-rows: auto auto auto auto auto;
        grid-template-columns: auto auto;
        row-gap: 30px;
    }

    #detailview-wrap>div:nth-child(3), div:nth-child(4), div:nth-child(5){
        grid-column: 1 / 3;
    }
</style>
<body>
    
    <%@ include file="buyMenubar.jsp" %>
    
    
    <div id="detailview-wrap">
        <div>
            <img src="<%= contextPath %>/<%= list.get(0).getPicturePath() %>/<%= list.get(0).getPictureCname() %>" width="500" height="500">
            <br><br>
            <div>
            	<% for(int i = 1; i < list.size(); i++) {%>
					<img src="<%= contextPath %>/<%= list.get(i).getPicturePath() %>/<%= list.get(i).getPictureCname() %>" id="contentImg<%= i %>" width="200" height="200">
				<% } %>
            </div>
        </div>
		
        <div id="d_content">
        	<form>
        		<input type="hidden" value="<%= p %>" name="p">
        		<input type="hidden" value="<%= list %>" name="list">
	            <h2><%= p.getProductName() %></h2>
	            <% if(p.getProductSubname() != null) { %>
	            	<h3><%= p.getProductSubname() %></h3>
	            <% } %>
	            <p><%= p.getOrigin() %></p>
	            <p>★<%= p.getProductScoreReviewAvg() %></p>
	            <h2><%= p.getPrice() %></h2>
	            <h3><%= p.getDilivery() %></h3>
	            
	            	<% if(!list2.isEmpty()) { %>
	            		<select id="select">
			            	<% for(int i = 0; i < list2.size(); i++) { %>
			                	<option><%= list2.get(i).getOptionName() %></option>
			                <% } %>
		                </select>
		                <span><%= list2.get(0).getOptionPrice() %></span>
		                <input type="hidden" value="<%= list2.get(0).getOptionNo() %>" name="ono">
		                <h2>총 가격 <%= p.getPrice() + p.getDilivery() + list2.get(0).getOptionNo() %>원</h2>
	                <% } else { %>
	                	<h2>총 가격 <%= p.getPrice() + p.getDilivery() %>원</h2>
	                <% } %>
	            
	            <!-- <% if(loginMember != null) { %>
		            <button type="submit" formaction="<%=contextPath%>/probuy.po?buy=pre">선물하기</button>
		            <button type="submit" formaction="">장바구니</button>
		            <button type="submit" formaction="<%=contextPath%>/probuy.po?buy=buy">바로구매</button>
            	<% } else { %>
            		<br><br>
            		<h2>로그인 후 구매가능합니다</h2>
            	<% } %> -->
            	    <button type="submit" formaction="<%=contextPath%>/probuy.po?buy=pre">선물하기</button>
		            <button type="submit" formaction="">장바구니</button>
		            <button type="submit" formaction="<%=contextPath%>/probuy.po?buy=buy">바로구매</button>
            </form>
        </div>
        
        <script>
        	$(function(){
        		$('#select').on("change", function(){
        			<% for(int i = 0; i < list2.size(); i++) { %>
	        			if($(this).val() == '<%= list2.get(i).getOptionName() %>') {
							$('#select').next().text('<%= list2.get(i).getOptionPrice() %>');
							$('#select').next().next().val('<%= list2.get(i).getOptionNo() %>');
							$('#select').next().next().next().text('총 가격 <%= p.getPrice() + p.getDilivery() + list2.get(i).getOptionPrice() %>원');
						}
        			<% } %>
        		})
        	})
        </script>

        <div align="center">
            <h2 style="display: inline-block;">상세정보</h2>
            <h2 style="display: inline-block;">구매안내</h2>
            <h2 style="display: inline-block;">후기</h2>
        </div>

        <div>
            <div style="background-color: #e2e2e2;">
            <br>
                <%= p.getProductDetail() %>
            <br><br>
            </div>
            <br>
            <div style="background-color: #e2e2e2;">
                asdf
                <br><br>
            </div>
        </div>
        
        
        <div class="d_reply">
            <h2>후기</h2>
            <input type="checkbox">포토후기
            <button style="float: right;">후기작성</button>
            <br><br><br>
            <p style="margin-bottom: 0px;">주문자명</p>
            <p style="display: inline-block;">★★★</p>
            <p style="display: inline-block;">작성일</p>
            <img src="/view/image/hello.png" width="100" height="100" style="display: block;">
            <p>리뷰내용</p>
        </div>
    </div>
    
    <%@ include file="buyFooter.jsp" %>
</body>
</html>