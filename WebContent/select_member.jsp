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
<h1>회원 정보 조회</h1>
<table border=1 id="tab2">
	<tr>
		<th>id</th>
		<th>성명</th>
		<th>패스워드</th>
		<th>성별</th>
		<th>생년월일</th>
		<th>이메일</th>
		<th>휴대폰</th>
		<th>주 소</th>
		<th>닉네임</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		String sql="select id,name,password,gender,to_char(birth,'yyyy-mm-dd'),mail,phone,address,nickname from member0106";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String id=rs.getString(1);
			String name=rs.getString(2);
			String password=rs.getString(3);
			String gender=rs.getString(4);
			String birth=rs.getString(5);
			String mail=rs.getString(6);
			String phone=rs.getString(7);
			String address=rs.getString(8);
			String nickname=rs.getString(9);
			System.out.println("테이블 조회 성공");
%>
	<tr>
		<td><%=id %></td>
		<td><%=name %></td>
		<td><%=password %></td>
		<td><%=gender %></td>
		<td><%=birth %></td>
		<td><%=mail %></td>
		<td><%=phone %></td>
		<td><%=address %></td>
		<td><%=nickname %></td>
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