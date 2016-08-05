<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="javax.sql.*,java.sql.*,javax.naming.*"%>
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
<title>Train Details</title>
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
<form action="adminwork.jsp">
	<table align="center" width="1000" id="bor">
     <td align="center"><font color="#309" size="6">
     <b>Train Details</b></font></td></table>
	 <% 
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=null;
        con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","joyita");
        
    
        PreparedStatement ps=con.prepareStatement("select * from t_info");
        
        ResultSet rs=ps.executeQuery();
       
      %>
      <table border="1" align="center" width="1000" id="bor">
      <tr><td><b><font color="#000000">Train ID</font></b></td><td><b><font color="#000000">Train Name</font></b></td><td><b><font color="#000000">Source</font></b></td><td><b><font color="#000000">Destination</font></b></td><td><b><font color="#000000">Departure</font></b></td><td><b><font color="#000000">Arrival</font></b></td>
      <td><b><font color="#000000">Journey Time</font></b></td>
      <td><b><font color="#000000">AC 1st</font></b></td><td><b><font color="#000000">AC 2nd</font></b></td><td><b><font color="#000000">AC 3rd</font></b></td><td><b><font color="#000000">Sleeper</font></b></td></tr>
    
      <%while(rs.next())
    	  {
    	  %>
       <tr><td><%=rs.getInt(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getString(3) %></td><td><%=rs.getString(4) %></td><td><%=rs.getString(5) %></td><td><%=rs.getString(6) %></td>
       <td><%=rs.getString(7)%></td><td><%=rs.getString(8)%></td><td><%=rs.getString(9)%></td><td><%=rs.getString(10)%></td><td><%=rs.getString(11)%></td></tr>
          <%} %>
      </table>
      <br><br>
      <table align="center" width="1000"><td align="center">
      <input type="submit" value="Admin Console" action="adminwork.jsp">
      </td></table>
</form>

<%  }else
{session.setAttribute("remark","Session expired.Please login again.");%>

<form action="admin.jsp">
<% String a=(String)session.getAttribute("remark");
 out.println(a);%><br>
 
 
 <input type="submit" value="Login again" action="admin.jsp">
 <%response.sendRedirect("admin.jsp"); %>
</form>
<%
}%>
</body>
</html>