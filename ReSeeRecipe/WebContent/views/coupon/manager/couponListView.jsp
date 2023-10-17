<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[쿠폰관리] 쿠폰함 관리</title>
</head>
<!-- sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- categoryListView / script & css -->
<link rel="stylesheet" href="resources/css/coupon/coupon_manager.css">

</head>
<body>

	<%@ include file="../../manager/navbar.jsp" %>

	<div class="rs-content">
	    <div class="header">
		    <div class="h-title p-3">   <!-- 패딩 1rem -->
		        [쿠폰 관리] 쿠폰 등록 / 삭제
		    </div>
            <div class="searchTable">
            	<table>
            		<tr>
            			<td>
            			    <select name="searchDrop">
								<option value="all">전체</option>
								<option value="memId">아이디</option>
								<option value="memNickname">닉네임</option>
							</select>
            			</td>
            			<td><input id="rewardSearch" type="text" placeholder="검색명을 입력하세요" size="30">
            				<button type="submit">조회</button>
           				</td>
            		</tr>
            	</table>
            </div>
            <div class="h-content d-flex p-3">  <!-- 패딩 1rem -->
                <div class="mr-auto">	
                    조회수 <span class="waiting">10</span><span>개</span>
                </div>
                <div >
                    <button type="button" onclick="showDetailReportModal()" class="btn btn-sm btn-warning">쿠폰등록</button>
                    <button type="submit" onclick="updateReport()"class="btn btn-sm btn-warning">상세보기</button>
                    <button type="submit" onclick="updateReport()"class="btn btn-sm btn-secondary">쿠폰삭제</button>
                </div>
            </div>
        </div>	<!-- header -->
        <div class="tableBody">
            <table id='tb-report' class="table table-sm table-hover">
                <thead>
                    <tr>
                        <th data-idx=0><input type="checkbox" onclick="checkAll()"></th>
                        <th data-idx=1 data-type="num">번호<div class="sort"></div></th>
                        <th data-idx=2>쿠폰이름<div class="sort"></div></th>
                        <th data-idx=3>쿠폰할인율<div class="sort"></div></th>
                        <th data-idx=4>쿠폰등록일<div class="sort"></div></th>
                        <th data-idx=5>쿠폰종료일<div class="sort"></div></th>
                        <th data-idx=6>발급 수<div class="sort"></div></th>
                        <th data-idx=7>사용 수<div class="sort"></div></th>
                        <th data-idx=8>발급상태<div class="sort"></div></th>
                        <th data-idx=9 style="display: none">쿠폰지급사유<div class="sort"></div></th>
                    </tr>
                </thead>
                <tbody>
   	                <tr>
	                    <td colspan="9">쿠폰 등록 내역이 없습니다</td>
	                </tr>
	                    <tr>
	                        <td><input type="checkbox" onclick="checkOnce()"></td>
	                        <td></td>
	                    </tr>
                </tbody>
            </table>	<!-- tb-report -->
        </div>	<!-- tableBody  -->
	
	<!-- 페이징바 -->
	</div>	<!-- 페이징바 -->
	</div>	<!-- rs-content -->


</body>
</html>