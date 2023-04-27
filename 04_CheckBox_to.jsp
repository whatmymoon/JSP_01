<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04_CheckBox_to.jsp</title>
</head>
<body>
<h2>전송된 주소</h2>
<h3>http://localhost:8090/WEB07_JSP_SERVLET/01/04_CheckBox_to.jsp?item=shoes&item=bag&item=cap&item=watch</h3>

<%
  String [] item = request.getParameterValues("item");
  if( item == null){ //item이 null 이라는건 체크박스가 하나도 체크가 안됬을때.
     %>     
     <h3> 선택한 항목이 없습니다</h3>
<% 
  }else{
%>
      <h3> 니가 선택한 항목이다</h3>
<%       
      for( String t : item){
%>         
     <h3><%=t%></h3>
<%         
    }
  }  
%>

</body>
</html>