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
<title>About Us</title>
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
<table width=1000 align="center" id="bor" cellpadding="10">
<tr>
   <td colspan="2" align="center" id="bord"><font size=7 color="#309"><b>About Us</b></font></td>
</tr>
<tr>
   <td colspan="2" align="justified"><font color="#000000">
    The first railway on Indian sub-continent ran over a stretch of 21 miles from Bombay to Thane. The idea of a railway to connect Bombay with Thane, Kalyan and with the Thal and Bhore Ghats inclines first occurred to Mr. George Clark, the Chief Engineer of the Bombay Government, during a visit to Bhandup in 1843.

The formal inauguration ceremony was performed on 16th April 1853, when 14 railway carriages carrying about 400 guests left Bori Bunder at 3.30 pm "amidst the loud applause of a vast multitude and to the salute of 21 guns." The first passenger train steamed out of Howrah station destined for Hooghly, a distance of 24 miles, on 15th August, 1854. Thus the first section of the East Indian Railway was opened to public traffic, inaugurating the beginning of railway transport on the Eastern side of the subcontinent.
 

In south the first line was opened on Ist July, 1856 by the Madras Railway Company. It ran between Vyasarpadi Jeeva Nilayam (Veyasarpandy) and Walajah Road (Arcot), a distance of 63 miles. In the North a length of 119 miles of line was laid from Allahabad to Kanpur on 3rd March 1859. The first section from Hathras Road to Mathura Cantonment was opened to traffic on 19th October, 1875.

These were the small’s beginnings which is due course developed into a network of railway lines all over the country. By 1880 the Indian Railway system had a route mileage of about 9000 miles. INDIAN RAILWAYS, the premier transport organization of the country is the largest rail network in Asia and the world’s second largest under one management.</font></td>
</tr>
<tr><td height="106" colspan="2"><font size=5 color="#309"><b>Created by:-</b></font></td>
</tr>
<tr>
<td width="480"><font color="#000000"><b>Soumik Sarkar<br>B.P. Poddar Institute of Technology</b></font></td>
<td width="470"><font color="#000000"><b>Priyanjit Dey<br>
  Institute of Engineering & Management</b></font></td>

</tr>
<tr>
  <td><font color="#000000"><b>Joyita Bhowal<br>Future Institute of Engineering and Management</b></font></td>
  <td><font color="#000000"><b>Hillol Dhar<br>
    Future Institute of Engineering and Management</b></font></td>
</tr>

</table>
<p>&nbsp; </p>

<p><table align="center" width=500 id="topbor">
<tr><td><a href="home.jsp">Home</a></td>  
     <td align="center"><a href="Terms.jsp">Terms & Conditions</a></td>
     <td><a href="aboutus.jsp">About Us</a></td>
     <td><a href="admin.jsp">Admin Login</a></td></tr>
</table>
</body>
</html>