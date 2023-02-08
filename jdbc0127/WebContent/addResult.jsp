<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!

	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:XE";

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
	
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		int admin = Integer.parseInt(request.getParameter("admin"));
		
		String sql = "insert into member values(?,?,?,?,?,?)";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, "study", "1234");
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, pw);
			pstmt.setString(4, email);
			pstmt.setString(5, phone);
			pstmt.setInt(6, admin);
			
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	%>
	
	<a href="showMember.jsp">목록확인</a>

</body>
</html>