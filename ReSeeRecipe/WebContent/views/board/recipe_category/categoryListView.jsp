<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.semi.board.recipe.model.vo.RecipeCategory" %>    
<%
	String contextPath = request.getContextPath();
	ArrayList<RecipeCategory> list = new ArrayList();
%>            
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[메뉴관리] 카테고리 관리</title>

<!-- bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- sweetalert -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />

<!-- navbar.css -->
<link rel="stylesheet" href="<%= contextPath %>/resources/css/manager.css">
</head>
<body>

    <div class="rs-content">        
        <div class="header">
            <div class="h-title p-3">   <!-- 패딩 1rem -->
                [메뉴 관리] 카테고리 관리
            </div>
            <div >
            	<table>
            		<tr>
            			<td><input type="text" placeholder="검색할 카테고리명을 입력하세요" size="30"><button type="submit">조회</button></td>
            		</tr>
            	</table>
            </div>
            <div class="h-content d-flex p-3">  <!-- 패딩 1rem -->
                <div class="mr-auto">
                    조회수 <span class="waiting">8</span><span>개</span>
                </div>
                <div >
                    <button class="btn btn-sm btn-warning">카테고리 추가</button>
                    <button class="btn btn-sm btn-warning">카테고리 수정</button>
                    <button class="btn btn-sm btn-secondary">카테고리 삭제</button>
                </div>
            </div>
        </div>
        <div class="tableBody">
            <table id='tb-dm' class="table table-sm table-hover">
                <thead>
                    <tr>
                        <th data-idx=0><input type="checkbox"></th>
                        <th data-idx=1 data-type="num">번호<div class="sort"></div></th>
                        <th data-idx=2>카테고리명<div class="sort"></div></th>
                        <th data-idx=3>게시글 수<div class="sort"></div></th>
                    </tr>
                </thead>
                <tbody>
   	                <tr>
	                    <td colspan="7">등록한 카테고리가 없습니다</td>
	                </tr>
	                    <tr>
	                        <td><input type="checkbox"></td>
	                        <td>1</td>
	                        <td>한식</td>
	                        <td>120</td>
	                    </tr>
                </tbody>
            </table>
        </div>
   	</div>  <!-- rs-content -->

</body>
</html>