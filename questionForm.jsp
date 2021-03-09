<%@page import="com.webjjang.main.controller.Beans"%>
<%@page import="com.webjjang.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.webjjang.main.controller.ExeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문하기</title>

  <script type="text/javascript" src="../js/formUtil.js"></script>
  <script type="text/javascript">
  $(function () {
	$("#cancelBtn").click(function () {
		history.back();
	});
	$("#writeForm").submit(function () {
		//alert("데이터 전달 이벤트 발생");
		
		//필수입력
		//alert(!require($("#title"), "제목"));
		if(!require($("#title"), "제목")) return false;
		if(!require($("#content"), "내용")) return false;

		
		//길이
		if(!checkLength($("#title"), "제목", 3)) return false;
		if(!checkLength($("#content"), "내용", 3)) return false;
		
		
		//submit 이벤트 취소
		//return false;
	});
	
});
  </script>
</head>
<body>
<div class= "container">
<h1>질문하기</h1>
<form action="write.jsp" id="writeForm" method="post">
	<div class="form-group">
	<label for ="title">제목</label>
	<input name="title" class ="form-control" id="title"  placeholder="3글자 이상 50자 이내 입력" required="required">
	</div>
	<div class ="form-group">
	<label for = "content">내용</label><textarea rows="7" cols="5" name="content" class="form-control" id="content"  placeholder="3글자 이상 입력" required="required"></textarea>
	</div>
	
	<button class="btn btn-default">등록</button>
	<button class="btn btn-default" type="reset">새로 입력</button>
	<button type= "button" class="btn btn-default" id="cancelBtn" >취소</button>

</form>
</div>
</body>
</html>