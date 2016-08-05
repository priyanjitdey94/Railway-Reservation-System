<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,javax.sql.*,javax.naming.*"%>
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
<title>Plan your journey</title>
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
   <td align="center" id="bord"><font size="5" color="#309"><b>Booking</b></font></td>
</tr>

</table>
<table align="center" width="1000" id="bor">

<%
String u=(String)session.getAttribute("user");
if(u!=null)
{%>
<form action="planmyjourney.jsp" ><tr>
<td width="261" height="57" align="right"><font size=4 color="#309"><b><u>Source Station:</u></b></font>
         </td>
         <td width="152">
           
           <select name="sels">
               <option value="HWH">HWH</option>
               <option value="SBC">SBC</option>
               <option value="NDLS">NDLS</option>
               <option value="GHY">GHY</option>
           </select>
      
      </td>
      
          <td width="263" align="right"><font size=4 color="#309"><b><u>Destination Station:</u></b></font></td>
     <td width="302">
       <select name="seld">
          <option value="HWH">HWH</option>
          <option value="SBC">SBC</option>
          <option value="NDLS">NDLS</option>
          <option value="CST-CSTM">CST-CSTM</option>
          <option value="GHY">GHY</option>
          
        </select>
     </td>
   <tr><td height="50" colspan="4" align="center"> <input type="submit" value="Get Details">
   </td></tr>
</table>
<%}else if(u==null)
{   
	   %>
	   <form action="home.jsp">
	   <table width=1000  cellpadding="10" align="center" id="bor">
	   <tr><td><font size=5 color="#309">You are not logged in or your session has expired. Please go back and log in to continue.
	   </font></td></tr>
	   <tr><td align="center"><input type="submit" value="back"></td></tr>
	   </table>
	   </form>   
	  <%}%>
	


</body>
</html>