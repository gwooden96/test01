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
	
		int no = Integer.parseInt(request.getParameter("사원번호"));

		
		String sql = "DELETE FROM 사원 WHERE 사원번호 = ?";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, "study", "1234");
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, no);

			
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
	<h2>삭제완료</h2>
	<a href="showInfo.jsp">사원목록페이지</a><br>
	<a href="addStaf.jsp">사원등록페이지</a><br>
	<a href="deleteStaf.jsp">사원삭제페이지</a>

</body>
</html>