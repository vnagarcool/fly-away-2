<%@ page import="java.sql.*"%>
<%@page import="servlets.Login"%>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FlyAway Airlines</title>

</head>

<body>


	<div >
		<a href="index.jsp" >FlyAway</a>
		<div >
			<a href="login.jsp" > Admin Login</a>
		</div>
	</div>
	
	
	<%
	if (Login.isLoggedIn) {
	%>
	<div >
		<h2 >
			<b>Admin Dashboard</b>
		</h2>
		
		<p>
			<strong>
					You are LoggedIn as : <%=Login.email%>.
					Your Password is : <%=Login.password%>
			</strong>
			
		</p>
		
		<br>
		<br>
		
		<div>
			<div >
				<form method="post" action="${pageContext.request.contextPath}/change-password.jsp">
					<button type="submit">ChangePassword</button>
				</form>
				
			</div>
			<div >
				<form method="post" action="${pageContext.request.contextPath}/login.jsp">
					<button type="submit" >Logout</button>
				</form>
			</div>

		</div>
	</div>

	<section >
		<section >
			<section>
			
				<table >
					<thead>
						<tr>
							<th >Flight ID</th>
							<th >Name</th>
							<th >Source</th>
							<th >Destination</th>
							<th >Day</th>
							<th >Ticket Price</th>
						</tr>
					</thead>
					<tbody>

						<p>Flight Details :</p>
						
						<br>

						<%
						String driverName = "com.mysql.cj.jdbc.Driver";
						String connectionUrl = "jdbc:mysql://localhost:3306/flyaway";
						String userId = "root";
						String password = "24531395";

						try {
							Class.forName(driverName);
							System.out.println("connected driver");
						} catch (ClassNotFoundException e) {
							e.printStackTrace();
						}

						Connection con = null;
						Statement stmt = null;
						ResultSet res = null;
						
						try {
							con = DriverManager.getConnection(connectionUrl, userId, password);
							stmt = con.createStatement();
							String sql = "SELECT * FROM flight";
							res = stmt.executeQuery(sql);
							System.out.println("executed");
							while (res.next()) {
						%>

						<tr>
							<td><%=res.getInt("flight_id")%></td>
							<td><%=res.getString("name")%></td>
							<td><%=res.getString("source")%></td>
							<td><%=res.getString("destination")%></td>
							<td><%=res.getString("days")%></td>
							<td><%=res.getInt("ticket_price") %>
							</td>
						</tr>
						<%
						}
						} catch (Exception e) {
						e.printStackTrace();
						}
						} else {
						out.print("You must Login first");
						}
						%>
					</tbody>
				</table>
			</section>
		</section>
	</section>
	<div class="footer" align="center">
	FlyAway by Vinod Nagar</div>
</body>
</html>
