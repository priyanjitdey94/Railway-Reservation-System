<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="javax.sql.*,java.sql.*,javax.naming.*" %>
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
<title>Signing</title>
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
<form action="signup.jsp">
<table align="center" width=1000 id="menu1">
<tr><td align="center" width="250" valign="middle"><a href="traininfo.jsp"><font color="#FFFFCC" size=5><b>Train Information</b></font></a></td>
     <td align="center" width="250"><a href="Booking.jsp"><font color="#FFFFCC" size=5><b>Booking</b></font></a></td>
     <td align="center" width="250"><a href="pnr.jsp"><font color="#FFFFCC" size=5><b>PNR status</b></font></a></td>
  <td align="center" width="250"><a href="cancel.jsp"><font color="#FFFFCC" size=5><b>Cancel Ticket</b></font></a></td>
</tr>     
</table>
<br>
<table align="center" width=1000 cellpadding=10 id="bor" >
<tr><td>
 <% String fname=request.getParameter("fname");
   String lname=request.getParameter("lname");
   String email=request.getParameter("email");
   String uname=request.getParameter("uname");
   String pass=request.getParameter("pass");
   String add=request.getParameter("add");
   long phno=Long.parseLong(request.getParameter("phno"));
   String dob=request.getParameter("dob");
   int flag=0;
   
   Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection con=null;
   con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","joyita");
   PreparedStatement ps=con.prepareStatement("select * from signup");
   ResultSet rs=ps.executeQuery();
   while(rs.next())
   {
	 
	 
	 if (uname.compareToIgnoreCase(rs.getString(4))==0)
	 {
		 flag=1;
		 break;
	 }
   }
   if (flag==1)
   {     
	   out.println("<font size=5>Username Already Exists!Go back and choose another username</font>"); 
   }
   else
     {
     
      PreparedStatement ps1=con.prepareStatement("insert into signup values(?,?,?,?,?,?,?,?)");
       ps1.setString(1,fname);
	   ps1.setString(2,lname);
	   ps1.setString(3,email);
	   ps1.setString(4,uname);
	   ps1.setString(5,pass);
	   ps1.setString(6,add);
	   ps1.setLong(7,phno);
	   ps1.setString(8,dob);
	   int i=ps1.executeUpdate();
	   if (i>0)
	       out.println("<b><font size=5>SignUp Succesful</font></b><br>Click on Continue to go to home page");
		else
		    out.println("Signup not Succesful!!");	
     }
 %>
</td></tr>

 <p>&nbsp;</p>

<% if(flag==1)
{%>
<tr><td colspan=3 align="center"><input type="submit" value="Back" name="back" >
</td></tr>
<%}
else
{%>

<tr><td colspan=3 align="center"><input type="submit" value="Back" name="back" disabled>
</td></tr>
<%}%>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<tr><td width=50 align="center"><a href="home.jsp" ><font size="4" color="#309"><b><u>Continue</u></b></font></a></td></tr>
</table>


<p>&nbsp;</p>
<p>&nbsp;</p>
<table align="center" width=500 id="topbor">
<tr><td><a href="home.jsp">Home</a></td>
     <td align="center"><a href="Terms.jsp">Terms & Conditions</a></td>
     <td><a href="aboutus.jsp">About Us</a></td>
     <td><a href="admin.jsp">Admin Login</a></td></tr>
     
</table>
</body>
</html>