<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
table {
	border:1px solid;
	border-collapse: collapse
}
td, tr {
	border : 1px solid;
	padding : 4px 10px;
}
.title {
	text-align: center;
	background-color: lightgray;
}
</style>
<title>2단 ~ 9단 구구단 출력</title></head>
<body>
<div style="display:grid; grid-template-columns:repeat(8, 100px);">
<% for(int i = 2; i <=9; i++){ %>
	<div style="text-align:center">
			<%= i %>단
	</div>
<% } %>
<%   for (int j=1; j <=9; j++){ %>
<%      for(int i = 2; i <= 9; i++) { %>
		<div style="text-align: center;">
							<%=i %> * <%= j %> = <%= i*j %>
		</div>
		<%  } %>
<%  } %>
</div>
</body>
</html>