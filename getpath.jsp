<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body, html {
	height: 100%;
	margin: 0;
	font-family: Arial;
}

.bg {
	background-image: url("fmap1.jpeg");
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	backdrop-filter: blur(2px);
}

.titleContainer {
	padding: 10px;
	background-color: rgba(0, 0, 0, 0.5);
	color: rgb(255, 255, 255);
	flex: 25%;
	justify-content: space-around;
	align-items: space-around;
}

.title {
	padding: 10px;
	color: rgb(255, 255, 255);
	flex: 100%;
	font-size: 4vw;
	justify-content: space-around;
	align-items: space-around;
	text-align: center;
}

.flexHorizantal {
	display: flex;
	flex: 100%;
	flex-direction: row;
	height: 100%;
	width: 100%;
	justify-content: space-around;
	align-items: space-around;
}

.flexVertical {
	display: flex;
	flex: 100%;
	flex-direction: column;
	height: 100%;
	width: 100%;
	justify-content: space-around;
	align-items: space-around;
}


.content {
	background-color: rgba(255, 255, 255, 0.5);
	display: flex;
	height: 100%;
	width: 100%;
	display: flex;
	justify-content: space-around;
	align-items: space-around;
}

.btnContainer {
	background-color: rgba(0, 0, 0, 0.8);
	display: flex;
	flex: 15%;
	flex-direction: column;
	height: 100%;
	width: 100%;
	align-items: space-around;
}

.button {
  color: rgb(255, 255, 255);
  padding: 12px 20px;
  text-align: center;
  text-decoration: none;
  display: flex;
  font-size: 16px;
  transition-duration: 0.4s;
  cursor: pointer;
}

.button:hover {
  background-color: white;
  color: black;
}

input[type=text], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit] {
	width: 100%;
	background-color: #DB7093;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #DB7093;
}

.box {
  border-radius: 5px;
  background-color: #FFEFD5;
  padding: 20px;
}

</style>

<title>MiniMap</title>
</head>


<body class="bg">

<div class="flexHorizantal">
	<div class="titleContainer">
		<div class="title">M</div>
		<div class="title">I</div>
		<div class="title">N</div>
		<div class="title">I</div>
		<div class="title">M</div>
		<div class="title">A</div>
		<div class="title">P</div>
	</div>
	
	<div class="btnContainer">
		<a class="button" href="http://localhost:8080/SampleProject/Mainpage.html">Home</a>
		<a class="button" style="background-color: white; color: black;" href="http://localhost:8080/SampleProject/getpath.jsp">Find Path</a>
		<a class="button" href="http://localhost:8080/SampleProject/addcities.jsp">Add City</a>
		<a class="button" href="http://localhost:8080/SampleProject/addpath.jsp">Add Path</a>
	</div>
	
	<div class="content">
		<form action="printpath.jsp">

					<%@page import="java.sql.*"%>
					<%@page import="java.util.*" %>


					<%
					try {
						//out.print("Welcome");
						Class.forName("com.mysql.jdbc.Driver");
						Connection conn = DriverManager.getConnection("jdbc:Mysql://127.0.0.1:3306/minimap", "root", "root");
						//out.print("Welcome");

						PreparedStatement st1 = conn.prepareStatement("select count(*) from Matrix;");
						ResultSet rs1 = st1.executeQuery();
						rs1.next();
						int n = Integer.parseInt(rs1.getString("count(*)"));
						String City[] = new String[n];

						PreparedStatement st2 = conn.prepareStatement("select * from Matrix;");
						ResultSet rs2 = st2.executeQuery();
						for (int i = 0; i < n; i++) {
							rs2.next();
							City[i] = rs2.getString(1);
						}

						//out.print("<label for='source'>Source</label>");
						out.print("<select id='source' name='source' placeholder='Enter your source'>");
                        out.print("<option value='source'>Enter Your Source</option>");
						for (int i = 0; i < n; i++) {
							out.print("<option value=" + i + ">" + City[i] + "</option>");
						}

						out.print("</select>");
                         
						//out.print("<label for='dest'>Destination</label>");
						out.print("<select id='dest' name='dest' placeholder='Enter your Destination'>");
                        out.print("<option value='dest'>Enter Your Destination</option>");
						for (int i = 0; i < n; i++) {
							out.print("<option value=" + i + ">" + City[i] + "</option>");
						}

						out.print("</select>");

					} catch (Exception e1) {
					//	System.out.println("Error");
					}
					%>
					<input type="submit" value="Submit">
				</form>
	</div>
</div>



</body>
</html>