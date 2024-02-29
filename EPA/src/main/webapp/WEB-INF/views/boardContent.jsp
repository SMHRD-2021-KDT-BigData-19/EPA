<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="${cpath}/resources/css/style.css">
    <link rel="stylesheet" href="${cpath}/resources/css/community.css">
    <style>
        #small {
            margin-right: 70%;
        }
        #midium {
            font-size: 14px;
        }
        input {
            width: 900px;
            height: 25px;
            font-size: 15px;
            margin-top: 20px;
        }
        button {
            background-color: #dcdcdc;
            color: white;
            border-radius: 5px;
            border: none; 
           border-radius: 5px;
           padding: 8px 16px; 
           margin-right: 10px; 
           cursor: pointer; 
        }
            button:hover {
        background-color: #a0a0a0; 
    }
        #jak{
        width:70px;
        margin-top:-32px;
        margin-left:930px;
         background-color: #FFC0CB; 
        color: white; 
        border: none; 
        border-radius: 5px; 
        padding: 8px 16px;
        cursor: pointer; }
        
        #jak:hover {
        background-color: #FF8E99; 
    }
        
     body > div.panel-body{
    font-family: 'IBMPlexSansKR-Regular';} 
    
      body > div.panel-body > table > tbody > tr> td > b{
      margin-left:20px;}
      
      #midium > td:nth-child(1) > b{
      font-size:16px;
      white-space: nowrap;
      margin-left:10px}/* 텍스트 줄 바꿈 방지 */
      
        footer {
          position: fixed;
          bottom: 0;
          width: 100%;
          color: #fff;
          padding: 10px 0;
          text-align: center;
      }
      
      .comment-text {
      margin-left: 30px;
      }
    
    </style>
</head>
<body>
<script type="text/javascript">
   function goDelete() {
      location.href="<c:url value='/boardDelete.do/${vo.BD_NO}'/>";
      
   }
   function goUpdate() {
      location.href="${cpath}/boardUpdateForm.do?BD_NO=${vo.BD_NO}";
   
   }
   function goList() {
      location.href="${cpath}/boardList.do";
   
   }
   function commentDelete() {
	    // id 값으로 가져오기
	    var COM_NO = $('#COM_NO').val();
	    $.ajax({
	        url: "${cpath}/commentDelete.do",
	        type: "post",
	        data: {COM_NO:COM_NO}, // 'COM_NO' 파라미터 전달
	        dataType: 'json',
	        complete: function() {
	            location.reload();
	            
	        }
	    });
	}
   
   
</script>
<header>
    <a href="#"><img id="login_icon" src="${cpath}/resources/img/login.png" width="20" height="20"></img></a>
    <a href="${cpath}/Logout.do">로그아웃</a>
</header>
<div class="navbar">
     <a href="${cpath}/main.do"><img id="icon" src="${cpath}/resources/img/mainlogo.png" width="150" height="80"></img></a>
     <a href="${cpath}/info.do">운동정보</a>
    <a href="${cpath}/boardList.do">커뮤니티</a>
    <a href="${cpath}/use.do">EPA이용방법</a>
    <a href="${cpath}/mypage.do">마이페이지</a>
</div>
<div class="panel-body">
    <table class="table table-hover table-striped">
        <tr>
            <td class="boardtd"><b>제목</b></td>
            <td class="boardtd">${vo.BD_T}</td>
        </tr>

        <tr>
            <td class="boardtd"><b>내용</b></td>
            
            <% // 스크립틀릿
                 pageContext.setAttribute("newLine", "\n");
               %>
             
          <td class="boardtd">
           <c:choose>
        <c:when test="${not empty Ivo}">
	            <c:forEach items="${Ivo}" var="i">
	                <c:if test="${not empty i.file}">
	                    <img src="http://172.30.1.66:8080/imgEPA/${vo.BD_NO}/${i.file}" width="800" height="500">
	                </c:if>
	            </c:forEach>
	        </c:when>
	        <c:otherwise>
	            <!-- 파일이 없을 때 아무것도 표시하지 않음 -->
	        </c:otherwise>
	    </c:choose>
          <br>
          ${fn:replace(vo.BD_C, newLine, "<br>") }</td>
        </tr>
        
        
        <tr id="midium">
            <td class="boardtd"><b>작성자</b></td>
            <td class="boardtd">${vo.MEM_ID}</td>
        </tr>
        
        <tr id="small">
            <td style="text-align: right;" class="boardtd"></td>
            <td style="text-align: right;" class="boardtd">작성일&nbsp;:&nbsp;&nbsp;${vo.BD_DATE}&nbsp;
            <button onclick="goUpdate()">수정</button>
            <button onclick="goDelete()">삭제</button>
            <button onclick="goList()">목록</button>
            </td>
        </tr>
     <c:forEach items="${comment}" var="c" >   
     <tr>
       <td><span class="comment-text">${c.MEM_ID}</span></td>
       <td><span class="comment-text">${c.COM_C}</span>&nbsp;&nbsp;<button id="COM_NO" onclick="commentDelete()" value="${c.COM_NO}">삭제</button></td>
        </tr>
         </c:forEach>
     <tr>
         <td><b>댓글</b></td>
           
         <td>
         <form action="${cpath}/commentInsert.do" method="post">
         <input type="hidden" name="MEM_ID" value="${loginMember.MEM_ID}">
         <input type="text" name="COM_C">
         <input type="hidden" name="BD_NO" value="${vo.BD_NO}">
         
         <button type="submit" id="jak">작성</button></form><br>
         </td>
  
     </tr>
        
    </table>
 </div>
  
</body>
</html>