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

function checkpass(a)
{
	var y=document.f1.pass.value;
	var x=a.value;
	if(y==x)
	document.getElementById("con").innerHTML="<b>Equal</b>";
	else
document.getElementById("con").innerHTML="<b>Not Equal</b>";
	
}

</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign Up</title>
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

<form name="f1" action="success.jsp">
<table align="center" width=1000 cellpadding=10 id="bor">
<tr>
  <td colspan=3 align="center"><br><font size=6 color="#309"><b> SIGN UP</b></font><br><br><br></td>
</tr>  
<tr>
  <td align="right" width=500><font size=5 color="#000000">First Name</font></td><td width=500><input type="text" name="fname" required></td>
</tr>
<tr>
   <td align="right" width=500><font size=5 color="#000000">Last Name</font></td><td width=500><input type="text" name="lname"></td>
</tr>

<tr>
    <td align="right" width=500><font size=5 color="#000000">E-mail</font></td><td width=500><input type="email" name="email" required></td>
</tr>
<tr>
    <td align="right" width=500><font size=5 color="#000000">Username</font></td><td width=500><input type="text" name="uname" required></td>
</tr>
<tr>
<td align="right" width=500><font size=5 color="#000000">Password</font></td><td width=500><input type="password" name="pass" required></td>
</tr>
 <tr>
 <td align="right" width=500><font size=5 color="#000000">Confirm Password</font></td><td width=500><input type="password" name="con" onkeyup="checkpass(this)" required><div id="con"></div></td>
 </tr>
 <tr>
 <td align="right" width=500><font size=5 color="#000000">Address</font></td><td width=500><textarea rows=4 name="add"></textarea required></td>
 </tr>
 <tr>
 <td align="right" width=500><font size=5 color="#000000">Phone Number</font></td><td width=500><input type="text" name="phno" required></td>
 </tr>
 <tr>
 <td align="right" width=500><font size=5 color="#000000">Date of Birth</font></td>
 <td><input type="date" width=100 name="dob" placeholder="dd/mm/yyyy" required></tr>
<tr>
<tr><td colspan=3 align="center"><input type="submit" value="Sign Up"></td>
</tr>
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