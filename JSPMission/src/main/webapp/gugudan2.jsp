<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>구구단 출력</title></head>
<body>
<%
 for(int i = 2; i<10; i++){
	 out.println(i +"단<br>");
  	for(int j = 1; j<10; j++){
	  	out.println(i+"x"+ j + "="+ (i*j) + "<br>");
  		}
  	out.println();
 	}
%> 

</body>
</html>