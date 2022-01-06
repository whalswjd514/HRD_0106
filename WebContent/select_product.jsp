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
<h1>상품 정보 조회</h1>
<table border=1 id="tab4">
	<tr>
		<th>no</th>
		<th>상품코드</th>
		<th>상품명</th>
		<th>가격</th>
		<th>상세정보</th>
		<th>분류</th>
		<th>제조사</th>
		<th>재고수</th>
		<th>상태</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int no=0;
	
	try{
		String sql="select * from product0106 order by productId";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String productId=rs.getString(1);
			String productName=rs.getString(2);
			String unitprice=rs.getString(3);
			String description=rs.getString(4);
			String category=rs.getString(5);
			String manufacturer=rs.getString(6);
			String unitsInstock=rs.getString(7);
			String condition=rs.getString(8);
			no++;
			System.out.println("테이블 조회 성공");
%>
	<tr>
		<td><%=no %></td>
		<td><%=productId %></td>
		<td><%=productName %></td>
		<td><%=unitprice %></td>
		<td><%=description %></td>
		<td><%=category %></td>
		<td><%=manufacturer %></td>
		<td><%=unitsInstock %></td>
		<td><%=condition %></td>
	</tr>
<%
			}
	}catch(SQLException e){
		System.out.println("테이블 조회 실패");
		e.printStackTrace();
	}
%>
</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>