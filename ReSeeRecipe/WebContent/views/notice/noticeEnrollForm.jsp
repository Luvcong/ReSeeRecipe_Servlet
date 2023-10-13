<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성하기</title>
</head>
<body>
    
    <br><br>
    <h2>공지사항 작성</h2>
    <br><br>
    <div class="container">
        <form class="form" action="<%=contextPath%>/hlnoticeEnroll.ma">
            
            <label for="noticeTitle">공지사항 제목 : </label>
            <input type="text" class="form-control" placeholder="제목을 입력하세요" id="noticeTitle">
            
            <br>
            <label for="noticeWriter">작성자 :</label>
            <input type="password" class="form-control" placeholder="관리자 | 매니저" id="noticeWriter">
            <br><br>
            <label for="noticeFile">이미지</label> <br>
            <div class="custom-file">
                <input type="file" class="custom-file w3-yellow" id="noticeFile">
                <label class="custom-file-label" for="noticeFile">파일선택</label>
            </div>
            <br><br>
            <label for="noticeContent">공지사항 내용</label>
            <textarea class="form-control" rows="5" id="comment"></textarea>
            <br><br>
            <label for="noticeHashtag">해시태그</label>
            <input type="text" class="form-control" placeholder="해시태그를 입력하세요(#제외)" id="hashtag">
            <br><br><br>
            <button type="submit" class="btn btn-warning">등록하기</button>
            <button type="submit" class="btn btn-warning">목록으로</button>
        </form>
    </div>
</body>
</html>