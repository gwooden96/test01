<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border='1'>
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>권한</th>
		</tr>
		
		<%
			String sql = "select * from member";
		
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection(url, "study", "1234");
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					out.print("<tr>");
					out.print("<td>" + rs.getString("name") + "</td>");
					out.print("<td>" + rs.getString("userid") + "</td>");
					out.print("<td>" + rs.getString("pw") + "</td>");
					out.print("<td>" + rs.getString("email") + "</td>");
					out.print("<td>" + rs.getString("phone") + "</td>");
					out.print("<td>" + rs.getInt("admin") + "</td>");
					out.print("</tr>");
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(rs != null)
						rs.close();
					if(stmt != null)
						stmt.close();
					if(conn != null)
						conn.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		%>
		
	</table>
</body>
</html>