<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<title>PNR Status</title>

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
<table width=1000 align="center" >
<tr>
     <td width=350 valign="top">
      <%
        String u=(String)session.getAttribute("user");
        
        if(u==null)
        {%>
     <form action="login.jsp">
        <table width=300 height=300 id="bor">
              <tr><td height=35 id="menu" align="center" colspan=2><font color="#FFFFCC" size=6 ><b>LOGIN</b></font></td></tr>
              <tr><td align="center"><font size=4><b>Username</b></font></td>
              <td><input type="text" placeholder="username" name="inuser" required ></td></tr>
              <tr><td valign="top" align="center"><font size=4><b>Password</b></font></td><td valign="top"><input type="password" name="inpass" placeholder="password" required>
              <br>
              <%String r=(String)session.getAttribute("remark"); if(r!=null)out.println("<font color=red>"+r+"</font>");%></td></tr>
              <tr><td colspan=2 height=100 align="center" valign="top" ><input type="submit" value="LOGIN"><br><br><a href="signup.jsp">New User? Sign Up</a><br></td></tr>
</table>
</form>
<%}else
          {%>
          <form action="logout.jsp">
          <table width=300 height=300 id="bor">
              <tr>
                 <td height=35 id="menu" align="center" colspan=2><font color="#FFFFCC" size=6 ><b>WELCOME</b></font>
                 </td>
               </tr>
              <tr>
              <td height="80">
              <font size=5><b>Welcome</b></font><br>
              <font size=5 color="#309"><%=u %></font></td>
              </tr>
              
              <tr>
                 <td colspan=2 height=100 align="center" valign="top" ><input type="submit" value="LOGOUT"><br>                 </td>
               </tr>
              
          </table>
          </form>
          <%} %>
</td>
    <form action="ticket2.jsp">  
     <td align="right" valign="top"><br><br><font size="5"  color="#309"><b>Enter PNR Number</b></font><br><br>
     <input type="submit" value="View Ticket"></td>
     
<td align="left" valign="top"><br><br>&nbsp;<input type="text" name="pnrno"></td>

</form>
</tr>     
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>

</body>
</html>