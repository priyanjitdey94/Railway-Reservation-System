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
<title>User Details</title>
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
     <tr>
       <td align="center"><b><font color="#309" size="6">User Details</font></b></td></tr></table>
	 <% 
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=null;
        con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","joyita");
        
    
        PreparedStatement ps=con.prepareStatement("select * from signup");
       
        ResultSet rs=ps.executeQuery();
       
      %>
      <table border="1" align="center" width="1000" id="bor">
      <tr><td><b><font color="#000000">First Name</font></b></td><td><b><font color="#000000">Last Name</font></b></td><td><b><font color="#000000">Email</font></b></td><td><b><font color="#000000">Username</font></b></td><td><b><font color="#000000">Password</font></b></td><td><b><font color="#000000">Address</font></b></td><td>
      <b><font color="#000000">Contact No.</font></b></td><td><b><font color="#000000">DOB</font></b></td></tr>
    
      <%while(rs.next())
    	  {
    	  %>
       <tr><td> <%=rs.getString(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getString(3) %></td><td><%=rs.getString(4) %></td><td><%=rs.getString(5) %></td><td><%=rs.getString(6) %></td>
       <td><%=rs.getLong(7)%></td><td><%=rs.getString(8)%></td></tr>
          <%} %>
      </table>
      <br><br>
      <table align="center">
      <td align="center">
      <input type="submit" value="Admin Console" action="adminwork.jsp">
      </td></table>
</form>
<% }else
{session.setAttribute("remark","Session expired.Please login again.");%>
<form action="admin.jsp">
<% String a=(String)session.getAttribute("remark");
 out.println(a);%><br>
 <input type="submit" action="admin.jsp">
 <%response.sendRedirect("admin.jsp"); %>
</form>
<%
}%>

</body>
</html>