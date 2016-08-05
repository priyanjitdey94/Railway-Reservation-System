<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,javax.sql.*,javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
a:hover,a:active
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
<title>Payment Status</title>
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
<table align="center" width="1000" id="bor"><tr><td>

<%
String u=(String)session.getAttribute("user");
if(u!=null)
{%>
<%!int fare,bal,rembal,card; %>
<%
fare=Integer.parseInt(request.getParameter("fare"));
card=Integer.parseInt(request.getParameter("card"));
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=null;
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","joyita");
PreparedStatement ps=con.prepareStatement("select * from creditcard where credit_no=?");
ps.setInt(1,card);
ResultSet rs=ps.executeQuery();
while(rs.next())
{  bal=rs.getInt(2);
 rembal=bal-fare;
PreparedStatement p=con.prepareStatement("update creditcard set balance=? where credit_no=? ");
p.setInt(1,rembal);
p.setInt(2,card);
int i=p.executeUpdate();
  if(i>0)
  { out.println("   Payment Successful.Your ticket is made.     ");%><br></td></tr>
  
  <tr><td align="center">  <a href="home.jsp">Goto Home</a> </td></tr>
  <tr><td align="center">  <a href="pnr2.jsp">Print Ticket</a> </td></tr>
  <tr><td align="center">      <a href="Booking.jsp">Book another ticket</a></td></tr>
  <%}
  else{ out.println("Transaction Failed");%>
<br><tr><td align="center"><input type="submit" value="Back"></td></tr></table>
<%response.sendRedirect("confirmpay.jsp");}
}%>

<%}else
{%>
<form action="home.jsp">
<% session.setAttribute("remark","Session Expired");
 %><br>
 Sorry Session Expired.<br>
 <input type="submit" value="Login again"><%} %>
 </form>

</body>
</html>