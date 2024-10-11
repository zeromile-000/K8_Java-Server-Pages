<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 입력받은 구구단 출력</title></head>
</head>
<body>
<% 
String val = request.getParameter("val");
	int dan = 3;
	if(val != null){
		dan = Integer.parseInt(val);
	 	if(dan < 10){  
	 		out.print(dan + "단 입니다.");	
   	    } else {
   	    	out.print("잘못된 입력 입니다.");
   	    	return ;
   	    }
	}
%>
</body>
</html>