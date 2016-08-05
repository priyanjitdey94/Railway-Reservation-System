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

<meta http-equiv="Cotent-Type" content="text/html; charset=ISO-8859-1">
<title>Booking</title>
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
<table align="center" width=1000 id="menu1">
<tr><td align="center" width="250"><c><a href="traininfo.jsp"><font color="#FFFFCC" size=5><b>Train Information</b></font></a></c></td>
     <td align="center" width="250"><a href="Booking.jsp"><font color="#FFFFCC" size=5><b>Booking</b></font></a></td>
     <td align="center" width="250"><a href="pnr.jsp"><font color="#FFFFCC" size=5><b>PNR status</b></font></a></td>
     <td align="center" width="250"><a href="cancel.jsp"><font color="#FFFFCC" size=5><b>Cancel Ticket</b></font></a></td>
</tr>     
</table>
<%!String r;
    String t1,t2; %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=null;
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","joyita");
%>
<%
int credit=Integer.parseInt(request.getParameter("credit"));
PreparedStatement cr=con.prepareStatement("select credit_no from creditcard where credit_no=?");
cr.setInt(1,credit);
ResultSet rsc=cr.executeQuery();
if(rsc.next())
{  
  r=Integer.toString(rsc.getInt(1));
}
if(r==null)
{
	%><table width="1000" align="center" id="bor">
	  <tr><td><font size=6 color="#309">Invalid Credit Card Number.Go back and try again</font></td></tr>
      </table>
   <%
}
else 
{
	
int tid=Integer.parseInt(request.getParameter("tid"));
String source=request.getParameter("ss");
String destination=request.getParameter("sd");

PreparedStatement p4=con.prepareStatement("select distance from schedule where train_id=? and dstation_name=?");
    p4.setInt(1,tid);
    p4.setString(2,source);
   
    ResultSet r4=p4.executeQuery();
	if(r4.next())
	   {
		   t1=r4.getString(1);
	   }
	
	PreparedStatement p5=con.prepareStatement("select distance from schedule where train_id=? and dstation_name=?");
    p5.setInt(1,tid);
    p5.setString(2,destination);
    
    ResultSet r5=p5.executeQuery();
	
	if(r5.next())
	   {
		   t2=r5.getString(1);
	   }	
	
if((t1==null)||(t2==null))
	{
		%><table width="1000" align="center" id="bor">
	  <tr><td><font size=6 color="#309">Incorrect TrainId or Source name or Destination name.Go back and try again.</font></td></tr>
      </table>
   <%
	}
else
{
	%>	
  
<form action="ticket.jsp"> 
<table width="1000" id="bor" cellspacing="5" cellpadding="10" align="center">
<%!Double fare;
    int pnr=0;
    int j=0; 
%>

<%
String s[]=new String[10];
String a[]=new String[10];
String g[]=new String[10];
int d[]=new int[2];
String name=request.getParameter("name");
String dod=request.getParameter("dod");
String s1=request.getParameter("s1");
int n=Integer.parseInt(request.getParameter("nop"));
for(int i=1;i<=n;i++)
{
	 s[i]=request.getParameter("name"+i);
	 a[i]=request.getParameter("age"+i);
	 g[i]=request.getParameter("radio"+i);
	 
	 
}

String em=request.getParameter("em");




if(s1.equals("acfirst"))
{   
    PreparedStatement ps1=con.prepareStatement("select ac_first from t_info where train_id=?");
	ps1.setInt(1,tid);
	ResultSet rs1=ps1.executeQuery();
	while(rs1.next())
	{
	      fare=(double)rs1.getInt(1);
	     
	}
	
	PreparedStatement ps4=con.prepareStatement("select distance from schedule where train_id=? and dstation_name=?");
    ps4.setInt(1,tid);
    ps4.setString(2,source);
   
    ResultSet rs4=ps4.executeQuery();
    while(rs4.next())
    {
    	d[j]=rs4.getInt(1);
    	
    	
    }
    j++;
    
	PreparedStatement ps5=con.prepareStatement("select distance from schedule where train_id=? and dstation_name=?");
    ps5.setInt(1,tid);
    ps5.setString(2,destination);
    
    ResultSet rs5=ps5.executeQuery();
    while(rs5.next())
    {
    	d[j]=rs5.getInt(1);
    	
    	
    }
 
    
   
    fare=(fare+((d[1]-d[0])*0.7))*n;

}

if(s1.equals("acsecond"))
{
    PreparedStatement ps1=con.prepareStatement("select ac_second from t_info where train_id=?");
	ps1.setInt(1,tid);
	ResultSet rs1=ps1.executeQuery();
	while(rs1.next())
	{
		  fare=(double)rs1.getInt(1);
	     
	}
	PreparedStatement ps4=con.prepareStatement("select distance from schedule where train_id=? and dstation_name=?");
    ps4.setInt(1,tid);
    ps4.setString(2,source);
   
    ResultSet rs4=ps4.executeQuery();
    while(rs4.next())
    {
    	d[j]=rs4.getInt(1);
    	
    	
    }
    j++;
    
	PreparedStatement ps5=con.prepareStatement("select distance from schedule where train_id=? and dstation_name=?");
    ps5.setInt(1,tid);
    ps5.setString(2,destination);
    
    ResultSet rs5=ps5.executeQuery();
    while(rs5.next())
    {
    	d[j]=rs5.getInt(1);
    	
    	
    }
 
    
   
    fare=(fare+((d[1]-d[0])*0.7))*n;

}

if(s1.equals("acthird"))
{
    PreparedStatement ps1=con.prepareStatement("select ac_third from t_info where train_id=?");
	ps1.setInt(1,tid);
	ResultSet rs1=ps1.executeQuery();
	while(rs1.next())
	{
		  fare=(double)rs1.getInt(1);
	     
	}
	PreparedStatement ps4=con.prepareStatement("select distance from schedule where train_id=? and dstation_name=?");
    ps4.setInt(1,tid);
    ps4.setString(2,source);
   
    ResultSet rs4=ps4.executeQuery();
    while(rs4.next())
    {
    	d[j]=rs4.getInt(1);
    	
    	
    }
    j++;
    
	PreparedStatement ps5=con.prepareStatement("select distance from schedule where train_id=? and dstation_name=?");
    ps5.setInt(1,tid);
    ps5.setString(2,destination);
    
    ResultSet rs5=ps5.executeQuery();
    while(rs5.next())
    {
    	d[j]=rs5.getInt(1);
    	
    	
    }
    fare=(fare+((d[1]-d[0])*0.7))*n;

}

if(s1.equals("sleeper"))
{
    PreparedStatement ps1=con.prepareStatement("select sleeper from t_info where train_id=?");
	ps1.setInt(1,tid);
	ResultSet rs1=ps1.executeQuery();
	while(rs1.next())
	{
		  fare=(double)rs1.getInt(1);
	     
	}
	PreparedStatement ps4=con.prepareStatement("select distance from schedule where train_id=? and dstation_name=?");
    ps4.setInt(1,tid);
    ps4.setString(2,source);
   
    ResultSet rs4=ps4.executeQuery();
    while(rs4.next())
    {
    	d[j]=rs4.getInt(1);
    	
    	
    }
    j++;
    
	PreparedStatement ps5=con.prepareStatement("select distance from schedule where train_id=? and dstation_name=?");
    ps5.setInt(1,tid);
    ps5.setString(2,destination);
    
    ResultSet rs5=ps5.executeQuery();
    while(rs5.next())
    {
    	d[j]=rs5.getInt(1);
    	
    	
    }
 
    
   
    fare=(fare+((d[1]-d[0])*0.7))*n;

}

int max=pnr;
PreparedStatement ps3=con.prepareStatement("select * from book");
ResultSet rs3=ps3.executeQuery();

while(rs3.next())
{
	pnr=rs3.getInt(1);
	if(max<pnr)
		max=pnr;
}


max=max+1;

String m=Integer.toString(max);
session.setAttribute("pnrno",m);
String username=(String)session.getAttribute("username");

PreparedStatement ps=con.prepareStatement("insert into book values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
ps.setInt(1,max);
ps.setString(2,username);
ps.setString(3,name);
ps.setInt(4,tid);
ps.setString(5,source);
ps.setString(6,destination);
ps.setString(7,dod);
ps.setString(8,s1);
ps.setInt(9,n);
ps.setString(10,s[1]);
ps.setString(11,a[1]);
ps.setString(12,g[1]);
ps.setString(13,s[2]);
ps.setString(14,a[2]);
ps.setString(15,g[2]);
ps.setString(16,s[3]);
ps.setString(17,a[3]);
ps.setString(18,g[3]);
ps.setString(19,em);
ps.setInt(20,credit);
ps.setDouble(21,fare);
int p=ps.executeUpdate();
if (p>0)
	%>
   <tr><td><font size=6 color=#309> Booking Succesfully Done.</font><font color="#000000"><br>Click 'Generate Ticket' to view your ticket.</font></td></tr>
 <tr>
    <td align="center"><input type="submit" value="Generate Ticket"></td>
  </tr>
 
</table>
</form>
<%}
}
%>


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