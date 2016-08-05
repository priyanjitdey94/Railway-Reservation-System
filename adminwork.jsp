<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,javax.sql.*,javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><style>
a:hover
{
	color: #000000;
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

<meta http-equiv="Cotent-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Admin</title>
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

<%
String s=(String)session.getAttribute("admin");
if(s!=null)
{
%>

<table align="center" width=1000 id="bor">
<tr><td colspan="2" align="center"><font color="#309" size=8><b>Welcome Admin</b></font></td></tr>
<br>
<br>
<tr>
<td width="494" id="bor" align="center"><br><form action="addtrain.jsp">
  <input type="submit" value="Add train">
</form><br></td>
<td width="492" id="bor" align="center"><br>
<form action="modifytrain.jsp">
  <input type="submit" value="Modify train">
</form><br></td></tr>
<tr><td id="bor" align="center"><br>
<form action="deletetrain.jsp">
<input type="submit" value="Delete train">
</form><br></td>
<td id="bor" align="center"><br>
<form action="bookingdetails.jsp">
<input type="submit" value="Booking Details">
</form><br></td></tr>
<tr><td id="bor" align="center"><br>
<form action="traindetails.jsp">
<input type="submit" value="Train details">
</form><br></td>
<td id="bor" align="center"><br>
<form action="userdetails.jsp">
<input type="submit" value="User Details">
</form><br></td>
</tr>
<tr>
<td colspan="2" align="center" id="bor">
<br>
<form action="adminlogout.jsp">
<input type="submit" value="Admin Logout">
</form><br></td>
</tr>
</table>
<%
}else
	{ session.setAttribute("remark","Session Expired.Login to continue.");%>
<form action="admin.jsp">
<% String a=(String)session.getAttribute("remark");
 out.println(a);
 %><br>
 <input type="submit" value="Login Again">
 <% response.sendRedirect("admin.jsp"); %>
 </form>	
<%} %>

</body>
</html>