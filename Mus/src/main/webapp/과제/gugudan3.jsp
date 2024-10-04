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
<title> 입력받은 구구단 출력</title></head>
<body>
	<div style="text-align:center">
<% String val = request.getParameter("val"); 
	int dan = 2;
	if(val != null){
	 	dan = Integer.parseInt(val);
	 	if(dan < 10){  
	 		out.print(dan + "단 입니다.");	
   	    } else {
   	    	
   	    }
	}

%>
</div>
<%      for(int i = 1; i <= 9; i++) { %>
		<div style="text-align: center;">
			<%= dan %> * <%= i %> = <%= dan * i %>
		</div>
		<%  } %>
</div>
</body>
</html>