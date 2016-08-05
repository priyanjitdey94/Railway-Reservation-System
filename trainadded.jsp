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
<title>Train Added</title>
<link href="cs1.css" rel="stylesheet" type="text/css">
</head>
<body onLoad="showClock()">

<table align="center"  width=1000 height=50>
<tr><td align="center">
<tr>
<td align="center" valign="top" width=200><img src="new ilogo crop.jpg" height=124 width=123 ><br><div id="clk"></div></td>
<td width=1000 align="center" valign="top"><marquee><b><font size=3 color=#309>Now book your journey online!!</font></b></marquee><br>&nbsp;&nbsp;&nbsp;&nbsp;<b><i><font size=6 color="#309"><br><br>Welcome to Indian Railway Reservation</font></i></b></td>
<td><img src="63262-fairy-queen.jpg" height=150></td>
</tr>
</table>
<br>
<table align="center" width=1000 cellpadding=10 id="bor">
<%
String s=(String)session.getAttribute("admin");
if(s!=null)
{%>
<form action="addtrain.jsp">
<tr><td align="center">
<% int id=Integer.parseInt(request.getParameter("id"));
String tname=request.getParameter("tname");
String source=request.getParameter("scode");
String dest=request.getParameter("dcode");
String dtime=request.getParameter("dtime");
String atime=request.getParameter("atime");
String ttime=request.getParameter("ttime");
int acone=Integer.parseInt(request.getParameter("acone"));
int actwo=Integer.parseInt(request.getParameter("actwo"));
int acthree=Integer.parseInt(request.getParameter("acthree"));
int sleeper=Integer.parseInt(request.getParameter("sleeper"));
int flag=0;

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=null;
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","joyita");
PreparedStatement ps=con.prepareStatement("select * from t_info");
ResultSet rs=ps.executeQuery();
while(rs.next())
{
	 
	 
	 if (rs.getInt(1)==id)
	 {
		 flag=1;
		 break;
	 }
}
if (flag==1)
{     
	   out.println("<font size=5>Train Already Exists!Go back and enter correct information</font>"); 
}
else
  {
  
   PreparedStatement ps1=con.prepareStatement("insert into t_info values(?,?,?,?,?,?,?,?,?,?,?)");
    ps1.setInt(1,id);
	   ps1.setString(2,tname);
	   ps1.setString(3,source);
	   ps1.setString(4,dest);
	   ps1.setString(5,dtime);
	   ps1.setString(6,atime);
	   ps1.setString(7,ttime);
	   ps1.setInt(8,acone);
	   ps1.setInt(9,actwo);
	   ps1.setInt(10,acthree);
	   ps1.setInt(11,sleeper);
	   int i=ps1.executeUpdate();
	   if (i>0)
	       out.println("<b><font size=5>Train added.Succesful</font></b><br>Click on Continue to go to admin console page");
		else
		    out.println("not Succesful!!");	
  }
if(flag==1)
{%>
</td></tr><tr><td align="center">	<input type="submit" value="Back" name="back" >   </td></tr>
<% }else
{%>
<tr><td align="center">	  <input type="submit" value="Back" name="back" disabled><br></td></tr>
<tr><td align="center">	  <a href="adminwork.jsp">Continue</a></td></tr>
<%}
%>

</table>
 <% }else
{session.setAttribute("remark","Session expired.Please login again.");%>
<form action="admin.jsp"><table align="center" width="1000" id="bor"><tr><td align="center">
<% String a=(String)session.getAttribute("remark");
 out.println(a);%><br></td></tr>
 <tr><td align="center"><input type="submit" action="admin.jsp"></td></tr></table>
 <%response.sendRedirect("admin.jsp"); %>
</form>
<%
}%>
</body>
</html>