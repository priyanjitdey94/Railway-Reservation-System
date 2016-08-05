<%@ page language="java" contentType="application/msword;charset=ISO-8859-1"
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

<meta http-equiv="Cotent-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
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
<table align="center" width="1000" id="menu1">
<tr><td align="center" width="250"><c><a href="traininfo.jsp"><font color="#FFFFCC" size=5><b>Train Information</b></font></a></c></td>
     <td align="center" width="250"><a href="Booking.jsp"><font color="#FFFFCC" size=5><b>Booking</b></font></a></td>
     <td align="center" width="250"><a href="pnr.jsp"><font color="#FFFFCC" size=5><b>PNR status</b></font></a></td>
     <td align="center" width="250"><a href="cancel.jsp"><font color="#FFFFCC" size=5><b>Cancel Ticket</b></font></a></td>
</tr>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=null;
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","joyita");
%>
</table>
<table align="center" width=1000 id="bor" cellpadding="10" cellspacing="5">
<tr><td>&nbsp;</td></tr>
<%!String d_time,a_time;%>

<%
int p=Integer.parseInt((String)session.getAttribute("pnrno"));
PreparedStatement ps1=con.prepareStatement("select d_time from book b,schedule s where b.source=s.sstation_name and b.tid=s.train_id");
ResultSet rs1=ps1.executeQuery();
if(rs1.next())
{
	  d_time=rs1.getString(1);
}

PreparedStatement ps2=con.prepareStatement("select a_time from book b,schedule s where b.destination=s.dstation_name and b.tid=s.train_id");
ResultSet rs2=ps2.executeQuery();
if(rs2.next())
{
	  a_time=rs2.getString(1);
}
PreparedStatement ps=con.prepareStatement("select b.pnrno,b.tid,t.train_name,b.source,b.destination,b.dod,b.class,b.name1,b.age1,b.gender1,b.name2,b.age2,b.gender2,b.name3,b.age3,b.gender3,b.fare from book b,t_info t,schedule s where b.tid=t.train_id and  pnrno=?");
ps.setInt(1,p);

ResultSet rs=ps.executeQuery();
if(rs.next())
{
%>
<tr><td>
<table align="center" width=750  id="tab" cellpadding="5">
<tr>
<td rowspan="2" width=70 ><img src="new ilogo crop.jpg" width=90 height=80></td>
<td align="center" rowspan="2" colspan="2">
<font size=6 color="#309"><b>TICKET</b></font></td>
<td>
<font size=3 color="#309"><b>PNR NO.:</b></font><%=rs.getInt(1)%>
</td>
</tr>
<tr><td><font size=3 color="#309"><b>Class: </b></font><%=rs.getString(7)%></td></tr>
<tr><td><font size=3 color="#309"><b>Train Id: </b></font><%=rs.getInt(2)%></td>
<td><font size=3 color="#309"><b>Train Name: </b></font><%=rs.getString(3)%></td><td>&nbsp;</td><td><font size=3 color="#309"><b>Date of Departure: </b></font><%=rs.getString(6)%></td></tr>
<tr><td><font size=3 color="#309"><b>Source:</b></font><%=rs.getString(4)%></td>
<td><font size=3 color="#309"><b>Destination: </b></font><%=rs.getString(5)%></td>
<td><font size=3 color="#309"><b>Departure Time: </b></font><%=d_time%></td>
<td><font size=3 color="#309"><b>Arrival Time: </b></font><%=a_time%></td>
</tr>
<tr><td><font size=5 color="#309"><b><u>Passenger Details: </u></b></font></td></tr>
<tr><td><%=rs.getString(8)%></td><td><%=rs.getString(9)%>&nbsp;<%=rs.getString(10)%></td></tr>
<tr><td><%=rs.getString(11)%></td><td><%=rs.getString(12)%>&nbsp;<%=rs.getString(13)%></td></tr>
<tr><td><%=rs.getString(14)%></td><td><%=rs.getString(15)%>&nbsp;<%=rs.getString(16)%></td>
<td>&nbsp;</td><td><font size=3 color="#309"><b>Fare</b></font><%=rs.getString(17)%></td></tr>
<tr><td align="center" colspan=4><font size=5 color="#309">Have a Safe Journey</font></td></tr>

</table>
</td></tr>
<%}%>

<tr><td>&nbsp;</td><td align="right">&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
</table>
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