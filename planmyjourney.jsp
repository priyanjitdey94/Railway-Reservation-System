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
<tr>
   <td align="center" width="250"><a href="traininfo.jsp"><font color="#FFFFCC" size=5><b>Train Information</b></font></a></td>
     <td align="center" width="250"><a href="Booking.jsp"><font color="#FFFFCC" size=5><b>Booking</b></font></a></td>
    <td align="center" width="250"><a href="pnr.jsp"><font color="#FFFFCC" size=5><b>PNR status</b></font></a></td>
 <td align="center" width="250"><a href="cancel.jsp"><font color="#FFFFCC" size=5><b>Cancel Ticket</b></font></a></td>
</tr>     
</table>
<%
String u=(String)session.getAttribute("user");
if(u!=null)
{%>
<form action="bookticket.jsp">
<table align="center" width="1000" id="bor">
     <tr>
       <td align="center"><b><font color="#309" size="6">Train Details</font></b></td></tr></table>

<%
String sst=request.getParameter("sels");
String dst=request.getParameter("seld");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=null;
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","joyita");
PreparedStatement ps=con.prepareStatement("select * from t_info where source_code=? and destination_code=?");
ps.setString(1,sst);
ps.setString(2,dst);
ResultSet rs=ps.executeQuery();%>
<table border="1" align="center" width="1000" id="bor">
 <tr> <td align="right">Source Selected:</td><td><input type="text" value="<%=sst %>" name="s" readonly><br></td></tr>
<tr><td align="right">
Destination Selected:</td><td><input type="text" value="<%=dst %>" name="d" readonly>  <br></td></tr></table>
<table border="1" align="center" width="1000" id="bor">
      <tr><td><b><font color="#000000">Train ID</font></b></td><td><b><font color="#000000">Train Name</font></b></td><td><b><font color="#000000">Source</font></b></td><td><b><font color="#000000">Destination</font></b></td><td><b><font color="#000000">Departure</font></b></td><td><b><font color="#000000">Arrival</font></b></td><td><b><font color="#000000">Journey Time</font></b></td><td><b><font color="#000000">AC 1st</font></b></td><td><b><font color="#000000">AC 2nd</font></b></td><td><b><font color="#000000">AC 3rd</font></b></td><td><b><font color="#000000">Sleeper</font></b></td></tr>

<% while(rs.next())
{%>
<tr><td><input type="radio" name="r" value="<%=rs.getInt(1)%>"><%=rs.getInt(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getString(3) %></td><td><%=rs.getString(4) %></td><td><%=rs.getString(5) %></td><td><%=rs.getString(6) %></td>
       <td><%=rs.getString(7)%></td><td><%=rs.getString(8)%></td><td><%=rs.getString(9)%></td><td><%=rs.getString(10)%></td><td><%=rs.getString(11)%></td></tr>
          <% } %>
      </table>
      <br><br>
      <table align="center" width="1000"><tr><td align="center">
      <input type="submit" value="Book Ticket" action="bookticket.jsp"></td></tr></table>
    </form>
<%}else
{%>
<form action="home.jsp">
<% session.setAttribute("remark","Session Expired");
 %><br>
 Sorry Session Expired.<br>
 <input type="submit" value="Login again">
 </form>

	
	<%} %>



	

</body>
</html>