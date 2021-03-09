<%@page import="com.webjjang.qna.vo.QnaVO"%>
<%@page import="java.util.List"%>
<%@page import="com.webjjang.main.controller.Beans"%>
<%@page import="com.webjjang.util.filter.AuthorityFilter"%>
<%@page import="com.webjjang.main.controller.ExeService"%>
<%@page import="com.webjjang.util.PageObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="pageObject" tagdir="/WEB-INF/tags" %>
    
<%
//자바부분

//기본 정보 셋팅
Long curPage = 1L;
Long prerPageNum = 10L;


//넘어오는 데이터 받기 - 페이지, 한 페이지 당 데이터 갯수 
String strCurPage = request.getParameter("page");
String strPerPageNum = request.getParameter("perPageNum");

//pageObject 생성
PageObject pageObject = new PageObject();
//넘어오는 데이터가 있으면 pageObject의 페이지와 한 페이지당 표시 데이터 갯수의 기본정보를 바꾼다 
if(strCurPage !=null) curPage = Long.parseLong(strCurPage);
pageObject.setPage(curPage);
//초기값 설정이 있으므로 코드를 줄여서 써도 되지만 아닌 경우가 존재하므로 위에 처럼 쓰는 것이 나음 
if(strPerPageNum !=null) pageObject.setPerPageNum(Long.parseLong(strPerPageNum));

//DB에서 데이터 가져오기
@SuppressWarnings("unchecked")
List<QnaVO>list = (List<QnaVO>)ExeService.execute(Beans.get(AuthorityFilter.url), pageObject);

//객체 저장
request.setAttribute("list", list);
request.setAttribute("pageObject", pageObject);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문답변 목록</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<div class = "container">
<h1>질문답변 목록</h1>
<table class = "table">
	<tr>
	
	<th>번호</th>
	<th>제목</th>
	<th>이름</th>
	<th>작성일</th>
	<th>조회수</th>

	</tr>

	<c:forEach items = "${list}" var = "vo">
	<tr>
			<td>${vo.no }</td>
			<td>
		<c:forEach begin="1" end="${vo.levNo }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>
		<c:if test="${vo.levNo > 0 }">
		<i class="material-icons">subdirectory_arrow_right</i>
		</c:if> ${vo.title }
		</td>
		<td>${vo.name }(${vo.id })</td>
		<td>${vo.writeDate }</td>
		<td>${vo.hit }</td>
	</tr>
	</c:forEach>

	<tr>
		<td colspan="5">
			<pageObject:pageNav listURI="list.jsp" pageObject="${pageObject }"/><br>
		<c:if test="${!empty login }">
			<a href="questionForm.jsp" class="btn btn-default">질문하기</a>
		</c:if>
		</td>
	</tr>
	
</table>

</div>
</body>
</html>