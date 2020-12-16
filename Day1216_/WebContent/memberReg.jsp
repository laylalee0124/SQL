<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<a href="index.jsp">HOME</a>
	<h1>회원 등록 페이지</h1>
	
	<!-- 컨트롤러와 서버간의 약속. *.me로 보내는 링크를 컨트롤러에서 받기로 설정했었음 -->
	<form action="memberReg.me" method="post"> <!-- 기본값은 get방식 -->
		<p>
			<input type="email" name="email" placeholder="email 입력">
		</p>
		<p>
			<input type="password" name="pw" placeholder="PW입력">
		</p>
		<p>
			<input type="text" name="name" placeholder="이름 입력">
		</p>
		<p>
			<input type="submit" value="회원가입">
		</p>

	</form>
</body>
</html>