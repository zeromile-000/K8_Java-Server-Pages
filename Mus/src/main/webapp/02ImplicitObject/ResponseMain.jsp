<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>내장 객체 - response</title>
    <style>
        .error-message {
            color: red; /* 실패 메시지를 빨간색으로 설정 */
            font-weight: bold; /* 글씨를 굵게 설정 */
        }
    </style>
</head>
<body>
    <h2>1. 로그인 폼</h2>
    <%
    String loginErr = request.getParameter("loginErr");
    if (loginErr != null) out.print("<span class='error-message'>로그인 실패</span>");
    %>
    <form action="./ResponseLogin.jsp" method="post">
        아이디 : <input type="text" name="user_id"><br />
        패스워드 : <input type="password" name="user_pwd"><br />
        <input type="submit" value="로그인" />
    </form>
    
    
    <h2>2. HTTP 응답 헤더 설정하기</h2>
    <form action="./ResponseHeader.jsp" method="get">
        날짜 형식 : <input type="text" name="add_date" value="2021-10-25 09:00" /><br />
        숫자 형식 : <input type="text" name="add_int" value="8282" /><br />
        문자 형식 : <input type="text" name="add_str" value="홍길동" /><br />
        <input type="submit" value="전송" />
    </form>
</body>
</html>
