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
<title>Modify Train Time</title>
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
<br>
<table align="center" width=1000 cellpadding=10 id="bor"><tr><td align="center">
<%
String s=(String)session.getAttribute("admin");
if(s!=null)
{%>

<%
int tnamem=Integer.parseInt(request.getParameter("tnamem"));
String dtimem=request.getParameter("dtimem");
String ttimem=request.getParameter("ttimem");
String atimem=request.getParameter("atimem");
int flag=0,i=0;
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=null;
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","joyita");
PreparedStatement ps=con.prepareStatement("select * from t_info");
ResultSet rs=ps.executeQuery();
while(rs.next())
{
	if(rs.getInt(1)==tnamem)
	{
		flag=1;
		PreparedStatement p=con.prepareStatement("Update t_info set d_time=?,a_time=?,travel=? where train_id=?");
		p.setString(1,dtimem);
		p.setString(2,atimem);
		p.setString(3,ttimem);
		p.setInt(4,tnamem);
		i=p.executeUpdate();
	}
}
if(flag==0)
{
	out.println("No such train found. Enter data properly.Click Back to go back.");%>
	</td></tr><tr><td align="center"><form action="modifytrain.jsp"><br><input type="submit" value="Back" name="Name"><br></form></td></tr>
<%}else
{
	if(i>0)
	{
		out.println("Data Updated.Click on Continue to go to Admin Console.");%>
		<tr><td align="center"><form action="adminwork.jsp">	<br><input type="submit" value="Back" name="Name" disabled action="modifytrain.jsp">  
			  <input type="submit" value="Continue" action="adminwork.jsp"><br></form></td></tr>
	<%}
}
%>
</table>
<% }else
{session.setAttribute("remark","Session expired.Please login again.");%>
<form action="admin.jsp">
<table align="center" width="1000" id="bor"><tr><td align="center">
<% String a=(String)session.getAttribute("remark");
 out.println(a);%><br></td></tr>
 <tr><td align="center"><input type="submit" action="admin.jsp"></td></tr></table>
 <%response.sendRedirect("admin.jsp"); %>
</form>
<%
}%>
</body>
</html>