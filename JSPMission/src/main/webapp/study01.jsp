<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
// 나이 계산 메서드
    public int calculateAge(int year, int nowyear) {
        return nowyear - year +1 ;   // 나이 계산 로직 추가
    }
    
    // 띠 계산 메서드
    public String anotherMethod(int year) {
    	 switch((year-4) % 12){
    		case 0 :
    			return "쥐"; 
    		case 1 :
    			return "소"; 
    		case 2 :
    			return "호랑이";
    		case 3 :
    			return "토끼"; 
    		case 4 :
    			return "용";
    		case 5 :
    			return "뱀";
    		case 6 :
    			return "말";
    		case 7 :
    			return "양";
    		case 8 :
    			return "원숭이"; 
    		case 9 :
    			return "닭";
    		case 10 :
    			return "개";
    		case 11 :
    			return "돼지";
    		default:
    			return "기본값";
    	}
    }
    
    String name = "김준영";
    int nowyear = 2024;
    int age = 0;
    String a = "";
    int year = 2000;
    
%>
<html>
<head>
<meta charset="UTF-8">
<title>Year</title>
</head>
<body>
	<%
	try{
		year = Integer.parseInt(request.getParameter("year")); // 스크립틀릿 (자바 코드)
		age = calculateAge(year, nowyear);
		a = anotherMethod(year);
	}catch(Exception e){
		out.println("year이 Null입니다.");
	}

	
	%>

	<p>
		<%=name%>님의 태어난 연도는 <%=year%>년이고, 
		올해 나이는 <%=age%>살 <%=a%>띠 입니다.
	</p>

</body>
</html>