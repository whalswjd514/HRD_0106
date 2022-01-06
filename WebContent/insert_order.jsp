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
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String id=request.getParameter("id");
	String prodcount=request.getParameter("prodcount");
	int pcount=0; //prodcount가 string으로 넘어오므로
	if(prodcount==null){
		prodcount="0";
		pcount=0;
	}else{
		pcount=Integer.parseInt(prodcount); //prodcount가 string이므로 number로 바꾸는것
	}
	
	int price=0;
	int total=0;
	try{
		String sql="select productId,unitprice from product0106 where productId=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			id=rs.getString(1);
			price=rs.getInt(2);
			total=pcount * price;
			
			System.out.println("id :"+id);
			System.out.println("price :"+price);
			System.out.println("total :"+total);
		}else if(id==null){
			id="";
		}else{
			%>
			<script>
				alert("등록되지 않은 코드입니다.");
			</script>
			<%	
		}
	}catch(SQLException e){
		System.out.println("product table 읽기 실패");
		e.printStackTrace();
	}
%>
<form name="form" method="post" action="insert_order.jsp">
<h2>주문정보 등록</h2>
<table border=1 id="tab5">
	<tr>
		<th>상품 코드</th>
		<td><input type="text" name="id" value="<%=id %>" id="in7" onchange="changesubmit();"></td>
		<th>주문자 이름</th>
		<td><input type="text" name="name" id="in7"></td>
	</tr>
	<tr>
		<th>주문 날짜</th>
		<td><input type="text" name="orderdate" id="in7"></td>
		<th>전화번호</th>
		<td><input type="text" name="tel" id="in7"></td>
	</tr>
	<tr>
		<th>배달주소</th>
		<td colspan=3><input type="text" name="addr" id="in8"></td>
	</tr>
	<tr>
		<th>결제방법</th>
		<td><input type="radio" name="pay" value="1">현금
			<input type="radio" name="pay" value="2">카드
		</td>
		<th>카드번호</th>
		<td><input type="text" name="cardno" id="in7"></td>
	</tr>
	<tr>
		<th>주문상품수</th>
		<td><input type="text" name="prodcount" value="<%=prodcount %>" id="in7" onchange="changesubmit()"></td>
		<th>주문금액</th>
		<td><input type="text" name="total" value="<%=total %>" id="in7"></td>
	</tr>
	<tr>
		<td colspan=4 align=center height=30px>
			<input type="button" value="목록" id="btn1" onclick="location.href='select_order.jsp'">
			<input type="submit" value="저장" id="btn1" onclick="check()">
		</td>
	</tr>
</table>
</form>
<script>
	function check(){
		if(document.form.name.value==""){
			alert("이름을 입력하세요.");
			document.form.name.focus();
		}else if(document.form.addr.value==""){
			alert("주소를 입력하세요.");
			document.form.addr.focus();
		}else{
			form.action="insert_orderProcess.jsp";
		}
	}
	
	function changesubmit(){
		document.form.submit();
	}
</script>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>