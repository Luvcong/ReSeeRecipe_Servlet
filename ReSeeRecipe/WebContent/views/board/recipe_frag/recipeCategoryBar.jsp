<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피카테고리바</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<style>
    /*****************************************************/
    /* 전체 래핑 div 세팅 */
    #recipe-category-wrap {
        width: 1000px;
        height: 150px;
        margin: auto;
        text-align: center;
        box-sizing: border-box;
    }

    /* 테이블영역 div 세팅 */
    #category-toggle-menu{
        width: 100%;
		height: 80%;
    }
    
    /* 더보기 영역 div 세팅 */
    #category-toggle-msg {
        width: 100%;
        height: 20%;
    }
    
    /* 테이블영역 세팅 */
	#recipe-category-table {
		width: 100%;
		height: 100%;
	}

    /* h3요소 세팅 */
    h3 {
        margin: 0px;
        display: inline-block;
    }

    /*****************************************************/
    /* 테이블 내부 요소들 */
    #recipe-category-table td {
        width: 20%;
        height: 50%;
        color : black;
    }

    /* 더보기 내부 요소들 */
    #category-toggle-msg > h3 {
        font-size: 5px;
        color : black;
        display: inline-block;
        cursor: pointer;
    }
    
    /************************지울부분****************************/ 
    td {
        background-color: aquamarine;
    }
    #category-toggle-msg {
        background-color: cornflowerblue;
    }
    #recipe-category-table{
        background-color: blue;
    }
   
</style>
</head>
<body>
        <div id="recipe-category-wrap">
            <div id="category-toggle-menu">
                <table id="recipe-category-table">
                    <tr>
                        <td rowspan="2" id="recipe-category-logo">
                            <img src="#"> 로고 이미지
                        </td>
                        <td><h3>한식</h3></td>
                        <td><h3>양식</h3></td>
                        <td><h3>중식</h3></td>
                        <td><h3>일식</h3></td>
                    </tr>
                    <tr>
                        <td><h3>아시안</h3></td>
                        <td><h3>야식</h3></td>
                        <td><h3>디저트</h3></td>
                        <td><h3>음료</h3></td>
                    </tr>
                </table>
            </div>
            <div id="category-toggle-msg">
                <h3>접기</h3>
            </div>
        </div>

        <!-- 카테고리메뉴 토글 -->
        <script>
            $(function(){
                $('#category-toggle-msg > h3').click(function(){
                    if($(this).text() == '접기') {
                        $(this).text('더보기');
                    }
                    else {
                        $(this).text('접기');
                    }
                    $('#category-toggle-menu').slideToggle();
                })
            });
        </script>
	
	

</body>
</html>