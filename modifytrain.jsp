<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
a:hover
{
    color:#000;
}
</style>
<script language="javascript">
function showClock()
{
	var  d=new Date() ;

	document.getElementById("clk").innerHTML=d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
	setTimeout("showClock()",1000);
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modify Train Time</title>
<link href="cs1.css" rel="stylesheet" type="text/css">
</head>
<body onLoad="showClock()">
<table align="center"  width=1000 height=50>
<tr>
<td align="center" valign="top" width=200><img src="new ilogo crop.jpg" height=124 width=123 ><br><div id="clk"></div></td>
<td width=1000 align="center" valign="top"><marquee><b><font size=3 color=#309>Now book your journey online!!</font></b></marquee><br>&nbsp;&nbsp;&nbsp;&nbsp;<b><i><font size=6 color="#309"><br><br>Welcome to Indian Railway Reservation</font></i></b></td>
<td><img src="63262-fairy-queen.jpg" height=150></td>
</tr>
</table>
<br>
<table align="center" width=1000 cellpadding=10 id="bor">
<%
String s=(String)session.getAttribute("admin");
if(s!=null)
{%>

<form action="trainmodified.jsp">
<tr><td colspan="2" align="center"><font color="#309" size="5">MODIFY TRAIN TIME</font></td></tr>
<tr><td align="right">
Enter the train ID</td><td> <input type="number" required name="tnamem"><br></td></tr>
<tr><td align="right">
Enter New Departure</td><td> <input type="text" required name="dtimem"><br></td></tr>
<tr><td align="right">
Enter New Arrival</td><td> <input type="text" required name="atimem"><br></td></tr>
<tr><td align="right">
Enter new travel time</td><td><input type="text" required name="ttimem"><br></td></tr>
<tr><td colspan="2" align="center">
<input type="submit" value="Modify"></td></tr>

</table>
<%}else
	{session.setAttribute("remark","Session expired.Please login again.");%>
 <form action="admin.jsp">
 <% String a=(String)session.getAttribute("remark");
  out.println(a);%><br>
  <input type="submit" action="admin.jsp">
  <%response.sendRedirect("admin.jsp"); %>
 </form>
<%
}%>
</body>
</html>