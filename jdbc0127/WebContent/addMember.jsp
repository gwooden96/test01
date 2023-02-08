<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>member 테이블에 추가할 데이터 입력</h1>
   
   <form method="post" action="addResult.jsp">
	      이름 <input type="text" name="name"> <br>
	      아이디<input type="text" name="id"> <br>
	      비밀번호<input type="text" name="pw"> <br>
	      이메일 <input type="text" name="email"> <br>
	      전화번호 <input type="text" name="phone"> <br>
	      권한 <input type="radio" name="admin" value="1"> 관리자
         <input type="radio" name="admin" value="0"> 일반회원 <br>
      <input type="submit" value="확인">   
   </form>
</body>
</html>