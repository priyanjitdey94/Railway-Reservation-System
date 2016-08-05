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
<title>Booking details</title>
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
<%
String s=(String)session.getAttribute("admin");
if(s!=null)
{
%>

<table align="center" width=1000 cellpadding=10 id="bor">
<tr><td align="center"><font color="#309" size="6">BOOKING DETAILS</font></td></tr></table>
<table align="center" width=1000 cellpadding=10 border="1" id="bor">
     
	 <% 
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=null;
        con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","joyita");
        
    
        PreparedStatement ps=con.prepareStatement("select * from book where pnrno>=?");
        ps.setInt(1,1000);
        ResultSet rs=ps.executeQuery();
       
      %>
      
      <tr><td><b><font color="#000000">PNR</font></b></td><td width="58"><b><font color="#000000">User Name</font></b></td><td width="72"><b><font color="#000000">Train Id</font></b></td><td width="63"><b><font color="#000000">Source</font></b></td><td width="114"><b><font color="#000000">Destionation</font></b></td><td width="143"><b><font color="#000000">Date of Journey</font></b></td>
      <td width="53"><b><font color="#000000">Class</font></b></td>
      <td width="73"><b><font color="#000000">Persons</font></b></td><td width="54"><b><font color="#000000">Email</font></b></td><td width="48"><b><font color="#000000">Fare</font></b></td>
    
      <%while(rs.next())
    	  {
    	  %>
       <tr><td> <%=rs.getInt(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getString(4) %></td><td><%=rs.getString(5) %></td><td><%=rs.getString(6) %></td><td><%=rs.getString(7) %></td>
       <td><%=rs.getString(8)%></td><td><%=rs.getString(9)%></td><td><%=rs.getString(19)%></td><td><%=rs.getString(21)%></td></tr>
          <%} %>
         
          
      </table>
      <br><br>
      <table align="center">
      <form action="adminwork.jsp">
      <tr><td align="center"><input type="submit" value="Admin Console">
      </td></tr></table>
      <%  }else
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