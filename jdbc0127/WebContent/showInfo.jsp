<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%!

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String id = "study";
	String pw = "1234";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>사원정보</h1>
	<table border="1">
		<tr>
			<th>사원번호</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>부서명</th>
		</tr>
		
		
		<%
			try {
			String sql = "select * from 사원";
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				out.print("<tr>");
				out.print("<td>" + rs.getInt("사원번호") + "</td>");
				out.print("<td>" + rs.getString("이름") + "</td>");
				out.print("<td>" + rs.getInt(3) + "</td>");
				out.print("<td>" + rs.getString(4) + "</td>");
				out.print("</tr>");

			}
			out.print("<td colspan=4 style='text-align: center;'><a href='addStaf.jsp'>사원등록페이지</a></td>"); 
			out.print("<td colspan=4 style='text-align: center;'><a href='deleteStaf.jsp'>사원삭제페이지</a></td>");
			
			} catch(Exception e) {
				out.print("조회 실패");
				e.printStackTrace();
			} finally {
				try {
					if(rs != null)
						rs.close();
					if(pstmt != null)
						pstmt.close();
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