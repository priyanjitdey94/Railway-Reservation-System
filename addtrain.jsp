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
<title>Add Train Info</title>
<link href="cs1.css" rel="stylesheet" type="text/css">
</head>
<body onLoad="showClock()">
<% String s=(String)session.getAttribute("admin");
if(s!=null)
{%>
<form action="trainadded.jsp">
<table align="center"  width=1000 height=50>
<tr>
<td align="center" valign="top" width=200><img src="new ilogo crop.jpg" height=124 width=123 ><br><div id="clk"></div></td>
<td width=1000 align="center" valign="top"><marquee><b><font size=3 color=#309>Now book your journey online!!</font></b></marquee><br>&nbsp;&nbsp;&nbsp;&nbsp;<b><i><font size=6 color="#309"><br><br>Welcome to Indian Railway Reservation</font></i></b></td>
<td><img src="63262-fairy-queen.jpg" height=150></td>
</tr>
</table>
<br>
<table align="center" width=1000 cellpadding=10 id="bor">


<tr><td colspan="2" align="center"><font size="6" color="#309">ADD TRAIN INFORMATION</font></td></tr>
<tr>
<td width="459" align="right">
Train Id </td><td width="491"><input type="text" name="id" required><br></td></tr>
<tr>
<td align="right">Train Name</td><td> <input type="text" name="tname" required><br></td></tr>
<tr>
<td align="right">Source Code</td><td> <input type="text" name="scode" required><br></td></tr>
<tr>
<td align="right">Destination code</td><td> <input type="text" name="dcode" required><br></td></tr>
<tr>
<td align="right">Departure Time</td><td> <input type="text" name="dtime" required><br></td></tr>
<tr>
<td align="right">Arrival Time</td><td><input type="text" name="atime" required><br></td></tr>
<tr>
<td align="right">Time of Journey</td><td> <input type="text" name="ttime" required><br></td></tr>
<tr>
<td align="right">Cost of AC 1</td><td> <input type="text" name="acone" required><br></td></tr>
<tr>
<td align="right">Cost of AC 2</td><td> <input type="text" name="actwo" required><br></td></tr>
<tr>
<td align="right">
Cost of AC 3</td><td> <input type="text" name="acthree" required><br></td></tr>
<tr>
<td align="right">Cost of Sleeper</td><td> <input type="text" name="sleeper" required><br></td></tr>
<tr><td colspan="2" align="center">
<input type="submit" value="Record"> </td></tr>
</table>
</form>


<%}else
	{ %><center><%session.setAttribute("remark","Session expired.Please login again.");%>
	<form action="admin.jsp">
	<% String a=(String)session.getAttribute("remark");
	out.println(a);%>
	
	<input type="submit" value="Login Again" >
	<%response.sendRedirect("admin.jsp"); %>
	</form></center>
	<%} %>

</body>
</html>

