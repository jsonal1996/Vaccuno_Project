<%
	
	
	String usename = (String) session.getAttribute("uname");
	//System.out.println("Helllo "+usename);
	if (usename == null) {
		response.sendRedirect("loginpage.jsp");
	
		
	}
	else{
%>
<%@ page import="com.mongodb.DBObject"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mongodb.BasicDBList"%>

<%
//	import com.mongodb.BasicDBObject;
	
		List<DBObject> searchresults = new ArrayList<DBObject>();
		
		searchresults=(ArrayList)session.getAttribute("searchresults");
		


%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>To Do list</title>

<link type="text/css" rel="stylesheet" href="displayvaccine.css" />
<!--<script type = "text/javascript" >
function disableBackButton()
{
window.history.forward();
}
setTimeout("disableBackButton()", 0);
</script>-->

</head>

<body>

	<div  style=" background: url('images/header.jpg');
  -webkit-filter: blur(5px);
  background-repeat: no-repeat;
  background-size: cover;
  -moz-filter: blur(5px);
  -o-filter: blur(5px);
  -ms-filter: blur(5px);
  filter: blur(5px);
  position: fixed;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  z-index: -1;"></div>

		<div style="z-index: 1;
	background-color: white;
	/*position: fixed;
	width: 120%;*/
	margin-top: -35px;
	margin-left: -8px;
	margin-right: -8px;
	height: 135px;

	">
	
			<img src="images/logo.jpg" style="float:left; margin-left: 100px; padding-top: 10px; height: 120px" />
			<img src="images/headVa.jpg" style="float:right; margin-left: 500px; padding-top: 25px; height: 110px;width: 400px" />
			<div style="float:left;width: 100%;background-color:#0093AF;border-radius:0px;">
		<!-- <h1 style=" color:white;height:10%;font-style: arial;font-weight: bold;float:left">Vaccine List</h1>-->
		
		<div class="tab">
		<p style="padding-left:100px;font-style: arial;font-weight: bold;color:white;float:right">Hello <%=usename %>!!</p>
			<form action="VaccinelistCustServ" method="post" class="tablinks">
				<input style="color:white;background-color:#0093AF;border: none;outline:none;font-size:20px;height:45%;font-style: arial;font-weight: bold;float:left" type="submit"value="Vaccine Details">
			</form>
			<form  action="DoctorDetailServ" method="post" class="tablinks">
				<input style="color:white;background-color:#0093AF;border: none;
	    outline:none;font-size:20px;height:45%;font-style: arial;font-weight: bold" type="submit"
									value="Doctor Details"><br>
			</form>
			<form  action="TodoVaccinelistServ" method="post" class="tablinks">
				<input style="color:white;background-color:#0093AF;border: none;outline:none;font-size:20px;height:45%;font-style: arial;font-weight: bold" type="submit" value="To Do List"><br>
			</form>
			<form  action="DisplayQueryServ" method="post">
				<input style="color:white;background-color:#0093AF;border: none;outline:none;font-size:20px;height:45%;font-style: arial;font-weight: bold" type="submit" value="Ask Queries"><br>
			</form>
			<form  action="LogoutServ" method="post" class="tablinks">
				<input style="color:white;background-color:#0093AF;border: none;outline:none;font-size:20px;;font-style: arial;font-weight: bold;" type="submit" value="Log Out"><br>
			</form>
	  
		</div>
	</div>
	</div>
	<br><br>
	<div
		style=" margin:auto;width: 50%; /*border: 1px solid #73AD21;*/ padding: 15px;">
		<h1
			style="margin-top: 70px;width:400px; margin-left:-50%;color:black;background-color:white;">To Do List</h1>

		

		
		<div id="list">
			<table border="1">
				<tr>

					<th>Vaccine Name</th>
					<th>Vaccine Cost</th>
					<th>Vendor Name</th>
					<th>Disease</th>
					<th>Minimum No of Doses</th>
					<th>Status</th>
					<th>Appointment Dates</th>
					<th></th>
					<!-- <th></th>-->
				</tr>

				<%
					if(searchresults.iterator().hasNext()){
	
						for(DBObject info : searchresults){
						//	i=i+1;
						

				%>
				
				<tr>


					<td><%=(String)info.get("name") %></td>
					<td><%=(String)info.get("cost")%></td>
					<td><%=(String)info.get("vendor")%></td>
					<td><%=(String)info.get("disease") %></td>
					<td><%=(String)info.get("minnodoses")%></td>
					<td><%=(String)info.get("status") %></td>
					<%
						String s1=(String)info.get("status");
						String s=(String)info.get("minnodoses");
						int dose=Integer.parseInt(s);
						if(s1.equals("Approved")){
							BasicDBList datess=(BasicDBList) info.get("dates");
							//List<DBObject> list = (List<DBObject>)info.get("dates");
							BasicDBList list = new BasicDBList();
							int j=0;
							for (String key : datess.keySet()) {
							    list.add(datess.get(j));
//								System.out.println(datess.get(j));

							    j++;
							}
							
							List<String> listArray = new ArrayList<String>();
							for (Object object : list) {
							    listArray.add(object.toString());
							}
							System.out.println(listArray.get(0));

							String str=listArray.get(0);
							List<String> finallist = new ArrayList<String>();
							int k=0;
							System.out.println(str);


							for(int i=0;i<str.length();){
								if(str.charAt(i)=='['||str.charAt(i)==']'||str.charAt(i)==' '||str.charAt(i)=='"'||str.charAt(i)==','){
									i++;
									continue;
								}
								else{
									String one="";
									while(str.charAt(i)!='['&&str.charAt(i)!=']'&&str.charAt(i)!=' '&&str.charAt(i)!='"'&&str.charAt(i)!=';'){
										one+=str.charAt(i);
										i++;
									}
									finallist.add(one);
								}
							}
							
							for(int i=0;i<finallist.size();i++){
								System.out.println(finallist.get(i));
							}%>
							<td>
							<%							
							for(int i=0;i<finallist.size();i++){%>
								
								<%=finallist.get(i)%>
								
								
							<%}%>
							</td>
						<%}
						else{%>
							<td>Not Approved yet</td>
						<%}%>
					<td>
						<form action="BookAppointmentServ" method="post">
							<input type="hidden" name="check" value="<%=(String)info.get("name") %>">
							<input type="hidden" name="check1" value="<%=(String)info.get("cost")%>">
							<input type="hidden" name="check2" value="<%=(String)info.get("vendor")%>">
							<input type="hidden" name="check3" value="<%=(String)info.get("disease")%>">
							<input type="hidden" name="check4" value="<%=(String)info.get("minnodoses")%>">
							
							<input style="font-weight: bold" type="submit"
								value="Search for Doctors">
							<!-- onclick="return confirm('Are you sure you want to Add?')">-->
						</form>

					</td>
					<!-- <td>
						<form action="UpdateVaccineServ" method="post">
							<br> <input type="text" name="newcost"
								placeholder="Enter new Cost">
								 <input type="hidden"
								name="check" value=""> 
								<input
								type="hidden" name="check1" value=""><br>
							<input style="font-weight: bold" type="submit"
								value="Update Vaccine Cost"
								onclick="return confirm('Are you sure you want to update?')"><br>
							<br>
						</form>

					</td>-->

				</tr>
				<%
					}
					}
				%>
			</table>
			</div>
			</div>

		
</body>
</html>

<%
	}
%>