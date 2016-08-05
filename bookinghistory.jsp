<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,javax.sql.*,javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String u=(String)session.getAttribute("user");
if(u!=null)
{
%>
<form action="histories.jsp">
Enter username: <input type="text" name="uname" required>
<input type="submit" value="Proceed">
</form>
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