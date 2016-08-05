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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirm Payment</title>
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
<form action="paystatus.jsp">
<%
String name,source,destination,dod,cls,name1,age1,gender1,name2,age2,gender2,name3,age3,gender3,email,vote;
int t,numpass=1;

vote=request.getParameter("vote");
name=request.getParameter("name1");
dod=request.getParameter("dod");
name1=request.getParameter("name1");age1=request.getParameter("age1");gender1=request.getParameter("sex1");
name2=request.getParameter("name2");age2=request.getParameter("age2");gender2=request.getParameter("sex2");
name3=request.getParameter("name3");age3=request.getParameter("age3");gender3=request.getParameter("sex3");
if((name2.length()<=1 && name3.length()>1)||(name2.length()>1 && name3.length()<=1))
{
	numpass=2;
}
else if(name3.length()>1 && name2.length()>1)
{
	numpass=3;
}
email=request.getParameter("email");
String a="Ac 1st",b="Ac 2nd",c="Ac 3rd",d="Sleeper";
cls=request.getParameter("cls");
source=request.getParameter("ss");
destination=request.getParameter("ds");
t=Integer.parseInt(request.getParameter("trainid"));
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=null;
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","joyita");
int fare=0;
PreparedStatement xy=con.prepareStatement("select * from t_info where train_id=?");
xy.setInt(1,t);
ResultSet yz=xy.executeQuery();
if(yz.next())
{
	if(cls.compareToIgnoreCase(a)==0)
	{
		fare=yz.getInt(8);
	}
	else if(cls.compareToIgnoreCase(b)==0)
	{
		fare=yz.getInt(9);
	}
	else if(cls.compareToIgnoreCase(c)==0)
	{
		fare=yz.getInt(10);
	}
	else if(cls.compareToIgnoreCase(d)==0)
	{
		fare=yz.getInt(11);
	}
}
//int fare=Integer.parseInt(request.getParameter("class"));
//int numpass=Integer.parseInt(request.getParameter("pass"));
int bill=numpass*fare;
int card=Integer.parseInt(request.getParameter("card"));
int pnr=0,x=0;
PreparedStatement pn=con.prepareStatement("select pnrno from book");
ResultSet rn=pn.executeQuery();
while(rn.next())
{
  pnr=rn.getInt(1);
  if(x<pnr)
  {
	  x=pnr;
  }
}
pnr=x+2;
PreparedStatement ps=con.prepareStatement("select * from creditcard where credit_no=?");
ps.setInt(1,card);
ResultSet rs=ps.executeQuery();
if(rs.next())
{ int bal=rs.getInt(2);
   if(bal<bill)
   {
	   out.println("Insuffficient Balance.Sorry transaction failed.");%><form action="bookticket.jsp">
	  <br><input type="submit" value="Back"> </form>
 <%}else
   { PreparedStatement p=con.prepareStatement("insert into book values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	p.setInt(1,pnr);
	p.setString(2,name1);
	p.setString(3,name1);
	p.setInt(4,t);
	p.setString(5,source);
	p.setString(6,destination);
	p.setString(7,dod);
	p.setString(8,cls);
	p.setInt(9,numpass);
	p.setString(10,name1);
	p.setString(11,age1);
	p.setString(12,gender1);
	p.setString(13,name2);p.setString(14,age2);p.setString(15,gender2);p.setString(16,name3);p.setString(17,age3);p.setString(18,gender3);
	p.setString(19,email);
	p.setInt(20,card);
	p.setDouble(21,bill);
	int rw=p.executeUpdate();
    if(rw>0)
   {%>
   <table align="center" width="1000" id="tab">
   <tr><td colspan="4" align="center"><font color="#309" size="6"><b>Ticket Details</b></font><br></td><td width="0"></td></tr>
   <tr><td width="160">PNR:</td><td width="318"> <%=pnr %></td>
   <td width="124">Train ID:</td><td width="372"><%=t%></td></tr>
   <tr><td>Source:</td><td><%=source %></td><td>Destination:
   </td><td><%=destination %></td></tr>
   <tr><td>Date of Journey:</td><td> <%=dod %></td>
    <td>Class: </td><td><%=cls %></td></tr>
    <tr><td>Fare:</td><td> <%=bill %></td><td>Email:</td><td> <%=email %></td></tr><br><br><br>
   <tr><td colspan="4"> Passenger Details:<br></td></tr>
   <tr><td> <%=name1 %> </td><td>   <%=age1 %>   <%=gender1 %><br></td></tr>
    <tr><td> <%=name2 %> </td><td>   <%=age2 %>   <%=gender2 %><br></td></tr>
     <tr><td> <%=name3 %> </td><td>   <%=age3 %>   <%=gender3 %></td></tr> </table><br>
    <table align="center"> <tr><td align="center">Please note your PNR no. for future reference</td></tr>
    </table> <br><br>
   <table align="center" width="1000" id="tab">
   <tr><td colspan="2" align="center"><font color="#309" size="6"><b>Payment</b></font></td></tr>
  <tr><td width="492"> Card No.:</td><td width="494"> <input type="number" name="card" value="<%=card %>" readonly></td></tr>
   <tr><td>Number of passengers:</td><td> <input type="text" name="pass1" value="<%=numpass %>" readonly></td></tr>
  
  <tr><td> Total fare: </td><td><input type="text" name="fare"value="<%=bill %>" readonly></td></tr>
   
   <tr><td colspan="2" align="center"><input type="submit"  value="Pay"></td></tr></table>
  <%}
   } %>
<%}else{%><center><% 
	out.println("Card information wrong.Please give correct information.");%></center>

<%}
%>
</form>
<%}else
{%>
<form action="home.jsp">
<table align="center" width="1000" id="bor"><tr><td align="center">
<% session.setAttribute("remark","Session Expired");
 %><br></td></tr><tr><td align="center">
Session Expired<br></td></tr><tr><td align="center">
 <input type="submit" value="Login again"></td></tr></table>
<%} %>
 </form>

</body>
</html>