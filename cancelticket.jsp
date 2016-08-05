<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="java.sql.*,javax.sql.*,javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cancel ticket</title>
</head>
<body>
<%
String u=(String)session.getAttribute("user");
if(u!=null)
{%>
<form action="bookinghistory.jsp">
<%
int i=Integer.parseInt(request.getParameter("r"));
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=null;
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","joyita");
PreparedStatement ps=con.prepareStatement("delete from book where pnrno=?");
//ps.setString(1,u);
ps.setInt(1,i);
int x=ps.executeUpdate();
if(x>0)
{
	out.println("Ticket Cancelled");%>
	<a href="home.jsp">Goto Home</a>
	<%}else{
		out.println("Cancellation failed.");%>
		<%}%><input type="submit" value="Back"></form>
	<%}else
{session.setAttribute("remark","Session expired.Please login again.");%>
<form action="login.jsp">
<% String a=(String)session.getAttribute("remark");
 out.println(a);%><br>
 <input type="submit" value="Login again" action="login.jsp">
 <%response.sendRedirect("login.jsp");
 }%>
</form>

</body>
</html>