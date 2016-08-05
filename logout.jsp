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
<title>Logging Out</title>
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
<table align="center" width=1000 id="menu1">
<tr><td align="center" width="250"><a href="traininfo.jsp"><font color="#FFFFCC" size=5><b>Train Information</b></font></a></td>
    <td align="center" width="250"><a href="Booking.jsp"><font color="#FFFFCC" size=5><b>Booking</b></font></a></td>
     <td align="center" width="250"><a href="pnr.jsp"><font color="#FFFFCC" size=5><b>PNR status</b></font></a></td>
    <td align="center" width="250"><a href="cancel.jsp"><font color="#FFFFCC" size=5><b>Cancel Ticket</b></font></a></td>
</tr>     
</table>
<br>

<form name="f1" >
<table align="center" width=1000 cellpadding=10 id="bor">
<tr>
  <td colspan=3 align="center"><%session.invalidate();
  out.println("<font size=6><b>Succesfully logged out</b></font>");
  %></td>

</tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
</table>
</form>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table align="center" width=500 id="topbor">
<tr><td><a href="home.jsp">Home</a></td>
   <td align="center"><a href="Terms.jsp">Terms & Conditions</a></td>
     <td><a href="aboutus.jsp">About Us</a></td>
     <td><a href="admin.jsp">Admin Login</a></td></tr>
</table>

</body>
</html>