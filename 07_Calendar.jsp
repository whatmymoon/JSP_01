<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>07_Calendar.jsp</title>
<style type="text/css">
	td{font-weight:bold; font-size:110%;}
	tr>td:first-child{color:red;}
	tr>td:last-child{color:blue;}
	a{text-decoration:none;}
</style>
</head>
<body>
	<%
		java.util.Calendar sDay = java.util.Calendar.getInstance(); // 출력될 달력의 1일자를 저장할 객체
		Calendar eDay = Calendar.getInstance(); // 출력될 달력의 말일자가 저장될 객체
		
		int sYear = sDay.get(Calendar.YEAR);
		int sMonth = sDay.get(Calendar.MONTH);
		
		if(request.getParameter("sYear") != null){ 
			sYear = Integer.parseInt(request.getParameter("sYear"));
		}
		if(request.getParameter("sMonth") != null){
			sMonth = Integer.parseInt(request.getParameter("sMonth"));
			if(sMonth == 12){ sMonth = 0; sYear++; }
			if(sMonth == -1){ sMonth = 11; sYear--; }
		}
		
		
		
		int lastDay = sDay.getActualMaximum(Calendar.DAY_OF_MONTH);
		sDay.set( sYear, sMonth, 1 );
		eDay.set( sYear, sMonth, lastDay );
		//out.print( sYear + "" + sMonth + "" + lastDay);
		int START_WEEK = sDay.get( Calendar.DAY_OF_WEEK );
	%>
	<!-- jsp 문법을 이용해서 토요일부터 시작하는 4월 달력을 표시해주세요 -->
	<table width="560" align="left" cellspacing="1" bgcolor="black">
		<tr bgcolor="white" height="50">
			<td colspan="7" align="center">
				<h2><a href="07_Calendar.jsp?sYear=<%=sYear%>&sMonth=<%=sMonth-1%>">이전달</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<%=sYear %>년 <%=(sMonth+1) %>월
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="07_Calendar.jsp?sYear=<%=sYear%>&sMonth=<%=sMonth+1%>">다음달</a></h2>
			</td>
		</tr>
		<tr bgcolor="white" height="50"><!-- 맨 윗줄 요일이 표시되는 tr -->
			<td align= "center" width="80">일</td>
			<td align= "center" width="80">월</td>
			<td align= "center" width="80">화</td>
			<td align= "center" width="80">수</td>
			<td align= "center" width="80">목</td>
			<td align= "center" width="80">금</td>
			<td align= "center" width="80">토</td>
		</tr>
		<tr bgcolor="white" height="50"><!-- 날짜가 표시되는 tr -->
			<%
				int i;
				for(i=1; i<START_WEEK; i++){ 
					out.print("<td>&nbsp;</td>");
				} // 1일자 전 빈칸들 (2023년 4월 1일은 토요일 -> 여섯칸 빈칸)
				
				for(int d=1; d<=lastDay; d++){ // 1일부터 30일까지 한칸(td태그)씩 표시
					out.print("<td>" + d + "</td>");
					if( i++ % 7 == 0 ){ // 7의 배수만큼 열이 채워지는 순간 줄바꿈 -> tr끝 - tr시작
						out.print("</tr><tr bgcolor=\"white\" height=\"50\">");
					}
				}
				if(i%7 != 0){
					for(int k=1; k <= (8-(i%7)); k++){ // 마지막 말일 표시 후 남는 칸에 빈칸으로 채우기
						out.print("<td>&nbsp;</td>");
					}
				}else{
					out.print("<td>&nbsp;</td>");
				}
			%>
		</tr>
	</table>
</body>
</html>