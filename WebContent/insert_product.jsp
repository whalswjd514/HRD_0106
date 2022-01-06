<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<form name="form" method="post" action="insert_productProcess.jsp">
<h1>상품 정보 등록 화면</h1>
<hr>
<table border=1 id="tab3">
	<tr>
		<th>상품코드</th>
		<td colspan=3><input type="text" name="productId" id="in5"></td>
	</tr>
	<tr>
		<th>상품명</th>
		<td colspan=3><input type="text" name="productName" id="in5"></td>
	</tr>
	<tr>
		<th>가격</th>
		<td colspan=3><input type="text" name="unitprice" id="in5"></td>
	</tr>
	<tr>
		<th>상세정보</th>
		<td colspan=3><input type="text" name="description" id="in5"></td>
	</tr>
	<tr>
		<th>제조사</th>
		<td colspan=3><input type="text" name="manufacturer" id="in5"></td>
	</tr>
	<tr>
		<th>분류</th>
		<td><input type="text" name="category" id="in6"></td>
		<th>재고수</th>
		<td><input type="text" name="unitsInstock" id="in6"></td>
	</tr>
	<tr>
		<th>상태</th>
		<td colspan=3>
			<input type="radio" name="condition" value="신규제품" checked>신규제품
			<input type="radio" name="condition" value="중고제품">중고제품
			<input type="radio" name="condition" value="재생제품">재생제품
		</td>
	</tr>
	<tr>
		<td colspan=4 align=center>
			<input type="button" value="상품등록" onclick="check()">
			<input type="reset" value="다시작성">
		</td>
	</tr>
</table>
<hr>
</form>
<script>
	function check(){
		if(document.form.productId.value==""){
			alert("상품번호를 입력하세요.");
			document.form.productId.focus();
		}else if(document.form.productName.value==""){
			alert("상품명을 입력하세요.");
			document.form.productName.focus();
		}else{
			document.form.submit();
		}
	}
</script>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>