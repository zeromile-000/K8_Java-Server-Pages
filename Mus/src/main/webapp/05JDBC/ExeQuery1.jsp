<%@ page  import="java.sql.ResultSet"%>
<%@ page  import="java.sql.Statement"%>
<%@ page  import="java.sql.Connection"%>
<%@ page  import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>
	<h2>회원 목록 조회 테스트(executeQuery() 사용)</h2>
	<%
	// DB에 연결
	JDBConnect jdbc = new JDBConnect();
	
	// 쿼리문 생성
	String sql = "SELECT b.num, b.title, m.name, b.postdate, b.visitcount from board b join member m where b.id = m.id;";
	Statement stmt = jdbc.con.createStatement();
	
	// 쿼리 수행
	ResultSet rs = stmt.executeQuery(sql);
	
	// 결과 확인(웹 페이지에 출력)
	while (rs.next()) {
		int num = rs.getInt("b.num");
		String title = rs.getString("b.title");
		String name = rs.getString("m.name");
		java.sql.Date postdate = rs.getDate("b.postdate");
		double visitcount = rs.getDouble("b.visitcount");
		
		out.write("<table>");
		out.write("<tr>");
	      out.print("<td>"+ num +"<td/>");
	      out.print("<td>"+ title+"<td/>");
	      out.print("<td>"+ name +"<td/>");
	      out.print("<td>"+ postdate +"<td/>");
	      out.println("<td>"+ visitcount +"<td/>");
	      out.write("</tr>");
	    out.write("</table>");
		
		
		//out.println(String.format("%s %s %s %s", num, title, name, regidate) + "<br/>");
	}
		
	// 연결 닫기
	jdbc.close();
	rs.close();
	%>
	
    

</body>
</html>