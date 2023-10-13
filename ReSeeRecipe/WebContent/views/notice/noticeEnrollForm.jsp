<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int loginMemberNo = (int)(request.getAttribute("loginMemberNo"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성하기</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

	<!-- 해시태그 Tagify 라이브러리 -->
	<!-- 소스 다운 -->
	<script src="https://unpkg.com/@yaireo/tagify"></script>
	<!-- 폴리필 (구버젼 브라우저 지원) -->
	<script src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
	<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />

<style>

    .custom-file{
        width : 30%;
    }

    #HL_noticeContent{
        width : 500px;
        height : 200px;
        resize: none;
    }

    #HL_noticeTitle, #HL_noticeWriter, #HL_noticeHashtag{
        width : 500px;
    }
    /* button[type=submit]{
        align : "center";
    } */
    #HL_noticeContent {
        resize : none;
    }

</style>
</head>
<body>
    <%@ include file="../manager/navbar.jsp" %>
<div class="rs-content">
    <br><br>
    <h2>공지사항 작성</h2>
    <br><br>
    <div class="container">
        <form enctype="multipart/form-data" class="form" action="<%=contextPath%>/hlnoticeEnroll.ma" id="HL_noticeEnroll_Form" method="post">
            
            <!-- Session의 loginMember에서 관리자 정보 hidden으로 넘겨서 notice테이블에 insert -->
            <input type="hidden" name="adminNo" value=<%=loginMemberNo%>>
            <label for="HL_noticeTitle">공지사항 제목 : </label>
            <input type="text" class="form-control" placeholder="제목을 입력하세요" name="HL_noticeTitle" id="HL_noticeTitle" required>
            
            <br>
            <label for="HL_noticeWriter">작성자 :</label>
            <input type="password" class="form-control" placeholder="관리자 | 매니저" name="HL_noticeWriter" id="HL_noticeWriter" required>
            <br><br>

            <label for="HL_noticeFile">이미지</label> <br>
            <div class="custom-file">
                <label class="custom-file-label" for="HL_noticeFile">파일선택</label>
                <input type="file" class="custom-file w3-yellow" name="HL_noticeFile" id="HL_noticeFile">
            </div>  
            <br><br>
            <label for="HL_noticeContent">공지사항 내용</label>
            <textarea class="form-control" rows="5" name="HL_noticeContent" id="HL_noticeContent"></textarea>
            <br><br>
           
    <!--   <label for="HL_noticeHashtag">해시태그</label>
            <input type="text" class="form-control" placeholder="해시태그를 입력하세요(#제외)" name="HL_noticeHashtag" id="HL_noticeHashtag">
            <br> --> 
            <lable for="HL_noticeTag">해시태그</lable> <br>
            <input id="HL_noticeTag" name='tags'
  			class='some_class_name'            
 			placeholder='해시태그를 입력해주세요'      
  			value='공지사항, ReSEeRecipe, recipe, 레시피' 
  			data-blacklist='.NET,PHP'>  
                  
			<script>
			var inputElm = document.querySelector('input[name=tags]'),
		    whitelist = ["요린이", "요리대회"];
			
			
			
			
    		// initialize Tagify on the above input node reference
    		var tagify = new Tagify(inputElm, {
    		    enforceWhitelist: true,
    		  
    		    // make an array from the initial input value
    		    whitelist: inputElm.value.trim().split(/\s*,\s*/) 
    		})

    		// Chainable event listeners
    		tagify.on('add', onAddTag)
    		      .on('remove', onRemoveTag)
    		      .on('input', onInput)
    		      .on('edit', onTagEdit)
    		      .on('invalid', onInvalidTag)
    		      .on('click', onTagClick)
    		      .on('focus', onTagifyFocusBlur)
    		      .on('blur', onTagifyFocusBlur)
    		      .on('dropdown:hide dropdown:show', e => console.log(e.type))
    		      .on('dropdown:select', onDropdownSelect)

    		var mockAjax = (function mockAjax(){
    		    var timeout;
    		    return function(duration){
    		        clearTimeout(timeout); // abort last request
    		        return new Promise(function(resolve, reject){
    		            timeout = setTimeout(resolve, duration || 700, whitelist)
    		        })
    		    }
    		})()

    		// tag added callback
    		function onAddTag(e){
    		    console.log("onAddTag: ", e.detail);
    		    console.log("original input value: ", inputElm.value)
    		    tagify.off('add', onAddTag) // exmaple of removing a custom Tagify event
    		}

    		// tag remvoed callback
    		function onRemoveTag(e){
    		    console.log("onRemoveTag:", e.detail, "tagify instance value:", tagify.value)
    		}

    		// on character(s) added/removed (user is typing/deleting)
    		function onInput(e){
    		    console.log("onInput: ", e.detail);
    		    tagify.settings.whitelist.length = 0; // reset current whitelist
    		    tagify.loading(true).dropdown.hide.call(tagify) // show the loader animation

    		    // get new whitelist from a delayed mocked request (Promise)
    		    mockAjax()
    		        .then(function(result){
    		            // replace tagify "whitelist" array values with new values
    		            // and add back the ones already choses as Tags
    		            tagify.settings.whitelist.push(...result, ...tagify.value)

    		            // render the suggestions dropdown.
    		            tagify.loading(false).dropdown.show.call(tagify, e.detail.value);
    		        })
    		}

    		function onTagEdit(e){
    		    console.log("onTagEdit: ", e.detail);
    		}

    		// invalid tag added callback
    		function onInvalidTag(e){
    		    console.log("onInvalidTag: ", e.detail);
    		}

    		// invalid tag added callback
    		function onTagClick(e){
    		    console.log(e.detail);
    		    console.log("onTagClick: ", e.detail);
    		}

    		function onTagifyFocusBlur(e){
    		    console.log(e.type, "event fired")
    		}

    		function onDropdownSelect(e){
    		    console.log("onDropdownSelect: ", e.detail)
    		}

			</script>
            
            <br><br>
            <button type="submit" class="btn btn-warning">등록하기</button>
            <button type="submit" class="btn btn-warning">목록으로</button>
        </form>
    </div>
</div>
</body>
</html>