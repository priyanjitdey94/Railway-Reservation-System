<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,javax.sql.*,javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
a:hover
{
	color: #000000;
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
<title>Login Informnation</title>
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

<form name="a1" action="adminwork.jsp">
<%
int password=Integer.parseInt(request.getParameter("adminpass"));
String f="Admin";
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=null;
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","joyita");
request.getSession(true);
PreparedStatement ps=con.prepareStatement("select * from adminpass where password=?");
ps.setInt(1,password);
ResultSet rs=ps.executeQuery();

if(rs.next())
{
	session.setAttribute("admin",f);
	session.setMaxInactiveInterval(120);
}
else
{
	session.setAttribute("remark", "Invalid password ");
	response.sendRedirect("admin.jsp");
	
}
%>
<table align="center" width="1000" id="bor">
<tr><td align="center"><font color="#309" size="6"> Welcome
</font><font size="6" color="#309"> <%=session.getAttribute("admin")%></font><br></td></tr>
<tr><td align="center">
<input type="submit" value="Continue"><br></td></tr>
</table>

</body>
</html>