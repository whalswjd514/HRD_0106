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
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int no=0;
	try{
		String sql="select count(*) from order0106";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			no=rs.getInt(1);
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
<h1>상품 목록</h1>
<p id="p1">총<%=no %>개의 주문이 있습니다.</p>
<table border=1 id="tab6">
	<tr>
		<th>상품코드</th>
		<th>주문자이름</th>
		<th>주문날짜</th>
		<th>배달주소</th>
		<th>전화번호</th>
		<th>결제방법</th>
		<th>카드번호</th>
		<th>주문상품수</th>
		<th>판매가격</th>
		<th>총금액</th>
		<th>구분</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	
	try{
		String sql="select a.id,a.name,a.orderdate,a.addr,a.tel,a.pay,a.cardno,a.prodcount,b.unitprice,a.total from order0106 a,product0106 b where a.id=b.productId";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String id=rs.getString(1);
			String name=rs.getString(2);
			String orderdate=rs.getString(3);
			String addr=rs.getString(4);
			String tel=rs.getString(5);
			String pay=rs.getString(6);
			String cardno=rs.getString(7);
			String prodcount=rs.getString(8);
			String unitprice=rs.getString(9);
			String total=rs.getString(10);
			System.out.println("테이블 조회 성공");
%>
	<tr>
		<td><%=id %></td>
		<td><%=name %></td>
		<td><%=orderdate %></td>
		<td><%=addr %></td>
		<td><%=tel %></td>
		<td><%=pay %></td>
		<td><%=cardno %></td>
		<td><%=prodcount %></td>
		<td><%=unitprice %></td>
		<td><%=total %></td>
		<td><a href="update_order.jsp?id=<%=id %> & name=<%=name %>">수정</a> / 
			<a href="delete_order.jsp?id=<%=id %> & name=<%=name %>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a>
		</td>
	</tr>
<%
			}
	}catch(SQLException e){
		System.out.println("테이블 조회 실패");
		e.printStackTrace();
	}
%>
</table>
	<div class="btn_group" align=center>
		<button type="button" onclick="location.href='insert_order.jsp'">작성</button>
	</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>