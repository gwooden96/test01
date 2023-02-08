<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>사원등록</h1>
   
   <form method="post" action="addStafResult.jsp">
	 사원번호 <input type="text" name="사원번호"> <br>
	 이름<input type="text" name="이름"> <br>
	 생년월일<input type="text" name="생년월일"> <br>
	 부서명 <input type="text" name="부서명"> <br>
      <input type="submit" value="등록">   
   </form>
</body>
</html>