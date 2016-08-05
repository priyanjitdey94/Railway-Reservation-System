<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,javax.sql.*,javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
a:hover,a:active
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
<script type="text/javascript">
 function datevalid(){
        var arrivalDate = document.getElementById("arrivalDate");
            var value = new Date(arrivalDate.value);
			var valnow=new Date();
            if (value < valnow) {
                alert("Arrival date must be after now!");
				return false;
            } 
	}
    </script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Ticket</title>
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
String u=(String)session.getAttribute("user");
if(u!=null)
{%>
<form action="confirmpay.jsp" onSubmit="return datevalid();">
<table align="center" width="1000" id="tab">
     <tr>
       <td align="center"><b><font color="#309" size="6">Booking Details</font></b></td></tr></table>

<%
int i=Integer.parseInt(request.getParameter("r"));

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=null;
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","joyita");
PreparedStatement ps=con.prepareStatement("Select * from t_info where train_id=?");
ps.setInt(1,i);
ResultSet rs=ps.executeQuery();
if(rs.next())
{%> <table align="center" width="1000" id="tab">
     <tr><td>
	Fare details:<br></td><td></td></tr>
    <tr><td>AC 1st: </td><td>Rs.<%=rs.getInt(8) %><br></td></tr>
    <tr><td> AC 2nd: </td><td>Rs.<%=rs.getInt(9) %><br></td></tr>
    <tr><td> AC 3rd:</td><td> Rs.<%=rs.getInt(10) %><br></td></tr>
    <tr><td>Sleeper: </td><td>Rs.<%=rs.getInt(11) %><br></td></tr>
	<tr><td>Train ID:</td><td> <input type="number" name="trainid" value=<%=rs.getInt(1)%> readonly><br></td></tr>
	<tr><td>Source Selected:</td><td><input type="text" value=<%=rs.getString(3) %> name="ss" readonly><br></td></tr>
    <tr><td>Destination Selected:</td><td><input type="text" value=<%=rs.getString(4) %> name="ds" readonly><br></td></tr>
	<tr><td>Date of Journey:</td><td> <input type="date" name="dod" id="arrivalDate" required><br></td></tr>
	<tr><td>Passenger 1: </td><td>Name <input type="text" name="name1" required>   Age <input type="text" name="age1" required>  Sex <input type="text" name="sex1" required><br></td></tr><tr><td></td><td>Voter ID <input type="text" name="vote" required> <br> </td></tr>
	<tr><td>Passenger 2: </td><td>Name <input type="text" name="name2" >   Age <input type="text" name="age2" >  Sex <input type="text" name="sex2"> <br></td></tr>
	<tr><td>Passenger 3:</td><td> Name <input type="text" name="name3" >   Age <input type="text" name="age3" >  Sex <input type="text" name="sex3"><br></td></tr>
	<tr><td>Credit Card No.:</td><td> <input type="number" name="card" required><br></td></tr>
	<tr><td>Select Class:</td><td> <select name="cls"><option>Ac 1st</option><option>Ac 2nd</option><option>Ac 3rd</option><option>Sleeper</option></select><br></td></tr>

	<tr><td>E-mail id:</td><td> <input type="text" name="email" required><br></td></tr>
	     <tr><td colspan="2" align="center"> <input type="submit" Value="Next"></td></tr>
<%}else
{ out.println("Sorry.Train is temporarily unavailable.Go Back and Select Another train");%>
<input type="submit" value="Back">
<%}
%></table>
</form>
<%}else
{%>
<form action="home.jsp">
<% session.setAttribute("remark","Session Expired");
 %><br>
 Sorry Session Expired.<br>
 <input type="submit" value="Login again">
 </form>

<%}
%>

</body>
</html>