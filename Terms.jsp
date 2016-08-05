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

<meta http-equiv="Cotent-Type" content="text/html; charset=ISO-8859-1">
<title>Terms & Conditions</title>

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
<table width="1000" border="1" cellspacing="5" cellpadding="10" align="center">
<tr>
   <td align="center" id="bord"><font size=7 color="#309"><b>Terms & Conditions</b></font></td>
</tr>

  <tr>
    <td><font color="#000000">This Web portal has been designed, developed and maintained by Centre For Railway Information Systems (CRIS), on behalf of Ministry of Railways, Government of India.
 
These terms and conditions shall be governed by and construed in accordance with the Indian Laws. Any dispute arising under these terms and conditions shall be subject to the exclusive jurisdiction of the courts of India.
 
The information posted on this Portal could include hypertext links or pointers to information created and maintained by non – Government/ Private organisations. Indian Railways is providing these links and pointers solely for the information and convenience. When a user selects a link to an outside portal, the user leaves the ‘ Indian Railway Portal’ and is subject to the privacy and security policies of the owners/sponsors of the outside Portal/website.
 
Ministry of Railways does not guarantee that linked websites comply with Indian Government Web Guidelines.
 
Access any part of the Portal;
Print off one copy of any or all of the pages for his/her own personal reference.
 
The user may not:
 
Copy (whether by printing off on to paper, storing on disk, downloading or in any other way), distribute (including distributing copies), broadcast, alter or tamper with in any way or otherwise use any material contained in the portal except as set out under “The user may”. This restrictions apply in relation to all or p[art of the material on Portal;
 
Remove any copyright, other intellectual property notices contained in the original material from any material copied or printed off from the portal;
 
Link to this Portal;
 
…..without the written consent
 
If the user wishes to provide a hypertext or other link to this portal, please contact the website administrator with details of:
 
The URL(s) of the web page(s) from which the user is proposing to link to this portal  
The URL(s) of the web page(s) on this Portal to which the user is proposing to link
 
…..and request will be considered. Indian Railways has the sole discretion to accept or reject such requests.
 
Changes In Terms & Conditions
 
Ministry of Railways may change the terms and conditions and disclaimer set out above from time to time. By browsing this Portal the user accepts that he/she is bound by the current terms and conditions and disclaimer and so the user checks these each time he/she revisits the Portal.</font></td>
 </tr>
</table>

<p><table align="center" width=500 id="topbor">
<tr><td><a href="home.jsp">Home</a></td> 
     <td align="center"><a href="Terms.jsp">Terms & Conditions</a></td>
     <td><a href="aboutus.jsp">About Us</a></td>
     <td><a href="admin.jsp">Admin Login</a></td></tr>
</table><br>
</body>
</html>