<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ include file="../includes/tempnav.jsp" %>
<%
Long loggedInUserNo = (Long)session.getAttribute("loggedInUserNo");        
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<title>레시피 상세</title>
</head>
<body>

	<div style="text-align: center;">
		
			<div>
                <h1>레시피<c:out value="${recipe.title}" /></h1>
                <img src="<c:out value="${recipe.thumbnail}"/>" width="350" height="350" onerror="imgError(this);" />
               
			</div>
			<div>
				<c:out value="난이도:${recipe.difficulty}" /><br>
				<c:out value="분량:${recipe.portion}" /><br/>
				<c:out value="소요 시간:${recipe.cookingTime}" /><br>
				
				<c:out value="내용:${recipe.reContent }"/>
				<br>
                
            </div>
            <div>
                <c:if test="${not empty contentList[0].content }">
                <h3>요리 순서</h3>
                </c:if>
                <c:set var="doneLoop" value="false" />
            <c:forEach items="${contentList}" var="content">
				<c:if test="${empty content.photoUrl  && empty content.content }">
					<c:set var="doneLoop" value="true" />	
				</c:if>
				
				<c:if test="${not doneLoop}">
                <div>
                    순서:<c:out value="${content.stepNo}" />         
                    <img src="<c:out value="${content.photoUrl}"/>" width="200" height="200" onerror="imgError(this);" />
                    <c:out value="${content.content}" />
                </div>
                </c:if>
                
            </c:forEach>
			</div>
			<br><br>
			작성일 : <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${recipe.regDate}"/><br>
			수정일 : <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${recipe.updateDate}"/><br>
			
            
            <!--<c:out value="작성일:${recipe.regDate}" /><br>
            <c:out value="수정일:${recipe.updateDate}" />-->
    </div>
    <br><br>
    
<div style="text-align:center">
<div>
    주방장
    <a href="/user/profile?userId=<c:out value="${author.userId}" />">
    <img src="<c:out value="${author.profilePhoto}" />" width="140" height="120" onerror="imgError(this);" />
    <c:out value="${author.nickName}" />
    <c:out value="${author.bio}" />
    </a>
</div>
<div>
	<c:if test="${canModify eq 'true'}">  
	<a href="/recipe/modiRecipe?rno=${recipe.rno}">수정</a>
	<a href="/recipe/del?rno=${recipe.rno}">삭제</a>
	</c:if>
</div>
</div>
</body>

<script type="text/javascript">
</script>

</html>