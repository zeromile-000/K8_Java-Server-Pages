<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>구구단 표</title></head>
<body>
<%
for(int i = 2; i<10; i++){
	for(int j = 1; j<10; j++){
	  out.println(i + " x " + j + " = "+ (i * j));
	}out.print("<br>");
}
	
%> 

</body>
</html>